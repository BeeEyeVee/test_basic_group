-- MySQL dump 10.15  Distrib 10.0.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: yii2basic
-- ------------------------------------------------------
-- Server version	10.0.34-MariaDB-0ubuntu0.16.04.1

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
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1530652286),('m151008_162401_create_notification_table',1530726944),('m160509_211405_add_flashed_to_notification',1530726944),('m160921_171124_alter_notification_table',1530726944),('m180703_195330_create_users_table',1530660657),('m180703_195331_create_score_actions_table',1530660657);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `key_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `flashed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'error_transfer_message','1','error',2,0,'2018-07-04 18:55:51',1),(2,'success_transfer_message','1','success',2,0,'2018-07-04 18:56:24',1),(3,'success_transfer_message','2','success',1,0,'2018-07-04 18:57:40',1),(4,'error_transfer_message','2','error',1,0,'2018-07-04 18:57:40',1),(5,'success_transfer_message','1','success',2,0,'2018-07-04 19:20:00',1),(6,'success_transfer_message','1','success',2,0,'2018-07-04 19:20:04',1),(7,'success_transfer_message','1','success',2,0,'2018-07-04 19:20:06',1),(8,'success_transfer_message','1','success',2,0,'2018-07-04 19:20:08',1),(9,'success_transfer_message','1','success',2,0,'2018-07-04 19:20:10',1),(10,'success_transfer_message','1','success',2,0,'2018-07-04 19:20:12',1),(11,'success_transfer_message','1','success',2,0,'2018-07-04 19:20:14',1),(12,'success_transfer_message','2','success',1,0,'2018-07-04 19:23:52',1),(13,'success_transfer_message','2','success',1,0,'2018-07-04 19:23:59',1),(14,'success_transfer_message','2','success',1,0,'2018-07-04 19:24:01',1),(15,'success_transfer_message','2','success',1,0,'2018-07-04 19:24:03',1),(16,'success_transfer_message','2','success',1,0,'2018-07-04 19:24:18',1),(17,'success_transfer_message','2','success',1,0,'2018-07-04 19:24:20',1),(18,'success_transfer_message','2','success',1,0,'2018-07-04 19:24:22',1),(19,'success_transfer_message','2','success',1,0,'2018-07-04 19:24:23',1),(20,'success_transfer_message','2','success',1,0,'2018-07-04 19:24:26',1),(21,'success_transfer_message','2','success',1,0,'2018-07-04 19:24:28',1),(22,'success_transfer_message','2','success',1,0,'2018-07-04 19:25:15',1),(23,'success_transfer_message','2','success',1,0,'2018-07-04 19:25:17',1),(24,'success_transfer_message','2','success',1,0,'2018-07-04 19:25:18',1),(25,'success_transfer_message','2','success',1,0,'2018-07-04 19:25:19',1),(26,'success_transfer_message','2','success',1,0,'2018-07-04 19:25:20',1),(27,'success_transfer_message','2','success',1,0,'2018-07-04 19:25:21',1),(28,'error_transfer_message','2','error',1,0,'2018-07-04 19:25:21',1),(29,'success_transfer_message','1','success',2,0,'2018-07-04 19:25:29',1),(30,'success_transfer_message','1','success',2,0,'2018-07-04 19:25:30',1),(31,'success_transfer_message','1','success',2,0,'2018-07-04 19:25:31',1),(32,'success_transfer_message','1','success',2,0,'2018-07-04 19:25:32',1),(33,'success_transfer_message','1','success',2,0,'2018-07-04 19:25:34',1),(34,'success_transfer_message','1','success',2,0,'2018-07-04 19:25:35',1),(35,'success_transfer_message','1','success',2,0,'2018-07-04 19:25:36',1),(36,'success_transfer_message','1','success',2,0,'2018-07-04 19:25:38',1),(37,'success_transfer_message','1','success',2,0,'2018-07-04 19:25:39',1),(38,'success_transfer_message','1','success',2,0,'2018-07-04 19:25:44',1),(39,'success_transfer_message','1','success',2,0,'2018-07-04 19:26:21',1),(40,'success_transfer_message','1','success',2,0,'2018-07-04 19:26:25',1),(41,'error_transfer_message','2','error',1,0,'2018-07-04 19:26:38',1),(42,'error_transfer_message','2','error',1,0,'2018-07-04 19:26:40',1),(43,'error_transfer_message','2','error',1,0,'2018-07-04 19:26:41',1),(44,'error_transfer_message','2','error',1,0,'2018-07-04 19:26:41',1),(45,'error_transfer_message','2','error',1,0,'2018-07-04 19:26:41',1),(46,'error_transfer_message','2','error',1,0,'2018-07-04 19:26:42',1),(47,'error_transfer_message','2','error',1,0,'2018-07-04 19:26:43',1),(48,'error_transfer_message','2','error',1,0,'2018-07-04 19:26:43',1),(49,'error_transfer_message','2','error',1,0,'2018-07-04 19:26:43',1),(50,'success_transfer_message','3','success',1,0,'2018-07-04 19:27:18',1),(51,'success_transfer_message','3','success',2,0,'2018-07-04 19:27:21',1),(52,'success_transfer_message','3','success',2,0,'2018-07-04 19:27:24',1),(53,'success_transfer_message','3','success',1,0,'2018-07-04 19:27:27',1),(54,'success_transfer_message','3','success',1,0,'2018-07-04 19:27:29',1),(55,'success_transfer_message','3','success',1,0,'2018-07-04 19:27:31',1),(56,'success_transfer_message','3','success',2,0,'2018-07-04 19:27:32',1),(57,'success_transfer_message','3','success',1,0,'2018-07-04 19:27:53',1),(58,'success_transfer_message','3','success',2,0,'2018-07-04 19:27:55',1),(59,'success_transfer_message','3','success',2,0,'2018-07-04 19:27:58',1),(60,'success_transfer_message','3','success',2,0,'2018-07-04 19:28:00',1),(61,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:03',1),(62,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:04',1),(63,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:05',1),(64,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:05',1),(65,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:05',1),(66,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:08',1),(67,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:08',1),(68,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:08',1),(69,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:08',1),(70,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:08',1),(71,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:09',1),(72,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:09',1),(73,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:09',1),(74,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:09',1),(75,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:09',1),(76,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:09',1),(77,'error_transfer_message','3','error',2,0,'2018-07-04 19:28:10',1),(78,'error_transfer_message','3','error',1,0,'2018-07-04 19:32:45',1),(79,'error_transfer_message','3','error',2,0,'2018-07-04 19:32:47',1),(80,'error_transfer_message','3','error',1,0,'2018-07-04 19:46:46',1),(81,'error_transfer_message','3','error',1,0,'2018-07-04 19:46:46',1),(82,'error_transfer_message','3','error',1,0,'2018-07-04 19:46:46',1),(83,'success_transfer_message','1','success',3,0,'2018-07-04 19:47:51',1),(84,'success_transfer_message','3','success',1,0,'2018-07-04 19:48:34',1),(85,'success_transfer_message','3','success',1,0,'2018-07-04 19:49:41',1),(86,'success_transfer_message','3','success',1,0,'2018-07-04 19:50:19',1),(87,'success_transfer_message','3','success',1,0,'2018-07-04 19:51:26',1),(88,'success_transfer_message','3','success',1,0,'2018-07-04 19:51:29',1),(89,'success_transfer_message','3','success',1,0,'2018-07-04 19:51:32',1),(90,'success_transfer_message','3','success',1,0,'2018-07-04 19:51:33',1),(91,'success_transfer_message','3','success',1,0,'2018-07-04 19:51:34',1),(92,'success_transfer_message','3','success',2,0,'2018-07-04 19:51:35',1),(93,'success_transfer_message','3','success',2,0,'2018-07-04 19:51:36',1),(94,'success_transfer_message','3','success',2,0,'2018-07-04 19:51:37',1),(95,'success_transfer_message','3','success',2,0,'2018-07-04 19:51:38',1),(96,'success_transfer_message','1','success',3,0,'2018-07-04 19:56:11',1),(97,'success_transfer_message','3','success',2,0,'2018-07-04 20:00:42',1),(98,'success_transfer_message','3','success',2,0,'2018-07-04 20:00:49',1),(99,'success_transfer_message','3','success',2,0,'2018-07-04 20:00:51',1),(100,'success_transfer_message','3','success',1,0,'2018-07-04 20:00:53',1),(101,'success_transfer_message','3','success',2,0,'2018-07-04 20:00:55',1),(102,'success_transfer_message','1','success',2,0,'2018-07-04 20:01:02',1),(103,'success_transfer_message','1','success',2,0,'2018-07-04 20:01:05',1),(104,'success_transfer_message','1','success',2,0,'2018-07-04 20:01:07',1),(105,'success_transfer_message','1','success',3,0,'2018-07-04 20:01:39',1),(106,'success_transfer_message','1','success',3,0,'2018-07-04 20:01:49',1),(107,'success_transfer_message','1','success',3,0,'2018-07-04 20:01:52',1),(108,'success_transfer_message','1','success',3,0,'2018-07-04 20:01:57',1),(109,'error_transfer_message','1','error',2,0,'2018-07-04 20:08:07',1),(110,'error_transfer_message','1','error',2,0,'2018-07-04 20:08:21',1),(111,'error_transfer_message','1','error',2,0,'2018-07-04 20:10:55',1),(112,'error_transfer_message','1','error',2,0,'2018-07-04 20:11:22',1),(113,'error_transfer_message','1','error',2,0,'2018-07-04 20:11:36',1),(114,'error_transfer_message','1','error',2,0,'2018-07-04 20:11:46',1),(115,'error_transfer_message','1','error',2,0,'2018-07-04 20:12:04',1),(116,'error_transfer_message','1','error',2,0,'2018-07-04 20:25:07',1),(117,'error_transfer_message','1','error',2,0,'2018-07-04 20:25:40',1),(118,'error_transfer_message','1','error',2,0,'2018-07-04 20:25:41',1),(119,'error_transfer_message','1','error',2,0,'2018-07-04 20:25:41',1),(120,'error_transfer_message','1','error',2,0,'2018-07-04 20:25:41',1),(121,'error_transfer_message','1','error',2,0,'2018-07-04 20:25:41',1),(122,'error_transfer_message','1','error',2,0,'2018-07-04 20:25:41',1),(123,'success_transfer_message','2','success',1,0,'2018-07-04 20:29:00',1),(124,'success_transfer_message','2','success',1,0,'2018-07-04 20:29:36',1),(125,'success_transfer_message','2','success',1,0,'2018-07-04 20:29:41',1),(126,'success_transfer_message','2','success',1,0,'2018-07-04 20:29:43',1),(127,'success_transfer_message','2','success',1,0,'2018-07-04 20:29:45',1),(128,'success_transfer_message','2','success',1,0,'2018-07-04 20:29:47',1),(129,'success_transfer_message','1','success',2,0,'2018-07-04 20:33:35',1),(130,'success_transfer_message','1','success',3,0,'2018-07-04 20:34:14',0),(131,'success_transfer_message','1','success',2,0,'2018-07-04 20:35:35',1),(132,'success_transfer_message','1','success',3,0,'2018-07-04 20:35:40',0),(133,'success_transfer_message','1','success',3,0,'2018-07-04 20:39:09',0),(134,'success_transfer_message','1','success',3,0,'2018-07-04 20:39:11',0),(135,'success_transfer_message','1','success',3,0,'2018-07-04 20:39:12',0),(136,'success_transfer_message','1','success',3,0,'2018-07-04 20:39:13',0),(137,'success_transfer_message','1','success',3,0,'2018-07-04 20:39:14',0),(138,'success_transfer_message','1','success',3,0,'2018-07-04 20:39:16',0),(139,'error_transfer_message','1','error',3,0,'2018-07-04 20:41:40',0),(140,'success_transfer_message','2','success',1,0,'2018-07-04 20:43:47',1),(141,'success_transfer_message','2','success',1,0,'2018-07-04 20:43:50',1),(142,'error_transfer_message','2','error',1,0,'2018-07-04 21:00:18',1),(143,'success_transfer_message','2','success',1,0,'2018-07-04 21:00:38',1),(144,'success_transfer_message','2','success',1,0,'2018-07-04 21:00:44',1),(145,'success_transfer_message','2','success',1,0,'2018-07-04 21:00:47',1),(146,'success_transfer_message','1','success',2,0,'2018-07-04 21:00:56',1),(147,'success_transfer_message','2','success',1,0,'2018-07-04 21:01:02',1),(148,'success_transfer_message','1','success',2,0,'2018-07-04 21:04:15',1),(149,'success_transfer_message','1','success',2,0,'2018-07-04 21:20:36',1),(150,'success_transfer_message','1','success',2,0,'2018-07-04 21:20:38',0),(151,'success_transfer_message','2','success',1,0,'2018-07-04 21:48:33',1);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_actions`
--

DROP TABLE IF EXISTS `score_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_sender_id_fk` (`sender_id`),
  KEY `users_receiver_id_fk` (`receiver_id`),
  CONSTRAINT `users_receiver_id_fk` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `users_sender_id_fk` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_actions`
--

LOCK TABLES `score_actions` WRITE;
/*!40000 ALTER TABLE `score_actions` DISABLE KEYS */;
INSERT INTO `score_actions` VALUES (1,2,1,407.14,1530662698,1530662698),(2,2,1,319.02,1530662801,1530662801),(9,2,1,268.62,1530663058,1530663058),(12,2,1,5.2,1530663202,1530663202),(13,2,1,0,1530726863,1530726863),(14,2,1,0.01,1530726869,1530726869),(15,2,1,0.01,1530726877,1530726877),(21,2,1,0,1530726984,1530726984),(22,2,1,0,1530726992,1530726992),(23,2,1,0,1530727060,1530727060),(24,1,2,447.62,1530727098,1530727098),(25,1,2,447.62,1530727120,1530727120),(26,1,2,447.62,1530727134,1530727134),(27,1,2,447.62,1530727150,1530727150),(30,2,1,0,1530727159,1530727159),(31,2,1,0,1530727160,1530727160),(32,2,1,0,1530727161,1530727161),(33,2,1,0,1530727161,1530727161),(34,2,1,0,1530727161,1530727161),(35,2,1,0,1530727228,1530727228),(36,2,1,0,1530727232,1530727232),(37,2,1,0,1530727232,1530727232),(38,2,1,0,1530727232,1530727232),(39,2,1,0,1530727232,1530727232),(40,2,1,0,1530727236,1530727236),(41,2,1,0,1530727236,1530727236),(42,2,1,0,1530727236,1530727236),(43,2,1,0,1530727236,1530727236),(44,2,1,0,1530727240,1530727240),(45,2,1,0,1530727240,1530727240),(46,2,1,0,1530727240,1530727240),(53,2,1,0,1530727294,1530727294),(54,2,1,0,1530727297,1530727297),(55,2,1,0,1530727297,1530727297),(60,1,2,0,1530727469,1530727469),(61,1,2,105.76,1530727471,1530727471),(62,2,1,72.24,1530727490,1530727490),(63,1,2,7.54,1530727682,1530727682),(64,1,2,7.54,1530727684,1530727684),(65,1,2,6.9,1530727717,1530727717),(66,1,2,6.9,1530727755,1530727755),(67,1,2,6.9,1530727768,1530727768),(68,1,2,6.68,1530727827,1530727827),(69,2,1,52.11,1530727863,1530727863),(70,2,1,52.11,1530727886,1530727886),(71,1,2,6.68,1530727903,1530727903),(72,1,2,6.68,1530727919,1530727919),(73,1,2,6.68,1530727946,1530727946),(74,1,2,38.73,1530727949,1530727949),(75,1,2,38.73,1530727962,1530727962),(76,1,2,38.73,1530727963,1530727963),(77,1,2,38.73,1530727963,1530727963),(78,1,2,12.86,1530727969,1530727969),(79,1,2,12.86,1530727975,1530727975),(80,2,1,214.99,1530727983,1530727983),(81,2,1,486.06,1530727987,1530727987),(82,2,1,258.38,1530728024,1530728024),(83,2,1,258.38,1530728025,1530728025),(84,2,1,258.38,1530728026,1530728026),(85,2,1,258.38,1530728026,1530728026),(89,2,1,8.7,1530728033,1530728033),(90,2,1,27.18,1530728036,1530728036),(91,2,1,27.18,1530728038,1530728038),(92,2,1,26.1,1530728041,1530728041),(93,2,1,26.1,1530728041,1530728041),(94,2,1,26.1,1530728041,1530728041),(95,2,1,26.1,1530728041,1530728041),(96,2,1,26.1,1530728042,1530728042),(97,2,1,26.1,1530728047,1530728047),(98,2,1,0.41,1530728070,1530728070),(99,2,1,0.41,1530728075,1530728075),(100,2,1,0.41,1530728075,1530728075),(101,2,1,0.41,1530728076,1530728076),(102,2,1,1.54,1530728132,1530728132),(103,2,1,1.21,1530728134,1530728134),(104,2,1,2.58,1530728135,1530728135),(105,2,1,0.93,1530728137,1530728137),(106,1,2,16.15,1530728141,1530728141),(107,1,2,472.16,1530728146,1530728146),(108,1,2,532.41,1530728147,1530728147),(109,1,2,442.65,1530728149,1530728149),(110,1,2,232.2,1530728150,1530728150),(111,1,2,151.82,1530728151,1530728151),(112,1,2,60.73,1530728153,1530728153),(113,1,2,12.15,1530728400,1530728400),(114,1,2,16.16,1530728404,1530728404),(115,1,2,8.37,1530728406,1530728406),(116,1,2,9.59,1530728408,1530728408),(117,1,2,16.86,1530728410,1530728410),(118,1,2,17.18,1530728412,1530728412),(119,1,2,8.68,1530728414,1530728414),(120,2,1,352.01,1530728632,1530728632),(121,2,1,214,1530728639,1530728639),(122,2,1,14,1530728641,1530728641),(123,2,1,24,1530728643,1530728643),(124,2,1,318.6,1530728658,1530728658),(125,2,1,640.05,1530728660,1530728660),(126,2,1,302.6,1530728662,1530728662),(127,2,1,78.95,1530728663,1530728663),(128,2,1,15.08,1530728666,1530728666),(129,2,1,8.83,1530728668,1530728668),(130,2,1,4.25,1530728715,1530728715),(131,2,1,12.64,1530728717,1530728717),(132,2,1,7.86,1530728718,1530728718),(133,2,1,3.52,1530728719,1530728719),(134,2,1,0.96,1530728720,1530728720),(135,2,1,0.36,1530728721,1530728721),(136,1,2,0.31,1530728729,1530728729),(137,1,2,666.5,1530728730,1530728730),(138,1,2,698.24,1530728731,1530728731),(139,1,2,293.2,1530728732,1530728732),(140,1,2,144.76,1530728734,1530728734),(141,1,2,119.02,1530728735,1530728735),(142,1,2,41.11,1530728736,1530728736),(143,1,2,14.14,1530728738,1530728738),(144,1,2,10.73,1530728739,1530728739),(145,1,2,2.47,1530728744,1530728744),(146,1,2,1.47,1530728781,1530728781),(147,1,2,2.25,1530728785,1530728785),(148,3,1,633.33,1530728838,1530728838),(149,3,2,143.18,1530728841,1530728841),(150,3,2,176.66,1530728844,1530728844),(151,3,1,38.8,1530728847,1530728847),(152,3,1,5.51,1530728849,1530728849),(153,3,1,1.7,1530728851,1530728851),(154,3,2,0.54,1530728852,1530728852),(155,3,1,0.15,1530728873,1530728873),(156,3,2,0.08,1530728875,1530728875),(157,3,2,0.04,1530728878,1530728878),(158,3,2,0.01,1530728880,1530728880),(159,1,3,685.1,1530730071,1530730071),(160,3,1,223.47,1530730114,1530730114),(161,3,1,260.49,1530730181,1530730181),(162,3,1,110.63,1530730219,1530730219),(163,3,1,26.08,1530730286,1530730286),(164,3,1,24.39,1530730289,1530730289),(165,3,1,27.55,1530730292,1530730292),(166,3,1,8.83,1530730293,1530730293),(167,3,1,3.27,1530730294,1530730294),(168,3,2,0.26,1530730295,1530730295),(169,3,2,0.09,1530730296,1530730296),(170,3,2,0.03,1530730297,1530730297),(171,3,2,0.01,1530730298,1530730298),(172,1,3,202.15,1530730571,1530730571),(173,3,2,124.66,1530730842,1530730842),(174,3,2,34.5,1530730849,1530730849),(175,3,2,20.98,1530730851,1530730851),(176,3,1,8.02,1530730853,1530730853),(177,3,2,11.16,1530730855,1530730855),(178,1,2,278,1530730862,1530730862),(179,1,2,110.34,1530730865,1530730865),(180,1,2,47.71,1530730867,1530730867),(181,1,3,16.36,1530730899,1530730899),(182,1,3,13.63,1530730909,1530730909),(183,1,3,12.85,1530730912,1530730912),(184,1,3,11.69,1530730917,1530730917),(186,2,1,938.84,1530732540,1530732540),(187,2,1,333.97,1530732576,1530732576),(188,2,1,755.4,1530732581,1530732581),(189,2,1,731.54,1530732583,1530732583),(190,2,1,161.12,1530732585,1530732585),(191,2,1,21.77,1530732587,1530732587),(192,1,2,539.48,1530732815,1530732815),(193,1,3,600.79,1530732854,1530732854),(194,1,2,270.36,1530732935,1530732935),(195,1,3,485.14,1530732940,1530732940),(196,1,3,271.69,1530733149,1530733149),(197,1,3,540.78,1530733151,1530733151),(198,1,3,179.15,1530733152,1530733152),(199,1,3,40.65,1530733153,1530733153),(200,1,3,12.9,1530733154,1530733154),(201,1,3,1.7,1530733156,1530733156),(202,2,1,435.77,1530733427,1530733427),(203,2,1,181.69,1530733430,1530733430),(204,2,1,182.3,1530734351,1530734351),(206,2,1,5.33,1530734438,1530734438),(207,2,1,1.67,1530734444,1530734444),(208,2,1,3.08,1530734447,1530734447),(209,1,2,325.86,1530734456,1530734456),(210,2,1,183.1,1530734462,1530734462),(211,1,2,500.31,1530734655,1530734655),(212,1,2,71.08,1530735636,1530735636),(213,1,2,95.69,1530735638,1530735638),(214,2,1,714.15,1530737313,1530737313);
/*!40000 ALTER TABLE `score_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `score` float DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'bohdan2501','xtM8za70fmrlXeaCsaCE32Y6HgKWvBCa',-285.85,1530661004,1530737313),(2,'bohdan2502','H4piTAhVH0_Oi7JMmMk2tk56pR-LcDPq',-904.31,1530661247,1530737313),(3,'bohdan2503','-rMGj5aIdjHEF6SdIagf-amzGa-pzb5j',1190.16,1530728835,1530733156);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-04 21:53:02
