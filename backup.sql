-- MariaDB dump 10.19  Distrib 10.6.14-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: appdb
-- ------------------------------------------------------
-- Server version	5.6.51

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `appdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `appdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `appdb`;

--
-- Table structure for table `cricketer`
--

DROP TABLE IF EXISTS `cricketer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cricketer` (
  `name` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cricketer`
--

LOCK TABLES `cricketer` WRITE;
/*!40000 ALTER TABLE `cricketer` DISABLE KEYS */;
INSERT INTO `cricketer` VALUES ('Kane Williamson',35,'New Zealand'),('MS Dhoni',30,'India'),('Steve Smith',31,'Australia'),('Virat Kohli',32,'India'),('Kane Williamson',35,'New Zealand'),('MS Dhoni',30,'India'),('Steve Smith',31,'Australia'),('Virat Kohli',32,'India'),('Kane Williamson',35,'New Zealand'),('MS Dhoni',30,'India'),('Steve Smith',31,'Australia'),('Virat Kohli',32,'India'),('Kane Williamson',35,'New Zealand'),('MS Dhoni',30,'India'),('Steve Smith',31,'Australia'),('Virat Kohli',32,'India'),('Kane Williamson',35,'New Zealand'),('MS Dhoni',30,'India'),('Steve Smith',31,'Australia'),('Virat Kohli',32,'India'),('Kane Williamson',35,'New Zealand'),('MS Dhoni',30,'India'),('Steve Smith',31,'Australia'),('Virat Kohli',32,'India'),('Kane Williamson',35,'New Zealand'),('MS Dhoni',30,'India'),('Steve Smith',31,'Australia'),('Virat Kohli',32,'India'),('Kane Williamson',35,'New Zealand'),('MS Dhoni',30,'India'),('Steve Smith',31,'Australia'),('Virat Kohli',32,'India'),('Kane Williamson',35,'New Zealand'),('MS Dhoni',30,'India'),('Steve Smith',31,'Australia'),('Virat Kohli',32,'India'),('Kane Williamson',35,'New Zealand'),('MS Dhoni',30,'India'),('Steve Smith',31,'Australia'),('Virat Kohli',32,'India'),('Kane Williamson',35,'New Zealand'),('MS Dhoni',30,'India'),('Steve Smith',31,'Australia'),('Virat Kohli',32,'India');
/*!40000 ALTER TABLE `cricketer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) NOT NULL,
  `bidding_price` double NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sold` bit(1) NOT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdvd6ljes11r44igawmpm1mc5s` (`team_id`),
  CONSTRAINT `FKdvd6ljes11r44igawmpm1mc5s` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,24,15000,'Seniorteam','Viratdemo@gmail.com','Demo','',1),(2,24,15000,'Seniorteam','Viratdemo@gmail.com','Demo','\0',NULL),(3,24,15000,'Seniorteam','Viratdemo@gmail.com','Demo','',5),(4,24,15000,'Seniorteam','Viratdemo@gmail.com','Demo','\0',NULL),(5,24,1000,'Senior Team',NULL,'Player A','\0',NULL),(6,24,15000,'Seniorteam','Viratdemo@gmail.com','Demo','\0',NULL),(7,30,0,'',NULL,'Player 1','\0',NULL);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `maximum_budget` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,15000,'Demo'),(2,15000,'Demo'),(3,15000,'Demo'),(4,15000,'Demo'),(5,100000,'Team A'),(6,15000,'Demo');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `name` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES ('Senior Team','India'),('Junior Team','Australia'),('Senior Team','New Zealand'),('Senior Team','India'),('Junior Team','Australia'),('Senior Team','New Zealand'),('Senior Team','India'),('Junior Team','Australia'),('Senior Team','New Zealand'),('Senior Team','India'),('Junior Team','Australia'),('Senior Team','New Zealand'),('Senior Team','India'),('Junior Team','Australia'),('Senior Team','New Zealand'),('Senior Team','India'),('Junior Team','Australia'),('Senior Team','New Zealand'),('Senior Team','India'),('Junior Team','Australia'),('Senior Team','New Zealand'),('Senior Team','India'),('Junior Team','Australia'),('Senior Team','New Zealand'),('Senior Team','India'),('Junior Team','Australia'),('Senior Team','New Zealand'),('Senior Team','India'),('Junior Team','Australia'),('Senior Team','New Zealand'),('Senior Team','India'),('Junior Team','Australia'),('Senior Team','New Zealand');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'$2a$10$npsULKiLMJfsjXE47U9UjugRX9db2Hpuenn66CJGUD6CEKeUltne.','ADMIN','admin'),(2,'$2a$10$LHOLvq41UqT3FqAJB6sKdePhjbcGVqN9ARTD.JJ7h7FeUO7MxeTZy','ADMIN','admin'),(3,'$2a$10$8jM.vIiaIVATf8f94xHpNOtWcnlFZ9g.4l2bEc7H4f66AA6ArX.oe','ADMIN','admin'),(4,'$2a$10$.jtaHmSNzPQuUhWM0CR/h.kWb7KSIEqHtHf5YOghTsD1bL50OgoZe','ADMIN','admin'),(5,'$2a$10$xp3UXr47Ff6T6doY6YN.numX0CQ7cfQ2yCZZXA6W3HbppLdjazRJe','ADMIN','admin'),(6,'$2a$10$ofNSR54g0op2iZaZNdHN.Od2iyTTHqDZ0zkRXJed7orR0A1Cfbevi','ADMIN','admin'),(7,'$2a$10$XmPBhZfhw48oA2XhMeQH.uF.NYm.ra.wsBc9kqyQu81vhCdxL3vi6','ADMIN','admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18  6:56:44
