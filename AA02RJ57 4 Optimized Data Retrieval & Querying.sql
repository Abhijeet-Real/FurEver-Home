-- Step 1: Basic SELECT Queries
-- Retrieve all pets
SELECT * FROM Pets;

-- Retrieve specific columns (Pet Name, Species, Age)
SELECT Name, Species, Age FROM Pets;

-- Step 2: Using WHERE Clause
-- Retrieve only available pets
SELECT Name, Species, Age, Status FROM Pets WHERE Status = 'Available';

-- Retrieve pets younger than 3 years
SELECT Name, Age, Species FROM Pets WHERE Age < 3;

-- Retrieve pets rescued in 2024
SELECT Name, RescueDate FROM Pets WHERE YEAR(RescueDate) = 2024;

-- Step 3: Using LIKE for Pattern Matching
-- Retrieve pets whose names start with 'R'
SELECT Name, Species FROM Pets WHERE Name LIKE 'R%';

-- Retrieve pets whose names end with 'a'
SELECT Name, Species FROM Pets WHERE Name LIKE '%a';

-- Retrieve pets whose name contains 'o' anywhere
SELECT Name, Species FROM Pets WHERE Name LIKE '%o%';

-- Step 4: Using ORDER BY to Sort Data
-- Retrieve pets sorted by Age (youngest to oldest)
SELECT Name, Age FROM Pets ORDER BY Age ASC;

-- Retrieve pets sorted by Age (oldest to youngest)
SELECT Name, Age FROM Pets ORDER BY Age DESC;

-- Retrieve pets sorted by name alphabetically
SELECT Name, Species FROM Pets ORDER BY Name ASC;

-- Step 5: Using JOINs for Multi-Table Queries
-- Retrieve all available pets along with their foster home details
SELECT Pets.Name, Pets.Species, Pets.Age, FosterHomes.Name AS Foster_Home, FosterHomes.Address
FROM Pets
JOIN FosterHomes ON Pets.FosterHomeID = FosterHomes.FosterHomeID
WHERE Pets.Status = 'Available';

-- Retrieve all pets along with their adopter details (if adopted)
SELECT Pets.Name, Pets.Species, Adopters.Name AS Adopter_Name, Adopters.Email
FROM Pets
LEFT JOIN Rescuers ON Pets.PetID = Rescuers.PetID
LEFT JOIN Adopters ON Rescuers.AdopterID = Adopters.AdopterID
ORDER BY Pets.Name ASC;

-- Step 6: Using GROUP BY & HAVING for Aggregation
-- Count the number of pets in each foster home
SELECT FosterHomes.Name, COUNT(Pets.PetID) AS Total_Pets
FROM FosterHomes
LEFT JOIN Pets ON FosterHomes.FosterHomeID = Pets.FosterHomeID
GROUP BY FosterHomes.Name;

-- Count pets by species
SELECT Species, COUNT(*) AS Pet_Count FROM Pets GROUP BY Species;

-- Show only species with more than 5 pets
SELECT Species, COUNT(*) AS Pet_Count FROM Pets GROUP BY Species HAVING COUNT(*) > 5;

-- Step 7: Using Date Functions for Time-Based Queries
-- Find adopters who adopted pets within the last 6 months
SELECT Adopters.Name, Adopters.Email, Pets.Name AS Adopted_Pet, Pets.AdoptionDate
FROM Rescuers
JOIN Pets ON Rescuers.PetID = Pets.PetID
JOIN Adopters ON Rescuers.AdopterID = Adopters.AdopterID
WHERE Pets.AdoptionDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- Retrieve medical history of pets with IsVaccinated = FALSE
SELECT Pets.Name, MedicalRecords.DiseaseHistory, MedicalRecords.Notes
FROM Pets
JOIN MedicalRecords ON Pets.PetID = MedicalRecords.PetID
WHERE MedicalRecords.IsVaccinated = FALSE;

-- Step 8: Optimizing Queries with Indexing
-- Create indexes to speed up searches
CREATE INDEX idx_pet_name ON Pets(Name);
CREATE INDEX idx_adoption_date ON Pets(AdoptionDate);

-- Final Step: Complex Query Combining Everything
-- Find all available pets with their foster home, medical history, and vaccination status, sorted by age
SELECT Pets.Name, Pets.Species, Pets.Age, FosterHomes.Name AS Foster_Home, 
       MedicalRecords.DiseaseHistory, MedicalRecords.IsVaccinated
FROM Pets
JOIN FosterHomes ON Pets.FosterHomeID = FosterHomes.FosterHomeID
LEFT JOIN MedicalRecords ON Pets.PetID = MedicalRecords.PetID
WHERE Pets.Status = 'Available'
ORDER BY Pets.Age ASC;
