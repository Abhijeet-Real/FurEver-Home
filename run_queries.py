import os
import nbformat as nbf
import pandas as pd
import time
from sqlalchemy import create_engine, exc, text
from urllib.parse import quote_plus
from login import get_db_credentials
from index_sql import sql_files

# Load database credentials securely
DB_USERNAME, DB_PASSWORD, DB_HOST, DB_NAME, DB_TYPE = get_db_credentials()

# Encode password to handle special characters like '@'
ENCODED_PASSWORD = quote_plus(DB_PASSWORD)

try:
    # Create DB connection without selecting a specific schema initially
    engine = create_engine(f"{DB_TYPE}://{DB_USERNAME}:{ENCODED_PASSWORD}@{DB_HOST}")
    with engine.connect() as connection:
        # Disable foreign key checks to allow schema modifications
        connection.execute(text("SET FOREIGN_KEY_CHECKS = 0;"))
        
        # Drop and recreate the schema
        connection.execute(text(f"DROP SCHEMA IF EXISTS {DB_NAME};"))
        connection.execute(text(f"CREATE SCHEMA {DB_NAME};"))
        
        # Re-enable foreign key checks
        connection.execute(text("SET FOREIGN_KEY_CHECKS = 1;"))
except exc.OperationalError as e:
    print(f"OperationalError: {e.orig}")
    exit(1)
except exc.SQLAlchemyError as e:
    print(f"SQLAlchemyError: {str(e)}")
    exit(1)
except Exception as e:
    print(f"Unexpected Error: {str(e)}")
    exit(1)

# Reconnect to the newly created schema
engine.dispose()
engine = create_engine(f"{DB_TYPE}://{DB_USERNAME}:{ENCODED_PASSWORD}@{DB_HOST}/{DB_NAME}")

# Ensure correct database selection
with engine.connect() as connection:
    connection.execute(text(f"USE {DB_NAME};"))

# Wait for MySQL to process inserts
time.sleep(2)

# Initialize Jupyter notebook
nb = nbf.v4.new_notebook()

for sql_file in sql_files:
    # Add Header 2 for each SQL file
    nb.cells.append(nbf.v4.new_markdown_cell(f"## {sql_file}"))

    with open(sql_file, "r") as file:
        sql_script = file.read()

    # Execute statements line by line to ensure proper execution order
    sql_commands = sql_script.split(";")
    for sql_command in sql_commands:
        sql_command = sql_command.strip()
        if sql_command:
            try:
                with engine.connect() as connection:
                    transaction = connection.begin()
                    connection.execute(text("SET FOREIGN_KEY_CHECKS = 0;"))
                    
                    # Special Handling for Triggers
                    if sql_command.startswith("CREATE TRIGGER"):
                        trigger_name = sql_command.split(" ")[2]  # Extract trigger name
                        connection.execute(text(f"DROP TRIGGER IF EXISTS {trigger_name};"))
                        connection.execute(text(sql_command))
                    else:
                        result = connection.execute(text(sql_command))
                    
                    connection.execute(text("SET FOREIGN_KEY_CHECKS = 1;"))
                    transaction.commit()
                    
                    query_text = f"**Query:**\n```sql\n{sql_command}\n```"
                    
                    if result and result.returns_rows:
                        df = pd.DataFrame(result.fetchall(), columns=result.keys())
                        output_text = f"**Output Table:**\n\n```\n{df.to_markdown(index=False)}\n```"
                    else:
                        output_text = "**Output:**\n\n`Query executed successfully`"
                    
                    action_text = f"**Action Output:** `{result.rowcount if result else 0} rows affected`"
                    cell_content = f"{query_text}\n\n{output_text}\n\n{action_text}"
                    nb.cells.append(nbf.v4.new_markdown_cell(cell_content))
            except exc.SQLAlchemyError:
                transaction.rollback()
                continue  # Skip adding anything for failed queries

# Save the notebook
notebook_filename = "SQL_Execution_Report.ipynb"
with open(notebook_filename, "w", encoding="utf-8") as f:
    nbf.write(nb, f)

print(f"Notebook generated: {notebook_filename}")
