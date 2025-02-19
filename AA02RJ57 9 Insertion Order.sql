-- Select SCHEMA
USE AA02RJ57_FurEver_Home;

-- Step 1: Insert into Independent Table (No FK Dependencies)
INSERT INTO contactdetails (ContactPerson, ContactPhone)
VALUES ('Abhijeet', '8368256880');

-- Step 2: Insert into Tables Referencing Independent Tables
INSERT INTO fosterhomes (FosterHomeID, Name, Address, ManagerName, ContactPhone, Capacity, CurrentOccupancy, ContactID)
VALUES (99999, 'Jeev Sewa Ashram', 'MG Road, Delhi, India', 'Rajesh Verma', '8368256885', 10, 0, LAST_INSERT_ID());

-- Step 3: Insert into Core Tables
INSERT INTO adopters (AdopterID, Name, Email, Phone, Address, AdoptionFee)
VALUES (99999, 'Abhijeet', 'abhijeet1472@gmail.com', '9998887777', 'Sector 15, Noida, India', 1000.00);

INSERT INTO pets (PetID, Name, SpeciesID, Species, Breed, Age, Gender, Status, RescueDate, AdoptionDate, FosterHomeID)
VALUES (99999, 'Sheru', 1, 'Dog', 'Indian Pariah Dog', 4, 'Male', 'Available', '2025-02-01', NULL, 99999);

-- Step 4: Insert into Tables with Foreign Key Dependencies
INSERT INTO medicalrecords (MedicalRecordID, PetID, VaccinationDate, DiseaseHistory, IsVaccinated, Notes)
VALUES (99999, 99999, '2025-01-20', 'None', 1, 'Healthy and vaccinated. Regular check-ups advised.');

INSERT INTO customerfeedback (FeedbackID, AdopterID, Comments, Rating)
VALUES (99999, 99999, 'Adopting from Jeev Sewa Ashram was an amazing experience! Staff was very helpful.', 5);
