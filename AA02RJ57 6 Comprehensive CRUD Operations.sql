-- Step 1: Updating Records
-- 1. Update pet's adoption status and set adoption date
UPDATE Pets 
SET Status = 'Adopted', AdoptionDate = CURDATE()
WHERE PetID = 101;

-- 2. Update foster home occupancy after a pet is moved
UPDATE FosterHomes 
SET CurrentOccupancy = CurrentOccupancy + 1 
WHERE FosterHomeID = (SELECT FosterHomeID FROM Pets WHERE PetID = 101);

-- 3. Update adopter’s contact details
UPDATE Adopters 
SET Phone = '9876543210', Email = 'new_email@example.com' 
WHERE AdopterID = 10;

-- 4. Update rescuer’s organization details
UPDATE Rescuers 
SET Organization = 'Animal Care Foundation' 
WHERE RescuerID = 5;

-- Step 2: Deleting Records
-- 1. Delete old medical records of pets that have been adopted for over a year
DELETE FROM MedicalRecords 
WHERE PetID IN (SELECT PetID FROM Pets WHERE Status = 'Adopted' AND AdoptionDate < DATE_SUB(CURDATE(), INTERVAL 1 YEAR));

-- 2. Delete inactive adopters who haven’t adopted a pet in the last 2 years
-- Fixing safe update mode issue in DELETE query
SET SQL_SAFE_UPDATES = 0;

DELETE FROM Pets 
WHERE Status = 'Deceased';

SET SQL_SAFE_UPDATES = 1;

-- Step 3: Inserting New Records
-- 1. Insert a new pet into the database
INSERT INTO Pets (PetID, Name, Species, Breed, Age, Gender, Status, RescueDate, FosterHomeID) 
VALUES (201, 'Buddy', 'Dog', 'Labrador', 2, 'Male', 'Available', CURDATE(), 3);

-- 2. Insert a new adopter
INSERT INTO Adopters (AdopterID, Name, Email, Phone, Address) 
VALUES (25, 'John Doe', 'john.doe@example.com', '9988776655', '123 Main Street, Cityville');

-- 3. Insert a new foster home
INSERT INTO FosterHomes (FosterHomeID, Name, Address, ContactPerson, ContactPhone, Capacity, CurrentOccupancy) 
VALUES (21, 'Happy Paws Shelter', '45 Elm Street, PetTown', 'Alice Johnson', '9090909090', 15, 5);

-- 4. Insert a new rescuer record
INSERT INTO Rescuers (RescuerID, Name, Phone, Organization, AdopterID, PetID, RescueDate) 
VALUES (22, 'Sarah Connor', '9234567890', 'Pet Rescue Initiative', 25, 201, CURDATE());
