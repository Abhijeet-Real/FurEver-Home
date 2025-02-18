-- DDL: ALTER TABLE Statements for Pet Adoption and Rescue Management System

-- 1. Adding a new column to track the adoption fee in the Adopters table
ALTER TABLE Adopters 
ADD COLUMN AdoptionFee DECIMAL(10,2) DEFAULT 0.00;

-- 2. Modifying the data type of Phone in FosterHomes to accommodate international numbers
ALTER TABLE FosterHomes 
MODIFY COLUMN ContactPhone VARCHAR(20);

UPDATE Pets 
SET SpeciesID = (SELECT MIN(SpeciesID) FROM Species) 
WHERE SpeciesID IS NULL;

-- 3. Adding a NOT NULL constraint to ensure every pet has a species assigned
ALTER TABLE Pets 
MODIFY COLUMN SpeciesID INT NOT NULL;

-- 4. Renaming the 'ContactPerson' column in FosterHomes to 'ManagerName' for better clarity
ALTER TABLE FosterHomes 
RENAME COLUMN ContactPerson TO ManagerName;

-- 5. Creating CustomerFeedback table before modifying it
-- Creating the CustomerFeedback table if it doesn't exist
CREATE TABLE IF NOT EXISTS CustomerFeedback (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    AdopterID INT,
    Comments TEXT,
    Rating INT,
    FeedbackDate DATE,
    FOREIGN KEY (AdopterID) REFERENCES Adopters(AdopterID) ON DELETE CASCADE
);

-- 5. Dropping an unnecessary column from CustomerFeedback (if FeedbackDate is redundant)
ALTER TABLE CustomerFeedback 
DROP COLUMN FeedbackDate;

-- 6. Adding a Foreign Key constraint to link CustomerFeedback with Adopters
ALTER TABLE CustomerFeedback 
ADD CONSTRAINT fk_adopter_feedback FOREIGN KEY (AdopterID) REFERENCES Adopters(AdopterID) ON DELETE CASCADE;

-- 7. Renaming the 'Species' table to 'PetSpecies' to avoid confusion
ALTER TABLE Species 
RENAME TO PetSpecies;

-- 8. Adding a UNIQUE constraint to ensure no duplicate phone numbers exist in FosterHomes
ALTER TABLE FosterHomes 
ADD CONSTRAINT unique_contact_phone UNIQUE (ContactPhone);

-- 9. Updating triggers to avoid recursive updates
DROP TRIGGER IF EXISTS after_status_update;
DELIMITER $$
CREATE TRIGGER after_status_update
BEFORE UPDATE ON Pets
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Adopted' AND OLD.Status <> 'Adopted' THEN
        SET NEW.AdoptionDate = NOW();
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS after_pet_insert;
DELIMITER $$
CREATE TRIGGER after_pet_insert
AFTER INSERT ON Pets
FOR EACH ROW
BEGIN
    UPDATE FosterHomes
    SET CurrentOccupancy = CurrentOccupancy + 1
    WHERE FosterHomeID = NEW.FosterHomeID;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS after_pet_update;
DELIMITER $$
CREATE TRIGGER after_pet_update
BEFORE UPDATE ON Pets
FOR EACH ROW
BEGIN
    IF OLD.FosterHomeID IS NOT NULL AND OLD.FosterHomeID <> NEW.FosterHomeID THEN
        UPDATE FosterHomes
        SET CurrentOccupancy = CurrentOccupancy - 1
        WHERE FosterHomeID = OLD.FosterHomeID;
    END IF;
    IF NEW.FosterHomeID IS NOT NULL AND OLD.FosterHomeID <> NEW.FosterHomeID THEN
        UPDATE FosterHomes
        SET CurrentOccupancy = CurrentOccupancy + 1
        WHERE FosterHomeID = NEW.FosterHomeID;
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS after_pet_delete;
DELIMITER $$
CREATE TRIGGER after_pet_delete
AFTER DELETE ON Pets
FOR EACH ROW
BEGIN
    UPDATE FosterHomes
    SET CurrentOccupancy = CurrentOccupancy - 1
    WHERE FosterHomeID = OLD.FosterHomeID;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS before_foster_delete;
DELIMITER $$
CREATE TRIGGER before_foster_delete
BEFORE DELETE ON FosterHomes
FOR EACH ROW
BEGIN
    IF OLD.CurrentOccupancy > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a FosterHome that still has pets.';
    END IF;
END$$
DELIMITER ;
