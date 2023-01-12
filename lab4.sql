-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: lab3
-- ------------------------------------------------------
-- Server version       8.0.31-0ubuntu0.22.04.1

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
-- Table structure for table `BODY_F`
--

DROP TABLE IF EXISTS `BODY_F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BODY_F` (
  `ID_F` int NOT NULL,
  `NUM_D` int NOT NULL,
  `NUM_K` int NOT NULL,
  `ID_PRED` int NOT NULL,
  PRIMARY KEY (`ID_F`,`NUM_D`,`NUM_K`),
  KEY `ID_PRED` (`ID_PRED`),
  CONSTRAINT `BODY_F_ibfk_1` FOREIGN KEY (`ID_F`) REFERENCES `F_CONFIG` (`ID_F`),
  CONSTRAINT `BODY_F_ibfk_2` FOREIGN KEY (`ID_PRED`) REFERENCES `PREDICAT` (`ID_PRED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BODY_F`
--

LOCK TABLES `BODY_F` WRITE;
/*!40000 ALTER TABLE `BODY_F` DISABLE KEYS */;
INSERT INTO `BODY_F` VALUES (1,0,1,4);
/*!40000 ALTER TABLE `BODY_F` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENUM`
--

DROP TABLE IF EXISTS `ENUM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENUM` (
  `ID_ENUM` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_ENUM`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENUM`
--

LOCK TABLES `ENUM` WRITE;
/*!40000 ALTER TABLE `ENUM` DISABLE KEYS */;
INSERT INTO `ENUM` VALUES (1,'FIRST_ENUM');
/*!40000 ALTER TABLE `ENUM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENUM_RESTRIC`
--

DROP TABLE IF EXISTS `ENUM_RESTRIC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENUM_RESTRIC` (
  `ID_VAL` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  `ID_ENUM` int DEFAULT NULL,
  `VALUE` int DEFAULT NULL,
  PRIMARY KEY (`ID_VAL`),
  KEY `ID_ENUM` (`ID_ENUM`),
  CONSTRAINT `ENUM_RESTRIC_ibfk_1` FOREIGN KEY (`ID_ENUM`) REFERENCES `ENUM` (`ID_ENUM`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENUM_RESTRIC`
--

LOCK TABLES `ENUM_RESTRIC` WRITE;
/*!40000 ALTER TABLE `ENUM_RESTRIC` DISABLE KEYS */;
INSERT INTO `ENUM_RESTRIC` VALUES (1,'MODEL_1',1,20);
/*!40000 ALTER TABLE `ENUM_RESTRIC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `F_CONFIG`
--

DROP TABLE IF EXISTS `F_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `F_CONFIG` (
  `ID_F` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_F`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `F_CONFIG`
--

LOCK TABLES `F_CONFIG` WRITE;
/*!40000 ALTER TABLE `F_CONFIG` DISABLE KEYS */;
INSERT INTO `F_CONFIG` VALUES (1,'TEST'),(2,'FIRST_FUNCTION');
/*!40000 ALTER TABLE `F_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER1`
--

DROP TABLE IF EXISTS `ORDER1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDER1` (
  `ID_ORDER` int NOT NULL AUTO_INCREMENT,
  `NUM` varchar(50) DEFAULT NULL,
  `CUSTOMER` int NOT NULL,
  `DATE_REG` date DEFAULT NULL,
  PRIMARY KEY (`ID_ORDER`),
  KEY `ORDER1_ibfk_1` (`CUSTOMER`),
  CONSTRAINT `ORDER1_ibfk_1` FOREIGN KEY (`CUSTOMER`) REFERENCES `SHD` (`ID_SHD`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER1`
--

LOCK TABLES `ORDER1` WRITE;
/*!40000 ALTER TABLE `ORDER1` DISABLE KEYS */;
INSERT INTO `ORDER1` VALUES (1,'TEST',1,'2010-11-12'),(2,'12-243',1,'2022-12-12'),(3,'123-563',1,'2022-12-24'),(11,'123',1,'2022-11-12'),(18,'123',1,'2022-11-18'),(20,'SWSW',1,'2022-10-17'),(21,'6',1,'2022-09-09'),(22,'876',1,'2022-07-01'),(23,'980',1,'2022-02-12'),(24,'767',1,'2021-09-01'),(25,'987',1,'2022-12-11'),(26,'9',1,'2022-05-02');
/*!40000 ALTER TABLE `ORDER1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARAM`
--

DROP TABLE IF EXISTS `PARAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARAM` (
  `ID_PAR` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `UM_PAR` int NOT NULL,
  `TYPE_PAR` int NOT NULL,
  `FLAG_CONFIG` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_PAR`),
  KEY `ibfk_1_del_cas` (`UM_PAR`),
  CONSTRAINT `ibfk_1_del_cas` FOREIGN KEY (`UM_PAR`) REFERENCES `PROD_CLASSIFICATOR` (`ID_UM`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARAM`
--

LOCK TABLES `PARAM` WRITE;
/*!40000 ALTER TABLE `PARAM` DISABLE KEYS */;
INSERT INTO `PARAM` VALUES (1,'P1',1,1,0),(2,'P2',1,2,1),(3,'P3',1,3,1);
/*!40000 ALTER TABLE `PARAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARAM_PROD_CLASSIFICATOR`
--

DROP TABLE IF EXISTS `PARAM_PROD_CLASSIFICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARAM_PROD_CLASSIFICATOR` (
  `ID_CLASS` int NOT NULL,
  `ID_PAR` int NOT NULL,
  PRIMARY KEY (`ID_CLASS`,`ID_PAR`),
  KEY `ID_PAR` (`ID_PAR`),
  CONSTRAINT `PARAM_PROD_CLASSIFICATOR_ibfk_1` FOREIGN KEY (`ID_CLASS`) REFERENCES `PROD_CLASSIFICATOR` (`ID_CLASS`),
  CONSTRAINT `PARAM_PROD_CLASSIFICATOR_ibfk_2` FOREIGN KEY (`ID_PAR`) REFERENCES `PARAM` (`ID_PAR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARAM_PROD_CLASSIFICATOR`
--

LOCK TABLES `PARAM_PROD_CLASSIFICATOR` WRITE;
/*!40000 ALTER TABLE `PARAM_PROD_CLASSIFICATOR` DISABLE KEYS */;
INSERT INTO `PARAM_PROD_CLASSIFICATOR` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `PARAM_PROD_CLASSIFICATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARAM_VALUE`
--

DROP TABLE IF EXISTS `PARAM_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARAM_VALUE` (
  `ID_PAR` int NOT NULL,
  `ID_PROD` int NOT NULL,
  `VALUE` int DEFAULT NULL,
  PRIMARY KEY (`ID_PROD`,`ID_PAR`),
  KEY `ID_PAR` (`ID_PAR`),
  CONSTRAINT `PARAM_VALUE_ibfk_1` FOREIGN KEY (`ID_PAR`) REFERENCES `PARAM` (`ID_PAR`) ON DELETE CASCADE,
  CONSTRAINT `PARAM_VALUE_ibfk_2` FOREIGN KEY (`ID_PROD`) REFERENCES `PROD` (`ID_PROD`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARAM_VALUE`
--

LOCK TABLES `PARAM_VALUE` WRITE;
/*!40000 ALTER TABLE `PARAM_VALUE` DISABLE KEYS */;
INSERT INTO `PARAM_VALUE` VALUES (1,15,100),(2,15,300),(3,15,20),(1,19,0),(2,19,0),(3,19,0);
/*!40000 ALTER TABLE `PARAM_VALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POS_ORDER`
--

DROP TABLE IF EXISTS `POS_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POS_ORDER` (
  `ID_ORDER` int NOT NULL,
  `NUM_POS` int NOT NULL,
  `ID_PROD` int NOT NULL,
  `Q` double DEFAULT NULL,
  PRIMARY KEY (`ID_ORDER`,`NUM_POS`),
  KEY `ID_PROD` (`ID_PROD`),
  CONSTRAINT `POS_ORDER_ibfk_1` FOREIGN KEY (`ID_ORDER`) REFERENCES `ORDER1` (`ID_ORDER`),
  CONSTRAINT `POS_ORDER_ibfk_2` FOREIGN KEY (`ID_PROD`) REFERENCES `PROD` (`ID_PROD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POS_ORDER`
--

LOCK TABLES `POS_ORDER` WRITE;
/*!40000 ALTER TABLE `POS_ORDER` DISABLE KEYS */;
INSERT INTO `POS_ORDER` VALUES (3,1,14,500),(3,2,1,100),(26,1,18,10);
/*!40000 ALTER TABLE `POS_ORDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREDICAT`
--

DROP TABLE IF EXISTS `PREDICAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PREDICAT` (
  `ID_PRED` int NOT NULL AUTO_INCREMENT,
  `ID_PAR` int NOT NULL,
  `ID_VAL` int DEFAULT NULL,
  `OPER` char(1) NOT NULL,
  PRIMARY KEY (`ID_PRED`),
  KEY `ID_PAR` (`ID_PAR`),
  KEY `ID_VAL` (`ID_VAL`),
  CONSTRAINT `PREDICAT_ibfk_1` FOREIGN KEY (`ID_PAR`) REFERENCES `PARAM` (`ID_PAR`),
  CONSTRAINT `PREDICAT_ibfk_2` FOREIGN KEY (`ID_VAL`) REFERENCES `ENUM_RESTRIC` (`ID_VAL`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREDICAT`
--

LOCK TABLES `PREDICAT` WRITE;
/*!40000 ALTER TABLE `PREDICAT` DISABLE KEYS */;
INSERT INTO `PREDICAT` VALUES (4,1,1,'='),(5,2,1,'>');
/*!40000 ALTER TABLE `PREDICAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROD`
--

DROP TABLE IF EXISTS `PROD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROD` (
  `ID_PROD` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `ID_CLASS` int NOT NULL,
  `START_TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `CONF` int NOT NULL,
  `TYPE_PROD` int NOT NULL,
  PRIMARY KEY (`ID_PROD`),
  KEY `PROD_ibfk_1` (`ID_CLASS`),
  KEY `PROD_ibfk_2` (`CONF`),
  KEY `TYPE_PROD` (`TYPE_PROD`),
  CONSTRAINT `PROD_ibfk_1` FOREIGN KEY (`ID_CLASS`) REFERENCES `PROD_CLASSIFICATOR` (`ID_CLASS`) ON DELETE CASCADE,
  CONSTRAINT `PROD_ibfk_3` FOREIGN KEY (`TYPE_PROD`) REFERENCES `PROD` (`ID_PROD`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROD`
--

LOCK TABLES `PROD` WRITE;
/*!40000 ALTER TABLE `PROD` DISABLE KEYS */;
INSERT INTO `PROD` VALUES (1,'ТОВАР1',1,'2022-12-22 21:08:25',1,1),(4,'ТОВАР1',1,'2022-12-23 09:44:44',2,1),(14,'Транзистор',1,'2022-12-24 02:53:46',1,1),(15,'Транзистор',1,'2022-12-24 03:04:54',2,14),(17,'Процессор',1,'2022-12-26 02:34:24',2,1),(18,'Лампочка',1,'2022-12-26 02:36:02',1,1),(19,'Лампочка',1,'2022-12-26 02:36:27',2,18);
/*!40000 ALTER TABLE `PROD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROD_CLASSIFICATOR`
--

DROP TABLE IF EXISTS `PROD_CLASSIFICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROD_CLASSIFICATOR` (
  `ID_CLASS` int NOT NULL AUTO_INCREMENT,
  `PARENT_CLASS` int DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  `ID_UM` int NOT NULL,
  PRIMARY KEY (`ID_CLASS`),
  KEY `PROD_CLASSIFICATOR_ibfk_1` (`ID_UM`),
  KEY `PROD_CLASSIFICATOR_ibfk_2` (`PARENT_CLASS`),
  CONSTRAINT `PROD_CLASSIFICATOR_ibfk_1` FOREIGN KEY (`ID_UM`) REFERENCES `UM` (`ID_UM`) ON DELETE CASCADE,
  CONSTRAINT `PROD_CLASSIFICATOR_ibfk_2` FOREIGN KEY (`PARENT_CLASS`) REFERENCES `PROD_CLASSIFICATOR` (`ID_CLASS`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROD_CLASSIFICATOR`
--

LOCK TABLES `PROD_CLASSIFICATOR` WRITE;
/*!40000 ALTER TABLE `PROD_CLASSIFICATOR` DISABLE KEYS */;
INSERT INTO `PROD_CLASSIFICATOR` VALUES (1,NULL,'TEST',1);
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
  `ID_POS` int NOT NULL,
  `id_incoming_prod` int NOT NULL,
  `volume` int DEFAULT '1',
  PRIMARY KEY (`id_prod`,`ID_POS`),
  KEY `id_incoming_prod` (`id_incoming_prod`),
  CONSTRAINT `PROD_SPECIFIC_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `PROD` (`ID_PROD`),
  CONSTRAINT `PROD_SPECIFIC_ibfk_2` FOREIGN KEY (`id_incoming_prod`) REFERENCES `PROD` (`ID_PROD`)
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
  `ID_SHD` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `SHORT_NAME` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_SHD`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHD`
--

LOCK TABLES `SHD` WRITE;
/*!40000 ALTER TABLE `SHD` DISABLE KEYS */;
INSERT INTO `SHD` VALUES (1,'T','t');
/*!40000 ALTER TABLE `SHD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UM`
--

DROP TABLE IF EXISTS `UM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UM` (
  `ID_UM` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `SHORT_NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_UM`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UM`
--

LOCK TABLES `UM` WRITE;
/*!40000 ALTER TABLE `UM` DISABLE KEYS */;
INSERT INTO `UM` VALUES (1,'САНТИМЕТР','СМ');
/*!40000 ALTER TABLE `UM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VAR_CONFIG`
--

DROP TABLE IF EXISTS `VAR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VAR_CONFIG` (
  `ID_VAR` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_VAR`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VAR_CONFIG`
--

LOCK TABLES `VAR_CONFIG` WRITE;
/*!40000 ALTER TABLE `VAR_CONFIG` DISABLE KEYS */;
INSERT INTO `VAR_CONFIG` VALUES (1,'MAIN');
/*!40000 ALTER TABLE `VAR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lab3'
--

--
-- Dumping routines for database 'lab3'
--
/*!50003 DROP FUNCTION IF EXISTS `NEW_POS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `NEW_POS`(pIdOrder integer) RETURNS int
BEGIN
DECLARE vCount INT DEFAULT 0;
DECLARE oNumPos INT;
select count(*) from POS_ORDER
where ID_ORDER=pIdOrder
INTO vCount;
IF vCount >0 THEN
select MAX(NUM_POS) from POS_ORDER
where ID_ORDER=pIdOrder
INTO oNumPos;
SET oNumPos=oNumPos+1;
ELSE 
SET oNumPos=1;
END IF;
RETURN oNumPos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_PROD_ORDER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ADD_PROD_ORDER`(IN idOrder integer, IN idProd integer, IN Q integer)
BEGIN
DECLARE oNumPos INT;
DECLARE vConf INT;
DECLARE vOrder INT DEFAULT idOrder;
SELECT CONF FROM PROD
WHERE ID_PROD = idProd
INTO vConf;
IF  vConf = 1 THEN
SELECT NEW_POS(vOrder)
INTO oNumPos;
insert into POS_ORDER VALUES(idOrder,oNumPos,idProd, Q);
SELECT "OK!";
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `COPY_PAR_PROD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `COPY_PAR_PROD`( IN idProd integer, IN idPar integer)
BEGIN
declare  VYES integer;
  SELECT count(*) from PARAM_VALUE
  WHERE ID_PROD=idProd and ID_PAR=idPar
      INTO vYes;
  IF vYes = 0 THEN
    insert into PARAM_VALUE VALUES(idPar,idProd,0);
  ELSE
    SELECT "THERE IS PARAMETR YET";
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CUR_CL_PAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CUR_CL_PAR`(IN idProd integer , IN idClass integer)
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE par INT;
  DECLARE prod INT(11) DEFAULT idProd;
  DECLARE mycursor CURSOR FOR
  SELECT ID_PAR FROM PARAM_PROD_CLASSIFICATOR
  WHERE ID_CLASS=idClass;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN mycursor;
  fetch_loop: LOOP
    FETCH mycursor INTO par;
  IF done THEN
      LEAVE fetch_loop;
    END IF;
    call COPY_PAR_PROD(prod,par);
  END LOOP;
  CLOSE mycursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CUR_FIND_PAR_CONF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CUR_FIND_PAR_CONF`( IN pIdProd integer, OUT oIdPar integer, OUT oTypePar integer, OUT oNamePar varchar(100))
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE param INT(11);
  DECLARE mycursor CURSOR FOR
  SELECT ID_PAR FROM PARAM_VALUE
  WHERE ID_PROD=pIdProd;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN mycursor;
  fetch_loop: LOOP
    FETCH mycursor INTO param;
  IF done THEN
      LEAVE fetch_loop;
    END IF;
    SELECT ID_PAR,TYPE_PAR, NAME FROM PARAM
    WHERE ID_PAR=param
    INTO oIdPar, oTypePar,oNamePar;
    SELECT oIdPar, oTypePar,oNamePar;
  END LOOP;
  CLOSE mycursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CUR_PAR_PROD_TYPE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CUR_PAR_PROD_TYPE`(IN idProd integer , IN idPar integer)
BEGIN
declare  VYES integer;
  SELECT count(*) from PARAM_VALUE
  WHERE ID_PROD=idProd and ID_PAR=idPar
      INTO vYes;
  IF vYes = 0 THEN
    insert into PARAM_VALUE VALUES(idPar,idProd);
    SELECT "SUCCESS!";
    
  ELSE
    SELECT "THERE IS PARAMETR YET";
  END IF;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CUR_PROD_CL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CUR_PROD_CL`( IN idProd integer)
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE class INT(11);
  DECLARE prod INT(11) DEFAULT idProd;
  DECLARE mycursor CURSOR FOR
  SELECT ID_CLASS FROM PROD
  WHERE ID_PROD=idProd;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN mycursor;
  fetch_loop: LOOP
    FETCH mycursor INTO class;
  IF done THEN
      LEAVE fetch_loop;
    END IF;
    CALL CUR_CL_PAR(prod,class);
  END LOOP;
  CLOSE mycursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CUR_PROD_PROD_TYPE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CUR_PROD_PROD_TYPE`( IN idProd integer, IN idProdType integer)
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE idPar INT(11);
  DECLARE prod INT(11) DEFAULT idProd;
  DECLARE mycursor CURSOR FOR
  SELECT ID_PAR FROM PARAM_VALUE
  WHERE ID_PROD=idProdType;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN mycursor;
  fetch_loop: LOOP
    FETCH mycursor INTO idPar;
  IF done THEN
      LEAVE fetch_loop;
    END IF;
    CALL CUR_PAR_PROD_TYPE(prod,idPar);
  END LOOP;
  CLOSE mycursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CUR_READ_VAR_CONF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CUR_READ_VAR_CONF`( IN pIdProd integer, OUT oNamePar varchar(100))
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE param INT(11);
  DECLARE mycursor CURSOR FOR
  SELECT ID_PAR FROM PARAM_VALUE
  WHERE ID_PROD=pIdProd;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN mycursor;
  fetch_loop: LOOP
    FETCH mycursor INTO param;
  IF done THEN
      LEAVE fetch_loop;
    END IF;
    SELECT NAME FROM PARAM
    WHERE ID_PAR=param
    INTO oNamePar;
    SELECT oNamePar;
  END LOOP;
  CLOSE mycursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FIND_PAR_CONF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FIND_PAR_CONF`(IN pIdProd integer, OUT oIdPar integer, OUT oTypePar integer, OUT oNamePar varchar(100))
BEGIN 
DECLARE vYesType integer; 
SELECT CONF from PROD 
where ID_PROD=pIdProd 
INTO vYesType; 
IF vYesType = 2 THEN 
CALL CUR_FIND_PAR_CONF(pIdProd, oIdPar, oTypePar, oNamePar); 
ELSE 
SELECT "WRONG CONFIGURATION"; 
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INS_ORDER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INS_ORDER`( IN PIdCastomer integer, IN PDateReg date, IN PNUM varchar(50), OUT oIdOrder integer)
BEGIN
  insert into ORDER1(NUM,DATE_REG,CUSTOMER)
  values(PNUM,PDateReg,PIdCastomer); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NEW_F` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NEW_F`(IN pName varchar(50))
BEGIN declare vYesF int;   SELECT count(*) from F_CONFIG     where NAME= pNAME     into vYesF;      if vYesF=0 THEN       INSERT INTO F_CONFIG (NAME) VALUES(pName);          ELSE      SELECT "this function already exists";     END IF;   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NEW_PRED` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NEW_PRED`(IN pIdPar integer, IN pOper char(1), IN pVal integer)
BEGIN
DECLARE  vYesPar INTEGER;
DECLARE  vYesVal INTEGER;

  select count(*) from PARAM
    where ID_PAR=pIdPar
    into vYesPar;
  if ((pOper = '=') or (pOper='>')or(pOper='<'))
       and (vYesPar>0)  THEN
      INSERT INTO PREDICAT(ID_PAR,OPER,ID_VAL) values(pIdPar, pOper,pVal); 
   else
     SELECT "ERROR";
     
     END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NEW_VAR_PROD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NEW_VAR_PROD`( IN pTypeProd integer, OUT OIDPROD integer, OUT oName varchar(250))
BEGIN
declare vConf  integer;
declare vIdCl  integer;
declare  VYESTERM integer;
DECLARE prod_type INT(11) DEFAULT pTypeProd;

  select NAME,CONF, ID_CLASS from PROD
    where ID_PROD = pTypeProd
    into oName,vConf,vIdCl;
  IF vConf=1 THEN
      insert into PROD (NAME,ID_CLASS,CONF,TYPE_PROD)
      values(oName,vIdCl,2,pTypeProd);
      SELECT MAX(ID_PROD) FROM PROD
      INTO OIDPROD;
      CALL CUR_PROD_CL(OIDPROD);
  END IF;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `READ_VAR_CONF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `READ_VAR_CONF`(IN pIdProd integer)
BEGIN 
DECLARE oNamePar varchar(100);
DECLARE vYesType integer; 
SELECT CONF from PROD 
where ID_PROD=pIdProd 
INTO vYesType; 
IF vYesType = 2 THEN 
CALL CUR_READ_VAR_CONF(pIdProd,oNamePar); 
ELSE 
SELECT "WRONG CONFIGURATION"; 
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RES_F` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RES_F`(IN pIdProd integer,IN pIdPOS integer,IN vNumD integer )
BEGIN
DECLARE  vResPred INTEGER;
DECLARE  vIdPred INTEGER;
DECLARE  vPar INTEGER;
DECLARE  vValP INTEGER;
DECLARE  vOper char(1);
DECLARE  vValConf INTEGER;
DECLARE oIdF INTEGER;

  select ID_F from SPEC_PROD
    where ID_POS = pIdPOS
    into oIdF;
  if ((oIdF=0)or(oIdF is null)) then
     set oIdF=0;
  else
              select ID_PRED from BODY_F
                    where ID_F = oIdF and NUM_D = vNumD
                    into vIdPred;
                      select ID_PAR,ID_VAL,OPER from PREDICAT
                        where ID_PRED=vIdPred
                        into vPar,vValP,vOper;
                      select VALUE from PARAM_VALUE
                        where PROD=pIdProd and PAR=vPar
                        into vValConf;
                      if(vOper =''='') then  
                        if(vValP=vValConf) then 
                        SELECT "OK";
                        else 
                        SELECT "ERROR";
                        END IF;
                        END IF;
                      
                      if(vOper =''>'') then   
                        if(vValP>vValConf) then 
                          SELECT "OK";
                          else
                          SELECT "ERROR";
                          END IF;
                          END IF;
                      if(vOper =''<'') then  
                        if(vValP<vValConf) then
                            SELECT "OK";
                        else  
                            SELECT "ERROR";
                            END IF;
                        END IF;
                    END IF;
                END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `WRITE_PAR2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `WRITE_PAR2`( IN PIDPROD integer, IN PIDPAR integer, IN PVAL double precision)
BEGIN
DECLARE  Yes INT(11);
  SELECT count(*) FROM PARAM_VALUE
    WHERE ID_PROD = PIDPROD AND ID_PAR=PIDPAR
    INTO Yes;
  IF Yes>0 THEN
  UPDATE PARAM_VALUE
  SET VALUE=PVAL
  WHERE ID_PROD = PIDPROD AND ID_PAR=PIDPAR;
  SELECT "OK!";
  ELSE
      SELECT "NO PARAM";
  END IF;
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

-- Dump completed on 2023-01-12  3:54:41
