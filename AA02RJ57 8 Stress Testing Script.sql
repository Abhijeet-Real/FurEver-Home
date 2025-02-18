-- Stress Testing Script for Final Schema

-- Step 1: Bulk Insert for FosterHomes (Ensuring Availability Before Pets Insertion)
INSERT INTO FosterHomes (FosterHomeID, Name, Address, Capacity, CurrentOccupancy, ContactID, ManagerName)
SELECT
    ROW_NUMBER() OVER () + 10000, 
    CONCAT('FosterHome_', ROW_NUMBER() OVER ()), 
    CONCAT('Address_', ROW_NUMBER() OVER ()), 
    FLOOR(RAND() * 500) + 500, 
    0,  -- Ensuring all foster homes start with zero occupancy
    FLOOR(RAND() * 100) + 1,
    CONCAT('Manager_', ROW_NUMBER() OVER ())
FROM (SELECT * FROM information_schema.tables LIMIT 5000) AS T;

-- Step 2: Adjust Foster Home Capacities and Update Occupancy

-- Create a Temporary Table for FosterHome IDs
DROP TEMPORARY TABLE IF EXISTS TempFosterHomeIDs;
CREATE TEMPORARY TABLE TempFosterHomeIDs AS
SELECT FosterHomeID FROM FosterHomes;

-- Update Capacity Using the Temporary Table
UPDATE FosterHomes FH
JOIN TempFosterHomeIDs Temp
ON FH.FosterHomeID = Temp.FosterHomeID
SET FH.Capacity = FLOOR(RAND() * 500) + 500;

-- Drop Temporary Table After Use
DROP TEMPORARY TABLE IF EXISTS TempFosterHomeIDs;
-- Step 2.1: Create a Temporary Table for Managing Foster Home Capacities
DROP TEMPORARY TABLE IF EXISTS TempFosterHomeIDs;
CREATE TEMPORARY TABLE TempFosterHomeIDs AS
SELECT FosterHomeID FROM FosterHomes;

-- Update Capacity Using the Temporary Table
UPDATE FosterHomes FH
JOIN TempFosterHomeIDs Temp
ON FH.FosterHomeID = Temp.FosterHomeID
SET FH.Capacity = FLOOR(RAND() * 500) + 500;

-- Drop Temporary Table After Use
DROP TEMPORARY TABLE IF EXISTS TempFosterHomeIDs;

UPDATE FosterHomes FH
JOIN (SELECT FosterHomeID FROM FosterHomes ORDER BY RAND() LIMIT 2500) AS Temp
ON FH.FosterHomeID = Temp.FosterHomeID
SET FH.CurrentOccupancy = FLOOR(RAND() * FH.Capacity);

-- Step 3: Create a Temporary Table for Available Foster Homes
DROP TEMPORARY TABLE IF EXISTS TempAvailableFosterHomes;

CREATE TEMPORARY TABLE TempAvailableFosterHomes AS
SELECT FosterHomeID FROM FosterHomes WHERE CurrentOccupancy < Capacity;
-- Step 3.1: Prepare Temporary Table for Foster Home Availability

-- Step 4: Bulk Insert for Pets (Assigning to Available Foster Homes)
INSERT INTO Pets (PetID, Name, SpeciesID, Breed, Age, Gender, Status, RescueDate, AdoptionDate, Species, FosterHomeID)
SELECT 
    ROW_NUMBER() OVER () + 10000, 
    CONCAT('Pet_', ROW_NUMBER() OVER ()), 
    FLOOR(RAND() * 10) + 1, 
    CONCAT('Breed_', FLOOR(RAND() * 10)), 
    FLOOR(RAND() * 15), 
    CASE WHEN RAND() > 0.5 THEN 'Male' ELSE 'Female' END, 
    CASE WHEN RAND() > 0.5 THEN 'Available' ELSE 'Adopted' END, 
    CAST(DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 1000) DAY) AS DATE), 
    NULL, 'Unknown', (SELECT FosterHomeID FROM TempAvailableFosterHomes ORDER BY RAND() LIMIT 1)
FROM Pets
ORDER BY RAND()
LIMIT 10000;

-- Step 5: Drop Temporary Table After Use
DROP TEMPORARY TABLE IF EXISTS TempAvailableFosterHomes;
DROP TEMPORARY TABLE IF EXISTS AvailableFosterHomes;

-- Step 6: Bulk Insert for Adopters (Creating Sample Adopter Data)
INSERT INTO Adopters (AdopterID, Name, Email, Phone, Address, AdoptionFee)
SELECT
    ROW_NUMBER() OVER () + 10000, 
    CONCAT('Adopter_', ROW_NUMBER() OVER ()), 
    CONCAT('adopter', ROW_NUMBER() OVER (), '@example.com'), 
    CONCAT('+91', FLOOR(RAND() * 10000000000)), 
    CONCAT('Address_', ROW_NUMBER() OVER ()), 
    ROUND(RAND() * 5000, 2)
FROM Pets ORDER BY RAND() LIMIT 10000;

-- Step 7: Bulk Insert for MedicalRecords (Assigning Health Data to Pets)
INSERT INTO MedicalRecords (MedicalRecordID, PetID, VaccinationDate, DiseaseHistory, IsVaccinated, Notes)
SELECT
    ROW_NUMBER() OVER () + 10000, 
    PetID,  -- Select only PetIDs that do not already exist in MedicalRecords
    CAST(DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 500) DAY) AS DATE), 
    CONCAT('History_', FLOOR(RAND() * 10)), 
    FLOOR(RAND() * 2), 
    CONCAT('Notes_', FLOOR(RAND() * 10))
FROM Pets
WHERE PetID NOT IN (SELECT PetID FROM MedicalRecords)  -- Exclude existing records
ORDER BY RAND()
LIMIT 10000;


-- End of Stress Testing Script
