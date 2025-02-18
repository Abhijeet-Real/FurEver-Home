-- Drop the schema if it exists to avoid errors
DROP SCHEMA IF EXISTS aa02rj57_furever_home;

-- Recreate the schema
CREATE SCHEMA aa02rj57_furever_home;
USE aa02rj57_furever_home;

-- Table 1: FosterHomes
CREATE TABLE FosterHomes (
    FosterHomeID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address TEXT NOT NULL,
    ContactPerson VARCHAR(100) NOT NULL,
    ContactPhone VARCHAR(15) NOT NULL,
    Capacity INT NOT NULL,
    CurrentOccupancy INT DEFAULT 0
);

-- Table 2: Pets
CREATE TABLE Pets (
    PetID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Species VARCHAR(30) NOT NULL,
    Breed VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Status VARCHAR(20) DEFAULT 'Available',
    RescueDate DATE NOT NULL,
    AdoptionDate DATE,
    FosterHomeID INT,
    FOREIGN KEY (FosterHomeID) REFERENCES FosterHomes(FosterHomeID)
);

-- Table 3: Adopters
CREATE TABLE Adopters (
    AdopterID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Address TEXT NOT NULL
);

-- Table 4: MedicalRecords
CREATE TABLE MedicalRecords (
    MedicalRecordID INT PRIMARY KEY,
    PetID INT UNIQUE,
    VaccinationDate DATE,
    DiseaseHistory TEXT,
    IsVaccinated BOOLEAN DEFAULT FALSE,
    Notes TEXT,
    FOREIGN KEY (PetID) REFERENCES Pets(PetID)
);

-- Table 5: Rescuers
CREATE TABLE Rescuers (
    RescuerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Organization VARCHAR(100),
    AdopterID INT,
    PetID INT UNIQUE,
    RescueDate DATE NOT NULL,
    FOREIGN KEY (AdopterID) REFERENCES Adopters(AdopterID),
    FOREIGN KEY (PetID) REFERENCES Pets(PetID)
);
