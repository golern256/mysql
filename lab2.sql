-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: lab2
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

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
-- Current Database: `lab2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lab2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `lab2`;

--
-- Table structure for table `ENUM`
--

DROP TABLE IF EXISTS `ENUM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENUM` (
  `id_enum` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  PRIMARY KEY (`id_enum`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENUM`
--

LOCK TABLES `ENUM` WRITE;
/*!40000 ALTER TABLE `ENUM` DISABLE KEYS */;
INSERT INTO `ENUM` VALUES (1,'Квалификация');
/*!40000 ALTER TABLE `ENUM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENUM_VAL`
--

DROP TABLE IF EXISTS `ENUM_VAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENUM_VAL` (
  `id_val` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `id_enum` int NOT NULL,
  PRIMARY KEY (`id_val`),
  KEY `enum_val_enum` (`id_enum`),
  CONSTRAINT `enum_val_enum` FOREIGN KEY (`id_enum`) REFERENCES `ENUM` (`id_enum`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENUM_VAL`
--

LOCK TABLES `ENUM_VAL` WRITE;
/*!40000 ALTER TABLE `ENUM_VAL` DISABLE KEYS */;
INSERT INTO `ENUM_VAL` VALUES (1,'1 разряд',1),(2,'2 разряд',1),(3,'3 разряд',1);
/*!40000 ALTER TABLE `ENUM_VAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GRC`
--

DROP TABLE IF EXISTS `GRC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GRC` (
  `id_grc` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `id_class` int NOT NULL,
  `id_shd` int NOT NULL,
  PRIMARY KEY (`id_grc`),
  KEY `grc_class` (`id_class`),
  CONSTRAINT `grc_class` FOREIGN KEY (`id_class`) REFERENCES `PROD_CLASSIFICATOR` (`id_class`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GRC`
--

LOCK TABLES `GRC` WRITE;
/*!40000 ALTER TABLE `GRC` DISABLE KEYS */;
INSERT INTO `GRC` VALUES (1,'Сварочный полуавтомат',9,4),(2,'Стенд сборки',9,5),(3,'Отрезной станок',9,6),(4,'Токарный станок',9,7);
/*!40000 ALTER TABLE `GRC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IN_RES`
--

DROP TABLE IF EXISTS `IN_RES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IN_RES` (
  `out_to` int NOT NULL,
  `in_to` int NOT NULL,
  `Q` double(10,3) NOT NULL,
  `FOR_Q` double(10,3) NOT NULL,
  KEY `out_to` (`out_to`),
  KEY `in_to` (`in_to`),
  CONSTRAINT `in_to` FOREIGN KEY (`in_to`) REFERENCES `TM` (`id_to`) ON DELETE CASCADE,
  CONSTRAINT `out_to` FOREIGN KEY (`out_to`) REFERENCES `TM` (`id_to`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IN_RES`
--

LOCK TABLES `IN_RES` WRITE;
/*!40000 ALTER TABLE `IN_RES` DISABLE KEYS */;
INSERT INTO `IN_RES` VALUES (5,7,1.000,1.000),(6,7,0.100,1.000),(8,10,0.500,1.000),(9,10,2.000,1.000),(1,3,0.500,1.000),(2,3,0.200,1.000),(3,5,0.700,1.000),(4,5,1.700,1.000);
/*!40000 ALTER TABLE `IN_RES` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROD`
--

LOCK TABLES `PROD` WRITE;
/*!40000 ALTER TABLE `PROD` DISABLE KEYS */;
INSERT INTO `PROD` VALUES (1,'ФРЕЗА',19,'2022-10-22 17:00:12',NULL),(2,'Резец',19,'2022-10-22 17:00:33',NULL),(3,'Кисть',19,'2022-10-22 17:06:08',NULL),(4,'Лист',20,'2022-10-22 17:07:16',NULL),(5,'Электрод',20,'2022-10-22 17:07:24',NULL),(6,'Эмаль',20,'2022-10-22 17:07:33',NULL),(7,'Круг',20,'2022-10-22 17:07:44',NULL),(8,'Корпус',21,'2022-10-22 17:09:10',NULL),(9,'Блок',21,'2022-10-22 17:09:18',NULL),(10,'Основание',22,'2022-10-22 17:09:39',NULL),(11,'Вал',22,'2022-10-22 17:09:46',NULL),(12,'Подшипник',22,'2022-10-22 17:09:56',NULL),(13,'Процессор',23,'2022-10-22 17:11:11',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROD_CLASSIFICATOR`
--

LOCK TABLES `PROD_CLASSIFICATOR` WRITE;
/*!40000 ALTER TABLE `PROD_CLASSIFICATOR` DISABLE KEYS */;
INSERT INTO `PROD_CLASSIFICATOR` VALUES (2,NULL,'КлПО',6),(3,2,'Изделия',6),(4,2,'СХД',6),(5,2,'Профессия',6),(6,2,'Операция',6),(7,3,'Продукция',4),(8,3,'Покупные комп.',4),(9,3,'Средства труда',4),(10,4,'Производство',4),(11,4,'Цех',4),(12,4,'Участок',4),(13,5,'Сварщик',4),(14,5,'Слесарь',4),(15,5,'Токарь',4),(16,6,'Сварка',4),(17,6,'Сборка',4),(18,6,'Резка',4),(19,2,'Инструмент',8),(20,2,'Материалы',7),(21,2,'Узлы',4),(22,2,'Деталь',8),(23,2,'Покупные детали',4);
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
/*!40000 ALTER TABLE `PROD_SPECIFIC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHD`
--

DROP TABLE IF EXISTS `SHD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHD` (
  `id_shd` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `main_shd` int DEFAULT NULL,
  `id_class` int NOT NULL,
  PRIMARY KEY (`id_shd`),
  KEY `shd_class` (`id_class`),
  CONSTRAINT `shd_class` FOREIGN KEY (`id_class`) REFERENCES `PROD_CLASSIFICATOR` (`id_class`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHD`
--

LOCK TABLES `SHD` WRITE;
/*!40000 ALTER TABLE `SHD` DISABLE KEYS */;
INSERT INTO `SHD` VALUES (1,'Ремонтный завод',NULL,10),(2,'Цех 1',1,11),(3,'Цех 2',1,11),(4,'Участок 1.1',2,12),(5,'Участок 1.2',2,12),(6,'Участок 2.1',3,12),(7,'Участок 2.2',3,12);
/*!40000 ALTER TABLE `SHD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TM`
--

DROP TABLE IF EXISTS `TM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TM` (
  `id_to` int NOT NULL AUTO_INCREMENT,
  `for_prod` int NOT NULL,
  `num` int NOT NULL,
  `cl_to` int NOT NULL,
  `cl_prof` int NOT NULL,
  `kval` int NOT NULL,
  `grc` int NOT NULL,
  `t_pz` double(10,3) NOT NULL,
  `t_st` double(10,3) NOT NULL,
  PRIMARY KEY (`id_to`),
  KEY `to_class` (`cl_to`),
  KEY `prof_class` (`cl_prof`),
  KEY `kval_enum` (`kval`),
  KEY `grc_tm` (`grc`),
  KEY `prod_tm` (`for_prod`),
  CONSTRAINT `grc_tm` FOREIGN KEY (`grc`) REFERENCES `GRC` (`id_grc`) ON DELETE CASCADE,
  CONSTRAINT `kval_enum` FOREIGN KEY (`kval`) REFERENCES `ENUM_VAL` (`id_val`) ON DELETE CASCADE,
  CONSTRAINT `prod_tm` FOREIGN KEY (`for_prod`) REFERENCES `PROD` (`id_prod`) ON DELETE CASCADE,
  CONSTRAINT `prof_class` FOREIGN KEY (`cl_prof`) REFERENCES `PROD_CLASSIFICATOR` (`id_class`) ON DELETE CASCADE,
  CONSTRAINT `to_class` FOREIGN KEY (`cl_to`) REFERENCES `PROD_CLASSIFICATOR` (`id_class`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TM`
--

LOCK TABLES `TM` WRITE;
/*!40000 ALTER TABLE `TM` DISABLE KEYS */;
INSERT INTO `TM` VALUES (1,4,1,16,13,1,1,0.200,0.200),(2,1,1,16,13,1,1,0.200,0.200),(3,2,2,18,15,2,3,0.200,0.200),(4,10,2,18,15,2,3,0.200,0.200),(5,12,3,17,14,3,2,0.600,0.600),(6,3,3,17,14,3,2,0.600,0.600),(7,9,4,16,13,1,1,0.200,0.200),(8,1,1,16,13,1,1,0.200,0.200),(9,10,1,16,13,1,1,0.200,0.200),(10,13,2,16,13,1,1,0.200,0.200);
/*!40000 ALTER TABLE `TM` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM`
--

LOCK TABLES `UM` WRITE;
/*!40000 ALTER TABLE `UM` DISABLE KEYS */;
INSERT INTO `UM` VALUES (1,'Сантиметр','см'),(2,'Дюйм','ДМ'),(3,'Количество','ШТ'),(4,'единица','ед'),(5,'час','ч'),(6,'-','-'),(7,'метр','м'),(8,'штук','шт');
/*!40000 ALTER TABLE `UM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lab2'
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
/*!50003 DROP PROCEDURE IF EXISTS `root_TO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `root_TO`(IN id_prod INT, OUT root int)
BEGIN
SELECT id_to FROM TM
INNER JOIN 
(SELECT DISTINCT in_to FROM IN_RES AS prod
WHERE NOT EXISTS (SELECT
out_to FROM IN_RES WHERE out_to=prod.in_to)) as prod 
ON prod.in_to = TM.id_to
WHERE for_prod = id_prod
INTO root;
END ;;
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
/*!50003 DROP PROCEDURE IF EXISTS `sum_res` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sum_res`(IN id_prod INT, IN col INT)
BEGIN
    CALL root_TO(id_prod, @root);
    WITH
    RECURSIVE cte (out_to, in_to, Q, FOR_Q, n) AS 
    (
            SELECT out_to, in_to, Q, FOR_Q, Q*FOR_Q*col as n
            FROM IN_RES
            WHERE in_to = @root
        UNION ALL 
            SELECT IN_RES.out_to, IN_RES.in_to, IN_RES.Q, IN_RES.FOR_Q, n*IN_RES.Q as n
            FROM cte 
            INNER JOIN IN_RES 
            ON IN_RES.in_to = cte.out_to
    )
    SELECT DISTINCT a2.name as prod, a3.name as class_prod, SUM(cte.n) as sum, a4.name as ei
    FROM cte
    INNER JOIN TM AS a1 ON (a1.id_to = cte.out_to)
    INNER JOIN PROD as a2 ON (a1.for_prod = a2.id_prod)
    INNER JOIN PROD_CLASSIFICATOR as a3 ON (a2.id_class = a3.id_class)
    INNER JOIN UM AS a4 ON (a3.id_um = a4.id_um)
    GROUP BY a2.name, a3.name, a4.name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `time_to` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `time_to`(IN id_prod INT, IN col INT)
BEGIN
    CALL root_TO(id_prod, @root);
    WITH
    RECURSIVE cte AS 
    (
            SELECT out_to, in_to, Q, FOR_Q
            FROM IN_RES
            WHERE in_to = @root
        UNION ALL 
            SELECT IN_RES.out_to, IN_RES.in_to, IN_RES.Q, IN_RES.FOR_Q
            FROM IN_RES 
            INNER JOIN cte 
            ON IN_RES.in_to = cte.out_to
    )
    SELECT a0.grc as grc, a0.cl_prof as class_prof, a0.kval as kval, SUM(a0.t_pz) as SUM, SUM(a0.t_st)*col as SUM1, SUM(a0.t_st*col+a0.t_pz) as SUM2
    FROM 
    (SELECT DISTINCT a1.grc, a1.cl_prof, a1.kval, a1.t_pz, a1.t_st
    FROM cte
    INNER JOIN TM as a1 ON (cte.out_to = a1.id_to)) as a0
    GROUP BY a0.grc, a0.cl_prof, a0.kval;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tree_TO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tree_TO`(IN id_prod INT)
BEGIN
    CALL root_TO(id_prod, @root);
    WITH
    RECURSIVE cte AS 
    (
            SELECT out_to, in_to, Q, FOR_Q
            FROM IN_RES
            WHERE in_to = @root
        UNION ALL 
            SELECT IN_RES.out_to, IN_RES.in_to, IN_RES.Q, IN_RES.FOR_Q
            FROM IN_RES 
            INNER JOIN cte 
            ON IN_RES.in_to = cte.out_to
    )
    SELECT DISTINCT a1.num as number, a3.name as to_name,
                    a5.name as grc, a6.name as shd, a4.name as prof,
                    a7.name as kval, a1.t_pz, a1.t_st, a8.name as res,
                    a9.name as class_res, cte.Q, cte.FOR_Q, cte.out_to, cte.in_to
    FROM cte
    INNER JOIN TM as a1 ON (cte.out_to = a1.id_to)
    INNER JOIN PROD as a2 ON (a1.for_prod = a2.id_prod)
    INNER JOIN PROD_CLASSIFICATOR as a3 ON (a1.cl_to = a3.id_class)
    INNER JOIN PROD_CLASSIFICATOR as a4 ON (a1.cl_prof = a4.id_class)
    INNER JOIN GRC as a5 ON (a1.grc = a5.id_grc)
    INNER JOIN SHD as a6 ON (a5.id_shd = a6.id_shd)
    INNER JOIN ENUM_VAL as a7 ON (a1.kval = a7.id_val)
    INNER JOIN PROD as a8 ON (a1.for_prod = a8.id_prod)
    INNER JOIN PROD_CLASSIFICATOR as a9 ON (a8.id_class = a9.id_class);
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

-- Dump completed on 2022-10-27 15:27:18
