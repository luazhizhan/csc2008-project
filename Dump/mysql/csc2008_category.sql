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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Action & Adventure'),(2,'Anime Features'),(3,'Anime Series'),(4,'British TV Shows'),(5,'Children & Family Movies'),(6,'Classic & Cult TV'),(7,'Classic Movies'),(8,'Comedies'),(9,'Crime TV Shows'),(10,'Cult Movies'),(11,'Documentaries'),(12,'Docuseries'),(13,'Dramas'),(14,'Faith & Spirituality'),(15,'Horror Movies'),(16,'Independent Movies'),(17,'International Movies'),(18,'International TV Shows'),(19,'Kids\' TV'),(20,'Korean TV Shows'),(21,'LGBTQ Movies'),(22,'Movies'),(23,'Music & Musicals'),(24,'Reality TV'),(25,'Romantic Movies'),(26,'Romantic TV Shows'),(27,'Science & Nature TV'),(28,'Sci-Fi & Fantasy'),(29,'Spanish-Language TV Shows'),(30,'Sports Movies'),(31,'Stand-Up Comedy'),(32,'Stand-Up Comedy & Talk Shows'),(33,'Teen TV Shows'),(34,'Thrillers'),(35,'TV Action & Adventure'),(36,'TV Comedies'),(37,'TV Dramas'),(38,'TV Horror'),(39,'TV Mysteries'),(40,'TV Sci-Fi & Fantasy'),(41,'TV Shows'),(42,'TV Thrillers');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-23 16:14:00
