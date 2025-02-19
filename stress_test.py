import mysql.connector
import random
from datetime import datetime, timedelta
from login import get_db_credentials
from urllib.parse import quote_plus

def get_connection():
    # Load database credentials securely
    DB_USERNAME, DB_PASSWORD, DB_HOST, DB_NAME, DB_TYPE = get_db_credentials()

    return mysql.connector.connect(
        host=DB_HOST,
        user=DB_USERNAME,
        password=DB_PASSWORD,
        database=DB_NAME,
        port=3306,
        autocommit=True
    )

def insert_bulk_records():
    conn = get_connection()
    cursor = conn.cursor()
    
    # Generate unique IDs avoiding conflicts
    base_id = 100000  # Start from 100000 to avoid 99999 conflict
    
    try:
        # Insert into ContactDetails
        cursor.execute("INSERT INTO contactdetails (ContactID, ContactPerson, ContactPhone) VALUES (%s, %s, %s)",
                       (base_id, 'Stress Test Contact', '9876843210'))
        
        # Insert into FosterHomes
        cursor.execute("INSERT INTO fosterhomes (FosterHomeID, Name, Address, ManagerName, ContactPhone, Capacity, CurrentOccupancy, ContactID) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
                       (base_id, 'Stress Test Shelter', 'Test Address, India', 'Manager Name', '9876543210', 50, 0, base_id))
        
        # Insert into Adopters
        cursor.execute("INSERT INTO adopters (AdopterID, Name, Email, Phone, Address, AdoptionFee) VALUES (%s, %s, %s, %s, %s, %s)",
                       (base_id, 'Stress Test Adopter', 'test_adopter@example.com', '9998887777', 'Test Address, India', 500.00))
        
        # Insert into Pets
        rescue_date = (datetime.now() - timedelta(days=random.randint(10, 100))).strftime('%Y-%m-%d')
        cursor.execute("INSERT INTO pets (PetID, Name, SpeciesID, Species, Breed, Age, Gender, Status, RescueDate, AdoptionDate, FosterHomeID) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, NULL, %s)",
                       (base_id, 'Stress Test Pet', 1, 'Dog', 'Indian Pariah Dog', random.randint(1, 10), 'Male', 'Available', rescue_date, base_id))
        
        # Insert into MedicalRecords
        vaccination_date = (datetime.now() - timedelta(days=random.randint(1, 50))).strftime('%Y-%m-%d')
        cursor.execute("INSERT INTO medicalrecords (MedicalRecordID, PetID, VaccinationDate, DiseaseHistory, IsVaccinated, Notes) VALUES (%s, %s, %s, %s, %s, %s)",
                       (base_id, base_id, vaccination_date, 'None', 1, 'Healthy and vaccinated.'))
        
        # Insert into CustomerFeedback
        cursor.execute("INSERT INTO customerfeedback (FeedbackID, AdopterID, Comments, Rating) VALUES (%s, %s, %s, %s)",
                       (base_id, base_id, 'Great adoption experience!', 5))
        
        # Commit transaction
        conn.commit()
        print("Bulk records inserted successfully!")
    except Exception as e:
        conn.rollback()
        print(f"Error: {e}")
    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    insert_bulk_records()
