-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: pruebadb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Recetas'),(2,'Juegos'),(3,'RecordarImportante'),(4,'Urgente'),(5,'Tareas'),(6,'Matemática'),(7,'Programación'),(8,'MasterClass'),(9,'DataImportante'),(10,'ProyectoIntegrador');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_category_pv`
--

DROP TABLE IF EXISTS `note_category_pv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_category_pv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) DEFAULT NULL,
  `note_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `note_category_pv_FK` (`categoria_id`),
  KEY `note_category_pv_FK_1` (`note_id`),
  CONSTRAINT `note_category_pv_FK` FOREIGN KEY (`categoria_id`) REFERENCES `category` (`id`),
  CONSTRAINT `note_category_pv_FK_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_category_pv`
--

LOCK TABLES `note_category_pv` WRITE;
/*!40000 ALTER TABLE `note_category_pv` DISABLE KEYS */;
INSERT INTO `note_category_pv` VALUES (1,7,1),(2,1,2),(3,1,3),(4,3,4),(5,4,5),(6,7,6),(7,5,7),(8,10,8),(9,2,9),(10,7,10);
/*!40000 ALTER TABLE `note_category_pv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `modification_date` date DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `remove` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'Crud','2022-04-02','2022-04-03','Realizar metodo destroy',0),(2,'Pizza','2020-08-06','2020-08-07','Comprar harina',0),(3,'Pastafrola','2017-09-03','2017-09-06','2 huevos, 2 tazas de harina leudate..',0),(4,'MediaQueries','2022-02-01','2022-02-07','revisar media querie del admin',0),(5,'Médico','2021-12-05','2021-12-09','laboratorio',1),(6,'Qa','2018-06-01','2018-06-05','investigar QA',1),(7,'Sequelize','2012-05-19','2012-05-20','tomar mates con sequelize',1),(8,'DataBase','2012-03-01','2012-03-10','DER a proyecto',1),(9,'Juegos para niños','2013-04-05','2013-04-10','ayudar a meli a buscar juegos para la fiestita del sábado',1),(10,'Tp','2022-01-03','2022-01-05','practica playgroud',0);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `note_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_FK` (`note_id`),
  CONSTRAINT `users_FK` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Karen','Calisaya','mail@mail.com',NULL),(2,'Pedro','Gonzales','pedro@mail.com',NULL),(3,'Laura','Perez','laura@mail.com',NULL),(4,'Rodrigo','Hernández','rodri@mail.com',NULL),(5,'Luci','Lopez','luu@mail.com',NULL),(6,'Lautaro','Águila','lautaro@mail.com',NULL),(7,'Araceli','Luna','ara@mail.com',NULL),(8,'Lorena','Palacios','lore@mail.com',NULL),(9,'Karina','Polit','lore@mail.com',NULL),(10,'Tomas','Valleint','tomy@mail.com',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pruebadb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 17:23:47
