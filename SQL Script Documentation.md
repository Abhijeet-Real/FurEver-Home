# **SQL Scripts Documentation**

## **1. Database Schema Definition Script**

### **Description**
The **Database Schema Definition Script** sets up the relational database for the **Pet Adoption and Foster Care System**. It defines tables with appropriate constraints and relationships to ensure data integrity and efficiency.

### **Schema Details**

#### **FosterHomes Table**
- **FosterHomeID** (INT, PK) - Unique identifier for each foster home.
- **Name** (VARCHAR(100)) - Name of the foster home.
- **Address** (TEXT) - Location details.
- **ContactPerson** (VARCHAR(100)) - Name of the primary contact person.
- **ContactPhone** (VARCHAR(15)) - Contact phone number.
- **Capacity** (INT) - Maximum number of pets allowed.
- **CurrentOccupancy** (INT) - Number of pets currently housed.

#### **Pets Table**
- **PetID** (INT, PK) - Unique identifier for each pet.
- **Name** (VARCHAR(50)) - Name of the pet.
- **Species** (VARCHAR(30)) - Type of pet (e.g., Dog, Cat, Bird).
- **Breed** (VARCHAR(50)) - Breed of the pet.
- **Age** (INT) - Pet's age in years.
- **Gender** (VARCHAR(10)) - Gender of the pet.
- **Status** (VARCHAR(20)) - Availability status (Adopted/Available).
- **RescueDate** (DATE) - Date of rescue.
- **AdoptionDate** (DATE, NULL) - Date of adoption.
- **FosterHomeID** (INT, FK) - Links to **FosterHomes**.

#### **Adopters Table**
- **AdopterID** (INT, PK) - Unique identifier for each adopter.
- **Name** (VARCHAR(100)) - Full name.
- **Email** (VARCHAR(100), UNIQUE) - Email address.
- **Phone** (VARCHAR(15)) - Contact number.
- **Address** (TEXT) - Residential address.

#### **MedicalRecords Table**
- **MedicalRecordID** (INT, PK) - Unique identifier for each medical record.
- **PetID** (INT, FK) - Links to **Pets**.
- **VaccinationDate** (DATE) - Last vaccination date.
- **DiseaseHistory** (TEXT) - Past illnesses.
- **IsVaccinated** (BOOLEAN) - 1 if vaccinated, 0 if not.
- **Notes** (TEXT) - Additional medical details.

#### **Rescuers Table**
- **RescuerID** (INT, PK) - Unique identifier for each rescuer.
- **Name** (VARCHAR(100)) - Name of the rescuer.
- **Phone** (VARCHAR(15)) - Contact details.
- **Organization** (VARCHAR(100)) - Associated organization (if any).
- **AdopterID** (INT, FK) - Links to **Adopters**.
- **PetID** (INT, FK) - Links to **Pets**.
- **RescueDate** (DATE) - Date of rescue.

---

## **2. Initial Data Insertion Script**

### **Description**
The **Initial Data Insertion Script** populates the tables with sample records for testing and demonstration purposes.

### **Sample Data Entries**
- **FosterHomes**: 20 records with realistic names and contact details.
- **Pets**: 20 records linking pets to foster homes.
- **Adopters**: 20 adopters with realistic information.
- **MedicalRecords**: 20 entries tracking pet health.
- **Rescuers**: 20 rescuers assigned to rescued pets.

---

## **3. Database Automation & Integrity Triggers**

### **Description**
This script automates database updates and ensures data consistency through triggers.

### **Triggers Implemented**

#### **Adoption Tracking**
- **Trigger:** `after_status_update`
- **Action:** Automatically sets `AdoptionDate` when the pet's status is updated to "Adopted."

#### **Foster Home Occupancy Management**
- **Trigger:** `after_pet_insert` → Increases `CurrentOccupancy` when a pet is assigned to a foster home.
- **Trigger:** `after_pet_update` → Updates `CurrentOccupancy` when a pet is moved between foster homes.
- **Trigger:** `after_pet_delete` → Decreases `CurrentOccupancy` when a pet is removed.
- **Trigger:** `before_pet_insert` → Prevents over-occupancy.

#### **Cascading Deletions**
- **Trigger:** `after_pet_delete_medical` → Deletes associated `MedicalRecords` when a pet is removed.
- **Trigger:** `after_pet_delete_rescuer` → Deletes associated `Rescuers` records when a pet is removed.
- **Trigger:** `before_foster_delete` → Prevents deletion of foster homes with active pets.

---

## **4. Optimized Data Retrieval & Querying**

### **Description**
This script contains optimized SQL queries for retrieving relevant data efficiently.

### **Implemented Queries**
- Retrieve all pets and their details.
- Find adopters who adopted pets within the last 6 months.
- Retrieve medical history of unvaccinated pets.
- Optimize queries with indexes on frequently searched fields (e.g., `Pets.Name`, `Adopters.Email`).

---

## **5. Database Normalization & Constraints Enforcement**

### **Description**
This script ensures compliance with **1NF, 2NF, and 3NF** and enforces referential integrity.

### **Normalization Steps**
- **1NF:** Ensured atomicity by moving species to a separate `Species` table.
- **2NF:** Removed partial dependencies by moving contact details into a separate `ContactDetails` table.
- **3NF:** Eliminated transitive dependencies by ensuring every column depends only on the primary key.

### **Constraints Implemented**
- **Foreign Keys:** Prevent orphan records.
- **CHECK Constraints:** Validate data integrity (e.g., `Pet Age >= 0`).
- **Indexes:** Improve query performance on key columns.

---

## **6. Comprehensive CRUD Operations**

### **Description**
This script includes Create, Read, Update, and Delete (CRUD) operations for managing records in the system.

### **Examples**
- **Updating pet adoption status**
- **Deleting old medical records**
- **Inserting new adopters and rescued pets**

---

## **7. Database Schema Modification & Optimization (DDL ALTER Script)**

### **Description**
The **DDL ALTER script** was created to **modify and optimize the database structure** while preserving data.

### **Key Modifications**
1. **Adding New Columns**
   - Added `AdoptionFee` to `Adopters`.
   - Added `ContactID` to `FosterHomes`.
2. **Modifying Data Types**
   - Expanded `ContactPhone` field.
3. **Adding Constraints**
   - Enforced `NOT NULL` on `SpeciesID` in `Pets`.
   - Implemented CHECK constraints for `Age` and `Capacity`.
4. **Foreign Key Enhancements**
   - Ensured referential integrity for **CustomerFeedback** and **Rescuers**.
5. **Performance Indexing**
   - Created indexes on `Pets(Name)`, `Adopters(Email)`, and `FosterHomes(Capacity)`.

---

This documentation provides a structured overview of all major scripts, ensuring a well-documented and efficient pet adoption management system. 🚀

