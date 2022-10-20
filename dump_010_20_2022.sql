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
  `id_class` int DEFAULT NULL,
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `parent_prod` int DEFAULT NULL,
  PRIMARY KEY (`id_prod`),
  KEY `id_class` (`id_class`),
  KEY `parent_prod` (`parent_prod`),
  CONSTRAINT `PROD_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `PROD_CLASSIFICATOR` (`id_class`) ON DELETE CASCADE,
  CONSTRAINT `PROD_ibfk_2` FOREIGN KEY (`parent_prod`) REFERENCES `PROD` (`id_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROD`
--

LOCK TABLES `PROD` WRITE;
/*!40000 ALTER TABLE `PROD` DISABLE KEYS */;
INSERT INTO `PROD` VALUES (6,'MSI MEG Z690',4,'2022-09-28 22:30:06',NULL),(7,'INTEL CORE I5',5,'2022-09-28 22:32:40',NULL),(8,'APW 9',6,'2022-09-28 22:33:46',NULL),(9,'Lenovo Y520',10,'2022-09-28 23:09:45',NULL),(10,'INTEL CORE I7',5,'2022-09-29 11:45:06',7);
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
  `id_um` int NOT NULL,
  PRIMARY KEY (`id_class`),
  KEY `id_um` (`id_um`),
  KEY `parent_class` (`parent_class`),
  CONSTRAINT `PROD_CLASSIFICATOR_ibfk_1` FOREIGN KEY (`id_um`) REFERENCES `UM` (`id_um`) ON DELETE CASCADE,
  CONSTRAINT `PROD_CLASSIFICATOR_ibfk_2` FOREIGN KEY (`parent_class`) REFERENCES `PROD_CLASSIFICATOR` (`id_class`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROD_CLASSIFICATOR`
--

LOCK TABLES `PROD_CLASSIFICATOR` WRITE;
/*!40000 ALTER TABLE `PROD_CLASSIFICATOR` DISABLE KEYS */;
INSERT INTO `PROD_CLASSIFICATOR` VALUES (4,10,'Мат. плата',2),(5,4,'Процессор',2),(6,10,'Видеокарта',2),(7,10,'Блок Питания',2),(8,4,'ПЗУ',2),(9,4,'ОЗУ',2),(10,NULL,'Компьютер',3);
/*!40000 ALTER TABLE `PROD_CLASSIFICATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROD_SPECIFIC`
--

DROP TABLE IF EXISTS `PROD_SPECIFIC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROD_SPECIFIC` (
  `id_prod` int NOT NULL,
  `id_incoming_prod` int NOT NULL,
  `volume` int DEFAULT '1',
  PRIMARY KEY (`id_prod`,`id_incoming_prod`),
  KEY `id_incoming_prod` (`id_incoming_prod`),
  CONSTRAINT `PROD_SPECIFIC_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `PROD` (`id_prod`),
  CONSTRAINT `PROD_SPECIFIC_ibfk_2` FOREIGN KEY (`id_incoming_prod`) REFERENCES `PROD` (`id_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROD_SPECIFIC`
--

LOCK TABLES `PROD_SPECIFIC` WRITE;
/*!40000 ALTER TABLE `PROD_SPECIFIC` DISABLE KEYS */;
INSERT INTO `PROD_SPECIFIC` VALUES (6,7,4),(9,6,2),(9,8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM`
--

LOCK TABLES `UM` WRITE;
/*!40000 ALTER TABLE `UM` DISABLE KEYS */;
INSERT INTO `UM` VALUES (1,'Сантиметр','см'),(2,'Дюйм','ДМ'),(3,'Количество','ШТ');
/*!40000 ALTER TABLE `UM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lab1'
--
/*!50003 DROP PROCEDURE IF EXISTS `calculateSpec` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculateSpec`(IN id_spec INT)
BEGIN
WITH RECURSIVE cte AS (SELECT id_prod, volume, id_incoming_prod FROM PROD_SPECIFIC WHERE id_prod=id_spec UNION ALL SELECT c.id_prod, c.volume*cte.volume as total_count, c.id_incoming_prod FROM PROD_SPECIFIC c JOIN cte ON cte.id_incoming_prod=c.id_prod ) SELECT id_prod, id_incoming_prod, volume FROM cte;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cheakHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cheakHistory`(IN node INT)
BEGIN
WITH RECURSIVE cte AS (SELECT id_prod, parent_prod, start_time, name FROM PROD WHERE id_prod=node UNION ALL SELECT c.id_prod, c.parent_prod, c.start_time, c.name FROM PROD
c JOIN cte ON cte.parent_prod=c.id_prod ) SELECT name, start_time FROM cte;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p2`()
SELECT * FROM PROD; ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `searchGraph` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchGraph`(IN node INT)
BEGIN
WITH RECURSIVE cte AS ( SELECT id_prod, id_incoming_prod, CAST(id_prod AS CHAR(500)) AS path,1 as level, 0 as is_cycle FROM PROD_SPECIFIC where id_prod=node  UNION ALL SELECT c.id_prod, c.id_incoming_prod, CONCAT(cte.path, ',', c.id_prod), cte.level+1, FIND_IN_SET(c.id_incoming_prod,cte.path)!=0 FROM PROD_SPECIFIC c JOIN cte ON cte.id_incoming_prod=c.id_prod WHERE is_cycle=0 ) SELECT * FROM cte;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-20 15:31:04
