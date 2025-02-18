-- Trigger 1: Automatically set AdoptionDate when Status is updated to 'Adopted'
DELIMITER $$
CREATE TRIGGER after_status_update
AFTER UPDATE ON Pets
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Adopted' AND OLD.Status <> 'Adopted' THEN
        UPDATE Pets
        SET AdoptionDate = NOW()
        WHERE PetID = NEW.PetID;
    END IF;
END$$
DELIMITER ;

-- Trigger 2: Maintain CurrentOccupancy in FosterHomes after inserting a pet
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

-- Trigger 3: Maintain CurrentOccupancy in FosterHomes after updating FosterHomeID
DELIMITER $$
CREATE TRIGGER after_pet_update
AFTER UPDATE ON Pets
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

-- Trigger 4: Maintain CurrentOccupancy in FosterHomes after deleting a pet
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

-- Trigger 5: Prevent FosterHomes from exceeding Capacity
DELIMITER $$
CREATE TRIGGER before_pet_insert
BEFORE INSERT ON Pets
FOR EACH ROW
BEGIN
    DECLARE home_capacity INT;
    DECLARE home_occupancy INT;

    SELECT Capacity, CurrentOccupancy INTO home_capacity, home_occupancy
    FROM FosterHomes
    WHERE FosterHomeID = NEW.FosterHomeID;

    IF home_occupancy >= home_capacity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Foster home has reached its maximum capacity';
    END IF;
END$$
DELIMITER ;

-- Delettion Trigger

-- Trigger 1: Cascade delete MedicalRecords when a Pet is deleted
DELIMITER $$
CREATE TRIGGER after_pet_delete_medical
AFTER DELETE ON Pets
FOR EACH ROW
BEGIN
    DELETE FROM MedicalRecords
    WHERE PetID = OLD.PetID;
END$$
DELIMITER ;

-- Trigger 4: Handle deletion of Adopters
-- If an Adopter is deleted, set AdopterID to NULL in Rescuers to avoid orphan records
DELIMITER $$
CREATE TRIGGER after_adopter_delete
AFTER DELETE ON Adopters
FOR EACH ROW
BEGIN
    UPDATE Rescuers
    SET AdopterID = NULL
    WHERE AdopterID = OLD.AdopterID;
END$$
DELIMITER ;
