-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: lab1
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `PROD`
--

DROP TABLE IF EXISTS `PROD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROD` (
  `id_prod` int NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `short_name` char(5) NOT NULL,
  `id_class` int DEFAULT NULL,
  PRIMARY KEY (`id_prod`),
  KEY `id_class` (`id_class`),
  CONSTRAINT `PROD_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `PROD_CLASSIFICATOR` (`id_class`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROD`
--

LOCK TABLES `PROD` WRITE;
/*!40000 ALTER TABLE `PROD` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROD_CLASSIFICATOR`
--

DROP TABLE IF EXISTS `PROD_CLASSIFICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROD_CLASSIFICATOR` (
  `id_class` int NOT NULL AUTO_INCREMENT,
  `parent_class` int DEFAULT NULL,
  `name` char(15) NOT NULL,
  `short_name` char(5) NOT NULL,
  `id_um` int NOT NULL,
  PRIMARY KEY (`id_class`),
  KEY `id_um` (`id_um`),
  KEY `parent_class` (`parent_class`),
  CONSTRAINT `PROD_CLASSIFICATOR_ibfk_1` FOREIGN KEY (`id_um`) REFERENCES `UM` (`id_um`) ON DELETE CASCADE,
  CONSTRAINT `PROD_CLASSIFICATOR_ibfk_2` FOREIGN KEY (`parent_class`) REFERENCES `PROD_CLASSIFICATOR` (`id_class`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROD_CLASSIFICATOR`
--

LOCK TABLES `PROD_CLASSIFICATOR` WRITE;
/*!40000 ALTER TABLE `PROD_CLASSIFICATOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROD_CLASSIFICATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROD_SPECIFIC`
--

DROP TABLE IF EXISTS `PROD_SPECIFIC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROD_SPECIFIC` (
  `prod_position` int NOT NULL AUTO_INCREMENT,
  `id_prod` int DEFAULT NULL,
  `incoming_prod` int DEFAULT NULL,
  `volume` int DEFAULT NULL,
  PRIMARY KEY (`prod_position`),
  KEY `id_prod` (`id_prod`),
  KEY `incoming_prod` (`incoming_prod`),
  KEY `uniq_pos` (`prod_position`,`id_prod`),
  CONSTRAINT `PROD_SPECIFIC_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `PROD` (`id_prod`) ON DELETE CASCADE,
  CONSTRAINT `PROD_SPECIFIC_ibfk_2` FOREIGN KEY (`incoming_prod`) REFERENCES `PROD` (`id_prod`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROD_SPECIFIC`
--

LOCK TABLES `PROD_SPECIFIC` WRITE;
/*!40000 ALTER TABLE `PROD_SPECIFIC` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROD_SPECIFIC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM`
--

DROP TABLE IF EXISTS `UM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UM` (
  `id_um` int NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `short_name` char(2) NOT NULL,
  PRIMARY KEY (`id_um`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM`
--

LOCK TABLES `UM` WRITE;
/*!40000 ALTER TABLE `UM` DISABLE KEYS */;
/*!40000 ALTER TABLE `UM` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-17 19:01:49
