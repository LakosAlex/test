-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: test_db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `asset_monitor`
--

DROP TABLE IF EXISTS `asset_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_monitor` (
  `id` varchar(255) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `connectivity` varchar(255) DEFAULT NULL,
  `is_curved` bit(1) NOT NULL,
  `ishdr` bit(1) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `panel_type` varchar(255) DEFAULT NULL,
  `refresh_rate` int NOT NULL,
  `resolutionx` int NOT NULL,
  `resolutiony` int NOT NULL,
  `screen_size` double NOT NULL,
  `asset_template_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_oc86jym0njpknh7ej60f5d3br` (`model`),
  KEY `FKdcqyno4p24n8poioi1c1ykdf3` (`asset_template_id`),
  CONSTRAINT `FKdcqyno4p24n8poioi1c1ykdf3` FOREIGN KEY (`asset_template_id`) REFERENCES `asset_templates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_monitor`
--

LOCK TABLES `asset_monitor` WRITE;
/*!40000 ALTER TABLE `asset_monitor` DISABLE KEYS */;
INSERT INTO `asset_monitor` VALUES ('ae24zbjczneiqsdx','Dell','HDMI DP MDP',_binary '',_binary '\0','P3418HW','IPS',60,2560,1080,34,'hcuwmb2svbmb6yyc'),('o941zn0jdh4u7uu7','Dell','HDMI DP',_binary '\0',_binary '','P2417H','VGA',60,1920,1080,24,'hcuwmb2svbmb6yyc');
/*!40000 ALTER TABLE `asset_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_templates`
--

DROP TABLE IF EXISTS `asset_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_templates` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_f05qi3vbm2wfyimqk0wh7e7s9` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_templates`
--

LOCK TABLES `asset_templates` WRITE;
/*!40000 ALTER TABLE `asset_templates` DISABLE KEYS */;
INSERT INTO `asset_templates` VALUES ('hcuwmb2svbmb6yyc','Monitor'),('8dba328f-dfdf-469e-ba57-afdf8531d3e1','Workstation');
/*!40000 ALTER TABLE `asset_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_workstation`
--

DROP TABLE IF EXISTS `asset_workstation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_workstation` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `room_fk` varchar(255) DEFAULT NULL,
  `asset_template_fk` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr2j9me3wsa2udjhr8diq3dfmu` (`room_fk`),
  KEY `FKdh4vih1lws7v6f3nhqj0eurfe` (`asset_template_fk`),
  CONSTRAINT `FKdh4vih1lws7v6f3nhqj0eurfe` FOREIGN KEY (`asset_template_fk`) REFERENCES `asset_templates` (`id`),
  CONSTRAINT `FKr2j9me3wsa2udjhr8diq3dfmu` FOREIGN KEY (`room_fk`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_workstation`
--

LOCK TABLES `asset_workstation` WRITE;
/*!40000 ALTER TABLE `asset_workstation` DISABLE KEYS */;
INSERT INTO `asset_workstation` VALUES ('03d70f6b-2a93-4a90-8341-7290c133ec92','YRW 001','68186a9d-84f4-4f9b-b8ff-5ac4f979c22e','8dba328f-dfdf-469e-ba57-afdf8531d3e1'),('282acca9-344c-45e3-9839-017dcc7f1ed3','YRW 002','68186a9d-84f4-4f9b-b8ff-5ac4f979c22e','8dba328f-dfdf-469e-ba57-afdf8531d3e1'),('457569d7-fcb6-4a9b-80e9-2122362fe478','YRW 003','68186a9d-84f4-4f9b-b8ff-5ac4f979c22e','8dba328f-dfdf-469e-ba57-afdf8531d3e1'),('4af018e9-638a-49cc-bb5e-181bcf87602d','RRW 002','6572c9ca-2b95-4f83-80e2-1101b422fa8c','8dba328f-dfdf-469e-ba57-afdf8531d3e1'),('a37664b5-1d6d-4014-9d51-26627d084711','RRW 003','6572c9ca-2b95-4f83-80e2-1101b422fa8c','8dba328f-dfdf-469e-ba57-afdf8531d3e1'),('ad5772c7-7758-4f51-8955-07429ce059a8','GRW 003','c60dcc57-2312-4ab6-a41a-f4619e4ca54a','8dba328f-dfdf-469e-ba57-afdf8531d3e1'),('c6a24f36-f5ec-4a37-893e-08d6a94b3e9b','GRW 002','c60dcc57-2312-4ab6-a41a-f4619e4ca54a','8dba328f-dfdf-469e-ba57-afdf8531d3e1'),('d95aa089-a234-4b57-ad55-472da7f76036','GRW 001','c60dcc57-2312-4ab6-a41a-f4619e4ca54a','8dba328f-dfdf-469e-ba57-afdf8531d3e1'),('dae9fc18-6b8f-4b8c-92f8-525bddc77de2','RRW 001','6572c9ca-2b95-4f83-80e2-1101b422fa8c','8dba328f-dfdf-469e-ba57-afdf8531d3e1');
/*!40000 ALTER TABLE `asset_workstation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'HR'),(2,'ADMIN');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_office_requests`
--

DROP TABLE IF EXISTS `home_office_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_office_requests` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `requested_day` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_office_requests`
--

LOCK TABLES `home_office_requests` WRITE;
/*!40000 ALTER TABLE `home_office_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_office_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_pictures`
--

DROP TABLE IF EXISTS `profile_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_pictures` (
  `id` varchar(255) NOT NULL,
  `img` longblob,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6jju2b9l2tfcam660onl6ecxn` (`user_id`),
  CONSTRAINT `FK6jju2b9l2tfcam660onl6ecxn` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_pictures`
--

LOCK TABLES `profile_pictures` WRITE;
/*!40000 ALTER TABLE `profile_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `reserved_day` date DEFAULT NULL,
  `workstation_fk` varchar(255) DEFAULT NULL,
  `requester_email` varchar(255) DEFAULT NULL,
  `requester_full_name` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKktrr9ssfntuwo7a5ads6irhvt` (`workstation_fk`),
  CONSTRAINT `FKktrr9ssfntuwo7a5ads6irhvt` FOREIGN KEY (`workstation_fk`) REFERENCES `asset_workstation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES ('002dd93a-3a66-427a-9909-e6f437d710ad','my reservation name','2023-10-16 09:43:55.827000','2023-10-16','4af018e9-638a-49cc-bb5e-181bcf87602d','testUser@officer.com','Test User',''),('1a3378a1-cebb-4220-a1b6-c67195b9239a','my reservation name','2023-09-17 11:06:12.067000','2023-09-17','03d70f6b-2a93-4a90-8341-7290c133ec92','lakosalexx@gmail.com','Alex Lakos',''),('1b228f50-753c-4f01-b733-e35649c1986c','my reservation name','2023-09-17 18:55:54.316000','2023-09-17','a37664b5-1d6d-4014-9d51-26627d084711','lakosalexx@gmail.com','Alex Lakos',''),('224698b8-bbfb-4c0f-9b9a-c2fb82d65544','my reservation name','2023-09-17 18:59:32.947000','2023-09-18','ad5772c7-7758-4f51-8955-07429ce059a8','lakosalexx@gmail.com','Alex Lakos',''),('25733c15-7613-47a3-bf9d-a8b28e4efff9','my reservation name','2023-10-16 09:36:52.838000','2023-10-16','ad5772c7-7758-4f51-8955-07429ce059a8','lakosalexx@gmail.com','Alex Lakos',''),('31c3caa9-d0ce-45f4-8748-a69514d149f2','my reservation name','2023-10-10 23:51:44.994000','2023-10-11','4af018e9-638a-49cc-bb5e-181bcf87602d','lakosalexx@gmail.com','Alex Lakos',''),('597402a7-018d-42d0-b035-ccca8cb33080','my reservation name','2023-09-17 21:59:54.960000','2023-09-18','d95aa089-a234-4b57-ad55-472da7f76036','lakosalexx@gmail.com','Alex Lakos',''),('5ae5ef61-af16-4284-89cc-98be0b3ebb8f','my reservation name','2023-09-17 21:59:57.983000','2023-09-18','4af018e9-638a-49cc-bb5e-181bcf87602d','lakosalexx@gmail.com','Alex Lakos',''),('5d909a3f-976e-45f3-a16a-54a56e64fd56','my reservation name','2023-09-18 10:11:10.440000','2023-09-18','03d70f6b-2a93-4a90-8341-7290c133ec92','lakosalexx@gmail.com','Alex Lakos',''),('7dfc2050-bb11-4021-9dba-47bab2ccc358','my reservation name','2023-09-16 22:08:28.985000','2023-09-17','c6a24f36-f5ec-4a37-893e-08d6a94b3e9b','lakosalexx@gmail.com','Alex Lakos',''),('88fc9829-1b4c-4b22-ba85-a7ee5b2b12ad','my reservation name','2023-10-10 23:51:30.632000','2023-10-10','4af018e9-638a-49cc-bb5e-181bcf87602d','lakosalexx@gmail.com','Alex Lakos',''),('9c4a441e-d381-4b74-8168-ee8b0b15501f','my reservation name','2023-09-18 13:12:48.971000','2023-09-21','4af018e9-638a-49cc-bb5e-181bcf87602d','lakosalexx@gmail.com','Alex Lakos',''),('a8465f1d-4f26-4ded-ac8d-629d916e4e79','my reservation name','2023-09-16 11:39:27.759000','2023-09-17','ad5772c7-7758-4f51-8955-07429ce059a8','lakosalexx@gmail.com','Alex Lakos',''),('aaec63c9-8fac-4cc1-9d91-172a1288aa0b','my reservation name','2023-09-18 13:12:46.374000','2023-09-21','ad5772c7-7758-4f51-8955-07429ce059a8','lakosalexx@gmail.com','Alex Lakos',''),('abfc2af3-fccc-48a4-9c92-0b471631e57b','my reservation name','2023-10-10 23:50:11.257000','2023-10-10','ad5772c7-7758-4f51-8955-07429ce059a8','lakosalexx@gmail.com','Alex Lakos',''),('bcef43a8-42ab-4456-9dc7-877f0bc6f3d5','my reservation name','2023-10-16 09:43:57.372000','2023-10-16','a37664b5-1d6d-4014-9d51-26627d084711','testUser@officer.com','Test User',''),('ca386c32-1bde-42f8-8712-1b5d95cc3315','my reservation name','2023-10-16 09:38:29.600000','2023-10-16','c6a24f36-f5ec-4a37-893e-08d6a94b3e9b','lakosalexx@gmail.com','Alex Lakos',''),('f323ba38-1fc4-42fe-9bb9-6c95c8fd7435','my reservation name','2023-09-18 10:16:40.558000','2023-09-19','ad5772c7-7758-4f51-8955-07429ce059a8','lakosalexx@gmail.com','Alex Lakos','');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1kuqhbfxed2e8t571uo82n545` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES ('4e643b38-86b0-4416-8fe5-faafaff43df2','Blue Room'),('c60dcc57-2312-4ab6-a41a-f4619e4ca54a','Green Room'),('6572c9ca-2b95-4f83-80e2-1101b422fa8c','Red Room'),('68186a9d-84f4-4f9b-b8ff-5ac4f979c22e','Yellow Room');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `department_id` bigint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `profile_picture_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UK_k0y369dffniq4d2myb2kbkw2h` (`profile_picture_id`),
  UNIQUE KEY `UK_6efs5vmce86ymf5q7lmvn2uuf` (`user_id`),
  KEY `FKsbg59w8q63i0oo53rlgvlcnjq` (`department_id`),
  CONSTRAINT `FK2ts6um1d9nbi1tfuuytpke6ng` FOREIGN KEY (`profile_picture_id`) REFERENCES `profile_pictures` (`id`),
  CONSTRAINT `FKr5q81yrh5ync8c1x09gapf0fb` FOREIGN KEY (`user_id`) REFERENCES `profile_pictures` (`id`),
  CONSTRAINT `FKsbg59w8q63i0oo53rlgvlcnjq` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'admin','admin','1e29f5e0-8a7b-4b9f-9b24-51f60c912a67',NULL,NULL,NULL),(1,'hr','hr','9e8a3b70-721d-4e60-9f22-084ecb1c5d11',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workstation_monitor`
--

DROP TABLE IF EXISTS `workstation_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstation_monitor` (
  `workstation_fk` varchar(255) NOT NULL,
  `monitor_type_fk` varchar(255) NOT NULL,
  KEY `FKx5wbmecla13p8u7x3nhc22ak` (`monitor_type_fk`),
  KEY `FKqe0bkwxfwa16wkogl50f6vetc` (`workstation_fk`),
  CONSTRAINT `FKqe0bkwxfwa16wkogl50f6vetc` FOREIGN KEY (`workstation_fk`) REFERENCES `asset_workstation` (`id`),
  CONSTRAINT `FKx5wbmecla13p8u7x3nhc22ak` FOREIGN KEY (`monitor_type_fk`) REFERENCES `asset_monitor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workstation_monitor`
--

LOCK TABLES `workstation_monitor` WRITE;
/*!40000 ALTER TABLE `workstation_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `workstation_monitor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-19 12:36:13
