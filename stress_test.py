import mysql.connector
import random
from datetime import datetime, timedelta
from login import get_db_credentials

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

def insert_bulk_records(base_id = 1):
    conn = get_connection()
    cursor = conn.cursor()
    
    base_nr = 1000000000 + base_id
    try:
        # Insert into ContactDetails
        cursor.execute("INSERT INTO contactdetails (ContactID, ContactPerson, ContactPhone) VALUES (%s, %s, %s)",
                       (base_id, 'Stress Test Contact', base_nr))
        
        # Insert into FosterHomes
        cursor.execute("INSERT INTO fosterhomes (FosterHomeID, Name, Address, ContactPerson, ContactPhone, Capacity, CurrentOccupancy, ContactID) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
                       (base_id, 'Stress Test Shelter', 'Test Address, India' + str(base_id), 'Manager Name', base_nr, 50, 0, base_id))
        
        # Insert into Adopters
        cursor.execute("INSERT INTO adopters (AdopterID, Name, Email, Phone, Address) VALUES (%s, %s, %s, %s, %s)",
                       (base_id, 'Stress Test Adopter', 'test_adopter' + str(base_id) +'@example.com', base_nr, 'Test Address, India'))
        
        
        # Insert into Species
        cursor.execute("INSERT INTO species (SpeciesID, SpeciesName) VALUES (%s, %s)", 
                       (base_id, 'Dog' + str(base_id)))

        # Insert into Pets
        rescue_date = (datetime.now() - timedelta(days=random.randint(10, 100))).strftime('%Y-%m-%d')
        cursor.execute("INSERT INTO pets (PetID, Name, SpeciesID, Species, Breed, Age, Gender, Status, RescueDate, AdoptionDate, FosterHomeID) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, NULL, %s)",
                       (base_id, 'Stress Test Pet', base_id, 'Dog' + str(base_id), 'Indian Pariah Dog', random.randint(1, 10), 'Male', 'Available', rescue_date, base_id))
        
        # Insert into MedicalRecords
        vaccination_date = (datetime.now() - timedelta(days=random.randint(1, 50))).strftime('%Y-%m-%d')
        cursor.execute("INSERT INTO medicalrecords (MedicalRecordID, PetID, VaccinationDate, DiseaseHistory, IsVaccinated, Notes) VALUES (%s, %s, %s, %s, %s, %s)",
                       (base_id, base_id, vaccination_date, 'None', 1, 'Healthy and vaccinated.'))
        
        cursor.execute("INSERT INTO Rescuers (RescuerID, Name, Phone, Organization, AdopterID, PetID, RescueDate) VALUES (%s, %s, %s, %s, %s, %s, %s)", 
                        (base_id, "Test Rescuer " + str(base_id), base_nr, "Test Organization" + str(base_id), base_id, base_id, "2024-02-19"))


        # Commit transaction
        conn.commit()
        # print("Records inserted successfully!")
    except Exception as e:
        conn.rollback()
        print(f"Error: {e}")
    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    for i in range(1, 10000):
        insert_bulk_records(i)
        if i % 100 == 0:
            print(f"Inserted records for base_id {i}")
