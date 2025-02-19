# **Pet Adoption and Rescue Management System**

## **📌 Project Overview**
The **Pet Adoption and Rescue Management System** is a structured **SQL-based database** designed to manage and streamline the **adoption and rescue** process of pets. The system ensures **efficient record-keeping**, **automation via triggers**, **optimized data retrieval**, and **enforced constraints for data integrity**.

---

## **📂 Features & Functionalities**
✔ **Database Schema Definition** (Structured tables & relationships)  
✔ **Data Normalization** (1NF, 2NF, 3NF)  
✔ **Automated Triggers** (Occupancy, adoption tracking, cascading deletes)  
✔ **Optimized Data Retrieval** (Indexed queries, JOINs, filtering)  
✔ **CRUD Operations** (Insert, Update, Delete, Select)  
✔ **Schema Modifications & Performance Enhancements**  

---

## **🛠️ Technology Stack**
- **Database:** MySQL
- **Languages:** SQL
- **Development Tools:** MySQL Workbench, OneDrive (Cloud Storage)
- **Version Control:** Git & GitHub
- **Indexing & Optimization:** Performance tuning via indexing

---

## **📁 Folder Structure**
```
📂 Pet-Adoption-Rescue-Management/
├── 📁 Dump/                     # Database backup and exports
├── 📄 .gitignore                 # Ignore unnecessary files
├── 📄 AA02RJ57 1 Database Schema Definition Script.sql
├── 📄 AA02RJ57 2 Database Automation & Integrity.sql
├── 📄 AA02RJ57 3 Initial Data Insertion Script.sql
├── 📄 AA02RJ57 4 Optimized Data Retrieval & Querying.sql
├── 📄 AA02RJ57 5 Database Normalization & Constraints Enforcement.sql
├── 📄 AA02RJ57 6 Comprehensive CRUD Operations.sql
├── 📄 AA02RJ57 7 Database Schema Modification & Optimization.sql
├── 📄 ERD FurEver Home - Evolution 1.pdf   # Entity-Relationship Diagram (ERD)
├── 📄 SQL Script Documentation.md         # Detailed documentation
└── 📄 Project_Report.ipynb     # Project report template
```

---

## **⚙️ Setup & Installation**
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/Abhijeet-Real/FurEver-Home.git
   cd Pet-Adoption-Rescue-Management
   ```
2. **Import the Database:**
   - Open **MySQL Workbench** or **command line**.
   - Run:
     ```sh
     mysql -u your_username -p < Dump/database_dump.sql
     ```
3. **Execute SQL Scripts in Order:**
   - **Step 1:** `Database Schema Definition Script.sql`
   - **Step 2:** `Initial Data Insertion Script.sql`
   - **Step 3:** `Database Automation & Integrity.sql`
   - **Step 4:** `Optimized Data Retrieval & Querying.sql`
   - **Step 5:** `Database Normalization & Constraints Enforcement.sql`
   - **Step 6:** `Comprehensive CRUD Operations.sql`
   - **Step 7:** `Database Schema Modification & Optimization.sql`

---

## **📊 Database Schema & Relationships**
The system is structured around several key tables:

### **📌 Key Tables**
1️⃣ **`Pets`** - Stores pet information.  
2️⃣ **`Adopters`** - Stores adopter details.  
3️⃣ **`FosterHomes`** - Manages foster home data.  
4️⃣ **`MedicalRecords`** - Maintains pet medical history.  
5️⃣ **`Rescuers`** - Stores details of pet rescuers.  
6️⃣ **`PetSpecies`** - Normalized species table.  
7️⃣ **`CustomerFeedback`** - Stores feedback from adopters.  

### **🔗 Relationships**
- **One-to-One:** Pets → MedicalRecords, Pets → Adopters
- **Many-to-One:** Pets → FosterHomes, Pets → PetSpecies
- **One-to-Many:** Adopters → CustomerFeedback, FosterHomes → ContactDetails

---

## **📜 Database Constraints & Triggers**
- **Foreign Key Constraints** to maintain relational integrity.
- **Check Constraints** (e.g., Age must be `>= 0`, Capacity must be `>= CurrentOccupancy`).
- **Triggers** to automate:
  - **Adoption tracking** (Auto-set adoption date when pet status changes).
  - **Foster home occupancy** (Auto-update on insert/update/delete).
  - **Cascade deletions** (Auto-delete dependent records).

---

## **📊 Data Retrieval & Query Optimization**
**Key Queries Implemented:**
✅ Fetch all pets & their details.  
✅ Retrieve available pets.  
✅ Retrieve pets based on search filters (e.g., species, age, name).  
✅ Find adopters who adopted within the last 6 months.  
✅ Retrieve unvaccinated pets.  
✅ Optimize searches using **INDEXING**.

---

## **🛠️ DDL & Schema Modifications**
- **Added new columns:** (e.g., `AdoptionFee` in Adopters)
- **Modified data types for optimization.**
- **Renamed tables for better clarity.**
- **Indexed frequently searched fields.**

---

## **📌 Issues & Future Enhancements**
### **🔴 Known Issues:**
- OneDrive creates unwanted metadata files, affecting Git tracking.
- Safe update mode prevents certain deletions; needs manual override.

### **🚀 Future Enhancements:**
- Integration with a **web-based front-end**.
- Implementation of **stored procedures for bulk operations**.
- Advanced **search & filtering options**.

---

## **📜 License**
This project is licensed under the **MIT License** – feel free to modify and use it as needed.

---

## **🤝 Contributing**
We welcome contributions! To contribute:
1. Fork the repo.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit changes (`git commit -m "Your changes"`).
4. Push the branch (`git push origin feature-branch`).
5. Open a **Pull Request**.

---

## **📞 Contact & Support**
For any issues or queries, reach out via:
📧 **Email:** Abhijeet1472@gmail.com 
🔗 **GitHub Issues:** [Open an issue](https://github.com/Abhijeet-Real/Pet-Adoption-Rescue-Management/issues)

🚀 **Happy Coding!** 🎉

