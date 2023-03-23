-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: csc2008
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.10.2

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
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Afghanistan'),(2,'Albania'),(3,'Algeria'),(4,'Angola'),(5,'Argentina'),(6,'Armenia'),(7,'Australia'),(8,'Austria'),(9,'Azerbaijan'),(10,'Bahamas'),(11,'Bangladesh'),(12,'Belarus'),(13,'Belgium'),(14,'Bermuda'),(15,'Botswana'),(16,'Brazil'),(17,'Bulgaria'),(18,'Burkina Faso'),(19,'Cambodia'),(20,'Cameroon'),(21,'Canada'),(22,'Cayman Islands'),(23,'Chile'),(24,'China'),(25,'Colombia'),(26,'Croatia'),(27,'Cuba'),(28,'Cyprus'),(29,'Czech Republic'),(30,'Denmark'),(31,'Dominican Republic'),(32,'East Germany'),(33,'Ecuador'),(34,'Egypt'),(35,'Ethiopia'),(36,'Finland'),(37,'France'),(38,'Georgia'),(39,'Germany'),(40,'Ghana'),(41,'Greece'),(42,'Guatemala'),(43,'Hong Kong'),(44,'Hungary'),(45,'Iceland'),(46,'India'),(47,'Indonesia'),(48,'Iran'),(49,'Iraq'),(50,'Ireland'),(51,'Israel'),(52,'Italy'),(53,'Jamaica'),(54,'Japan'),(55,'Jordan'),(56,'Kazakhstan'),(57,'Kenya'),(58,'Kuwait'),(59,'Latvia'),(60,'Lebanon'),(61,'Liechtenstein'),(62,'Lithuania'),(63,'Luxembourg'),(64,'Malawi'),(65,'Malaysia'),(66,'Malta'),(67,'Mauritius'),(68,'Mexico'),(69,'Mongolia'),(70,'Montenegro'),(71,'Morocco'),(72,'Mozambique'),(73,'Namibia'),(74,'Nepal'),(75,'Netherlands'),(76,'New Zealand'),(77,'Nicaragua'),(78,'Nigeria'),(79,'Norway'),(80,'Pakistan'),(81,'Palestine'),(82,'Panama'),(83,'Paraguay'),(84,'Peru'),(85,'Philippines'),(86,'Poland'),(87,'Portugal'),(88,'Puerto Rico'),(89,'Qatar'),(90,'Romania'),(91,'Russia'),(92,'Samoa'),(93,'Saudi Arabia'),(94,'Senegal'),(95,'Serbia'),(96,'Singapore'),(97,'Slovakia'),(98,'Slovenia'),(99,'Somalia'),(100,'South Africa'),(101,'South Korea'),(102,'Soviet Union'),(103,'Spain'),(104,'Sri Lanka'),(105,'Sudan'),(106,'Sweden'),(107,'Switzerland'),(108,'Syria'),(109,'Taiwan'),(110,'Thailand'),(111,'Turkey'),(112,'Uganda'),(113,'Ukraine'),(114,'United Arab Emirates'),(115,'United Kingdom'),(116,'United States'),(117,'Uruguay'),(118,'Vatican City'),(119,'Venezuela'),(120,'Vietnam'),(121,'West Germany'),(122,'Zimbabwe');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-23 16:14:03
