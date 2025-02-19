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

-- Dump completed on 2025-02-19  8:53:33
