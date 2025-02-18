CREATE DATABASE  IF NOT EXISTS `aa02rj57_furever_home` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aa02rj57_furever_home`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: aa02rj57_furever_home
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adopters`
--

DROP TABLE IF EXISTS `adopters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adopters` (
  `AdopterID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Address` text NOT NULL,
  `AdoptionFee` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`AdopterID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `idx_adopter_email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adopters`
--

LOCK TABLES `adopters` WRITE;
/*!40000 ALTER TABLE `adopters` DISABLE KEYS */;
INSERT INTO `adopters` VALUES (1,'Amit Sharma','amit.sharma@fsm.ac.in','9876543210','Delhi, India',0.00),(2,'Neha Verma','neha.verma@fsm.ac.in','9123456789','Mumbai, Maharashtra',0.00),(3,'Rohit Gupta','rohit.gupta@fsm.ac.in','9822334455','Pune, Maharashtra',0.00),(4,'Priya Singh','priya.singh@fsm.ac.in','9876501234','Lucknow, Uttar Pradesh',0.00),(5,'Arjun Reddy','arjun.reddy@fsm.ac.in','9745612345','Hyderabad, Telangana',0.00),(6,'Sneha Dubey','sneha.dubey@fsm.ac.in','9754321234','Bhopal, Madhya Pradesh',0.00),(7,'Kiran Shah','kiran.shah@fsm.ac.in','9898076543','Ahmedabad, Gujarat',0.00),(8,'Ravi Kumar','ravi.kumar@fsm.ac.in','9876345120','Chennai, Tamil Nadu',0.00),(9,'Anita Nair','anita.nair@fsm.ac.in','9847012345','Kochi, Kerala',0.00),(10,'Ramesh Reddy','new_email@example.com','9876543210','Bengaluru, Karnataka',0.00),(11,'Sonia D\'Souza','sonia.dsouza@fsm.ac.in','9823123456','Panaji, Goa',0.00),(12,'Hari Krishnan','hari.krishnan@fsm.ac.in','9842012345','Pondicherry',0.00),(13,'Shivani Patil','shivani.patil@fsm.ac.in','9823012345','Nagpur, Maharashtra',0.00),(14,'Anjali Mehta','anjali.mehta@fsm.ac.in','9832109876','Jaipur, Rajasthan',0.00),(15,'Vikram Iyer','vikram.iyer@fsm.ac.in','9445567890','Chennai, Tamil Nadu',0.00),(16,'Rohit Sharma','rohit.sharma@fsm.ac.in','9829012345','Jaipur, Rajasthan',0.00),(17,'Sanjay Gupta','sanjay.gupta@fsm.ac.in','9839011122','Lucknow, Uttar Pradesh',0.00),(18,'Pooja Mehra','pooja.mehra@fsm.ac.in','9878123456','Chandigarh',0.00),(19,'Neha Shah','neha.shah@fsm.ac.in','9898123456','Surat, Gujarat',0.00),(20,'Arvind Rao','arvind.rao@fsm.ac.in','9876543211','Hyderabad, Telangana',0.00),(25,'John Doe','john.doe@example.com','9988776655','123 Main Street, Cityville',0.00);
/*!40000 ALTER TABLE `adopters` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_adopter_delete` AFTER DELETE ON `adopters` FOR EACH ROW BEGIN
    UPDATE Rescuers
    SET AdopterID = NULL
    WHERE AdopterID = OLD.AdopterID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contactdetails`
--

DROP TABLE IF EXISTS `contactdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactdetails` (
  `ContactID` int NOT NULL AUTO_INCREMENT,
  `ContactPerson` varchar(100) NOT NULL,
  `ContactPhone` varchar(15) NOT NULL,
  PRIMARY KEY (`ContactID`),
  UNIQUE KEY `ContactPhone` (`ContactPhone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactdetails`
--

LOCK TABLES `contactdetails` WRITE;
/*!40000 ALTER TABLE `contactdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerfeedback`
--

DROP TABLE IF EXISTS `customerfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerfeedback` (
  `FeedbackID` int NOT NULL AUTO_INCREMENT,
  `AdopterID` int DEFAULT NULL,
  `Comments` text,
  `Rating` int DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `fk_adopter_feedback` (`AdopterID`),
  CONSTRAINT `customerfeedback_ibfk_1` FOREIGN KEY (`AdopterID`) REFERENCES `adopters` (`AdopterID`) ON DELETE CASCADE,
  CONSTRAINT `fk_adopter_feedback` FOREIGN KEY (`AdopterID`) REFERENCES `adopters` (`AdopterID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerfeedback`
--

LOCK TABLES `customerfeedback` WRITE;
/*!40000 ALTER TABLE `customerfeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fosterhomes`
--

DROP TABLE IF EXISTS `fosterhomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fosterhomes` (
  `FosterHomeID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` text NOT NULL,
  `ManagerName` varchar(100) NOT NULL,
  `ContactPhone` varchar(20) DEFAULT NULL,
  `Capacity` int NOT NULL,
  `CurrentOccupancy` int DEFAULT '0',
  `ContactID` int DEFAULT NULL,
  PRIMARY KEY (`FosterHomeID`),
  UNIQUE KEY `unique_contact_phone` (`ContactPhone`),
  KEY `ContactID` (`ContactID`),
  KEY `idx_fosterhome_capacity` (`Capacity`),
  CONSTRAINT `fosterhomes_ibfk_1` FOREIGN KEY (`ContactID`) REFERENCES `contactdetails` (`ContactID`),
  CONSTRAINT `chk_capacity` CHECK (((`Capacity` >= 0) and (`Capacity` >= `CurrentOccupancy`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fosterhomes`
--

LOCK TABLES `fosterhomes` WRITE;
/*!40000 ALTER TABLE `fosterhomes` DISABLE KEYS */;
INSERT INTO `fosterhomes` VALUES (1,'Paws Paradise','12 MG Road, Bengaluru, Karnataka','Arjun Reddy','9876543210',15,12,NULL),(2,'Furry Friends Shelter','45 Link Road, Mumbai, Maharashtra','Meera Desai','9123456789',20,14,NULL),(3,'Hope for Paws','78 Sector 18, Noida, Uttar Pradesh','Rahul Verma','9876501234',10,8,NULL),(4,'Happy Tails Home','22 Park Street, Kolkata, West Bengal','Priya Sen','9832109876',25,20,NULL),(5,'Safe Haven for Strays','19 Nehru Nagar, Chennai, Tamil Nadu','Vikram Iyer','9445567890',12,9,NULL),(6,'Animal Care Trust','5 MG Marg, Pune, Maharashtra','Anjali Patil','9822334455',18,14,NULL),(7,'Stray Rescue India','34 Green Road, Ahmedabad, Gujarat','Kiran Shah','9898076543',16,11,NULL),(8,'Pet Haven','50 NH Road, Hyderabad, Telangana','Ravi Kumar','9876345120',14,10,NULL),(9,'Kindness Shelter','66 Old Bus Stand, Kochi, Kerala','Anita Nair','9847012345',20,15,NULL),(10,'Love for Paws','10 Civil Lines, Jaipur, Rajasthan','Rohit Sharma','9829012345',10,8,NULL),(11,'Shelter for All','11 Residency Road, Lucknow, Uttar Pradesh','Sanjay Gupta','9839011122',15,11,NULL),(12,'Animal Aid','90 New Colony, Bhopal, Madhya Pradesh','Sneha Dubey','9754321234',22,16,NULL),(13,'Care Shelter','7 Rajendra Nagar, Patna, Bihar','Amit Kumar','9123456780',18,13,NULL),(14,'Pet Support Center','23 Main Street, Chandigarh','Pooja Mehra','9878123456',12,7,NULL),(15,'Helping Paws','45 City Center, Surat, Gujarat','Neha Shah','9898123456',14,10,NULL),(16,'Companion Shelter','88 Jubilee Hills, Hyderabad, Telangana','Arvind Rao','9876543211',16,14,NULL),(17,'Animal Rescue Home','56 Outer Ring Road, Bengaluru, Karnataka','Ramesh Reddy','9745612345',25,20,NULL),(18,'Friendly Paws','32 MG Road, Goa','Sonia D\'Souza','9823123456',10,6,NULL),(19,'Care for Creatures','18 Mission Street, Pondicherry','Hari Krishnan','9842012345',12,8,NULL),(20,'Paw Protectors','77 Shastri Nagar, Nagpur, Maharashtra','Shivani Patil','9823012345',20,16,NULL),(21,'Happy Paws Shelter','45 Elm Street, PetTown','Alice Johnson','9090909090',15,5,NULL);
/*!40000 ALTER TABLE `fosterhomes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_foster_delete` BEFORE DELETE ON `fosterhomes` FOR EACH ROW BEGIN
    IF OLD.CurrentOccupancy > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a FosterHome that still has pets.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medicalrecords`
--

DROP TABLE IF EXISTS `medicalrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalrecords` (
  `MedicalRecordID` int NOT NULL,
  `PetID` int DEFAULT NULL,
  `VaccinationDate` date DEFAULT NULL,
  `DiseaseHistory` text,
  `IsVaccinated` tinyint(1) DEFAULT '0',
  `Notes` text,
  PRIMARY KEY (`MedicalRecordID`),
  UNIQUE KEY `PetID` (`PetID`),
  CONSTRAINT `fk_pet_medical` FOREIGN KEY (`PetID`) REFERENCES `pets` (`PetID`) ON DELETE CASCADE,
  CONSTRAINT `medicalrecords_ibfk_1` FOREIGN KEY (`PetID`) REFERENCES `pets` (`PetID`),
  CONSTRAINT `chk_vaccination` CHECK ((`IsVaccinated` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalrecords`
--

LOCK TABLES `medicalrecords` WRITE;
/*!40000 ALTER TABLE `medicalrecords` DISABLE KEYS */;
INSERT INTO `medicalrecords` VALUES (1,1,'2024-12-15','None',1,'Healthy and active.'),(2,2,'2024-12-18','Allergic to dust',1,'Requires dust-free environment.'),(3,3,'2024-12-20','Skin infection (recovered)',1,'Fully recovered, no special care needed.'),(4,4,'2024-12-25','None',1,'Energetic and playful.'),(5,5,'2024-12-28','Eye infection (under treatment)',0,'Needs regular eye drops.'),(6,6,'2025-01-02','None',1,'Friendly and adaptable.'),(7,7,'2025-01-05','Limp in hind leg (recovering)',0,'Physiotherapy recommended.'),(8,8,'2025-01-08','None',1,'Vaccinations up to date.'),(9,9,'2025-01-10','Heartworm treatment (completed)',1,'Healthy post-treatment.'),(10,10,'2025-01-12','None',1,'Calm and affectionate.'),(11,11,'2025-01-15','Ear infection (under treatment)',0,'Needs ear cleaning and medication.'),(12,12,'2025-01-18','None',1,'Perfect for adoption.'),(13,13,'2025-01-20','None',1,'Well-socialized and healthy.'),(14,14,'2025-01-22','Anxiety (mild)',1,'Prefers a quiet home.'),(15,15,'2025-01-25','None',1,'Loves outdoor activities.'),(16,16,'2025-01-28','Dental issues (under treatment)',0,'Requires dental care.'),(17,17,'2025-01-30','None',1,'Very friendly with children.'),(18,18,'2025-02-02','None',1,'Loves attention and cuddles.'),(19,19,'2025-02-05','Obesity (managed)',1,'On a controlled diet.'),(20,20,'2025-02-10','None',1,'Excellent health and active.');
/*!40000 ALTER TABLE `medicalrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `PetID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Species` varchar(30) NOT NULL,
  `Breed` varchar(50) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'Available',
  `RescueDate` date NOT NULL,
  `AdoptionDate` date DEFAULT NULL,
  `FosterHomeID` int DEFAULT NULL,
  `SpeciesID` int NOT NULL,
  PRIMARY KEY (`PetID`),
  KEY `idx_adoption_date` (`AdoptionDate`),
  KEY `SpeciesID` (`SpeciesID`),
  KEY `fk_fosterhome` (`FosterHomeID`),
  KEY `idx_pet_name` (`Name`),
  CONSTRAINT `fk_fosterhome` FOREIGN KEY (`FosterHomeID`) REFERENCES `fosterhomes` (`FosterHomeID`) ON DELETE CASCADE,
  CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`FosterHomeID`) REFERENCES `fosterhomes` (`FosterHomeID`),
  CONSTRAINT `pets_ibfk_2` FOREIGN KEY (`SpeciesID`) REFERENCES `petspecies` (`SpeciesID`),
  CONSTRAINT `chk_pet_age` CHECK ((`Age` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,'Golu','Dog','Indian Pariah',3,'Female','Available','2025-01-01',NULL,1,1),(2,'Simran','Cat','Persian',2,'Male','Available','2025-01-05',NULL,2,1),(3,'Raja','Dog','Mudhol Hound',4,'Male','Available','2025-01-10',NULL,3,1),(4,'Laxmi','Dog','Rajapalayam',5,'Female','Available','2025-01-15',NULL,4,1),(5,'Chintu','Cat','Spotted Cat',2,'Female','Available','2025-01-20',NULL,5,1),(6,'Munni','Dog','Pandikona',1,'Male','Available','2025-01-25',NULL,6,1),(7,'Meow','Cat','Bengal',3,'Female','Available','2025-01-30',NULL,7,1),(8,'Sheru','Dog','Combai',6,'Male','Available','2025-02-01',NULL,8,1),(9,'Billu','Cat','Maine Coon',4,'Male','Available','2025-02-05',NULL,9,1),(10,'Rani','Dog','Chippiparai',2,'Female','Available','2025-02-10',NULL,10,1),(11,'Tiger','Dog','Kombai',5,'Male','Available','2025-02-15',NULL,11,1),(12,'Mishti','Cat','Ragdoll',3,'Female','Available','2025-02-20',NULL,12,1),(13,'Shankar','Dog','Jonangi',4,'Male','Available','2025-02-25',NULL,13,1),(14,'Chikoo','Cat','Abyssinian',2,'Female','Available','2025-03-01',NULL,14,1),(15,'Bhola','Dog','Himalayan Sheepdog',5,'Male','Available','2025-03-05',NULL,15,1),(16,'Sheela','Cat','Birman',4,'Female','Available','2025-03-10',NULL,16,1),(17,'Raja','Dog','Bakharwal',3,'Male','Available','2025-03-15',NULL,17,1),(18,'Zara','Cat','Scottish Fold',2,'Female','Available','2025-03-20',NULL,18,1),(19,'Kalu','Dog','Rampur Greyhound',6,'Male','Available','2025-03-25',NULL,19,1),(20,'Heera','Dog','Gaddi Kutta',4,'Female','Available','2025-03-30',NULL,20,1),(21,'Tipu','Dog','Indian Pariah',2,'Male','Available','2025-02-15',NULL,1,1),(22,'Chintu','Dog','Rajapalayam',3,'Male','Available','2025-02-16',NULL,2,1),(23,'Gudiya','Dog','Chippiparai',4,'Female','Available','2025-02-17',NULL,3,1),(24,'Shera','Dog','Kombai',5,'Male','Available','2025-02-18',NULL,4,1),(25,'Moti','Dog','Mudhol Hound',2,'Male','Available','2025-02-19',NULL,5,1),(26,'Rani','Dog','Bakharwal',3,'Female','Available','2025-02-20',NULL,6,1),(27,'Golu','Dog','Gaddi Kutta',4,'Male','Available','2025-02-21',NULL,7,1),(28,'Bhola','Dog','Himalayan Sheepdog',5,'Male','Available','2025-02-22',NULL,8,1),(29,'Heera','Dog','Jonangi',6,'Female','Available','2025-02-23',NULL,9,1),(30,'Raja','Dog','Pandikona',2,'Male','Available','2025-02-24',NULL,10,1),(31,'Bittu','Dog','Indian Pariah',3,'Male','Available','2025-02-25',NULL,11,1),(32,'Sonu','Dog','Chippiparai',4,'Male','Available','2025-02-26',NULL,12,1),(33,'Chikoo','Dog','Rajapalayam',5,'Male','Available','2025-02-27',NULL,13,1),(34,'Munna','Dog','Kombai',2,'Male','Available','2025-02-28',NULL,14,1),(35,'Meera','Dog','Mudhol Hound',3,'Female','Available','2025-03-01',NULL,15,1),(36,'Laxmi','Dog','Bakharwal',4,'Female','Available','2025-03-02',NULL,16,1),(37,'Kalu','Dog','Gaddi Kutta',5,'Male','Available','2025-03-03',NULL,17,1),(38,'Maya','Dog','Himalayan Sheepdog',6,'Female','Available','2025-03-04',NULL,18,1),(39,'Sheela','Dog','Jonangi',2,'Female','Available','2025-03-05',NULL,19,1),(40,'Ravi','Dog','Pandikona',3,'Male','Available','2025-03-06',NULL,20,1),(201,'Buddy','Dog','Labrador',2,'Male','Available','2025-02-18',NULL,3,1);
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_pet_insert` BEFORE INSERT ON `pets` FOR EACH ROW BEGIN
    DECLARE home_capacity INT;
    DECLARE home_occupancy INT;

    SELECT Capacity, CurrentOccupancy INTO home_capacity, home_occupancy
    FROM FosterHomes
    WHERE FosterHomeID = NEW.FosterHomeID;

    IF home_occupancy >= home_capacity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Foster home has reached its maximum capacity';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_pet_insert` AFTER INSERT ON `pets` FOR EACH ROW BEGIN
    UPDATE FosterHomes
    SET CurrentOccupancy = CurrentOccupancy + 1
    WHERE FosterHomeID = NEW.FosterHomeID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_status_update` BEFORE UPDATE ON `pets` FOR EACH ROW BEGIN
    IF NEW.Status = 'Adopted' AND OLD.Status <> 'Adopted' THEN
        SET NEW.AdoptionDate = NOW();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_pet_update` BEFORE UPDATE ON `pets` FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_pet_delete_medical` AFTER DELETE ON `pets` FOR EACH ROW BEGIN
    DELETE FROM MedicalRecords
    WHERE PetID = OLD.PetID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_pet_delete_rescuer` AFTER DELETE ON `pets` FOR EACH ROW BEGIN
    DELETE FROM Rescuers
    WHERE PetID = OLD.PetID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_pet_delete` AFTER DELETE ON `pets` FOR EACH ROW BEGIN
    UPDATE FosterHomes
    SET CurrentOccupancy = CurrentOccupancy - 1
    WHERE FosterHomeID = OLD.FosterHomeID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `petspecies`
--

DROP TABLE IF EXISTS `petspecies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `petspecies` (
  `SpeciesID` int NOT NULL AUTO_INCREMENT,
  `SpeciesName` varchar(30) NOT NULL,
  PRIMARY KEY (`SpeciesID`),
  UNIQUE KEY `SpeciesName` (`SpeciesName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petspecies`
--

LOCK TABLES `petspecies` WRITE;
/*!40000 ALTER TABLE `petspecies` DISABLE KEYS */;
INSERT INTO `petspecies` VALUES (2,'Cat'),(1,'Dog');
/*!40000 ALTER TABLE `petspecies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rescuers`
--

DROP TABLE IF EXISTS `rescuers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rescuers` (
  `RescuerID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Organization` varchar(100) DEFAULT NULL,
  `AdopterID` int DEFAULT NULL,
  `PetID` int DEFAULT NULL,
  `RescueDate` date NOT NULL,
  PRIMARY KEY (`RescuerID`),
  UNIQUE KEY `PetID` (`PetID`),
  KEY `fk_rescuer_adopter` (`AdopterID`),
  CONSTRAINT `fk_rescuer_adopter` FOREIGN KEY (`AdopterID`) REFERENCES `adopters` (`AdopterID`) ON DELETE SET NULL,
  CONSTRAINT `fk_rescuer_pet` FOREIGN KEY (`PetID`) REFERENCES `pets` (`PetID`) ON DELETE SET NULL,
  CONSTRAINT `rescuers_ibfk_1` FOREIGN KEY (`AdopterID`) REFERENCES `adopters` (`AdopterID`),
  CONSTRAINT `rescuers_ibfk_2` FOREIGN KEY (`PetID`) REFERENCES `pets` (`PetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rescuers`
--

LOCK TABLES `rescuers` WRITE;
/*!40000 ALTER TABLE `rescuers` DISABLE KEYS */;
INSERT INTO `rescuers` VALUES (1,'Arjun Reddy','9876543210','Paws for Hope',1,1,'2025-01-01'),(2,'Neha Verma','9123456789','Care for Animals',2,2,'2025-01-05'),(3,'Rohit Gupta','9822334455','Animal Savers',3,3,'2025-01-10'),(4,'Priya Singh','9876501234','Furry Friends Rescue',4,4,'2025-01-15'),(5,'Kiran Shah','9898076543','Animal Care Foundation',7,5,'2025-01-20'),(6,'Ravi Kumar','9876345120','Happy Paws Shelter',8,6,'2025-01-25'),(7,'Anita Nair','9847012345','Care for Strays',9,7,'2025-01-30'),(8,'Ramesh Reddy','9876543211','Pet Helpers Foundation',10,8,'2025-02-01'),(9,'Hari Krishnan','9842012345','Compassionate Care',12,9,'2025-02-05'),(10,'Sonia D\'Souza','9823123456','Love for Paws',11,10,'2025-02-10'),(11,'Shivani Patil','9823012345','Fur Haven',13,11,'2025-02-15'),(12,'Anjali Mehta','9832109876','Forever Friends',14,12,'2025-02-20'),(13,'Vikram Iyer','9445567890','Helping Tails',15,13,'2025-02-25'),(14,'Rohit Sharma','9829012345','Care Shelter Foundation',16,14,'2025-03-01'),(15,'Sanjay Gupta','9839011122','Home for Strays',17,15,'2025-03-05'),(16,'Pooja Mehra','9878123456','Pet Protectors',18,16,'2025-03-10'),(17,'Neha Shah','9898123456','Kindness Crew',19,17,'2025-03-15'),(18,'Arvind Rao','9876543211','Animal Angels',20,18,'2025-03-20'),(19,'Sneha Dubey','9754321234','Healing Paws',6,19,'2025-03-25'),(20,'Rohit Gupta','9822334455','Stray Love Society',3,20,'2025-03-30'),(22,'Sarah Connor','9234567890','Pet Rescue Initiative',25,201,'2025-02-18');
/*!40000 ALTER TABLE `rescuers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'aa02rj57_furever_home'
--

--
-- Dumping routines for database 'aa02rj57_furever_home'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-18 16:37:57
