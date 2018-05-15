-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: iminerecom
-- ------------------------------------------------------
-- Server version	5.5.59-0ubuntu0.14.04.1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_country_id_index` (`country_id`),
  KEY `addresses_customer_id_index` (`customer_id`),
  CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'earum','Stanton Flats','498 Rowena Loaf','17080',1,1,1,2,1,NULL,'2018-05-14 23:22:22','2018-05-14 23:22:22'),(2,'voluptatem','Nelson Courts','7188 Bradtke Port','73900',1,1,1,2,1,NULL,'2018-05-14 23:22:22','2018-05-14 23:22:22'),(3,'temporibus','Bartholome Radial','737 Johns Forest','47074-2684',1,1,1,2,1,NULL,'2018-05-14 23:22:22','2018-05-14 23:22:22'),(4,'earum','Maria Plaza','7019 Rempel Ford','05755',1,1,1,3,1,NULL,'2018-05-14 23:22:22','2018-05-14 23:22:22'),(5,'officia','Assunta Cove','75120 Tyrique Meadow Apt. 803','94523-4321',1,1,1,3,1,NULL,'2018-05-14 23:22:22','2018-05-14 23:22:22'),(6,'sunt','Tremblay Glens','7332 Haskell Rest','77716',1,1,1,3,1,NULL,'2018-05-14 23:22:23','2018-05-14 23:22:23'),(7,'totam','Haley Common','3001 Reinger Corner Apt. 768','46524-8346',1,1,1,4,1,NULL,'2018-05-14 23:22:23','2018-05-14 23:22:23'),(8,'corrupti','Gusikowski Stream','8351 Stanton Locks','71784',1,1,1,4,1,NULL,'2018-05-14 23:22:23','2018-05-14 23:22:23'),(9,'aut','Khalil Circle','57731 Einar Extension','61661-7441',1,1,1,4,1,NULL,'2018-05-14 23:22:23','2018-05-14 23:22:23');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_value_product_attribute`
--

DROP TABLE IF EXISTS `attribute_value_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_value_product_attribute` (
  `attribute_value_id` int(10) unsigned NOT NULL,
  `product_attribute_id` int(10) unsigned NOT NULL,
  KEY `attribute_value_product_attribute_attribute_value_id_foreign` (`attribute_value_id`),
  KEY `attribute_value_product_attribute_product_attribute_id_foreign` (`product_attribute_id`),
  CONSTRAINT `attribute_value_product_attribute_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`),
  CONSTRAINT `attribute_value_product_attribute_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_value_product_attribute`
--

LOCK TABLES `attribute_value_product_attribute` WRITE;
/*!40000 ALTER TABLE `attribute_value_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_value_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_values`
--

DROP TABLE IF EXISTS `attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_values`
--

LOCK TABLES `attribute_values` WRITE;
/*!40000 ALTER TABLE `attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Uncategorized','uncategorized','Perferendis dolores quam fugit exercitationem laboriosam in sint. Qui et quis aut consequuntur deserunt debitis. Voluptatem esse dolorum tempora eligendi quisquam. Dolorem nihil repellat vero.','categories/5n2FJ4F9rvbO9RalSFOsaHyk3fdEoTC739s1CqXB.png',1,0,'2018-05-14 23:22:13','2018-05-14 23:22:13'),(2,'Toys','toys','Aliquam inventore ea non provident ab occaecati. Est et aliquid rem saepe. Sed quae quidem ullam voluptatem consequatur atque ipsam.','categories/J52vlitmckEadz8lrQvEjTyDcE6ljMevpsa2GGup.png',1,1,'2018-05-14 23:22:13','2018-05-14 23:22:13'),(3,'Household','household','Eius vero officia expedita esse ut nihil. Vero facilis pariatur blanditiis. Atque et accusamus atque.','categories/1EpfWNW8SW4lK8cQAlemC3GxXAHBtGuKDLeU6qlb.png',1,1,'2018-05-14 23:22:13','2018-05-14 23:22:13'),(4,'Gear','gear','Esse enim sequi ut molestiae. Sed ea reiciendis iusto blanditiis ab. Cum aperiam impedit quaerat est.','categories/Vo6S3kChfonGPrfH3C9bWKpQOaJ5t9S1bLto06yS.png',1,1,'2018-05-14 23:22:13','2018-05-14 23:22:13'),(5,'New Arrivals','new-arrivals','Qui rerum dolores enim labore et atque vitae. Ea est explicabo animi odit blanditiis voluptatem. Sit necessitatibus quae itaque accusantium consequatur. Amet sunt enim inventore quisquam quasi ad. Sunt cum modi incidunt iusto.','categories/BX1h99wEBlOfITTOnEN5Vk0YZvLFwmjH48UkHuqM.png',1,1,'2018-05-14 23:22:16','2018-05-14 23:22:16'),(6,'Featured','featured','Quaerat non et exercitationem eligendi. Impedit ut laudantium et voluptates rerum dolor est. Esse sint et qui. Illum earum saepe est repellat quaerat occaecati porro sit.','categories/hURXORnmzV258eXQM1ywT0OHGABf2F9Kvapl2jKk.png',1,1,'2018-05-14 23:22:19','2018-05-14 23:22:19');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_product_category_id_index` (`category_id`),
  KEY `category_product_product_id_index` (`product_id`),
  CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_product`
--

LOCK TABLES `category_product` WRITE;
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT INTO `category_product` VALUES (1,2,2),(2,2,3),(3,2,4),(4,2,5),(5,2,6),(6,3,7),(7,3,8),(8,3,9),(9,3,10),(10,3,11),(11,4,12),(12,4,13),(13,4,14),(14,4,15),(15,4,16),(16,1,17),(17,1,18),(18,1,19),(19,2,20),(20,2,21),(21,2,22),(22,3,23),(23,3,24),(24,3,25),(25,4,26),(26,4,27),(27,4,28),(28,5,29),(29,5,30),(30,5,31),(31,1,32),(32,1,33),(33,1,34),(34,2,35),(35,2,36),(36,2,37),(37,3,38),(38,3,39),(39,3,40),(40,4,41),(41,4,42),(42,4,43),(43,5,44),(44,5,45),(45,5,46),(46,6,47),(47,6,48),(48,6,49);
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_province_id_index` (`province_id`),
  CONSTRAINT `cities_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1637 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Bangued',1,NULL,NULL),(2,'Boliney',1,NULL,NULL),(3,'Bucay',1,NULL,NULL),(4,'Bucloc',1,NULL,NULL),(5,'Daguioman',1,NULL,NULL),(6,'Danglas',1,NULL,NULL),(7,'Dolores',1,NULL,NULL),(8,'La Paz',1,NULL,NULL),(9,'Lacub',1,NULL,NULL),(10,'Lagangilang',1,NULL,NULL),(11,'Lagayan',1,NULL,NULL),(12,'Langiden',1,NULL,NULL),(13,'Licuan-Baay',1,NULL,NULL),(14,'Luba',1,NULL,NULL),(15,'Malibcong',1,NULL,NULL),(16,'Manabo',1,NULL,NULL),(17,'Peñarrubia',1,NULL,NULL),(18,'Pidigan',1,NULL,NULL),(19,'Pilar',1,NULL,NULL),(20,'Sallapadan',1,NULL,NULL),(21,'San Isidro',1,NULL,NULL),(22,'San Juan',1,NULL,NULL),(23,'San Quintin',1,NULL,NULL),(24,'Tayum',1,NULL,NULL),(25,'Tineg',1,NULL,NULL),(26,'Tubo',1,NULL,NULL),(27,'Villaviciosa',1,NULL,NULL),(28,'Butuan City',2,NULL,NULL),(29,'Buenavista',2,NULL,NULL),(30,'Cabadbaran',2,NULL,NULL),(31,'Carmen',2,NULL,NULL),(32,'Jabonga',2,NULL,NULL),(33,'Kitcharao',2,NULL,NULL),(34,'Las Nieves',2,NULL,NULL),(35,'Magallanes',2,NULL,NULL),(36,'Nasipit',2,NULL,NULL),(37,'Remedios T. Romualdez',2,NULL,NULL),(38,'Santiago',2,NULL,NULL),(39,'Tubay',2,NULL,NULL),(40,'Bayugan',3,NULL,NULL),(41,'Bunawan',3,NULL,NULL),(42,'Esperanza',3,NULL,NULL),(43,'La Paz',3,NULL,NULL),(44,'Loreto',3,NULL,NULL),(45,'Prosperidad',3,NULL,NULL),(46,'Rosario',3,NULL,NULL),(47,'San Francisco',3,NULL,NULL),(48,'San Luis',3,NULL,NULL),(49,'Santa Josefa',3,NULL,NULL),(50,'Sibagat',3,NULL,NULL),(51,'Talacogon',3,NULL,NULL),(52,'Trento',3,NULL,NULL),(53,'Veruela',3,NULL,NULL),(54,'Altavas',4,NULL,NULL),(55,'Balete',4,NULL,NULL),(56,'Banga',4,NULL,NULL),(57,'Batan',4,NULL,NULL),(58,'Buruanga',4,NULL,NULL),(59,'Ibajay',4,NULL,NULL),(60,'Kalibo',4,NULL,NULL),(61,'Lezo',4,NULL,NULL),(62,'Libacao',4,NULL,NULL),(63,'Madalag',4,NULL,NULL),(64,'Makato',4,NULL,NULL),(65,'Malay',4,NULL,NULL),(66,'Malinao',4,NULL,NULL),(67,'Nabas',4,NULL,NULL),(68,'New Washington',4,NULL,NULL),(69,'Numancia',4,NULL,NULL),(70,'Tangalan',4,NULL,NULL),(71,'Legazpi City',5,NULL,NULL),(72,'Ligao City',5,NULL,NULL),(73,'Tabaco City',5,NULL,NULL),(74,'Bacacay',5,NULL,NULL),(75,'Camalig',5,NULL,NULL),(76,'Daraga',5,NULL,NULL),(77,'Guinobatan',5,NULL,NULL),(78,'Jovellar',5,NULL,NULL),(79,'Libon',5,NULL,NULL),(80,'Malilipot',5,NULL,NULL),(81,'Malinao',5,NULL,NULL),(82,'Manito',5,NULL,NULL),(83,'Oas',5,NULL,NULL),(84,'Pio Duran',5,NULL,NULL),(85,'Polangui',5,NULL,NULL),(86,'Rapu-Rapu',5,NULL,NULL),(87,'Santo Domingo',5,NULL,NULL),(88,'Tiwi',5,NULL,NULL),(89,'Anini-y',6,NULL,NULL),(90,'Barbaza',6,NULL,NULL),(91,'Belison',6,NULL,NULL),(92,'Bugasong',6,NULL,NULL),(93,'Caluya',6,NULL,NULL),(94,'Culasi',6,NULL,NULL),(95,'Hamtic',6,NULL,NULL),(96,'Laua-an',6,NULL,NULL),(97,'Libertad',6,NULL,NULL),(98,'Pandan',6,NULL,NULL),(99,'Patnongon',6,NULL,NULL),(100,'San Jose',6,NULL,NULL),(101,'San Remigio',6,NULL,NULL),(102,'Sebaste',6,NULL,NULL),(103,'Sibalom',6,NULL,NULL),(104,'Tibiao',6,NULL,NULL),(105,'Tobias Fornier',6,NULL,NULL),(106,'Valderrama',6,NULL,NULL),(107,'Calanasan',7,NULL,NULL),(108,'Conner',7,NULL,NULL),(109,'Flora',7,NULL,NULL),(110,'Kabugao',7,NULL,NULL),(111,'Luna',7,NULL,NULL),(112,'Pudtol',7,NULL,NULL),(113,'Santa Marcela',7,NULL,NULL),(114,'Baler',8,NULL,NULL),(115,'Casiguran',8,NULL,NULL),(116,'Dilasag',8,NULL,NULL),(117,'Dinalungan',8,NULL,NULL),(118,'Dingalan',8,NULL,NULL),(119,'Dipaculao',8,NULL,NULL),(120,'Maria Aurora',8,NULL,NULL),(121,'San Luis',8,NULL,NULL),(122,'Isabela City',9,NULL,NULL),(123,'Akbar',9,NULL,NULL),(124,'Al-Barka',9,NULL,NULL),(125,'Hadji Mohammad Ajul',9,NULL,NULL),(126,'Hadji Muhtamad',9,NULL,NULL),(127,'Lamitan',9,NULL,NULL),(128,'Lantawan',9,NULL,NULL),(129,'Maluso',9,NULL,NULL),(130,'Sumisip',9,NULL,NULL),(131,'Tabuan-Lasa',9,NULL,NULL),(132,'Tipo-Tipo',9,NULL,NULL),(133,'Tuburan',9,NULL,NULL),(134,'Ungkaya Pukan',9,NULL,NULL),(135,'Balanga City',10,NULL,NULL),(136,'Abucay',10,NULL,NULL),(137,'Bagac',10,NULL,NULL),(138,'Dinalupihan',10,NULL,NULL),(139,'Hermosa',10,NULL,NULL),(140,'Limay',10,NULL,NULL),(141,'Mariveles',10,NULL,NULL),(142,'Morong',10,NULL,NULL),(143,'Orani',10,NULL,NULL),(144,'Orion',10,NULL,NULL),(145,'Pilar',10,NULL,NULL),(146,'Samal',10,NULL,NULL),(147,'Basco',11,NULL,NULL),(148,'Itbayat',11,NULL,NULL),(149,'Ivana',11,NULL,NULL),(150,'Mahatao',11,NULL,NULL),(151,'Sabtang',11,NULL,NULL),(152,'Uyugan',11,NULL,NULL),(153,'Batangas City',12,NULL,NULL),(154,'Lipa City',12,NULL,NULL),(155,'Tanauan City',12,NULL,NULL),(156,'Agoncillo',12,NULL,NULL),(157,'Alitagtag',12,NULL,NULL),(158,'Balayan',12,NULL,NULL),(159,'Balete',12,NULL,NULL),(160,'Bauan',12,NULL,NULL),(161,'Calaca',12,NULL,NULL),(162,'Calatagan',12,NULL,NULL),(163,'Cuenca',12,NULL,NULL),(164,'Ibaan',12,NULL,NULL),(165,'Laurel',12,NULL,NULL),(166,'Lemery',12,NULL,NULL),(167,'Lian',12,NULL,NULL),(168,'Lobo',12,NULL,NULL),(169,'Mabini',12,NULL,NULL),(170,'Malvar',12,NULL,NULL),(171,'Mataas na Kahoy',12,NULL,NULL),(172,'Nasugbu',12,NULL,NULL),(173,'Padre Garcia',12,NULL,NULL),(174,'Rosario',12,NULL,NULL),(175,'San Jose',12,NULL,NULL),(176,'San Juan',12,NULL,NULL),(177,'San Luis',12,NULL,NULL),(178,'San Nicolas',12,NULL,NULL),(179,'San Pascual',12,NULL,NULL),(180,'Santa Teresita',12,NULL,NULL),(181,'Santo Tomas',12,NULL,NULL),(182,'Taal',12,NULL,NULL),(183,'Talisay',12,NULL,NULL),(184,'Taysan',12,NULL,NULL),(185,'Tingloy',12,NULL,NULL),(186,'Tuy',12,NULL,NULL),(187,'Baguio City',13,NULL,NULL),(188,'Atok',13,NULL,NULL),(189,'Bakun',13,NULL,NULL),(190,'Bokod',13,NULL,NULL),(191,'Buguias',13,NULL,NULL),(192,'Itogon',13,NULL,NULL),(193,'Kabayan',13,NULL,NULL),(194,'Kapangan',13,NULL,NULL),(195,'Kibungan',13,NULL,NULL),(196,'La Trinidad',13,NULL,NULL),(197,'Mankayan',13,NULL,NULL),(198,'Sablan',13,NULL,NULL),(199,'Tuba',13,NULL,NULL),(200,'Tublay',13,NULL,NULL),(201,'Almeria',14,NULL,NULL),(202,'Biliran',14,NULL,NULL),(203,'Cabucgayan',14,NULL,NULL),(204,'Caibiran',14,NULL,NULL),(205,'Culaba',14,NULL,NULL),(206,'Kawayan',14,NULL,NULL),(207,'Maripipi',14,NULL,NULL),(208,'Naval',14,NULL,NULL),(209,'Tagbilaran City',15,NULL,NULL),(210,'Alburquerque',15,NULL,NULL),(211,'Alicia',15,NULL,NULL),(212,'Anda',15,NULL,NULL),(213,'Antequera',15,NULL,NULL),(214,'Baclayon',15,NULL,NULL),(215,'Balilihan',15,NULL,NULL),(216,'Batuan',15,NULL,NULL),(217,'Bien Unido',15,NULL,NULL),(218,'Bilar',15,NULL,NULL),(219,'Buenavista',15,NULL,NULL),(220,'Calape',15,NULL,NULL),(221,'Candijay',15,NULL,NULL),(222,'Carmen',15,NULL,NULL),(223,'Catigbian',15,NULL,NULL),(224,'Clarin',15,NULL,NULL),(225,'Corella',15,NULL,NULL),(226,'Cortes',15,NULL,NULL),(227,'Dagohoy',15,NULL,NULL),(228,'Danao',15,NULL,NULL),(229,'Dauis',15,NULL,NULL),(230,'Dimiao',15,NULL,NULL),(231,'Duero',15,NULL,NULL),(232,'Garcia Hernandez',15,NULL,NULL),(233,'Getafe',15,NULL,NULL),(234,'Guindulman',15,NULL,NULL),(235,'Inabanga',15,NULL,NULL),(236,'Jagna',15,NULL,NULL),(237,'Lila',15,NULL,NULL),(238,'Loay',15,NULL,NULL),(239,'Loboc',15,NULL,NULL),(240,'Loon',15,NULL,NULL),(241,'Mabini',15,NULL,NULL),(242,'Maribojoc',15,NULL,NULL),(243,'Panglao',15,NULL,NULL),(244,'Pilar',15,NULL,NULL),(245,'President Carlos P. Garcia',15,NULL,NULL),(246,'Sagbayan',15,NULL,NULL),(247,'San Isidro',15,NULL,NULL),(248,'San Miguel',15,NULL,NULL),(249,'Sevilla',15,NULL,NULL),(250,'Sierra Bullones',15,NULL,NULL),(251,'Sikatuna',15,NULL,NULL),(252,'Talibon',15,NULL,NULL),(253,'Trinidad',15,NULL,NULL),(254,'Tubigon',15,NULL,NULL),(255,'Ubay',15,NULL,NULL),(256,'Valencia',15,NULL,NULL),(257,'Malaybalay City',16,NULL,NULL),(258,'Valencia City',16,NULL,NULL),(259,'Baungon',16,NULL,NULL),(260,'Cabanglasan',16,NULL,NULL),(261,'Damulog',16,NULL,NULL),(262,'Dangcagan',16,NULL,NULL),(263,'Don Carlos',16,NULL,NULL),(264,'Impasug-ong',16,NULL,NULL),(265,'Kadingilan',16,NULL,NULL),(266,'Kalilangan',16,NULL,NULL),(267,'Kibawe',16,NULL,NULL),(268,'Kitaotao',16,NULL,NULL),(269,'Lantapan',16,NULL,NULL),(270,'Libona',16,NULL,NULL),(271,'Malitbog',16,NULL,NULL),(272,'Manolo Fortich',16,NULL,NULL),(273,'Maramag',16,NULL,NULL),(274,'Pangantucan',16,NULL,NULL),(275,'Quezon',16,NULL,NULL),(276,'San Fernando',16,NULL,NULL),(277,'Sumilao',16,NULL,NULL),(278,'Talakag',16,NULL,NULL),(279,'Malolos City',17,NULL,NULL),(280,'Meycauayan City',17,NULL,NULL),(281,'San Jose del Monte City',17,NULL,NULL),(282,'Angat',17,NULL,NULL),(283,'Balagtas',17,NULL,NULL),(284,'Baliuag',17,NULL,NULL),(285,'Bocaue',17,NULL,NULL),(286,'Bulacan',17,NULL,NULL),(287,'Bustos',17,NULL,NULL),(288,'Calumpit',17,NULL,NULL),(289,'Doña Remedios Trinidad',17,NULL,NULL),(290,'Guiguinto',17,NULL,NULL),(291,'Hagonoy',17,NULL,NULL),(292,'Marilao',17,NULL,NULL),(293,'Norzagaray',17,NULL,NULL),(294,'Obando',17,NULL,NULL),(295,'Pandi',17,NULL,NULL),(296,'Paombong',17,NULL,NULL),(297,'Plaridel',17,NULL,NULL),(298,'Pulilan',17,NULL,NULL),(299,'San Ildefonso',17,NULL,NULL),(300,'San Miguel',17,NULL,NULL),(301,'San Rafael',17,NULL,NULL),(302,'Santa Maria',17,NULL,NULL),(303,'Tuguegarao City',18,NULL,NULL),(304,'Abulug',18,NULL,NULL),(305,'Alcala',18,NULL,NULL),(306,'Allacapan',18,NULL,NULL),(307,'Amulung',18,NULL,NULL),(308,'Aparri',18,NULL,NULL),(309,'Baggao',18,NULL,NULL),(310,'Ballesteros',18,NULL,NULL),(311,'Buguey',18,NULL,NULL),(312,'Calayan',18,NULL,NULL),(313,'Camalaniugan',18,NULL,NULL),(314,'Claveria',18,NULL,NULL),(315,'Enrile',18,NULL,NULL),(316,'Gattaran',18,NULL,NULL),(317,'Gonzaga',18,NULL,NULL),(318,'Iguig',18,NULL,NULL),(319,'Lal-lo',18,NULL,NULL),(320,'Lasam',18,NULL,NULL),(321,'Pamplona',18,NULL,NULL),(322,'Peñablanca',18,NULL,NULL),(323,'Piat',18,NULL,NULL),(324,'Rizal',18,NULL,NULL),(325,'Sanchez-Mira',18,NULL,NULL),(326,'Santa Ana',18,NULL,NULL),(327,'Santa Praxedes',18,NULL,NULL),(328,'Santa Teresita',18,NULL,NULL),(329,'Santo Niño',18,NULL,NULL),(330,'Solana',18,NULL,NULL),(331,'Tuao',18,NULL,NULL),(332,'Basud',19,NULL,NULL),(333,'Capalonga',19,NULL,NULL),(334,'Daet',19,NULL,NULL),(335,'Jose Panganiban',19,NULL,NULL),(336,'Labo',19,NULL,NULL),(337,'Mercedes',19,NULL,NULL),(338,'Paracale',19,NULL,NULL),(339,'San Lorenzo Ruiz',19,NULL,NULL),(340,'San Vicente',19,NULL,NULL),(341,'Santa Elena',19,NULL,NULL),(342,'Talisay',19,NULL,NULL),(343,'Vinzons',19,NULL,NULL),(344,'Iriga City',20,NULL,NULL),(345,'Naga City',20,NULL,NULL),(346,'Baao',20,NULL,NULL),(347,'Balatan',20,NULL,NULL),(348,'Bato',20,NULL,NULL),(349,'Bombon',20,NULL,NULL),(350,'Buhi',20,NULL,NULL),(351,'Bula',20,NULL,NULL),(352,'Cabusao',20,NULL,NULL),(353,'Calabanga',20,NULL,NULL),(354,'Camaligan',20,NULL,NULL),(355,'Canaman',20,NULL,NULL),(356,'Caramoan',20,NULL,NULL),(357,'Del Gallego',20,NULL,NULL),(358,'Gainza',20,NULL,NULL),(359,'Garchitorena',20,NULL,NULL),(360,'Goa',20,NULL,NULL),(361,'Lagonoy',20,NULL,NULL),(362,'Libmanan',20,NULL,NULL),(363,'Lupi',20,NULL,NULL),(364,'Magarao',20,NULL,NULL),(365,'Milaor',20,NULL,NULL),(366,'Minalabac',20,NULL,NULL),(367,'Nabua',20,NULL,NULL),(368,'Ocampo',20,NULL,NULL),(369,'Pamplona',20,NULL,NULL),(370,'Pasacao',20,NULL,NULL),(371,'Pili',20,NULL,NULL),(372,'Presentacion',20,NULL,NULL),(373,'Ragay',20,NULL,NULL),(374,'Sagñay',20,NULL,NULL),(375,'San Fernando',20,NULL,NULL),(376,'San Jose',20,NULL,NULL),(377,'Sipocot',20,NULL,NULL),(378,'Siruma',20,NULL,NULL),(379,'Tigaon',20,NULL,NULL),(380,'Tinambac',20,NULL,NULL),(381,'Catarman',21,NULL,NULL),(382,'Guinsiliban',21,NULL,NULL),(383,'Mahinog',21,NULL,NULL),(384,'Mambajao',21,NULL,NULL),(385,'Sagay',21,NULL,NULL),(386,'Roxas City',22,NULL,NULL),(387,'Cuartero',22,NULL,NULL),(388,'Dao',22,NULL,NULL),(389,'Dumalag',22,NULL,NULL),(390,'Dumarao',22,NULL,NULL),(391,'Ivisan',22,NULL,NULL),(392,'Jamindan',22,NULL,NULL),(393,'Ma-ayon',22,NULL,NULL),(394,'Mambusao',22,NULL,NULL),(395,'Panay',22,NULL,NULL),(396,'Panitan',22,NULL,NULL),(397,'Pilar',22,NULL,NULL),(398,'Pontevedra',22,NULL,NULL),(399,'President Roxas',22,NULL,NULL),(400,'Sapi-an',22,NULL,NULL),(401,'Sigma',22,NULL,NULL),(402,'Tapaz',22,NULL,NULL),(403,'Bagamanoc',23,NULL,NULL),(404,'Baras',23,NULL,NULL),(405,'Bato',23,NULL,NULL),(406,'Caramoran',23,NULL,NULL),(407,'Gigmoto',23,NULL,NULL),(408,'Pandan',23,NULL,NULL),(409,'Panganiban',23,NULL,NULL),(410,'San Andres',23,NULL,NULL),(411,'San Miguel',23,NULL,NULL),(412,'Viga',23,NULL,NULL),(413,'Virac',23,NULL,NULL),(414,'Cavite City',24,NULL,NULL),(415,'Dasmariñas City',24,NULL,NULL),(416,'Tagaytay City',24,NULL,NULL),(417,'Trece Martires City',24,NULL,NULL),(418,'Alfonso',24,NULL,NULL),(419,'Amadeo',24,NULL,NULL),(420,'Bacoor',24,NULL,NULL),(421,'Carmona',24,NULL,NULL),(422,'General Mariano Alvarez',24,NULL,NULL),(423,'General Emilio Aguinaldo',24,NULL,NULL),(424,'General Trias',24,NULL,NULL),(425,'Imus',24,NULL,NULL),(426,'Indang',24,NULL,NULL),(427,'Kawit',24,NULL,NULL),(428,'Magallanes',24,NULL,NULL),(429,'Maragondon',24,NULL,NULL),(430,'Mendez',24,NULL,NULL),(431,'Naic',24,NULL,NULL),(432,'Noveleta',24,NULL,NULL),(433,'Rosario',24,NULL,NULL),(434,'Silang',24,NULL,NULL),(435,'Tanza',24,NULL,NULL),(436,'Ternate',24,NULL,NULL),(437,'Bogo City',25,NULL,NULL),(438,'Cebu City',25,NULL,NULL),(439,'Carcar City',25,NULL,NULL),(440,'Danao City',25,NULL,NULL),(441,'Lapu-Lapu City',25,NULL,NULL),(442,'Mandaue City',25,NULL,NULL),(443,'Naga City',25,NULL,NULL),(444,'Talisay City',25,NULL,NULL),(445,'Toledo City',25,NULL,NULL),(446,'Alcantara',25,NULL,NULL),(447,'Alcoy',25,NULL,NULL),(448,'Alegria',25,NULL,NULL),(449,'Aloguinsan',25,NULL,NULL),(450,'Argao',25,NULL,NULL),(451,'Asturias',25,NULL,NULL),(452,'Badian',25,NULL,NULL),(453,'Balamban',25,NULL,NULL),(454,'Bantayan',25,NULL,NULL),(455,'Barili',25,NULL,NULL),(456,'Boljoon',25,NULL,NULL),(457,'Borbon',25,NULL,NULL),(458,'Carmen',25,NULL,NULL),(459,'Catmon',25,NULL,NULL),(460,'Compostela',25,NULL,NULL),(461,'Consolacion',25,NULL,NULL),(462,'Cordoba',25,NULL,NULL),(463,'Daanbantayan',25,NULL,NULL),(464,'Dalaguete',25,NULL,NULL),(465,'Dumanjug',25,NULL,NULL),(466,'Ginatilan',25,NULL,NULL),(467,'Liloan',25,NULL,NULL),(468,'Madridejos',25,NULL,NULL),(469,'Malabuyoc',25,NULL,NULL),(470,'Medellin',25,NULL,NULL),(471,'Minglanilla',25,NULL,NULL),(472,'Moalboal',25,NULL,NULL),(473,'Oslob',25,NULL,NULL),(474,'Pilar',25,NULL,NULL),(475,'Pinamungahan',25,NULL,NULL),(476,'Poro',25,NULL,NULL),(477,'Ronda',25,NULL,NULL),(478,'Samboan',25,NULL,NULL),(479,'San Fernando',25,NULL,NULL),(480,'San Francisco',25,NULL,NULL),(481,'San Remigio',25,NULL,NULL),(482,'Santa Fe',25,NULL,NULL),(483,'Santander',25,NULL,NULL),(484,'Sibonga',25,NULL,NULL),(485,'Sogod',25,NULL,NULL),(486,'Tabogon',25,NULL,NULL),(487,'Tabuelan',25,NULL,NULL),(488,'Tuburan',25,NULL,NULL),(489,'Tudela',25,NULL,NULL),(490,'Compostela',26,NULL,NULL),(491,'Laak',26,NULL,NULL),(492,'Mabini',26,NULL,NULL),(493,'Maco',26,NULL,NULL),(494,'Maragusan',26,NULL,NULL),(495,'Mawab',26,NULL,NULL),(496,'Monkayo',26,NULL,NULL),(497,'Montevista',26,NULL,NULL),(498,'Nabunturan',26,NULL,NULL),(499,'New Bataan',26,NULL,NULL),(500,'Pantukan',26,NULL,NULL),(501,'Kidapawan City',27,NULL,NULL),(502,'Alamada',27,NULL,NULL),(503,'Aleosan',27,NULL,NULL),(504,'Antipas',27,NULL,NULL),(505,'Arakan',27,NULL,NULL),(506,'Banisilan',27,NULL,NULL),(507,'Carmen',27,NULL,NULL),(508,'Kabacan',27,NULL,NULL),(509,'Libungan',27,NULL,NULL),(510,'M\'lang',27,NULL,NULL),(511,'Magpet',27,NULL,NULL),(512,'Makilala',27,NULL,NULL),(513,'Matalam',27,NULL,NULL),(514,'Midsayap',27,NULL,NULL),(515,'Pigkawayan',27,NULL,NULL),(516,'Pikit',27,NULL,NULL),(517,'President Roxas',27,NULL,NULL),(518,'Tulunan',27,NULL,NULL),(519,'Panabo City',28,NULL,NULL),(520,'Island Garden City of Samal',28,NULL,NULL),(521,'Tagum City',28,NULL,NULL),(522,'Asuncion',28,NULL,NULL),(523,'Braulio E. Dujali',28,NULL,NULL),(524,'Carmen',28,NULL,NULL),(525,'Kapalong',28,NULL,NULL),(526,'New Corella',28,NULL,NULL),(527,'San Isidro',28,NULL,NULL),(528,'Santo Tomas',28,NULL,NULL),(529,'Talaingod',28,NULL,NULL),(530,'Davao City',29,NULL,NULL),(531,'Digos City',29,NULL,NULL),(532,'Bansalan',29,NULL,NULL),(533,'Don Marcelino',29,NULL,NULL),(534,'Hagonoy',29,NULL,NULL),(535,'Jose Abad Santos',29,NULL,NULL),(536,'Kiblawan',29,NULL,NULL),(537,'Magsaysay',29,NULL,NULL),(538,'Malalag',29,NULL,NULL),(539,'Malita',29,NULL,NULL),(540,'Matanao',29,NULL,NULL),(541,'Padada',29,NULL,NULL),(542,'Santa Cruz',29,NULL,NULL),(543,'Santa Maria',29,NULL,NULL),(544,'Sarangani',29,NULL,NULL),(545,'Sulop',29,NULL,NULL),(546,'Mati City',30,NULL,NULL),(547,'Baganga',30,NULL,NULL),(548,'Banaybanay',30,NULL,NULL),(549,'Boston',30,NULL,NULL),(550,'Caraga',30,NULL,NULL),(551,'Cateel',30,NULL,NULL),(552,'Governor Generoso',30,NULL,NULL),(553,'Lupon',30,NULL,NULL),(554,'Manay',30,NULL,NULL),(555,'San Isidro',30,NULL,NULL),(556,'Tarragona',30,NULL,NULL),(557,'Arteche',31,NULL,NULL),(558,'Balangiga',31,NULL,NULL),(559,'Balangkayan',31,NULL,NULL),(560,'Borongan',31,NULL,NULL),(561,'Can-avid',31,NULL,NULL),(562,'Dolores',31,NULL,NULL),(563,'General MacArthur',31,NULL,NULL),(564,'Giporlos',31,NULL,NULL),(565,'Guiuan',31,NULL,NULL),(566,'Hernani',31,NULL,NULL),(567,'Jipapad',31,NULL,NULL),(568,'Lawaan',31,NULL,NULL),(569,'Llorente',31,NULL,NULL),(570,'Maslog',31,NULL,NULL),(571,'Maydolong',31,NULL,NULL),(572,'Mercedes',31,NULL,NULL),(573,'Oras',31,NULL,NULL),(574,'Quinapondan',31,NULL,NULL),(575,'Salcedo',31,NULL,NULL),(576,'San Julian',31,NULL,NULL),(577,'San Policarpo',31,NULL,NULL),(578,'Sulat',31,NULL,NULL),(579,'Taft',31,NULL,NULL),(580,'Buenavista',32,NULL,NULL),(581,'Jordan',32,NULL,NULL),(582,'Nueva Valencia',32,NULL,NULL),(583,'San Lorenzo',32,NULL,NULL),(584,'Sibunag',32,NULL,NULL),(585,'Aguinaldo',33,NULL,NULL),(586,'Alfonso Lista',33,NULL,NULL),(587,'Asipulo',33,NULL,NULL),(588,'Banaue',33,NULL,NULL),(589,'Hingyon',33,NULL,NULL),(590,'Hungduan',33,NULL,NULL),(591,'Kiangan',33,NULL,NULL),(592,'Lagawe',33,NULL,NULL),(593,'Lamut',33,NULL,NULL),(594,'Mayoyao',33,NULL,NULL),(595,'Tinoc',33,NULL,NULL),(596,'Batac City',34,NULL,NULL),(597,'Laoag City',34,NULL,NULL),(598,'Adams',34,NULL,NULL),(599,'Bacarra',34,NULL,NULL),(600,'Badoc',34,NULL,NULL),(601,'Bangui',34,NULL,NULL),(602,'Banna',34,NULL,NULL),(603,'Burgos',34,NULL,NULL),(604,'Carasi',34,NULL,NULL),(605,'Currimao',34,NULL,NULL),(606,'Dingras',34,NULL,NULL),(607,'Dumalneg',34,NULL,NULL),(608,'Marcos',34,NULL,NULL),(609,'Nueva Era',34,NULL,NULL),(610,'Pagudpud',34,NULL,NULL),(611,'Paoay',34,NULL,NULL),(612,'Pasuquin',34,NULL,NULL),(613,'Piddig',34,NULL,NULL),(614,'Pinili',34,NULL,NULL),(615,'San Nicolas',34,NULL,NULL),(616,'Sarrat',34,NULL,NULL),(617,'Solsona',34,NULL,NULL),(618,'Vintar',34,NULL,NULL),(619,'Candon City',35,NULL,NULL),(620,'Vigan City',35,NULL,NULL),(621,'Alilem',35,NULL,NULL),(622,'Banayoyo',35,NULL,NULL),(623,'Bantay',35,NULL,NULL),(624,'Burgos',35,NULL,NULL),(625,'Cabugao',35,NULL,NULL),(626,'Caoayan',35,NULL,NULL),(627,'Cervantes',35,NULL,NULL),(628,'Galimuyod',35,NULL,NULL),(629,'Gregorio Del Pilar',35,NULL,NULL),(630,'Lidlidda',35,NULL,NULL),(631,'Magsingal',35,NULL,NULL),(632,'Nagbukel',35,NULL,NULL),(633,'Narvacan',35,NULL,NULL),(634,'Quirino',35,NULL,NULL),(635,'Salcedo',35,NULL,NULL),(636,'San Emilio',35,NULL,NULL),(637,'San Esteban',35,NULL,NULL),(638,'San Ildefonso',35,NULL,NULL),(639,'San Juan',35,NULL,NULL),(640,'San Vicente',35,NULL,NULL),(641,'Santa',35,NULL,NULL),(642,'Santa Catalina',35,NULL,NULL),(643,'Santa Cruz',35,NULL,NULL),(644,'Santa Lucia',35,NULL,NULL),(645,'Santa Maria',35,NULL,NULL),(646,'Santiago',35,NULL,NULL),(647,'Santo Domingo',35,NULL,NULL),(648,'Sigay',35,NULL,NULL),(649,'Sinait',35,NULL,NULL),(650,'Sugpon',35,NULL,NULL),(651,'Suyo',35,NULL,NULL),(652,'Tagudin',35,NULL,NULL),(653,'Iloilo City',36,NULL,NULL),(654,'Passi City',36,NULL,NULL),(655,'Ajuy',36,NULL,NULL),(656,'Alimodian',36,NULL,NULL),(657,'Anilao',36,NULL,NULL),(658,'Badiangan',36,NULL,NULL),(659,'Balasan',36,NULL,NULL),(660,'Banate',36,NULL,NULL),(661,'Barotac Nuevo',36,NULL,NULL),(662,'Barotac Viejo',36,NULL,NULL),(663,'Batad',36,NULL,NULL),(664,'Bingawan',36,NULL,NULL),(665,'Cabatuan',36,NULL,NULL),(666,'Calinog',36,NULL,NULL),(667,'Carles',36,NULL,NULL),(668,'Concepcion',36,NULL,NULL),(669,'Dingle',36,NULL,NULL),(670,'Dueñas',36,NULL,NULL),(671,'Dumangas',36,NULL,NULL),(672,'Estancia',36,NULL,NULL),(673,'Guimbal',36,NULL,NULL),(674,'Igbaras',36,NULL,NULL),(675,'Janiuay',36,NULL,NULL),(676,'Lambunao',36,NULL,NULL),(677,'Leganes',36,NULL,NULL),(678,'Lemery',36,NULL,NULL),(679,'Leon',36,NULL,NULL),(680,'Maasin',36,NULL,NULL),(681,'Miagao',36,NULL,NULL),(682,'Mina',36,NULL,NULL),(683,'New Lucena',36,NULL,NULL),(684,'Oton',36,NULL,NULL),(685,'Pavia',36,NULL,NULL),(686,'Pototan',36,NULL,NULL),(687,'San Dionisio',36,NULL,NULL),(688,'San Enrique',36,NULL,NULL),(689,'San Joaquin',36,NULL,NULL),(690,'San Miguel',36,NULL,NULL),(691,'San Rafael',36,NULL,NULL),(692,'Santa Barbara',36,NULL,NULL),(693,'Sara',36,NULL,NULL),(694,'Tigbauan',36,NULL,NULL),(695,'Tubungan',36,NULL,NULL),(696,'Zarraga',36,NULL,NULL),(697,'Cauayan City',37,NULL,NULL),(698,'Santiago City',37,NULL,NULL),(699,'Alicia',37,NULL,NULL),(700,'Angadanan',37,NULL,NULL),(701,'Aurora',37,NULL,NULL),(702,'Benito Soliven',37,NULL,NULL),(703,'Burgos',37,NULL,NULL),(704,'Cabagan',37,NULL,NULL),(705,'Cabatuan',37,NULL,NULL),(706,'Cordon',37,NULL,NULL),(707,'Delfin Albano',37,NULL,NULL),(708,'Dinapigue',37,NULL,NULL),(709,'Divilacan',37,NULL,NULL),(710,'Echague',37,NULL,NULL),(711,'Gamu',37,NULL,NULL),(712,'Ilagan',37,NULL,NULL),(713,'Jones',37,NULL,NULL),(714,'Luna',37,NULL,NULL),(715,'Maconacon',37,NULL,NULL),(716,'Mallig',37,NULL,NULL),(717,'Naguilian',37,NULL,NULL),(718,'Palanan',37,NULL,NULL),(719,'Quezon',37,NULL,NULL),(720,'Quirino',37,NULL,NULL),(721,'Ramon',37,NULL,NULL),(722,'Reina Mercedes',37,NULL,NULL),(723,'Roxas',37,NULL,NULL),(724,'San Agustin',37,NULL,NULL),(725,'San Guillermo',37,NULL,NULL),(726,'San Isidro',37,NULL,NULL),(727,'San Manuel',37,NULL,NULL),(728,'San Mariano',37,NULL,NULL),(729,'San Mateo',37,NULL,NULL),(730,'San Pablo',37,NULL,NULL),(731,'Santa Maria',37,NULL,NULL),(732,'Santo Tomas',37,NULL,NULL),(733,'Tumauini',37,NULL,NULL),(734,'Tabuk',38,NULL,NULL),(735,'Balbalan',38,NULL,NULL),(736,'Lubuagan',38,NULL,NULL),(737,'Pasil',38,NULL,NULL),(738,'Pinukpuk',38,NULL,NULL),(739,'Rizal',38,NULL,NULL),(740,'Tanudan',38,NULL,NULL),(741,'Tinglayan',38,NULL,NULL),(742,'San Fernando City',39,NULL,NULL),(743,'Agoo',39,NULL,NULL),(744,'Aringay',39,NULL,NULL),(745,'Bacnotan',39,NULL,NULL),(746,'Bagulin',39,NULL,NULL),(747,'Balaoan',39,NULL,NULL),(748,'Bangar',39,NULL,NULL),(749,'Bauang',39,NULL,NULL),(750,'Burgos',39,NULL,NULL),(751,'Caba',39,NULL,NULL),(752,'Luna',39,NULL,NULL),(753,'Naguilian',39,NULL,NULL),(754,'Pugo',39,NULL,NULL),(755,'Rosario',39,NULL,NULL),(756,'San Gabriel',39,NULL,NULL),(757,'San Juan',39,NULL,NULL),(758,'Santo Tomas',39,NULL,NULL),(759,'Santol',39,NULL,NULL),(760,'Sudipen',39,NULL,NULL),(761,'Tubao',39,NULL,NULL),(762,'Biñan City',40,NULL,NULL),(763,'Calamba City',40,NULL,NULL),(764,'San Pablo City',40,NULL,NULL),(765,'Santa Rosa City',40,NULL,NULL),(766,'Alaminos',40,NULL,NULL),(767,'Bay',40,NULL,NULL),(768,'Cabuyao',40,NULL,NULL),(769,'Calauan',40,NULL,NULL),(770,'Cavinti',40,NULL,NULL),(771,'Famy',40,NULL,NULL),(772,'Kalayaan',40,NULL,NULL),(773,'Liliw',40,NULL,NULL),(774,'Los Baños',40,NULL,NULL),(775,'Luisiana',40,NULL,NULL),(776,'Lumban',40,NULL,NULL),(777,'Mabitac',40,NULL,NULL),(778,'Magdalena',40,NULL,NULL),(779,'Majayjay',40,NULL,NULL),(780,'Nagcarlan',40,NULL,NULL),(781,'Paete',40,NULL,NULL),(782,'Pagsanjan',40,NULL,NULL),(783,'Pakil',40,NULL,NULL),(784,'Pangil',40,NULL,NULL),(785,'Pila',40,NULL,NULL),(786,'Rizal',40,NULL,NULL),(787,'San Pedro',40,NULL,NULL),(788,'Santa Cruz',40,NULL,NULL),(789,'Santa Maria',40,NULL,NULL),(790,'Siniloan',40,NULL,NULL),(791,'Victoria',40,NULL,NULL),(792,'Iligan City',41,NULL,NULL),(793,'Bacolod',41,NULL,NULL),(794,'Baloi',41,NULL,NULL),(795,'Baroy',41,NULL,NULL),(796,'Kapatagan',41,NULL,NULL),(797,'Kauswagan',41,NULL,NULL),(798,'Kolambugan',41,NULL,NULL),(799,'Lala',41,NULL,NULL),(800,'Linamon',41,NULL,NULL),(801,'Magsaysay',41,NULL,NULL),(802,'Maigo',41,NULL,NULL),(803,'Matungao',41,NULL,NULL),(804,'Munai',41,NULL,NULL),(805,'Nunungan',41,NULL,NULL),(806,'Pantao Ragat',41,NULL,NULL),(807,'Pantar',41,NULL,NULL),(808,'Poona Piagapo',41,NULL,NULL),(809,'Salvador',41,NULL,NULL),(810,'Sapad',41,NULL,NULL),(811,'Sultan Naga Dimaporo',41,NULL,NULL),(812,'Tagoloan',41,NULL,NULL),(813,'Tangcal',41,NULL,NULL),(814,'Tubod',41,NULL,NULL),(815,'Marawi City',42,NULL,NULL),(816,'Bacolod-Kalawi',42,NULL,NULL),(817,'Balabagan',42,NULL,NULL),(818,'Balindong',42,NULL,NULL),(819,'Bayang',42,NULL,NULL),(820,'Binidayan',42,NULL,NULL),(821,'Buadiposo-Buntong',42,NULL,NULL),(822,'Bubong',42,NULL,NULL),(823,'Bumbaran',42,NULL,NULL),(824,'Butig',42,NULL,NULL),(825,'Calanogas',42,NULL,NULL),(826,'Ditsaan-Ramain',42,NULL,NULL),(827,'Ganassi',42,NULL,NULL),(828,'Kapai',42,NULL,NULL),(829,'Kapatagan',42,NULL,NULL),(830,'Lumba-Bayabao',42,NULL,NULL),(831,'Lumbaca-Unayan',42,NULL,NULL),(832,'Lumbatan',42,NULL,NULL),(833,'Lumbayanague',42,NULL,NULL),(834,'Madalum',42,NULL,NULL),(835,'Madamba',42,NULL,NULL),(836,'Maguing',42,NULL,NULL),(837,'Malabang',42,NULL,NULL),(838,'Marantao',42,NULL,NULL),(839,'Marogong',42,NULL,NULL),(840,'Masiu',42,NULL,NULL),(841,'Mulondo',42,NULL,NULL),(842,'Pagayawan',42,NULL,NULL),(843,'Piagapo',42,NULL,NULL),(844,'Poona Bayabao',42,NULL,NULL),(845,'Pualas',42,NULL,NULL),(846,'Saguiaran',42,NULL,NULL),(847,'Sultan Dumalondong',42,NULL,NULL),(848,'Picong',42,NULL,NULL),(849,'Tagoloan II',42,NULL,NULL),(850,'Tamparan',42,NULL,NULL),(851,'Taraka',42,NULL,NULL),(852,'Tubaran',42,NULL,NULL),(853,'Tugaya',42,NULL,NULL),(854,'Wao',42,NULL,NULL),(855,'Ormoc City',43,NULL,NULL),(856,'Tacloban City',43,NULL,NULL),(857,'Abuyog',43,NULL,NULL),(858,'Alangalang',43,NULL,NULL),(859,'Albuera',43,NULL,NULL),(860,'Babatngon',43,NULL,NULL),(861,'Barugo',43,NULL,NULL),(862,'Bato',43,NULL,NULL),(863,'Baybay',43,NULL,NULL),(864,'Burauen',43,NULL,NULL),(865,'Calubian',43,NULL,NULL),(866,'Capoocan',43,NULL,NULL),(867,'Carigara',43,NULL,NULL),(868,'Dagami',43,NULL,NULL),(869,'Dulag',43,NULL,NULL),(870,'Hilongos',43,NULL,NULL),(871,'Hindang',43,NULL,NULL),(872,'Inopacan',43,NULL,NULL),(873,'Isabel',43,NULL,NULL),(874,'Jaro',43,NULL,NULL),(875,'Javier',43,NULL,NULL),(876,'Julita',43,NULL,NULL),(877,'Kananga',43,NULL,NULL),(878,'La Paz',43,NULL,NULL),(879,'Leyte',43,NULL,NULL),(880,'Liloan',43,NULL,NULL),(881,'MacArthur',43,NULL,NULL),(882,'Mahaplag',43,NULL,NULL),(883,'Matag-ob',43,NULL,NULL),(884,'Matalom',43,NULL,NULL),(885,'Mayorga',43,NULL,NULL),(886,'Merida',43,NULL,NULL),(887,'Palo',43,NULL,NULL),(888,'Palompon',43,NULL,NULL),(889,'Pastrana',43,NULL,NULL),(890,'San Isidro',43,NULL,NULL),(891,'San Miguel',43,NULL,NULL),(892,'Santa Fe',43,NULL,NULL),(893,'Sogod',43,NULL,NULL),(894,'Tabango',43,NULL,NULL),(895,'Tabontabon',43,NULL,NULL),(896,'Tanauan',43,NULL,NULL),(897,'Tolosa',43,NULL,NULL),(898,'Tunga',43,NULL,NULL),(899,'Villaba',43,NULL,NULL),(900,'Cotabato City',44,NULL,NULL),(901,'Ampatuan',44,NULL,NULL),(902,'Barira',44,NULL,NULL),(903,'Buldon',44,NULL,NULL),(904,'Buluan',44,NULL,NULL),(905,'Datu Abdullah Sangki',44,NULL,NULL),(906,'Datu Anggal Midtimbang',44,NULL,NULL),(907,'Datu Blah T. Sinsuat',44,NULL,NULL),(908,'Datu Hoffer Ampatuan',44,NULL,NULL),(909,'Datu Montawal',44,NULL,NULL),(910,'Datu Odin Sinsuat',44,NULL,NULL),(911,'Datu Paglas',44,NULL,NULL),(912,'Datu Piang',44,NULL,NULL),(913,'Datu Salibo',44,NULL,NULL),(914,'Datu Saudi-Ampatuan',44,NULL,NULL),(915,'Datu Unsay',44,NULL,NULL),(916,'General Salipada K. Pendatun',44,NULL,NULL),(917,'Guindulungan',44,NULL,NULL),(918,'Kabuntalan',44,NULL,NULL),(919,'Mamasapano',44,NULL,NULL),(920,'Mangudadatu',44,NULL,NULL),(921,'Matanog',44,NULL,NULL),(922,'Northern Kabuntalan',44,NULL,NULL),(923,'Pagalungan',44,NULL,NULL),(924,'Paglat',44,NULL,NULL),(925,'Pandag',44,NULL,NULL),(926,'Parang',44,NULL,NULL),(927,'Rajah Buayan',44,NULL,NULL),(928,'Shariff Aguak',44,NULL,NULL),(929,'Shariff Saydona Mustapha',44,NULL,NULL),(930,'South Upi',44,NULL,NULL),(931,'Sultan Kudarat',44,NULL,NULL),(932,'Sultan Mastura',44,NULL,NULL),(933,'Sultan sa Barongis',44,NULL,NULL),(934,'Talayan',44,NULL,NULL),(935,'Talitay',44,NULL,NULL),(936,'Upi',44,NULL,NULL),(937,'Boac',45,NULL,NULL),(938,'Buenavista',45,NULL,NULL),(939,'Gasan',45,NULL,NULL),(940,'Mogpog',45,NULL,NULL),(941,'Santa Cruz',45,NULL,NULL),(942,'Torrijos',45,NULL,NULL),(943,'Masbate City',46,NULL,NULL),(944,'Aroroy',46,NULL,NULL),(945,'Baleno',46,NULL,NULL),(946,'Balud',46,NULL,NULL),(947,'Batuan',46,NULL,NULL),(948,'Cataingan',46,NULL,NULL),(949,'Cawayan',46,NULL,NULL),(950,'Claveria',46,NULL,NULL),(951,'Dimasalang',46,NULL,NULL),(952,'Esperanza',46,NULL,NULL),(953,'Mandaon',46,NULL,NULL),(954,'Milagros',46,NULL,NULL),(955,'Mobo',46,NULL,NULL),(956,'Monreal',46,NULL,NULL),(957,'Palanas',46,NULL,NULL),(958,'Pio V. Corpuz',46,NULL,NULL),(959,'Placer',46,NULL,NULL),(960,'San Fernando',46,NULL,NULL),(961,'San Jacinto',46,NULL,NULL),(962,'San Pascual',46,NULL,NULL),(963,'Uson',46,NULL,NULL),(964,'Caloocan City',47,NULL,NULL),(965,'Las Piñas City',47,NULL,NULL),(966,'Makati City',47,NULL,NULL),(967,'Malabon City',47,NULL,NULL),(968,'Mandaluyong City',47,NULL,NULL),(969,'Manila',47,NULL,NULL),(970,'Marikina City',47,NULL,NULL),(971,'Muntinlupa City',47,NULL,NULL),(972,'Navotas City',47,NULL,NULL),(973,'Parañaque City',47,NULL,NULL),(974,'Pasay City',47,NULL,NULL),(975,'Pasig City',47,NULL,NULL),(976,'Quezon City',47,NULL,NULL),(977,'San Juan City',47,NULL,NULL),(978,'Taguig City',47,NULL,NULL),(979,'Valenzuela City',47,NULL,NULL),(980,'Pateros',47,NULL,NULL),(981,'Oroquieta City',48,NULL,NULL),(982,'Ozamiz City',48,NULL,NULL),(983,'Tangub City',48,NULL,NULL),(984,'Aloran',48,NULL,NULL),(985,'Baliangao',48,NULL,NULL),(986,'Bonifacio',48,NULL,NULL),(987,'Calamba',48,NULL,NULL),(988,'Clarin',48,NULL,NULL),(989,'Concepcion',48,NULL,NULL),(990,'Don Victoriano Chiongbian',48,NULL,NULL),(991,'Jimenez',48,NULL,NULL),(992,'Lopez Jaena',48,NULL,NULL),(993,'Panaon',48,NULL,NULL),(994,'Plaridel',48,NULL,NULL),(995,'Sapang Dalaga',48,NULL,NULL),(996,'Sinacaban',48,NULL,NULL),(997,'Tudela',48,NULL,NULL),(998,'Cagayan de Oro',49,NULL,NULL),(999,'Gingoog City',49,NULL,NULL),(1000,'Alubijid',49,NULL,NULL),(1001,'Balingasag',49,NULL,NULL),(1002,'Balingoan',49,NULL,NULL),(1003,'Binuangan',49,NULL,NULL),(1004,'Claveria',49,NULL,NULL),(1005,'El Salvador',49,NULL,NULL),(1006,'Gitagum',49,NULL,NULL),(1007,'Initao',49,NULL,NULL),(1008,'Jasaan',49,NULL,NULL),(1009,'Kinoguitan',49,NULL,NULL),(1010,'Lagonglong',49,NULL,NULL),(1011,'Laguindingan',49,NULL,NULL),(1012,'Libertad',49,NULL,NULL),(1013,'Lugait',49,NULL,NULL),(1014,'Magsaysay',49,NULL,NULL),(1015,'Manticao',49,NULL,NULL),(1016,'Medina',49,NULL,NULL),(1017,'Naawan',49,NULL,NULL),(1018,'Opol',49,NULL,NULL),(1019,'Salay',49,NULL,NULL),(1020,'Sugbongcogon',49,NULL,NULL),(1021,'Tagoloan',49,NULL,NULL),(1022,'Talisayan',49,NULL,NULL),(1023,'Villanueva',49,NULL,NULL),(1024,'Barlig',50,NULL,NULL),(1025,'Bauko',50,NULL,NULL),(1026,'Besao',50,NULL,NULL),(1027,'Bontoc',50,NULL,NULL),(1028,'Natonin',50,NULL,NULL),(1029,'Paracelis',50,NULL,NULL),(1030,'Sabangan',50,NULL,NULL),(1031,'Sadanga',50,NULL,NULL),(1032,'Sagada',50,NULL,NULL),(1033,'Tadian',50,NULL,NULL),(1034,'Bacolod City',51,NULL,NULL),(1035,'Bago City',51,NULL,NULL),(1036,'Cadiz City',51,NULL,NULL),(1037,'Escalante City',51,NULL,NULL),(1038,'Himamaylan City',51,NULL,NULL),(1039,'Kabankalan City',51,NULL,NULL),(1040,'La Carlota City',51,NULL,NULL),(1041,'Sagay City',51,NULL,NULL),(1042,'San Carlos City',51,NULL,NULL),(1043,'Silay City',51,NULL,NULL),(1044,'Sipalay City',51,NULL,NULL),(1045,'Talisay City',51,NULL,NULL),(1046,'Victorias City',51,NULL,NULL),(1047,'Binalbagan',51,NULL,NULL),(1048,'Calatrava',51,NULL,NULL),(1049,'Candoni',51,NULL,NULL),(1050,'Cauayan',51,NULL,NULL),(1051,'Enrique B. Magalona',51,NULL,NULL),(1052,'Hinigaran',51,NULL,NULL),(1053,'Hinoba-an',51,NULL,NULL),(1054,'Ilog',51,NULL,NULL),(1055,'Isabela',51,NULL,NULL),(1056,'La Castellana',51,NULL,NULL),(1057,'Manapla',51,NULL,NULL),(1058,'Moises Padilla',51,NULL,NULL),(1059,'Murcia',51,NULL,NULL),(1060,'Pontevedra',51,NULL,NULL),(1061,'Pulupandan',51,NULL,NULL),(1062,'Salvador Benedicto',51,NULL,NULL),(1063,'San Enrique',51,NULL,NULL),(1064,'Toboso',51,NULL,NULL),(1065,'Valladolid',51,NULL,NULL),(1066,'Bais City',52,NULL,NULL),(1067,'Bayawan City',52,NULL,NULL),(1068,'Canlaon City',52,NULL,NULL),(1069,'Guihulngan City',52,NULL,NULL),(1070,'Dumaguete City',52,NULL,NULL),(1071,'Tanjay City',52,NULL,NULL),(1072,'Amlan',52,NULL,NULL),(1073,'Ayungon',52,NULL,NULL),(1074,'Bacong',52,NULL,NULL),(1075,'Basay',52,NULL,NULL),(1076,'Bindoy',52,NULL,NULL),(1077,'Dauin',52,NULL,NULL),(1078,'Jimalalud',52,NULL,NULL),(1079,'La Libertad',52,NULL,NULL),(1080,'Mabinay',52,NULL,NULL),(1081,'Manjuyod',52,NULL,NULL),(1082,'Pamplona',52,NULL,NULL),(1083,'San Jose',52,NULL,NULL),(1084,'Santa Catalina',52,NULL,NULL),(1085,'Siaton',52,NULL,NULL),(1086,'Sibulan',52,NULL,NULL),(1087,'Tayasan',52,NULL,NULL),(1088,'Valencia',52,NULL,NULL),(1089,'Vallehermoso',52,NULL,NULL),(1090,'Zamboanguita',52,NULL,NULL),(1091,'Allen',53,NULL,NULL),(1092,'Biri',53,NULL,NULL),(1093,'Bobon',53,NULL,NULL),(1094,'Capul',53,NULL,NULL),(1095,'Catarman',53,NULL,NULL),(1096,'Catubig',53,NULL,NULL),(1097,'Gamay',53,NULL,NULL),(1098,'Laoang',53,NULL,NULL),(1099,'Lapinig',53,NULL,NULL),(1100,'Las Navas',53,NULL,NULL),(1101,'Lavezares',53,NULL,NULL),(1102,'Lope de Vega',53,NULL,NULL),(1103,'Mapanas',53,NULL,NULL),(1104,'Mondragon',53,NULL,NULL),(1105,'Palapag',53,NULL,NULL),(1106,'Pambujan',53,NULL,NULL),(1107,'Rosario',53,NULL,NULL),(1108,'San Antonio',53,NULL,NULL),(1109,'San Isidro',53,NULL,NULL),(1110,'San Jose',53,NULL,NULL),(1111,'San Roque',53,NULL,NULL),(1112,'San Vicente',53,NULL,NULL),(1113,'Silvino Lobos',53,NULL,NULL),(1114,'Victoria',53,NULL,NULL),(1115,'Cabanatuan City',54,NULL,NULL),(1116,'Gapan City',54,NULL,NULL),(1117,'Science City of Muñoz',54,NULL,NULL),(1118,'Palayan City',54,NULL,NULL),(1119,'San Jose City',54,NULL,NULL),(1120,'Aliaga',54,NULL,NULL),(1121,'Bongabon',54,NULL,NULL),(1122,'Cabiao',54,NULL,NULL),(1123,'Carranglan',54,NULL,NULL),(1124,'Cuyapo',54,NULL,NULL),(1125,'Gabaldon',54,NULL,NULL),(1126,'General Mamerto Natividad',54,NULL,NULL),(1127,'General Tinio',54,NULL,NULL),(1128,'Guimba',54,NULL,NULL),(1129,'Jaen',54,NULL,NULL),(1130,'Laur',54,NULL,NULL),(1131,'Licab',54,NULL,NULL),(1132,'Llanera',54,NULL,NULL),(1133,'Lupao',54,NULL,NULL),(1134,'Nampicuan',54,NULL,NULL),(1135,'Pantabangan',54,NULL,NULL),(1136,'Peñaranda',54,NULL,NULL),(1137,'Quezon',54,NULL,NULL),(1138,'Rizal',54,NULL,NULL),(1139,'San Antonio',54,NULL,NULL),(1140,'San Isidro',54,NULL,NULL),(1141,'San Leonardo',54,NULL,NULL),(1142,'Santa Rosa',54,NULL,NULL),(1143,'Santo Domingo',54,NULL,NULL),(1144,'Talavera',54,NULL,NULL),(1145,'Talugtug',54,NULL,NULL),(1146,'Zaragoza',54,NULL,NULL),(1147,'Alfonso Castaneda',55,NULL,NULL),(1148,'Ambaguio',55,NULL,NULL),(1149,'Aritao',55,NULL,NULL),(1150,'Bagabag',55,NULL,NULL),(1151,'Bambang',55,NULL,NULL),(1152,'Bayombong',55,NULL,NULL),(1153,'Diadi',55,NULL,NULL),(1154,'Dupax del Norte',55,NULL,NULL),(1155,'Dupax del Sur',55,NULL,NULL),(1156,'Kasibu',55,NULL,NULL),(1157,'Kayapa',55,NULL,NULL),(1158,'Quezon',55,NULL,NULL),(1159,'Santa Fe',55,NULL,NULL),(1160,'Solano',55,NULL,NULL),(1161,'Villaverde',55,NULL,NULL),(1162,'Abra de Ilog',56,NULL,NULL),(1163,'Calintaan',56,NULL,NULL),(1164,'Looc',56,NULL,NULL),(1165,'Lubang',56,NULL,NULL),(1166,'Magsaysay',56,NULL,NULL),(1167,'Mamburao',56,NULL,NULL),(1168,'Paluan',56,NULL,NULL),(1169,'Rizal',56,NULL,NULL),(1170,'Sablayan',56,NULL,NULL),(1171,'San Jose',56,NULL,NULL),(1172,'Santa Cruz',56,NULL,NULL),(1173,'Calapan City',57,NULL,NULL),(1174,'Baco',57,NULL,NULL),(1175,'Bansud',57,NULL,NULL),(1176,'Bongabong',57,NULL,NULL),(1177,'Bulalacao',57,NULL,NULL),(1178,'Gloria',57,NULL,NULL),(1179,'Mansalay',57,NULL,NULL),(1180,'Naujan',57,NULL,NULL),(1181,'Pinamalayan',57,NULL,NULL),(1182,'Pola',57,NULL,NULL),(1183,'Puerto Galera',57,NULL,NULL),(1184,'Roxas',57,NULL,NULL),(1185,'San Teodoro',57,NULL,NULL),(1186,'Socorro',57,NULL,NULL),(1187,'Victoria',57,NULL,NULL),(1188,'Puerto Princesa City',58,NULL,NULL),(1189,'Aborlan',58,NULL,NULL),(1190,'Agutaya',58,NULL,NULL),(1191,'Araceli',58,NULL,NULL),(1192,'Balabac',58,NULL,NULL),(1193,'Bataraza',58,NULL,NULL),(1194,'Brooke\'s Point',58,NULL,NULL),(1195,'Busuanga',58,NULL,NULL),(1196,'Cagayancillo',58,NULL,NULL),(1197,'Coron',58,NULL,NULL),(1198,'Culion',58,NULL,NULL),(1199,'Cuyo',58,NULL,NULL),(1200,'Dumaran',58,NULL,NULL),(1201,'El Nido',58,NULL,NULL),(1202,'Kalayaan',58,NULL,NULL),(1203,'Linapacan',58,NULL,NULL),(1204,'Magsaysay',58,NULL,NULL),(1205,'Narra',58,NULL,NULL),(1206,'Quezon',58,NULL,NULL),(1207,'Rizal',58,NULL,NULL),(1208,'Roxas',58,NULL,NULL),(1209,'San Vicente',58,NULL,NULL),(1210,'Sofronio Española',58,NULL,NULL),(1211,'Taytay',58,NULL,NULL),(1212,'Angeles City',59,NULL,NULL),(1213,'City of San Fernando',59,NULL,NULL),(1214,'Apalit',59,NULL,NULL),(1215,'Arayat',59,NULL,NULL),(1216,'Bacolor',59,NULL,NULL),(1217,'Candaba',59,NULL,NULL),(1218,'Floridablanca',59,NULL,NULL),(1219,'Guagua',59,NULL,NULL),(1220,'Lubao',59,NULL,NULL),(1221,'Mabalacat',59,NULL,NULL),(1222,'Macabebe',59,NULL,NULL),(1223,'Magalang',59,NULL,NULL),(1224,'Masantol',59,NULL,NULL),(1225,'Mexico',59,NULL,NULL),(1226,'Minalin',59,NULL,NULL),(1227,'Porac',59,NULL,NULL),(1228,'San Luis',59,NULL,NULL),(1229,'San Simon',59,NULL,NULL),(1230,'Santa Ana',59,NULL,NULL),(1231,'Santa Rita',59,NULL,NULL),(1232,'Santo Tomas',59,NULL,NULL),(1233,'Sasmuan',59,NULL,NULL),(1234,'Alaminos City',60,NULL,NULL),(1235,'Dagupan City',60,NULL,NULL),(1236,'San Carlos City',60,NULL,NULL),(1237,'Urdaneta City',60,NULL,NULL),(1238,'Agno',60,NULL,NULL),(1239,'Aguilar',60,NULL,NULL),(1240,'Alcala',60,NULL,NULL),(1241,'Anda',60,NULL,NULL),(1242,'Asingan',60,NULL,NULL),(1243,'Balungao',60,NULL,NULL),(1244,'Bani',60,NULL,NULL),(1245,'Basista',60,NULL,NULL),(1246,'Bautista',60,NULL,NULL),(1247,'Bayambang',60,NULL,NULL),(1248,'Binalonan',60,NULL,NULL),(1249,'Binmaley',60,NULL,NULL),(1250,'Bolinao',60,NULL,NULL),(1251,'Bugallon',60,NULL,NULL),(1252,'Burgos',60,NULL,NULL),(1253,'Calasiao',60,NULL,NULL),(1254,'Dasol',60,NULL,NULL),(1255,'Infanta',60,NULL,NULL),(1256,'Labrador',60,NULL,NULL),(1257,'Laoac',60,NULL,NULL),(1258,'Lingayen',60,NULL,NULL),(1259,'Mabini',60,NULL,NULL),(1260,'Malasiqui',60,NULL,NULL),(1261,'Manaoag',60,NULL,NULL),(1262,'Mangaldan',60,NULL,NULL),(1263,'Mangatarem',60,NULL,NULL),(1264,'Mapandan',60,NULL,NULL),(1265,'Natividad',60,NULL,NULL),(1266,'Pozzorubio',60,NULL,NULL),(1267,'Rosales',60,NULL,NULL),(1268,'San Fabian',60,NULL,NULL),(1269,'San Jacinto',60,NULL,NULL),(1270,'San Manuel',60,NULL,NULL),(1271,'San Nicolas',60,NULL,NULL),(1272,'San Quintin',60,NULL,NULL),(1273,'Santa Barbara',60,NULL,NULL),(1274,'Santa Maria',60,NULL,NULL),(1275,'Santo Tomas',60,NULL,NULL),(1276,'Sison',60,NULL,NULL),(1277,'Sual',60,NULL,NULL),(1278,'Tayug',60,NULL,NULL),(1279,'Umingan',60,NULL,NULL),(1280,'Urbiztondo',60,NULL,NULL),(1281,'Villasis',60,NULL,NULL),(1282,'Lucena City',61,NULL,NULL),(1283,'Tayabas City',61,NULL,NULL),(1284,'Agdangan',61,NULL,NULL),(1285,'Alabat',61,NULL,NULL),(1286,'Atimonan',61,NULL,NULL),(1287,'Buenavista',61,NULL,NULL),(1288,'Burdeos',61,NULL,NULL),(1289,'Calauag',61,NULL,NULL),(1290,'Candelaria',61,NULL,NULL),(1291,'Catanauan',61,NULL,NULL),(1292,'Dolores',61,NULL,NULL),(1293,'General Luna',61,NULL,NULL),(1294,'General Nakar',61,NULL,NULL),(1295,'Guinayangan',61,NULL,NULL),(1296,'Gumaca',61,NULL,NULL),(1297,'Infanta',61,NULL,NULL),(1298,'Jomalig',61,NULL,NULL),(1299,'Lopez',61,NULL,NULL),(1300,'Lucban',61,NULL,NULL),(1301,'Macalelon',61,NULL,NULL),(1302,'Mauban',61,NULL,NULL),(1303,'Mulanay',61,NULL,NULL),(1304,'Padre Burgos',61,NULL,NULL),(1305,'Pagbilao',61,NULL,NULL),(1306,'Panukulan',61,NULL,NULL),(1307,'Patnanungan',61,NULL,NULL),(1308,'Perez',61,NULL,NULL),(1309,'Pitogo',61,NULL,NULL),(1310,'Plaridel',61,NULL,NULL),(1311,'Polillo',61,NULL,NULL),(1312,'Quezon',61,NULL,NULL),(1313,'Real',61,NULL,NULL),(1314,'Sampaloc',61,NULL,NULL),(1315,'San Andres',61,NULL,NULL),(1316,'San Antonio',61,NULL,NULL),(1317,'San Francisco',61,NULL,NULL),(1318,'San Narciso',61,NULL,NULL),(1319,'Sariaya',61,NULL,NULL),(1320,'Tagkawayan',61,NULL,NULL),(1321,'Tiaong',61,NULL,NULL),(1322,'Unisan',61,NULL,NULL),(1323,'Aglipay',62,NULL,NULL),(1324,'Cabarroguis',62,NULL,NULL),(1325,'Diffun',62,NULL,NULL),(1326,'Maddela',62,NULL,NULL),(1327,'Nagtipunan',62,NULL,NULL),(1328,'Saguday',62,NULL,NULL),(1329,'Antipolo City',63,NULL,NULL),(1330,'Angono',63,NULL,NULL),(1331,'Baras',63,NULL,NULL),(1332,'Binangonan',63,NULL,NULL),(1333,'Cainta',63,NULL,NULL),(1334,'Cardona',63,NULL,NULL),(1335,'Jalajala',63,NULL,NULL),(1336,'Morong',63,NULL,NULL),(1337,'Pililla',63,NULL,NULL),(1338,'Rodriguez',63,NULL,NULL),(1339,'San Mateo',63,NULL,NULL),(1340,'Tanay',63,NULL,NULL),(1341,'Taytay',63,NULL,NULL),(1342,'Teresa',63,NULL,NULL),(1343,'Alcantara',64,NULL,NULL),(1344,'Banton',64,NULL,NULL),(1345,'Cajidiocan',64,NULL,NULL),(1346,'Calatrava',64,NULL,NULL),(1347,'Concepcion',64,NULL,NULL),(1348,'Corcuera',64,NULL,NULL),(1349,'Ferrol',64,NULL,NULL),(1350,'Looc',64,NULL,NULL),(1351,'Magdiwang',64,NULL,NULL),(1352,'Odiongan',64,NULL,NULL),(1353,'Romblon',64,NULL,NULL),(1354,'San Agustin',64,NULL,NULL),(1355,'San Andres',64,NULL,NULL),(1356,'San Fernando',64,NULL,NULL),(1357,'San Jose',64,NULL,NULL),(1358,'Santa Fe',64,NULL,NULL),(1359,'Santa Maria',64,NULL,NULL),(1360,'Calbayog City',65,NULL,NULL),(1361,'Catbalogan City',65,NULL,NULL),(1362,'Almagro',65,NULL,NULL),(1363,'Basey',65,NULL,NULL),(1364,'Calbiga',65,NULL,NULL),(1365,'Daram',65,NULL,NULL),(1366,'Gandara',65,NULL,NULL),(1367,'Hinabangan',65,NULL,NULL),(1368,'Jiabong',65,NULL,NULL),(1369,'Marabut',65,NULL,NULL),(1370,'Matuguinao',65,NULL,NULL),(1371,'Motiong',65,NULL,NULL),(1372,'Pagsanghan',65,NULL,NULL),(1373,'Paranas',65,NULL,NULL),(1374,'Pinabacdao',65,NULL,NULL),(1375,'San Jorge',65,NULL,NULL),(1376,'San Jose De Buan',65,NULL,NULL),(1377,'San Sebastian',65,NULL,NULL),(1378,'Santa Margarita',65,NULL,NULL),(1379,'Santa Rita',65,NULL,NULL),(1380,'Santo Niño',65,NULL,NULL),(1381,'Tagapul-an',65,NULL,NULL),(1382,'Talalora',65,NULL,NULL),(1383,'Tarangnan',65,NULL,NULL),(1384,'Villareal',65,NULL,NULL),(1385,'Zumarraga',65,NULL,NULL),(1386,'Alabel',66,NULL,NULL),(1387,'Glan',66,NULL,NULL),(1388,'Kiamba',66,NULL,NULL),(1389,'Maasim',66,NULL,NULL),(1390,'Maitum',66,NULL,NULL),(1391,'Malapatan',66,NULL,NULL),(1392,'Malungon',66,NULL,NULL),(1393,'Enrique Villanueva',67,NULL,NULL),(1394,'Larena',67,NULL,NULL),(1395,'Lazi',67,NULL,NULL),(1396,'Maria',67,NULL,NULL),(1397,'San Juan',67,NULL,NULL),(1398,'Siquijor',67,NULL,NULL),(1399,'Sorsogon City',68,NULL,NULL),(1400,'Barcelona',68,NULL,NULL),(1401,'Bulan',68,NULL,NULL),(1402,'Bulusan',68,NULL,NULL),(1403,'Casiguran',68,NULL,NULL),(1404,'Castilla',68,NULL,NULL),(1405,'Donsol',68,NULL,NULL),(1406,'Gubat',68,NULL,NULL),(1407,'Irosin',68,NULL,NULL),(1408,'Juban',68,NULL,NULL),(1409,'Magallanes',68,NULL,NULL),(1410,'Matnog',68,NULL,NULL),(1411,'Pilar',68,NULL,NULL),(1412,'Prieto Diaz',68,NULL,NULL),(1413,'Santa Magdalena',68,NULL,NULL),(1414,'General Santos City',69,NULL,NULL),(1415,'Koronadal City',69,NULL,NULL),(1416,'Banga',69,NULL,NULL),(1417,'Lake Sebu',69,NULL,NULL),(1418,'Norala',69,NULL,NULL),(1419,'Polomolok',69,NULL,NULL),(1420,'Santo Niño',69,NULL,NULL),(1421,'Surallah',69,NULL,NULL),(1422,'T\'boli',69,NULL,NULL),(1423,'Tampakan',69,NULL,NULL),(1424,'Tantangan',69,NULL,NULL),(1425,'Tupi',69,NULL,NULL),(1426,'Maasin City',70,NULL,NULL),(1427,'Anahawan',70,NULL,NULL),(1428,'Bontoc',70,NULL,NULL),(1429,'Hinunangan',70,NULL,NULL),(1430,'Hinundayan',70,NULL,NULL),(1431,'Libagon',70,NULL,NULL),(1432,'Liloan',70,NULL,NULL),(1433,'Limasawa',70,NULL,NULL),(1434,'Macrohon',70,NULL,NULL),(1435,'Malitbog',70,NULL,NULL),(1436,'Padre Burgos',70,NULL,NULL),(1437,'Pintuyan',70,NULL,NULL),(1438,'Saint Bernard',70,NULL,NULL),(1439,'San Francisco',70,NULL,NULL),(1440,'San Juan',70,NULL,NULL),(1441,'San Ricardo',70,NULL,NULL),(1442,'Silago',70,NULL,NULL),(1443,'Sogod',70,NULL,NULL),(1444,'Tomas Oppus',70,NULL,NULL),(1445,'Tacurong City',71,NULL,NULL),(1446,'Bagumbayan',71,NULL,NULL),(1447,'Columbio',71,NULL,NULL),(1448,'Esperanza',71,NULL,NULL),(1449,'Isulan',71,NULL,NULL),(1450,'Kalamansig',71,NULL,NULL),(1451,'Lambayong',71,NULL,NULL),(1452,'Lebak',71,NULL,NULL),(1453,'Lutayan',71,NULL,NULL),(1454,'Palimbang',71,NULL,NULL),(1455,'President Quirino',71,NULL,NULL),(1456,'Senator Ninoy Aquino',71,NULL,NULL),(1457,'Banguingui',72,NULL,NULL),(1458,'Hadji Panglima Tahil',72,NULL,NULL),(1459,'Indanan',72,NULL,NULL),(1460,'Jolo',72,NULL,NULL),(1461,'Kalingalan Caluang',72,NULL,NULL),(1462,'Lugus',72,NULL,NULL),(1463,'Luuk',72,NULL,NULL),(1464,'Maimbung',72,NULL,NULL),(1465,'Old Panamao',72,NULL,NULL),(1466,'Omar',72,NULL,NULL),(1467,'Pandami',72,NULL,NULL),(1468,'Panglima Estino',72,NULL,NULL),(1469,'Pangutaran',72,NULL,NULL),(1470,'Parang',72,NULL,NULL),(1471,'Pata',72,NULL,NULL),(1472,'Patikul',72,NULL,NULL),(1473,'Siasi',72,NULL,NULL),(1474,'Talipao',72,NULL,NULL),(1475,'Tapul',72,NULL,NULL),(1476,'Surigao City',73,NULL,NULL),(1477,'Alegria',73,NULL,NULL),(1478,'Bacuag',73,NULL,NULL),(1479,'Basilisa',73,NULL,NULL),(1480,'Burgos',73,NULL,NULL),(1481,'Cagdianao',73,NULL,NULL),(1482,'Claver',73,NULL,NULL),(1483,'Dapa',73,NULL,NULL),(1484,'Del Carmen',73,NULL,NULL),(1485,'Dinagat',73,NULL,NULL),(1486,'General Luna',73,NULL,NULL),(1487,'Gigaquit',73,NULL,NULL),(1488,'Libjo',73,NULL,NULL),(1489,'Loreto',73,NULL,NULL),(1490,'Mainit',73,NULL,NULL),(1491,'Malimono',73,NULL,NULL),(1492,'Pilar',73,NULL,NULL),(1493,'Placer',73,NULL,NULL),(1494,'San Benito',73,NULL,NULL),(1495,'San Francisco',73,NULL,NULL),(1496,'San Isidro',73,NULL,NULL),(1497,'San Jose',73,NULL,NULL),(1498,'Santa Monica',73,NULL,NULL),(1499,'Sison',73,NULL,NULL),(1500,'Socorro',73,NULL,NULL),(1501,'Tagana-an',73,NULL,NULL),(1502,'Tubajon',73,NULL,NULL),(1503,'Tubod',73,NULL,NULL),(1504,'Bislig City',74,NULL,NULL),(1505,'Tandag City',74,NULL,NULL),(1506,'Barobo',74,NULL,NULL),(1507,'Bayabas',74,NULL,NULL),(1508,'Cagwait',74,NULL,NULL),(1509,'Cantilan',74,NULL,NULL),(1510,'Carmen',74,NULL,NULL),(1511,'Carrascal',74,NULL,NULL),(1512,'Cortes',74,NULL,NULL),(1513,'Hinatuan',74,NULL,NULL),(1514,'Lanuza',74,NULL,NULL),(1515,'Lianga',74,NULL,NULL),(1516,'Lingig',74,NULL,NULL),(1517,'Madrid',74,NULL,NULL),(1518,'Marihatag',74,NULL,NULL),(1519,'San Agustin',74,NULL,NULL),(1520,'San Miguel',74,NULL,NULL),(1521,'Tagbina',74,NULL,NULL),(1522,'Tago',74,NULL,NULL),(1523,'Tarlac City',75,NULL,NULL),(1524,'Anao',75,NULL,NULL),(1525,'Bamban',75,NULL,NULL),(1526,'Camiling',75,NULL,NULL),(1527,'Capas',75,NULL,NULL),(1528,'Concepcion',75,NULL,NULL),(1529,'Gerona',75,NULL,NULL),(1530,'La Paz',75,NULL,NULL),(1531,'Mayantoc',75,NULL,NULL),(1532,'Moncada',75,NULL,NULL),(1533,'Paniqui',75,NULL,NULL),(1534,'Pura',75,NULL,NULL),(1535,'Ramos',75,NULL,NULL),(1536,'San Clemente',75,NULL,NULL),(1537,'San Jose',75,NULL,NULL),(1538,'San Manuel',75,NULL,NULL),(1539,'Santa Ignacia',75,NULL,NULL),(1540,'Victoria',75,NULL,NULL),(1541,'Bongao',76,NULL,NULL),(1542,'Languyan',76,NULL,NULL),(1543,'Mapun',76,NULL,NULL),(1544,'Panglima Sugala',76,NULL,NULL),(1545,'Sapa-Sapa',76,NULL,NULL),(1546,'Sibutu',76,NULL,NULL),(1547,'Simunul',76,NULL,NULL),(1548,'Sitangkai',76,NULL,NULL),(1549,'South Ubian',76,NULL,NULL),(1550,'Tandubas',76,NULL,NULL),(1551,'Turtle Islands',76,NULL,NULL),(1552,'Olongapo City',77,NULL,NULL),(1553,'Botolan',77,NULL,NULL),(1554,'Cabangan',77,NULL,NULL),(1555,'Candelaria',77,NULL,NULL),(1556,'Castillejos',77,NULL,NULL),(1557,'Iba',77,NULL,NULL),(1558,'Masinloc',77,NULL,NULL),(1559,'Palauig',77,NULL,NULL),(1560,'San Antonio',77,NULL,NULL),(1561,'San Felipe',77,NULL,NULL),(1562,'San Marcelino',77,NULL,NULL),(1563,'San Narciso',77,NULL,NULL),(1564,'Santa Cruz',77,NULL,NULL),(1565,'Subic',77,NULL,NULL),(1566,'Dapitan City',78,NULL,NULL),(1567,'Dipolog City',78,NULL,NULL),(1568,'Bacungan',78,NULL,NULL),(1569,'Baliguian',78,NULL,NULL),(1570,'Godod',78,NULL,NULL),(1571,'Gutalac',78,NULL,NULL),(1572,'Jose Dalman',78,NULL,NULL),(1573,'Kalawit',78,NULL,NULL),(1574,'Katipunan',78,NULL,NULL),(1575,'La Libertad',78,NULL,NULL),(1576,'Labason',78,NULL,NULL),(1577,'Liloy',78,NULL,NULL),(1578,'Manukan',78,NULL,NULL),(1579,'Mutia',78,NULL,NULL),(1580,'Piñan',78,NULL,NULL),(1581,'Polanco',78,NULL,NULL),(1582,'President Manuel A. Roxas',78,NULL,NULL),(1583,'Rizal',78,NULL,NULL),(1584,'Salug',78,NULL,NULL),(1585,'Sergio Osmeña Sr.',78,NULL,NULL),(1586,'Siayan',78,NULL,NULL),(1587,'Sibuco',78,NULL,NULL),(1588,'Sibutad',78,NULL,NULL),(1589,'Sindangan',78,NULL,NULL),(1590,'Siocon',78,NULL,NULL),(1591,'Sirawai',78,NULL,NULL),(1592,'Tampilisan',78,NULL,NULL),(1593,'Pagadian City',79,NULL,NULL),(1594,'Zamboanga City',79,NULL,NULL),(1595,'Aurora',79,NULL,NULL),(1596,'Bayog',79,NULL,NULL),(1597,'Dimataling',79,NULL,NULL),(1598,'Dinas',79,NULL,NULL),(1599,'Dumalinao',79,NULL,NULL),(1600,'Dumingag',79,NULL,NULL),(1601,'Guipos',79,NULL,NULL),(1602,'Josefina',79,NULL,NULL),(1603,'Kumalarang',79,NULL,NULL),(1604,'Labangan',79,NULL,NULL),(1605,'Lakewood',79,NULL,NULL),(1606,'Lapuyan',79,NULL,NULL),(1607,'Mahayag',79,NULL,NULL),(1608,'Margosatubig',79,NULL,NULL),(1609,'Midsalip',79,NULL,NULL),(1610,'Molave',79,NULL,NULL),(1611,'Pitogo',79,NULL,NULL),(1612,'Ramon Magsaysay',79,NULL,NULL),(1613,'San Miguel',79,NULL,NULL),(1614,'San Pablo',79,NULL,NULL),(1615,'Sominot',79,NULL,NULL),(1616,'Tabina',79,NULL,NULL),(1617,'Tambulig',79,NULL,NULL),(1618,'Tigbao',79,NULL,NULL),(1619,'Tukuran',79,NULL,NULL),(1620,'Vincenzo A. Sagun',79,NULL,NULL),(1621,'Alicia',80,NULL,NULL),(1622,'Buug',80,NULL,NULL),(1623,'Diplahan',80,NULL,NULL),(1624,'Imelda',80,NULL,NULL),(1625,'Ipil',80,NULL,NULL),(1626,'Kabasalan',80,NULL,NULL),(1627,'Mabuhay',80,NULL,NULL),(1628,'Malangas',80,NULL,NULL),(1629,'Naga',80,NULL,NULL),(1630,'Olutanga',80,NULL,NULL),(1631,'Payao',80,NULL,NULL),(1632,'Roseller Lim',80,NULL,NULL),(1633,'Siay',80,NULL,NULL),(1634,'Talusan',80,NULL,NULL),(1635,'Titay',80,NULL,NULL),(1636,'Tungawan',80,NULL,NULL);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numcode` int(11) DEFAULT NULL,
  `phonecode` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countries_name_unique` (`name`),
  UNIQUE KEY `countries_iso_unique` (`iso`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AFGHANISTAN','AF','AFG',4,93,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(2,'ALBANIA','AL','ALB',8,355,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(3,'ALGERIA','DZ','DZA',12,213,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(4,'AMERICAN SAMOA','AS','ASM',16,1684,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(5,'ANDORRA','AD','AND',20,376,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(6,'ANGOLA','AO','AGO',24,244,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(7,'ANGUILLA','AI','AIA',660,1264,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(8,'ANTARCTICA','AQ',NULL,NULL,0,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(9,'ANTIGUA AND BARBUDA','AG','ATG',28,1268,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(10,'ARGENTINA','AR','ARG',32,54,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(11,'ARMENIA','AM','ARM',51,374,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(12,'ARUBA','AW','ABW',533,297,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(13,'AUSTRALIA','AU','AUS',36,61,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(14,'AUSTRIA','AT','AUT',40,43,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(15,'AZERBAIJAN','AZ','AZE',31,994,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(16,'BAHAMAS','BS','BHS',44,1242,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(17,'BAHRAIN','BH','BHR',48,973,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(18,'BANGLADESH','BD','BGD',50,880,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(19,'BARBADOS','BB','BRB',52,1246,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(20,'BELARUS','BY','BLR',112,375,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(21,'BELGIUM','BE','BEL',56,32,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(22,'BELIZE','BZ','BLZ',84,501,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(23,'BENIN','BJ','BEN',204,229,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(24,'BERMUDA','BM','BMU',60,1441,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(25,'BHUTAN','BT','BTN',64,975,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(26,'BOLIVIA','BO','BOL',68,591,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(27,'BOSNIA AND HERZEGOVINA','BA','BIH',70,387,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(28,'BOTSWANA','BW','BWA',72,267,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(29,'BOUVET ISLAND','BV',NULL,NULL,0,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(30,'BRAZIL','BR','BRA',76,55,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(31,'BRITISH INDIAN OCEAN TERRITORY','IO',NULL,NULL,246,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(32,'BRUNEI DARUSSALAM','BN','BRN',96,673,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(33,'BULGARIA','BG','BGR',100,359,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(34,'BURKINA FASO','BF','BFA',854,226,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(35,'BURUNDI','BI','BDI',108,257,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(36,'CAMBODIA','KH','KHM',116,855,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(37,'CAMEROON','CM','CMR',120,237,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(38,'CANADA','CA','CAN',124,1,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(39,'CAPE VERDE','CV','CPV',132,238,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(40,'CAYMAN ISLANDS','KY','CYM',136,1345,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(41,'CENTRAL AFRICAN REPUBLIC','CF','CAF',140,236,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(42,'CHAD','TD','TCD',148,235,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(43,'CHILE','CL','CHL',152,56,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(44,'CHINA','CN','CHN',156,86,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(45,'CHRISTMAS ISLAND','CX',NULL,NULL,61,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(46,'COCOS (KEELING) ISLANDS','CC',NULL,NULL,672,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(47,'COLOMBIA','CO','COL',170,57,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(48,'COMOROS','KM','COM',174,269,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(49,'CONGO','CG','COG',178,242,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(50,'CONGO, THE DEMOCRATIC REPUBLIC OF THE','CD','COD',180,242,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(51,'COOK ISLANDS','CK','COK',184,682,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(52,'COSTA RICA','CR','CRI',188,506,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(53,'COTE D\'IVOIRE','CI','CIV',384,225,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(54,'CROATIA','HR','HRV',191,385,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(55,'CUBA','CU','CUB',192,53,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(56,'CYPRUS','CY','CYP',196,357,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(57,'CZECH REPUBLIC','CZ','CZE',203,420,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(58,'DENMARK','DK','DNK',208,45,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(59,'DJIBOUTI','DJ','DJI',262,253,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(60,'DOMINICA','DM','DMA',212,1767,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(61,'DOMINICAN REPUBLIC','DO','DOM',214,1809,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(62,'ECUADOR','EC','ECU',218,593,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(63,'EGYPT','EG','EGY',818,20,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(64,'EL SALVADOR','SV','SLV',222,503,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(65,'EQUATORIAL GUINEA','GQ','GNQ',226,240,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(66,'ERITREA','ER','ERI',232,291,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(67,'ESTONIA','EE','EST',233,372,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(68,'ETHIOPIA','ET','ETH',231,251,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(69,'FALKLAND ISLANDS (MALVINAS)','FK','FLK',238,500,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(70,'FAROE ISLANDS','FO','FRO',234,298,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(71,'FIJI','FJ','FJI',242,679,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(72,'FINLAND','FI','FIN',246,358,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(73,'FRANCE','FR','FRA',250,33,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(74,'FRENCH GUIANA','GF','GUF',254,594,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(75,'FRENCH POLYNESIA','PF','PYF',258,689,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(76,'FRENCH SOUTHERN TERRITORIES','TF',NULL,NULL,0,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(77,'GABON','GA','GAB',266,241,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(78,'GAMBIA','GM','GMB',270,220,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(79,'GEORGIA','GE','GEO',268,995,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(80,'GERMANY','DE','DEU',276,49,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(81,'GHANA','GH','GHA',288,233,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(82,'GIBRALTAR','GI','GIB',292,350,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(83,'GREECE','GR','GRC',300,30,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(84,'GREENLAND','GL','GRL',304,299,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(85,'GRENADA','GD','GRD',308,1473,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(86,'GUADELOUPE','GP','GLP',312,590,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(87,'GUAM','GU','GUM',316,1671,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(88,'GUATEMALA','GT','GTM',320,502,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(89,'GUINEA','GN','GIN',324,224,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(90,'GUINEA-BISSAU','GW','GNB',624,245,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(91,'GUYANA','GY','GUY',328,592,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(92,'HAITI','HT','HTI',332,509,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(93,'HEARD ISLAND AND MCDONALD ISLANDS','HM',NULL,NULL,0,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(94,'HOLY SEE (VATICAN CITY STATE)','VA','VAT',336,39,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(95,'HONDURAS','HN','HND',340,504,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(96,'HONG KONG','HK','HKG',344,852,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(97,'HUNGARY','HU','HUN',348,36,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(98,'ICELAND','IS','ISL',352,354,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(99,'INDIA','IN','IND',356,91,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(100,'INDONESIA','ID','IDN',360,62,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(101,'IRAN, ISLAMIC REPUBLIC OF','IR','IRN',364,98,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(102,'IRAQ','IQ','IRQ',368,964,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(103,'IRELAND','IE','IRL',372,353,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(104,'ISRAEL','IL','ISR',376,972,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(105,'ITALY','IT','ITA',380,39,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(106,'JAMAICA','JM','JAM',388,1876,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(107,'JAPAN','JP','JPN',392,81,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(108,'JORDAN','JO','JOR',400,962,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(109,'KAZAKHSTAN','KZ','KAZ',398,7,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(110,'KENYA','KE','KEN',404,254,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(111,'KIRIBATI','KI','KIR',296,686,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(112,'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF','KP','PRK',408,850,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(113,'KOREA, REPUBLIC OF','KR','KOR',410,82,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(114,'KUWAIT','KW','KWT',414,965,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(115,'KYRGYZSTAN','KG','KGZ',417,996,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(116,'LAO PEOPLE\'S DEMOCRATIC REPUBLIC','LA','LAO',418,856,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(117,'LATVIA','LV','LVA',428,371,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(118,'LEBANON','LB','LBN',422,961,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(119,'LESOTHO','LS','LSO',426,266,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(120,'LIBERIA','LR','LBR',430,231,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(121,'LIBYAN ARAB JAMAHIRIYA','LY','LBY',434,218,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(122,'LIECHTENSTEIN','LI','LIE',438,423,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(123,'LITHUANIA','LT','LTU',440,370,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(124,'LUXEMBOURG','LU','LUX',442,352,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(125,'MACAO','MO','MAC',446,853,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(126,'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','MK','MKD',807,389,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(127,'MADAGASCAR','MG','MDG',450,261,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(128,'MALAWI','MW','MWI',454,265,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(129,'MALAYSIA','MY','MYS',458,60,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(130,'MALDIVES','MV','MDV',462,960,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(131,'MALI','ML','MLI',466,223,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(132,'MALTA','MT','MLT',470,356,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(133,'MARSHALL ISLANDS','MH','MHL',584,692,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(134,'MARTINIQUE','MQ','MTQ',474,596,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(135,'MAURITANIA','MR','MRT',478,222,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(136,'MAURITIUS','MU','MUS',480,230,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(137,'MAYOTTE','YT',NULL,NULL,269,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(138,'MEXICO','MX','MEX',484,52,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(139,'MICRONESIA, FEDERATED STATES OF','FM','FSM',583,691,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(140,'MOLDOVA, REPUBLIC OF','MD','MDA',498,373,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(141,'MONACO','MC','MCO',492,377,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(142,'MONGOLIA','MN','MNG',496,976,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(143,'MONTSERRAT','MS','MSR',500,1664,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(144,'MOROCCO','MA','MAR',504,212,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(145,'MOZAMBIQUE','MZ','MOZ',508,258,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(146,'MYANMAR','MM','MMR',104,95,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(147,'NAMIBIA','NA','NAM',516,264,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(148,'NAURU','NR','NRU',520,674,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(149,'NEPAL','NP','NPL',524,977,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(150,'NETHERLANDS','NL','NLD',528,31,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(151,'NETHERLANDS ANTILLES','AN','ANT',530,599,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(152,'NEW CALEDONIA','NC','NCL',540,687,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(153,'NEW ZEALAND','NZ','NZL',554,64,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(154,'NICARAGUA','NI','NIC',558,505,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(155,'NIGER','NE','NER',562,227,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(156,'NIGERIA','NG','NGA',566,234,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(157,'NIUE','NU','NIU',570,683,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(158,'NORFOLK ISLAND','NF','NFK',574,672,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(159,'NORTHERN MARIANA ISLANDS','MP','MNP',580,1670,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(160,'NORWAY','NO','NOR',578,47,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(161,'OMAN','OM','OMN',512,968,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(162,'PAKISTAN','PK','PAK',586,92,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(163,'PALAU','PW','PLW',585,680,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(164,'PALESTINIAN TERRITORY, OCCUPIED','PS',NULL,NULL,970,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(165,'PANAMA','PA','PAN',591,507,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(166,'PAPUA NEW GUINEA','PG','PNG',598,675,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(167,'PARAGUAY','PY','PRY',600,595,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(168,'PERU','PE','PER',604,51,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(169,'PHILIPPINES','PH','PHL',608,63,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(170,'PITCAIRN','PN','PCN',612,0,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(171,'POLAND','PL','POL',616,48,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(172,'PORTUGAL','PT','PRT',620,351,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(173,'PUERTO RICO','PR','PRI',630,1787,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(174,'QATAR','QA','QAT',634,974,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(175,'REUNION','RE','REU',638,262,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(176,'ROMANIA','RO','ROM',642,40,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(177,'RUSSIAN FEDERATION','RU','RUS',643,70,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(178,'RWANDA','RW','RWA',646,250,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(179,'SAINT HELENA','SH','SHN',654,290,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(180,'SAINT KITTS AND NEVIS','KN','KNA',659,1869,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(181,'SAINT LUCIA','LC','LCA',662,1758,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(182,'SAINT PIERRE AND MIQUELON','PM','SPM',666,508,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(183,'SAINT VINCENT AND THE GRENADINES','VC','VCT',670,1784,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(184,'SAMOA','WS','WSM',882,684,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(185,'SAN MARINO','SM','SMR',674,378,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(186,'SAO TOME AND PRINCIPE','ST','STP',678,239,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(187,'SAUDI ARABIA','SA','SAU',682,966,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(188,'SENEGAL','SN','SEN',686,221,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(189,'SERBIA AND MONTENEGRO','CS',NULL,NULL,381,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(190,'SEYCHELLES','SC','SYC',690,248,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(191,'SIERRA LEONE','SL','SLE',694,232,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(192,'SINGAPORE','SG','SGP',702,65,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(193,'SLOVAKIA','SK','SVK',703,421,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(194,'SLOVENIA','SI','SVN',705,386,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(195,'SOLOMON ISLANDS','SB','SLB',90,677,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(196,'SOMALIA','SO','SOM',706,252,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(197,'SOUTH AFRICA','ZA','ZAF',710,27,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(198,'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS','GS',NULL,NULL,0,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(199,'SPAIN','ES','ESP',724,34,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(200,'SRI LANKA','LK','LKA',144,94,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(201,'SUDAN','SD','SDN',736,249,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(202,'SURINAME','SR','SUR',740,597,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(203,'SVALBARD AND JAN MAYEN','SJ','SJM',744,47,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(204,'SWAZILAND','SZ','SWZ',748,268,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(205,'SWEDEN','SE','SWE',752,46,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(206,'SWITZERLAND','CH','CHE',756,41,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(207,'SYRIAN ARAB REPUBLIC','SY','SYR',760,963,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(208,'TAIWAN, PROVINCE OF CHINA','TW','TWN',158,886,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(209,'TAJIKISTAN','TJ','TJK',762,992,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(210,'TANZANIA, UNITED REPUBLIC OF','TZ','TZA',834,255,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(211,'THAILAND','TH','THA',764,66,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(212,'TIMOR-LESTE','TL',NULL,NULL,670,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(213,'TOGO','TG','TGO',768,228,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(214,'TOKELAU','TK','TKL',772,690,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(215,'TONGA','TO','TON',776,676,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(216,'TRINIDAD AND TOBAGO','TT','TTO',780,1868,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(217,'TUNISIA','TN','TUN',788,216,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(218,'TURKEY','TR','TUR',792,90,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(219,'TURKMENISTAN','TM','TKM',795,7370,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(220,'TURKS AND CAICOS ISLANDS','TC','TCA',796,1649,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(221,'TUVALU','TV','TUV',798,688,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(222,'UGANDA','UG','UGA',800,256,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(223,'UKRAINE','UA','UKR',804,380,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(224,'UNITED ARAB EMIRATES','AE','ARE',784,971,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(225,'UNITED KINGDOM','GB','GBR',826,44,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(226,'UNITED STATES','US','USA',840,1,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(227,'UNITED STATES MINOR OUTLYING ISLANDS','UM',NULL,NULL,1,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(228,'URUGUAY','UY','URY',858,598,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(229,'UZBEKISTAN','UZ','UZB',860,998,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(230,'VANUATU','VU','VUT',548,678,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(231,'VENEZUELA','VE','VEN',862,58,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(232,'VIET NAM','VN','VNM',704,84,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(233,'VIRGIN ISLANDS, BRITISH','VG','VGB',92,1284,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(234,'VIRGIN ISLANDS, U.S.','VI','VIR',850,1340,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(235,'WALLIS AND FUTUNA','WF','WLF',876,681,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(236,'WESTERN SAHARA','EH','ESH',732,212,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(237,'YEMEN','YE','YEM',887,967,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(238,'ZAMBIA','ZM','ZMB',894,260,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(239,'ZIMBABWE','ZW','ZWE',716,263,1,'2018-05-14 23:22:21','2018-05-14 23:22:21');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couriers`
--

DROP TABLE IF EXISTS `couriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `couriers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_free` int(11) NOT NULL,
  `cost` decimal(8,2) DEFAULT '0.00',
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couriers`
--

LOCK TABLES `couriers` WRITE;
/*!40000 ALTER TABLE `couriers` DISABLE KEYS */;
INSERT INTO `couriers` VALUES (1,'Free Shipping','Free Shipping','http://gerlach.com/illo-optio-ipsum-dolorem-eos-quia-deserunt',1,0.00,1,'2018-05-14 23:22:23','2018-05-14 23:22:23');
/*!40000 ALTER TABLE `couriers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Mathew','arlene07@example.org','$2y$10$l09UD/5K95Wd3HeBGHzT1OGTvtj3ZsSRfNlZit7BWuQi4ryszPD4.',1,NULL,NULL,NULL,NULL,NULL,'3VFnDqd6Ik','2018-05-14 23:22:13','2018-05-14 23:22:13'),(2,'Glenda','eloisa45@example.org','$2y$10$l09UD/5K95Wd3HeBGHzT1OGTvtj3ZsSRfNlZit7BWuQi4ryszPD4.',1,NULL,NULL,NULL,NULL,NULL,'OiOfwaulPZ','2018-05-14 23:22:22','2018-05-14 23:22:22'),(3,'Tyree','vkoepp@example.com','$2y$10$l09UD/5K95Wd3HeBGHzT1OGTvtj3ZsSRfNlZit7BWuQi4ryszPD4.',1,NULL,NULL,NULL,NULL,NULL,'IzHoaugsCr','2018-05-14 23:22:22','2018-05-14 23:22:22'),(4,'Germaine','may.goodwin@example.net','$2y$10$l09UD/5K95Wd3HeBGHzT1OGTvtj3ZsSRfNlZit7BWuQi4ryszPD4.',1,NULL,NULL,NULL,NULL,NULL,'GdwJvbUbBj','2018-05-14 23:22:22','2018-05-14 23:22:22'),(5,'Lucile','kuhn.delphia@example.net','$2y$10$l09UD/5K95Wd3HeBGHzT1OGTvtj3ZsSRfNlZit7BWuQi4ryszPD4.',1,NULL,NULL,NULL,NULL,NULL,'XqJZoQXpC8','2018-05-14 23:22:22','2018-05-14 23:22:22'),(6,'Kristopher','iva16@example.net','$2y$10$l09UD/5K95Wd3HeBGHzT1OGTvtj3ZsSRfNlZit7BWuQi4ryszPD4.',1,NULL,NULL,NULL,NULL,NULL,'Noq9y0M6r2','2018-05-14 23:22:22','2018-05-14 23:22:22'),(7,'Providenci','west.floyd@example.net','$2y$10$l09UD/5K95Wd3HeBGHzT1OGTvtj3ZsSRfNlZit7BWuQi4ryszPD4.',1,NULL,NULL,NULL,NULL,NULL,'n9aFgjQXYn','2018-05-14 23:22:22','2018-05-14 23:22:22'),(8,'Wilhelm','ifranecki@example.org','$2y$10$l09UD/5K95Wd3HeBGHzT1OGTvtj3ZsSRfNlZit7BWuQi4ryszPD4.',1,NULL,NULL,NULL,NULL,NULL,'TzcUR0nVVG','2018-05-14 23:22:22','2018-05-14 23:22:22'),(9,'Cynthia','gaylord.tyrell@example.net','$2y$10$l09UD/5K95Wd3HeBGHzT1OGTvtj3ZsSRfNlZit7BWuQi4ryszPD4.',1,NULL,NULL,NULL,NULL,NULL,'cxtnyHIWZc','2018-05-14 23:22:22','2018-05-14 23:22:22'),(10,'Katrina','murl68@example.com','$2y$10$l09UD/5K95Wd3HeBGHzT1OGTvtj3ZsSRfNlZit7BWuQi4ryszPD4.',1,NULL,NULL,NULL,NULL,NULL,'gv7X0IXFYr','2018-05-14 23:22:22','2018-05-14 23:22:22'),(11,'Ronaldo','bosco.wilber@example.com','$2y$10$0z.wUSnp2UnLrDMrWPcuY.SQ1mRl9pPKSx9w93MI0nws97D/D4qKu',1,NULL,NULL,NULL,NULL,NULL,'XxdFcxmVvu','2018-05-14 23:22:23','2018-05-14 23:26:52'),(12,'Shanon','xschmitt@example.net','$2y$10$l09UD/5K95Wd3HeBGHzT1OGTvtj3ZsSRfNlZit7BWuQi4ryszPD4.',1,NULL,NULL,NULL,NULL,NULL,'IJ4I1esNuz','2018-05-14 23:22:23','2018-05-14 23:22:23'),(13,'Riley','lakin.dayna@example.org','$2y$10$l09UD/5K95Wd3HeBGHzT1OGTvtj3ZsSRfNlZit7BWuQi4ryszPD4.',1,NULL,NULL,NULL,NULL,NULL,'A1rg6IivBa','2018-05-14 23:22:23','2018-05-14 23:22:23');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Charles','admin@admin.com','$2y$10$W2P0LGVEnSEIle65y3Ki..zXCJHc1svC.ZtMQkWRT5alwMh66nI7S',1,NULL,'q36oXGUovP','2018-05-14 23:22:13','2018-05-14 23:22:13'),(2,'Naomie','emmalee.hartmann@example.com','$2y$10$DdH2x2QaaYLBrWSWiQ/kKuBLR4GCjZiYIt4/ksk3cISoSOJp/5UBi',1,NULL,'dFeRKrnF6A','2018-05-14 23:22:13','2018-05-14 23:22:13');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_customers_table',1),(2,'2014_10_12_000010_create_employees_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2016_05_26_020731_create_country_table',1),(5,'2016_05_26_035202_create_provinces_table',1),(6,'2016_05_26_051502_create_cities_table',1),(7,'2017_06_10_225235_create_products_table',1),(8,'2017_06_11_015526_create_categories_table',1),(9,'2017_06_11_033553_create_category_product_table',1),(10,'2017_06_11_073305_create_address_table',1),(11,'2017_06_12_225546_create_order_status_table',1),(12,'2017_06_13_005248_create_payment_methods',1),(13,'2017_06_13_044714_create_couriers_table',1),(14,'2017_06_13_053346_create_orders_table',1),(15,'2017_06_13_091740_create_order_products_table',1),(16,'2017_06_17_011245_create_shoppingcart_table',1),(17,'2018_01_18_163143_create_product_images_table',1),(18,'2018_02_19_151228_create_cost_column',1),(19,'2018_03_05_141628_add_columns_to_payment_methods',1),(20,'2018_03_10_024148_laratrust_setup_tables',1),(21,'2018_03_10_110530_create_attributes_table',1),(22,'2018_03_10_150920_create_attribute_values_table',1),(23,'2018_03_11_014046_create_product_attributes_table',1),(24,'2018_03_11_090249_create_attribute_value_product_attribute_table',1),(25,'2018_03_15_232344_create_customer_subscription_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_index` (`order_id`),
  KEY `order_product_product_id_index` (`product_id`),
  CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` VALUES (1,'paid','green','2018-05-14 23:22:23','2018-05-14 23:22:23'),(2,'pending','yellow','2018-05-14 23:22:23','2018-05-14 23:22:23'),(3,'error','red','2018-05-14 23:22:23','2018-05-14 23:22:23'),(4,'on-delivery','blue','2018-05-14 23:22:23','2018-05-14 23:22:23');
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courier_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `address_id` int(10) unsigned NOT NULL,
  `order_status_id` int(10) unsigned NOT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discounts` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_products` decimal(8,2) NOT NULL,
  `tax` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total` decimal(8,2) NOT NULL,
  `total_paid` decimal(8,2) NOT NULL DEFAULT '0.00',
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_reference_unique` (`reference`),
  KEY `orders_courier_id_index` (`courier_id`),
  KEY `orders_customer_id_index` (`customer_id`),
  KEY `orders_address_id_index` (`address_id`),
  KEY `orders_order_status_id_index` (`order_status_id`),
  CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `orders_courier_id_foreign` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`),
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'25e81b1f-4ed8-3f4c-9d6c-83ffc72b84af',1,1,1,1,'paypal',572.51,5167.58,3387.82,3850.14,4663.97,NULL,'2018-05-14 23:22:23','2018-05-14 23:22:23'),(2,'4da92253-f9a2-3e42-ba1c-96a1631570a0',1,1,1,1,'paypal',867.80,2588.70,3417.94,9284.07,1914.70,NULL,'2018-05-14 23:22:23','2018-05-14 23:22:23'),(3,'b5a2045b-46a3-3de4-aaea-fd788a3fb609',1,1,1,1,'paypal',170.56,3724.94,7617.32,4995.84,2026.33,NULL,'2018-05-14 23:22:23','2018-05-14 23:22:23'),(4,'319efb5c-a647-3c16-8739-b913543bb2c0',1,1,1,1,'paypal',485.80,2214.92,8244.36,1360.57,5854.99,NULL,'2018-05-14 23:22:23','2018-05-14 23:22:23'),(5,'00c918b5-0fe2-30f3-8471-94d950d4847e',1,1,1,1,'paypal',404.14,70.16,7200.38,1158.00,6568.84,NULL,'2018-05-14 23:22:23','2018-05-14 23:22:23'),(6,'8ff66670-83fe-3007-aa08-a145728fffbc',1,1,1,1,'paypal',900.08,621.04,1449.38,4011.34,2705.46,NULL,'2018-05-14 23:22:23','2018-05-14 23:22:23'),(7,'db47e320-8051-35ee-b953-81bad01f107c',1,1,1,1,'paypal',874.36,4952.84,1569.24,1016.27,1877.32,NULL,'2018-05-14 23:22:24','2018-05-14 23:22:24'),(8,'583ed510-a9f9-3ab3-91c3-cb8062e78abe',1,1,1,1,'paypal',165.04,1146.98,5298.35,7091.22,6652.84,NULL,'2018-05-14 23:22:24','2018-05-14 23:22:24'),(9,'bfa72ee0-9829-3f57-9ecf-a39bbb2e5fb3',1,1,1,1,'paypal',703.23,3640.83,1281.05,6332.88,2656.05,NULL,'2018-05-14 23:22:24','2018-05-14 23:22:24'),(10,'7cae611c-3b33-336a-8b93-9db09d641dc3',1,1,1,1,'paypal',879.57,2505.67,9730.69,4254.19,4778.38,NULL,'2018-05-14 23:22:24','2018-05-14 23:22:24');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `account_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_methods_name_unique` (`name`),
  UNIQUE KEY `payment_methods_account_id_unique` (`account_id`),
  UNIQUE KEY `payment_methods_client_id_unique` (`client_id`),
  UNIQUE KEY `payment_methods_client_secret_unique` (`client_secret`),
  UNIQUE KEY `payment_methods_api_url_unique` (`api_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_user` (
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  KEY `permission_user_permission_id_foreign` (`permission_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_user`
--

LOCK TABLES `permission_user` WRITE;
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attributes`
--

DROP TABLE IF EXISTS `product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attributes_product_id_foreign` (`product_id`),
  CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attributes`
--

LOCK TABLES `product_attributes` WRITE;
/*!40000 ALTER TABLE `product_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `src` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_index` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'1002407','Beatae non id est et dicta aliquam asperiores libero.','beatae-non-id-est-et-dicta-aliquam-asperiores-libero','Cum temporibus sed doloribus consectetur voluptatem pariatur nihil. Voluptates quisquam quia ut qui enim. Qui dolor rerum ea et facilis sint.','products/gXjGrfHqUQ7tNp4tf17qjbv1neBVNHybMD9Wtbwz.png',10,5.00,1,'2018-05-14 23:22:13','2018-05-14 23:22:13'),(2,'1085731','Maxime odio aliquam rem eligendi minus ad eum.','maxime-odio-aliquam-rem-eligendi-minus-ad-eum','Sit dolorum maiores sed quidem. Omnis nihil doloribus distinctio pariatur velit at recusandae.','products/AOVg8bgDEvIdDztPMNeJoNoHuCP3sskBmRlOt1HF.png',10,5.00,1,'2018-05-14 23:22:14','2018-05-14 23:22:14'),(3,'1031304','Laudantium ut blanditiis fugiat aut quibusdam nemo.','laudantium-ut-blanditiis-fugiat-aut-quibusdam-nemo','Harum adipisci quam distinctio voluptatem ut qui autem. Sapiente laborum corporis atque provident quis. Laborum nam quia qui cupiditate aut optio. Distinctio sit dolores temporibus.','products/esXHhW1axRx3xrfPgcASoE8RixQK3OF3qm7qOnEw.png',10,5.00,1,'2018-05-14 23:22:14','2018-05-14 23:22:14'),(4,'1039871','Ipsa eveniet ea quo vero.','ipsa-eveniet-ea-quo-vero','Sequi facere qui nam rem officia. Dolor blanditiis velit et eum minus quis rerum. Nemo omnis voluptatem labore quos ut in.','products/KM7tLqzqCIVhYUP1Ek8q5eERAOeNE2Vi580GwAVV.png',10,5.00,1,'2018-05-14 23:22:14','2018-05-14 23:22:14'),(5,'1037762','Et dolorum porro aut aut facilis dolores aperiam ut.','et-dolorum-porro-aut-aut-facilis-dolores-aperiam-ut','Numquam sit dolorem consequuntur est. Harum quod eligendi asperiores molestias vitae. Qui alias provident nostrum velit. Neque ipsa tempore assumenda a sit perspiciatis.','products/7s5CuQ2H1Y5spns8eNT23GYZuWGeF2Nr69KfSCvs.png',10,5.00,1,'2018-05-14 23:22:14','2018-05-14 23:22:14'),(6,'1067852','Qui eos sapiente quo.','qui-eos-sapiente-quo','Dolores sint omnis tenetur vel quod. Dolores enim fuga aut cum. Alias iste dolore quae aut qui architecto excepturi.','products/riY56RjPAciUb0j1EBxhWn51NSoJGEsBq8lqCzRS.png',10,5.00,1,'2018-05-14 23:22:14','2018-05-14 23:22:14'),(7,'1005300','Voluptas adipisci in aspernatur non voluptate est.','voluptas-adipisci-in-aspernatur-non-voluptate-est','Vel suscipit adipisci vel totam officiis sit. Possimus repellendus beatae accusantium dolores aut assumenda. Quidem quae est excepturi soluta id fuga ex.','products/UEtLjNjE56lunsQtax2gTZBQOX3u2CzrgughAt6i.png',10,5.00,1,'2018-05-14 23:22:14','2018-05-14 23:22:14'),(8,'1005455','Aperiam possimus officia ex consequatur dignissimos rerum nihil ut.','aperiam-possimus-officia-ex-consequatur-dignissimos-rerum-nihil-ut','Fuga qui nobis ipsa. Et cupiditate repellendus ipsa quo provident. Incidunt quia eos facilis quo voluptatibus. Impedit ad dolores et sunt beatae provident aut ducimus. Rerum odit assumenda earum.','products/Yj2PBK3J3cvz6JxMMqY1vEAdKRA4wJd7oYcTPPYt.png',10,5.00,1,'2018-05-14 23:22:14','2018-05-14 23:22:14'),(9,'1101147','Explicabo numquam ipsum eos voluptatem voluptatem.','explicabo-numquam-ipsum-eos-voluptatem-voluptatem','Illo quaerat est tempore nisi sunt quia. Natus nostrum quia aut ea dignissimos. Et voluptatum consequatur quasi voluptatibus rerum a.','products/Ugu9RfqX6sFQrQDLdCl6CZ3jjV0y4HnrZzHeKONC.png',10,5.00,1,'2018-05-14 23:22:14','2018-05-14 23:22:14'),(10,'1053553','Qui vero minima facere autem quas reiciendis voluptate.','qui-vero-minima-facere-autem-quas-reiciendis-voluptate','Optio non accusantium necessitatibus est nesciunt assumenda. Mollitia mollitia error repudiandae inventore est consectetur. Fugit blanditiis rerum dolor omnis non vel. Pariatur modi animi quibusdam quis amet tempore.','products/rH1kF0pF1strlYlwFrWIOvy2IkCNVP1x6471O25h.png',10,5.00,1,'2018-05-14 23:22:15','2018-05-14 23:22:15'),(11,'1095962','Voluptas et ut totam voluptas fugiat qui temporibus ducimus.','voluptas-et-ut-totam-voluptas-fugiat-qui-temporibus-ducimus','Consequuntur rerum nihil voluptatum nobis vitae. Dolor ut nihil omnis quia explicabo nulla. Vero fuga rem ut praesentium mollitia.','products/UPYBX6k48U8V4jpHCjumLNMcGA65sr4bkErxa9I7.png',10,5.00,1,'2018-05-14 23:22:15','2018-05-14 23:22:15'),(12,'1039353','Velit at sed a itaque quia.','velit-at-sed-a-itaque-quia','Et tempore repellendus similique sunt rerum in. Repellat perferendis molestiae quam est quo incidunt aperiam. Harum rem ipsum quibusdam modi facilis. Sed quos non fugit amet accusamus mollitia accusamus unde. Quas amet sint aut et.','products/v6hVqOMHQkTvSQ12Boo0YcqH95KqsHaX8a5DBz31.png',10,5.00,1,'2018-05-14 23:22:15','2018-05-14 23:22:15'),(13,'1027634','Quia maiores ad et.','quia-maiores-ad-et','Nesciunt totam corporis temporibus repellendus. Reprehenderit magnam natus et est. Non non delectus harum omnis quasi. Omnis et ea necessitatibus reiciendis quia ea.','products/AD7NV5f8DmZ89JZyuuozgMa8zX78txDGsZLUqQTo.png',10,5.00,1,'2018-05-14 23:22:15','2018-05-14 23:22:15'),(14,'1108883','Quo explicabo blanditiis quos.','quo-explicabo-blanditiis-quos','Numquam reprehenderit aspernatur nam nulla id. A libero perferendis ullam. Repellendus sed cum id reiciendis voluptatem qui. Ducimus fugit doloribus hic iure pariatur. Nostrum soluta suscipit qui sint.','products/wwC97MV7oxKOx6sx0jv0iVywVan4b6okT7qRA8Jt.png',10,5.00,1,'2018-05-14 23:22:16','2018-05-14 23:22:16'),(15,'1007176','Ut blanditiis cum et quaerat voluptatem rerum laudantium perferendis.','ut-blanditiis-cum-et-quaerat-voluptatem-rerum-laudantium-perferendis','Similique maiores temporibus sit dolorem porro est nisi optio. Labore molestiae est et id aut. Magni blanditiis et qui facere voluptas qui et. Enim deserunt possimus quis inventore. Ea laborum qui ea officia quo dolorem.','products/4vmtygnogLezTE6kaJohNAJITFGZcuURWQWbUtVG.png',10,5.00,1,'2018-05-14 23:22:16','2018-05-14 23:22:16'),(16,'1050017','Sequi quod dolor dolores.','sequi-quod-dolor-dolores','Est corrupti voluptatem eaque enim voluptas odio. Perferendis modi consequatur qui. Molestiae quas non corrupti rem. Occaecati dolor at asperiores veniam.','products/t6GMdvlNkPTeNg948ta0Ca7UwSIEUwyzq7W2d2BE.png',10,5.00,1,'2018-05-14 23:22:16','2018-05-14 23:22:16'),(17,'1062729','Odit consectetur alias doloribus ab et et nisi.','odit-consectetur-alias-doloribus-ab-et-et-nisi','Quia accusantium ea laudantium cupiditate. Ex cum id non ad consequatur rerum quas. Perspiciatis iste perferendis a sapiente quasi quis necessitatibus aliquid. Minima voluptatem dolorem natus ipsa quia rerum et.','products/amIeXi8qmVJfGOd1kL3DuL9HcVB0hlc1dGaeZE8Q.png',10,5.00,1,'2018-05-14 23:22:17','2018-05-14 23:22:17'),(18,'1061122','Eum qui voluptatem cupiditate ut.','eum-qui-voluptatem-cupiditate-ut','Dolorum ullam odit recusandae placeat ut impedit. Voluptas est corporis iste vitae dolorem qui quod. Iusto minus possimus et.','products/lhOmX1eTjuWhwrA4uQPIZ0MaZsud0AQ2YrYAYR7I.png',10,5.00,1,'2018-05-14 23:22:17','2018-05-14 23:22:17'),(19,'1049525','Enim dolore ipsa et qui.','enim-dolore-ipsa-et-qui','Voluptatem cum aliquid sint totam natus occaecati quisquam maxime. Sit deserunt quod voluptatem. Magnam voluptatibus assumenda eum dolor minus asperiores error. Iusto saepe sit quidem laudantium vel dolor.','products/cjadGM5drMquWUen8U5opJwqh8D6yU84VwLvQ27W.png',10,5.00,1,'2018-05-14 23:22:17','2018-05-14 23:22:17'),(20,'1045857','Ex aspernatur quis consequatur porro eos tempore et.','ex-aspernatur-quis-consequatur-porro-eos-tempore-et','Vero temporibus nihil occaecati pariatur illum libero. Eum nisi et voluptates eos et omnis non non. Sapiente est esse enim hic et voluptate quidem.','products/dJkmzTScCd0VNKlJrh0mJ0M5Qi0HwjtUBE7KvYz1.png',10,5.00,1,'2018-05-14 23:22:17','2018-05-14 23:22:17'),(21,'1044290','Aspernatur non voluptas quo consequuntur sunt voluptatem veritatis autem.','aspernatur-non-voluptas-quo-consequuntur-sunt-voluptatem-veritatis-autem','At quia consequuntur aut dolorem itaque. Reiciendis distinctio tempore temporibus qui et. Quaerat rerum quasi expedita ratione fugiat. Aut voluptas eum quam deserunt ab consequatur.','products/VXwLFbbbyuJ72oWGcYwDddWkMAEP5R19QdnRXpj1.png',10,5.00,1,'2018-05-14 23:22:17','2018-05-14 23:22:17'),(22,'1050520','Est quas et consequatur non.','est-quas-et-consequatur-non','Vero commodi laudantium quia et quasi autem. Aut eum velit autem provident cum. Qui inventore itaque qui qui.','products/qLX8vqtp32FzFxV52Y8Ed5TGXbBYAzU2AB0ntrjO.png',10,5.00,1,'2018-05-14 23:22:17','2018-05-14 23:22:17'),(23,'1004975','Delectus id maiores quas quam sequi culpa eligendi.','delectus-id-maiores-quas-quam-sequi-culpa-eligendi','Et rerum sunt ut est. Non esse officiis rem quae aut. Dolores voluptatibus aut fuga. Cum id ad mollitia beatae.','products/cZfe4QRlroRFWoR4NpS9FChk5erhA7s2k3nuPYfs.png',10,5.00,1,'2018-05-14 23:22:17','2018-05-14 23:22:17'),(24,'1074249','Cum sapiente alias eligendi ullam tenetur.','cum-sapiente-alias-eligendi-ullam-tenetur','Nulla et natus error. Dolor illum autem exercitationem quisquam ut dignissimos suscipit. Minus quia in voluptatem rerum.','products/zuMl3p1OMNuVSKIYKvIgYaB2zVBkTVer9rHiHjUZ.png',10,5.00,1,'2018-05-14 23:22:18','2018-05-14 23:22:18'),(25,'1007705','Sunt unde ad architecto consequatur.','sunt-unde-ad-architecto-consequatur','Mollitia quas aut aut autem reprehenderit atque ea. Et et exercitationem maiores dolore excepturi dolorem. Et et placeat inventore nihil reprehenderit enim soluta. Odit tempore aliquid architecto reiciendis.','products/0ewUXVpwjktmvCmgdxKunmOCBKJqzw6Wj79GzUu5.png',10,5.00,1,'2018-05-14 23:22:18','2018-05-14 23:22:18'),(26,'1059710','Aspernatur exercitationem perspiciatis debitis qui sint repellat sint voluptatum.','aspernatur-exercitationem-perspiciatis-debitis-qui-sint-repellat-sint-voluptatum','Provident id facilis ut praesentium alias rerum. Cupiditate architecto et iusto ut iste rem voluptatibus. Suscipit qui sunt perspiciatis et sint vel rem tempora. Magnam illum omnis inventore.','products/0bLvoOKdFptDWknmhU3amHlMaA29E1YKwTzrLrna.png',10,5.00,1,'2018-05-14 23:22:18','2018-05-14 23:22:18'),(27,'1069427','Et sed cumque qui.','et-sed-cumque-qui','Ratione enim maiores ullam. Enim doloremque et dolor. Consequatur sed recusandae fugit harum id sint at. Similique dolor laboriosam aut perspiciatis aut.','products/7NWcBObALCBkTzVoPl0pfKbPgoinq66U2PwsBEKq.png',10,5.00,1,'2018-05-14 23:22:18','2018-05-14 23:22:18'),(28,'1043267','Perferendis aut voluptas itaque consectetur facilis voluptate sed impedit.','perferendis-aut-voluptas-itaque-consectetur-facilis-voluptate-sed-impedit','Nostrum sequi dolor tempore nihil eius. Rerum officiis in unde quidem et.','products/dxbRyXGOJV65f0jgbQJEFptbT1t8YmO7xUH1T0OL.png',10,5.00,1,'2018-05-14 23:22:18','2018-05-14 23:22:18'),(29,'1107323','Eius recusandae natus similique officiis praesentium in reiciendis iusto.','eius-recusandae-natus-similique-officiis-praesentium-in-reiciendis-iusto','Rerum soluta labore neque minus. Amet consequatur cumque exercitationem doloribus. Optio explicabo esse animi magni. Sunt ut aut atque. Non blanditiis consequatur omnis repellat cupiditate et.','products/VvLfix8h6ABxtsKNVbqVJXAWKhlhhd2zEbvJy70I.png',10,5.00,1,'2018-05-14 23:22:18','2018-05-14 23:22:18'),(30,'1050283','Maxime molestiae perspiciatis aliquid blanditiis.','maxime-molestiae-perspiciatis-aliquid-blanditiis','Minus ut et impedit. Rerum corporis impedit et omnis. Quia est pariatur occaecati nesciunt delectus necessitatibus alias.','products/84Lg2fgLgADA41pAPuBbEaz8VIa93X3jqICqTjzr.png',10,5.00,1,'2018-05-14 23:22:18','2018-05-14 23:22:18'),(31,'1110336','Repellat neque debitis omnis est vitae voluptatem.','repellat-neque-debitis-omnis-est-vitae-voluptatem','Blanditiis et cumque asperiores quia ut. Architecto facilis nemo distinctio. Quod est ex omnis sint. Et sunt aut nihil in illum.','products/WVcrI0YYqwzQLqoNgz6jTvkB5vUaLECJL0rNE1zE.png',10,5.00,1,'2018-05-14 23:22:19','2018-05-14 23:22:19'),(32,'1073341','Rem necessitatibus iure nesciunt sit libero ut aspernatur.','rem-necessitatibus-iure-nesciunt-sit-libero-ut-aspernatur','Eaque pariatur mollitia quam. Qui voluptatibus quae itaque minima asperiores. Velit aut consectetur minima vel recusandae. Suscipit cumque accusantium repudiandae fuga eveniet rem.','products/6Dsd3AONDbkwxwssWArGrrRiVk2XSD0RNUner6am.png',10,5.00,1,'2018-05-14 23:22:19','2018-05-14 23:22:19'),(33,'1079768','Commodi vel maiores dolor numquam rem fugit odio qui.','commodi-vel-maiores-dolor-numquam-rem-fugit-odio-qui','In minima dolore aliquam soluta dolores. Ducimus est atque sit consequatur.','products/nw7MZQpXBTCLH6jgFfoJ0WuGD7M472OpJspDE7Ps.png',10,5.00,1,'2018-05-14 23:22:19','2018-05-14 23:22:19'),(34,'1079115','Quam magnam reprehenderit dolor quasi tempora laborum.','quam-magnam-reprehenderit-dolor-quasi-tempora-laborum','Exercitationem magni et laudantium et et sed asperiores. Sed eum nam dolorem aspernatur accusantium laudantium deleniti. Vitae omnis minus voluptatem consequatur quisquam non quos. Quis assumenda sint nobis et exercitationem veritatis.','products/7KM96LLIOhdJjlybA3AZpqYd94zIYUiIlQT5Musp.png',10,5.00,1,'2018-05-14 23:22:19','2018-05-14 23:22:19'),(35,'1085735','Laborum dolores molestiae nobis nam.','laborum-dolores-molestiae-nobis-nam','Quaerat ullam exercitationem porro sed similique illum hic. Voluptate autem occaecati repellat et. Ea quasi amet minus rem est animi. Et enim ipsa tempora tempora molestiae.','products/7HATTBv8YQTcfHC7OBShhpoFFqQka4eTyGXYTdXF.png',10,5.00,1,'2018-05-14 23:22:19','2018-05-14 23:22:19'),(36,'1096359','Adipisci ducimus voluptas laborum molestias inventore.','adipisci-ducimus-voluptas-laborum-molestias-inventore','Dolores ad placeat molestias voluptates. Ducimus id aut asperiores aut voluptatibus harum. Placeat occaecati ullam voluptatem corporis et magnam. Illo ut harum tempore.','products/ffPnkK7rRuqiOPi9bmtajF2aW9SW8aEsCyKI5WI2.png',10,5.00,1,'2018-05-14 23:22:19','2018-05-14 23:22:19'),(37,'1011079','Dolorem facilis id exercitationem ut sed iure velit.','dolorem-facilis-id-exercitationem-ut-sed-iure-velit','Molestiae et voluptates quia. Totam quibusdam et ut assumenda dolores. Sint ex molestiae sequi a laudantium nisi. Ratione odio accusantium ex rem.','products/6JQU6tA6QU2hIBa3q10p8kaxD1tH3SmVe77rH0yw.png',10,5.00,1,'2018-05-14 23:22:19','2018-05-14 23:22:19'),(38,'1050199','Eos itaque vel corrupti similique debitis.','eos-itaque-vel-corrupti-similique-debitis','Consequatur aut voluptatem quae aut quia laborum. Quia nam quis nihil fugiat odio eveniet. Reiciendis eligendi blanditiis animi exercitationem soluta minima nihil. Dolorem vitae dignissimos voluptates assumenda aut inventore.','products/1IqEXNDB8YGp4TlP88OCldeEd5qlkW1RwGBNhaY5.png',10,5.00,1,'2018-05-14 23:22:20','2018-05-14 23:22:20'),(39,'1104219','Molestiae aut sunt dolor accusamus aut.','molestiae-aut-sunt-dolor-accusamus-aut','Officiis libero ad aut molestias. Dolores autem repellendus non qui nisi aperiam dolorum.','products/vZxRCo228uz8X7WMt71Fnivm2cXM5klj31QqgtEh.png',10,5.00,1,'2018-05-14 23:22:20','2018-05-14 23:22:20'),(40,'1050489','Qui quaerat quae nostrum officia.','qui-quaerat-quae-nostrum-officia','Non quasi eligendi perspiciatis optio nemo magni molestiae. Accusamus ut non impedit delectus dolorum. Odio nesciunt et eius ad ullam impedit natus.','products/Q6XR9MMrlSRgDMxzcggLRdxBHwbR14ngr8DeN8Du.png',10,5.00,1,'2018-05-14 23:22:20','2018-05-14 23:22:20'),(41,'1084653','Aut et consequatur voluptate nobis.','aut-et-consequatur-voluptate-nobis','Dignissimos laborum officiis et nostrum. Neque fuga aut et eum libero natus distinctio. A non at nihil molestiae nobis tempora. Placeat fuga sit reprehenderit accusamus.','products/z44Bm5mNPGR1660yhoz0CnV17yKIdwTcuejWQXrG.png',10,5.00,1,'2018-05-14 23:22:20','2018-05-14 23:22:20'),(42,'1081505','Nobis impedit recusandae inventore ad.','nobis-impedit-recusandae-inventore-ad','Similique optio est quae. Reiciendis est similique maxime aliquam. Ratione impedit asperiores natus sint ad. Vel aut voluptatem similique eligendi quis.','products/PfdWpTEqobAakOyy76DfsZaVJoM4dAnrmcJGxzy8.png',10,5.00,1,'2018-05-14 23:22:20','2018-05-14 23:22:20'),(43,'1016132','Aperiam sunt fugit dolorem quis qui.','aperiam-sunt-fugit-dolorem-quis-qui','Ullam consectetur velit qui dolorem porro omnis. Quos in perferendis beatae necessitatibus. Aut ab eos saepe a ex.','products/pV7cIRe0hkP23owmN4EVbXwLctTUFmNg0pF7jag1.png',10,5.00,1,'2018-05-14 23:22:20','2018-05-14 23:22:20'),(44,'1110832','Magnam aut ratione est.','magnam-aut-ratione-est','Rem iste laboriosam nisi rerum voluptatibus. Et ipsum laborum omnis occaecati. Recusandae ut et quod labore earum.','products/UEUGH3zBAuOqBDLw9lBIa44ysH3uHO6xYxLjN65X.png',10,5.00,1,'2018-05-14 23:22:20','2018-05-14 23:22:20'),(45,'1076743','Tempore laboriosam voluptatum necessitatibus reprehenderit neque deserunt expedita nulla.','tempore-laboriosam-voluptatum-necessitatibus-reprehenderit-neque-deserunt-expedita-nulla','Facere suscipit in commodi dolorum voluptas voluptatem. Ipsum asperiores qui omnis quia quisquam libero. Quia provident nesciunt non. Magni et et cumque eum.','products/51b1kslBktC847WprOcgLtDHXoMhlNcp863350FE.png',10,5.00,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(46,'1078887','Est aut ut doloremque quam blanditiis.','est-aut-ut-doloremque-quam-blanditiis','Ut a quia autem in. Iste iste quo et natus vitae dolore. Aut molestiae omnis ut quia ducimus. Minima odit accusamus explicabo quis quaerat et vel.','products/5XFl6V6pKtICEFWr7Ny6nw8J7qvMJjDw8Ed8HMnq.png',10,5.00,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(47,'1057325','Consequatur velit perspiciatis officiis qui enim similique laudantium.','consequatur-velit-perspiciatis-officiis-qui-enim-similique-laudantium','Qui voluptas voluptatem molestias eius incidunt nemo et. Voluptatem est ut illo dolorem architecto officia accusamus. Soluta itaque quos nostrum ipsum ipsum voluptas harum.','products/1snO4qKPiGuXGX7q1ilMGTprkAP4XVxCpLxtDhrK.png',10,5.00,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(48,'1031205','Nesciunt optio provident quaerat voluptatem.','nesciunt-optio-provident-quaerat-voluptatem','Sed cupiditate ipsum blanditiis eum repudiandae ab voluptas. Quidem odio nihil ut voluptatem.','products/s3gVnz2KkPSuVUMO2JzgTv4rA1yeOpqeykSiCT9W.png',10,5.00,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(49,'1063983','Ad quasi eum dolorem harum quisquam corrupti.','ad-quasi-eum-dolorem-harum-quisquam-corrupti','Earum provident aliquid explicabo culpa minus dolores eos. Consequatur nisi itaque ducimus dolorum. Incidunt quis ad delectus voluptas eius illo hic et. Distinctio id est ut id. Fuga sunt impedit sit natus.','products/LxHIhEwdfrJj22Dy8SxZ7L4cQaUjQ0eehTRLtsbt.png',10,5.00,1,'2018-05-14 23:22:21','2018-05-14 23:22:21');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provinces_country_id_index` (`country_id`),
  CONSTRAINT `provinces_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'Abra',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(2,'Agusan del Norte',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(3,'Agusan del Sur',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(4,'Aklan',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(5,'Albay',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(6,'Antique',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(7,'Apayao',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(8,'Aurora',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(9,'Basilan',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(10,'Bataan',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(11,'Batanes',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(12,'Batangas',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(13,'Benguet',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(14,'Biliran',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(15,'Bohol',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(16,'Bukidnon',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(17,'Bulacan',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(18,'Cagayan',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(19,'Camarines Norte',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(20,'Camarines Sur',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(21,'Camiguin',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(22,'Capiz',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(23,'Catanduanes',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(24,'Cavite',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(25,'Cebu',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(26,'Compostela Valley',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(27,'Cotabato',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(28,'Davao del Norte',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(29,'Davao del Sur',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(30,'Davao Oriental',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(31,'Eastern Samar',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(32,'Guimaras',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(33,'Ifugao',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(34,'Ilocos Norte',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(35,'Ilocos Sur',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(36,'Iloilo',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(37,'Isabela',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(38,'Kalinga',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(39,'La Union',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(40,'Laguna',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(41,'Lanao del Norte',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(42,'Lanao del Sur',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(43,'Leyte',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(44,'Maguindanao',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(45,'Marinduque',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(46,'Masbate',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(47,'Metro Manila',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(48,'Misamis Occidental',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(49,'Misamis Oriental',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(50,'Mountain Province',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(51,'Negros Occidental',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(52,'Negros Oriental',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(53,'Northern Samar',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(54,'Nueva Ecija',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(55,'Nueva Vizcaya',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(56,'Occidental Mindoro',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(57,'Oriental Mindoro',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(58,'Palawan',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(59,'Pampanga',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(60,'Pangasinan',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(61,'Quezon',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(62,'Quirino',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(63,'Rizal',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(64,'Romblon',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(65,'Samar',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(66,'Sarangani',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(67,'Siquijor',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(68,'Sorsogon',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(69,'South Cotabato',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(70,'Southern Leyte',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(71,'Sultan Kudarat',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(72,'Sulu',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(73,'Surigao del Norte',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(74,'Surigao del Sur',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(75,'Tarlac',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(76,'Tawi-Tawi',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(77,'Zambales',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(78,'Zamboanga del Norte',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(79,'Zamboanga del Sur',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21'),(80,'Zamboanga Sibugay',169,1,'2018-05-14 23:22:21','2018-05-14 23:22:21');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,'App\\Shop\\Employees\\Employee');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','','','2018-05-14 23:22:13','2018-05-14 23:22:13');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-15 17:41:55
