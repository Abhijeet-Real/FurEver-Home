-- Step 1: Ensuring First Normal Form (1NF)
-- Each column should have atomic values, and there should be no repeating groups
ALTER TABLE Pets MODIFY COLUMN Name VARCHAR(50) NOT NULL;
-- Fix Adopters Email duplicate index issue
SHOW INDEX FROM Adopters;
ALTER TABLE Adopters DROP INDEX Email;  -- Only if needed
ALTER TABLE Adopters MODIFY COLUMN Email VARCHAR(100) UNIQUE NOT NULL;

-- Step 2: Ensuring Second Normal Form (2NF)
-- Remove partial dependencies by ensuring that non-key attributes depend on the entire primary key
-- Example: Creating a separate table for species details
CREATE TABLE IF NOT EXISTS Species (
    SpeciesID INT PRIMARY KEY AUTO_INCREMENT,
    SpeciesName VARCHAR(30) UNIQUE NOT NULL
);

-- Modify Pets table to reference SpeciesID instead of storing species name directly
ALTER TABLE Pets ADD COLUMN SpeciesID INT;
ALTER TABLE Pets ADD FOREIGN KEY (SpeciesID) REFERENCES Species(SpeciesID);

-- Automatically populate Species table with distinct values from Pets
INSERT INTO Species (SpeciesName)
SELECT DISTINCT Species FROM Pets WHERE Species IS NOT NULL
ON DUPLICATE KEY UPDATE SpeciesName = SpeciesName;

-- Step 3: Ensuring Third Normal Form (3NF)
-- Remove transitive dependencies by ensuring that non-key attributes depend only on the primary key
CREATE TABLE IF NOT EXISTS ContactDetails (
    ContactID INT PRIMARY KEY AUTO_INCREMENT,
    ContactPerson VARCHAR(100) NOT NULL,
    ContactPhone VARCHAR(15) UNIQUE NOT NULL
);

-- Modify FosterHomes to reference ContactDetails instead of storing them directly
ALTER TABLE FosterHomes ADD COLUMN ContactID INT;
ALTER TABLE FosterHomes ADD FOREIGN KEY (ContactID) REFERENCES ContactDetails(ContactID);

-- Step 4: Enforcing Foreign Key Constraints to Prevent Orphan Records
ALTER TABLE Pets ADD CONSTRAINT fk_fosterhome FOREIGN KEY (FosterHomeID) REFERENCES FosterHomes(FosterHomeID) ON DELETE CASCADE;
ALTER TABLE MedicalRecords ADD CONSTRAINT fk_pet_medical FOREIGN KEY (PetID) REFERENCES Pets(PetID) ON DELETE CASCADE;
ALTER TABLE Rescuers ADD CONSTRAINT fk_rescuer_pet FOREIGN KEY (PetID) REFERENCES Pets(PetID) ON DELETE SET NULL;
ALTER TABLE Rescuers ADD CONSTRAINT fk_rescuer_adopter FOREIGN KEY (AdopterID) REFERENCES Adopters(AdopterID) ON DELETE SET NULL;

-- Step 5: Implementing CHECK Constraints for Data Validation
ALTER TABLE Pets ADD CONSTRAINT chk_pet_age CHECK (Age >= 0);
ALTER TABLE FosterHomes ADD CONSTRAINT chk_capacity CHECK (Capacity >= 0 AND Capacity >= CurrentOccupancy);
ALTER TABLE MedicalRecords ADD CONSTRAINT chk_vaccination CHECK (IsVaccinated IN (0,1));

-- Step 6: Indexing for Performance Optimization
-- Fix Pets duplicate index issue
SHOW INDEX FROM Pets;
DROP INDEX idx_pet_name ON Pets;  -- Only if it exists
CREATE INDEX idx_pet_name ON Pets(Name);
CREATE INDEX idx_adopter_email ON Adopters(Email);
CREATE INDEX idx_fosterhome_capacity ON FosterHomes(Capacity);

-- Step 7: Normalization and Constraints Verification
-- Query to check if normalization changes were successfully implemented
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_KEY
FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Pets';
