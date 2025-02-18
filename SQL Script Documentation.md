# SQL Scripts Documentation (Markdown Version)

## 1. Database Schema Definition Script

### Description
The **Create Table** script sets up the database schema for a **pet adoption and foster care system**. It defines five tables:

- **FosterHomes** - Stores information about foster homes.
- **Pets** - Stores details of pets available for adoption.
- **Adopters** - Contains information on individuals adopting pets.
- **MedicalRecords** - Maintains health and medical records for pets.
- **Rescuers** - Tracks individuals who rescue pets.

### Schema Details
#### FosterHomes Table
| Column Name  | Data Type | Description |
|-------------|-----------|-------------|
| FosterHomeID | INT (PK) | Unique identifier |
| Name | VARCHAR(100) | Foster home's name |
| Address | TEXT | Address details |
| ContactPerson | VARCHAR(100) | Name of contact person |
| ContactPhone | VARCHAR(15) | Contact number |
| Capacity | INT | Maximum pets allowed |
| CurrentOccupancy | INT | Current number of pets housed |

#### Pets Table
| Column Name  | Data Type | Description |
|-------------|-----------|-------------|
| PetID | INT (PK) | Unique identifier |
| Name | VARCHAR(50) | Pet's name |
| Species | VARCHAR(30) | Type of pet |
| Breed | VARCHAR(50) | Breed of pet |
| Age | INT | Age in years |
| Gender | VARCHAR(10) | Gender |
| Status | VARCHAR(20) | Adoption availability |
| RescueDate | DATE | Date rescued |
| AdoptionDate | DATE (NULL) | Date adopted |
| FosterHomeID | INT (FK) | Links to FosterHomes |

#### Adopters Table
| Column Name  | Data Type | Description |
|-------------|-----------|-------------|
| AdopterID | INT (PK) | Unique identifier |
| Name | VARCHAR(100) | Name of adopter |
| Email | VARCHAR(100) | Unique email |
| Phone | VARCHAR(15) | Contact number |
| Address | TEXT | Address details |

#### MedicalRecords Table
| Column Name  | Data Type | Description |
|-------------|-----------|-------------|
| MedicalRecordID | INT (PK) | Unique identifier |
| PetID | INT (FK) | Links to Pets |
| VaccinationDate | DATE | Last vaccination date |
| DiseaseHistory | TEXT | Record of past illnesses |
| IsVaccinated | BOOLEAN | Vaccination status |
| Notes | TEXT | Additional medical notes |

#### Rescuers Table
| Column Name  | Data Type | Description |
|-------------|-----------|-------------|
| RescuerID | INT (PK) | Unique identifier |
| Name | VARCHAR(100) | Name of rescuer |
| Phone | VARCHAR(15) | Contact details |
| Organization | VARCHAR(100) | Organization (if applicable) |
| AdopterID | INT (FK) | Links to Adopters |
| PetID | INT (FK) | Links to Pets |
| RescueDate | DATE | Date of rescue |

## 2. Database Automation & Integrity

### Description
The **Insert Records** script populates tables with sample data, providing realistic entries.

### Data Entries
- **FosterHomes Table:** 20 records with real-world locations.
- **Pets Table:** 20 records linking pets to foster homes.
- **Adopters Table:** 20 records of adopters.
- **MedicalRecords Table:** 20 medical history records.
- **Rescuers Table:** 20 rescuers assigned to pets.

## 3. Initial Data Insertion Script

### Triggers Implemented
#### Adoption Tracking
```sql
CREATE TRIGGER after_status_update
AFTER UPDATE ON Pets
FOR EACH ROW
WHEN NEW.Status = 'Adopted'
BEGIN
    UPDATE Pets SET AdoptionDate = CURRENT_DATE WHERE PetID = NEW.PetID;
END;
```

#### Foster Home Occupancy Management
```sql
CREATE TRIGGER after_pet_insert
AFTER INSERT ON Pets
FOR EACH ROW
BEGIN
    UPDATE FosterHomes SET CurrentOccupancy = CurrentOccupancy + 1 WHERE FosterHomeID = NEW.FosterHomeID;
END;
```

## 4. Optimized Data Retrieval & Querying

### Queries Implemented
- Retrieve all pets and their details.
- Retrieve only available pets.
- Retrieve pets younger than a specified age.
- Retrieve pets whose names match patterns using `LIKE`.
- Retrieve pets sorted by `ORDER BY`.
- Count pets by species and filter species with more than 5 pets.
- Find adopters who adopted pets in the last 6 months.
- Retrieve medical history of unvaccinated pets.

## 5. Database Normalization & Constraints Enforcement

### Normalization Steps
#### 1NF (Atomicity)
- **Problem:** Redundant `Species` column in `Pets`.
- **Solution:**
  - Created a `Species` table.
  - Replaced `Species` in `Pets` with `SpeciesID` as a foreign key.

#### 2NF (No Partial Dependencies)
- **Problem:** Contact details stored within `FosterHomes`.
- **Solution:** Moved `ContactPerson` and `ContactPhone` to a new `ContactDetails` table.

#### 3NF (No Transitive Dependencies)
- Removed derived attributes and ensured each column is functionally dependent on the primary key.

## 6. Comprehensive CRUD Operations

### Updating Records
```sql
UPDATE Pets
SET Status = 'Adopted', AdoptionDate = CURDATE()
WHERE PetID = 101;
```

### Deleting Records
```sql
DELETE FROM MedicalRecords
WHERE PetID IN (SELECT PetID FROM Pets WHERE Status = 'Adopted' AND AdoptionDate < DATE_SUB(CURDATE(), INTERVAL 1 YEAR));
```

### Inserting New Records
```sql
INSERT INTO Pets (PetID, Name, Species, Breed, Age, Gender, Status, RescueDate, FosterHomeID)
VALUES (201, 'Buddy', 'Dog', 'Labrador', 2, 'Male', 'Available', CURDATE(), 3);
```

## 7. Database Schema Modification & Optimization

### Key Modifications
- **Added Columns**: `AdoptionFee` in `Adopters`, `ContactID` in `FosterHomes`.
- **Changed Data Types**: `ContactPhone` updated for international formats.
- **Foreign Key Enhancements**: Linked `CustomerFeedback` with `Adopters`.
- **Indexing for Performance**:
  - `Pets(Name)`, `Adopters(Email)`, `FosterHomes(Capacity)` indexed.

## 8. Stress Testing Script

### Components
#### Bulk Insert for FosterHomes
```sql
INSERT INTO FosterHomes (FosterHomeID, Name, Address, Capacity, CurrentOccupancy, ContactID, ManagerName)
SELECT ROW_NUMBER() OVER () + 10000, CONCAT('FosterHome_', ROW_NUMBER() OVER ()), CONCAT('Address_', ROW_NUMBER() OVER ()),
FLOOR(RAND() * 500) + 500, 0, FLOOR(RAND() * 100) + 1, CONCAT('Manager_', ROW_NUMBER() OVER ())
FROM (SELECT * FROM information_schema.tables LIMIT 5000) AS T;
```

### Expected Results
- **Performance Testing**: Ensures efficient bulk inserts and updates.
- **Referential Integrity**: Maintains foreign key constraints.
- **Trigger Testing**: Validates adoption tracking.

### Conclusion
The stress testing script simulates high-load scenarios to validate database efficiency and reliability.

---
**End of Documentation**

