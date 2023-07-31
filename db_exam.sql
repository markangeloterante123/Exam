-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: db_exam
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

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
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sequence` int DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_resized` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata`
--

DROP TABLE IF EXISTS `metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata`
--

LOCK TABLES `metadata` WRITE;
/*!40000 ALTER TABLE `metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (118,'2014_10_12_000000_create_users_table',1),(119,'2014_10_12_100000_create_password_resets_table',1),(120,'2016_06_01_000001_create_oauth_auth_codes_table',1),(121,'2016_06_01_000002_create_oauth_access_tokens_table',1),(122,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(123,'2016_06_01_000004_create_oauth_clients_table',1),(124,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(126,'2019_12_14_000001_create_personal_access_tokens_table',1),(127,'2022_10_17_154329_create_logs_table',1),(128,'2022_10_17_154335_create_metadata_table',1),(129,'2022_10_17_154341_create_images_table',1),(130,'2022_10_17_154523_create_user_details_table',1),(131,'2022_10_17_154726_create_roles_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES ('97c465f5-def0-422f-a12b-f78532a5afd5',NULL,'Laravel Personal Access Client','7OP4gvisqwjOXnNnD1N0RILxE2tGj1kit5qJs1hj',NULL,'http://localhost',1,0,0,'2022-11-17 15:09:59','2022-11-17 15:09:59'),('97c465f5-e7c7-4af3-91b5-4e61e59af7c2',NULL,'Laravel Password Grant Client','8PPhVn5EznfFpt1zOBZdANZiJdAU2PT7WudMxVCX','users','http://localhost',0,1,0,'2022-11-17 15:09:59','2022-11-17 15:09:59'),('97cc0bde-2481-4b65-b426-54daec5fc69e',NULL,'Laravel Personal Access Client','Kvz0AwHEuspE9K5nl6gH5Mz4SFg58xdZvTFDFoOh',NULL,'http://localhost',1,0,0,'2022-11-21 18:24:42','2022-11-21 18:24:42'),('97cc0bde-2ad4-4615-90ff-487966b3dda4',NULL,'Laravel Password Grant Client','aMRKbp03V6KDz5zO9PYs7Tw28elSNbBJo91hkkFW','users','http://localhost',0,1,0,'2022-11-21 18:24:42','2022-11-21 18:24:42'),('99c44fe2-8fb2-444a-8965-e0270d3016aa',NULL,'Laravel Personal Access Client','vT2tJXKVn1w7whdr8z8690EYnq5wWYDBA8MtIdUI',NULL,'http://localhost',1,0,0,'2023-07-30 02:32:08','2023-07-30 02:32:08'),('99c44fe2-9d1d-4c75-bff5-29e8034c9465',NULL,'Laravel Password Grant Client','l6PmRfFRNuRr353v1oOMCqiGazGmhYLo82V9IRco','users','http://localhost',0,1,0,'2023-07-30 02:32:08','2023-07-30 02:32:08');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,'97c465f5-def0-422f-a12b-f78532a5afd5','2022-11-17 15:09:59','2022-11-17 15:09:59'),(2,'97cc0bde-2481-4b65-b426-54daec5fc69e','2022-11-21 18:24:42','2022-11-21 18:24:42'),(3,'99c44fe2-8fb2-444a-8965-e0270d3016aa','2023-07-30 02:32:08','2023-07-30 02:32:08');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` set('admin','editor','customer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('0dc1ab31-2cd2-4096-84f2-a334a8e1cb42','admin','','admin','[{\"name\":\"Dashboard\",\"unique\":\"dashboard\",\"checked\":false},{\"name\":\"Hearing Aids\",\"unique\":\"hearing-aids\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-hearing-aid\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-hearing-aid\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-hearing-aid\",\"checked\":false}]},{\"name\":\"Accessories\",\"unique\":\"accessories\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-accessory\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-accessory\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-accessory\",\"checked\":false}]},{\"name\":\"Variations\",\"unique\":\"variations\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-variation\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-variation\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-variation\",\"checked\":false}]},{\"name\":\"Discounts\",\"unique\":\"discounts\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-discount\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-discount\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-discount\",\"checked\":false}]},{\"name\":\"Branches\",\"unique\":\"branches\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-branch\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-branch\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-branch\",\"checked\":false}]},{\"name\":\"Articles\",\"unique\":\"articles\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-article\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-article\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-article\",\"checked\":false}]},{\"name\":\"Promos\",\"unique\":\"promos\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-promo\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-promo\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-promo\",\"checked\":false}]},{\"name\":\"Videos\",\"unique\":\"videos\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-video\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-video\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-video\",\"checked\":false}]},{\"name\":\"Services\",\"unique\":\"services\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-service\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-service\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-service\",\"checked\":false}]},{\"name\":\"Faqs\",\"unique\":\"faqs\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-faq\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-faq\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-faq\",\"checked\":false}]},{\"name\":\"Stats\",\"unique\":\"stats\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-stat\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-stat\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-stat\",\"checked\":false}]},{\"name\":\"Histories\",\"unique\":\"histories\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-history\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-history\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-history\",\"checked\":false}]},{\"name\":\"Inquiries\",\"unique\":\"inquiries\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-inquiry\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-inquiry\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-inquiry\",\"checked\":false}]},{\"name\":\"Pages\",\"unique\":\"pages\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-page\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-page\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-page\",\"checked\":false}]},{\"name\":\"Users\",\"unique\":\"users\",\"checked\":true,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-user\",\"checked\":true},{\"name\":\"Update\",\"unique\":\"update-user\",\"checked\":true},{\"name\":\"Delete\",\"unique\":\"delete-user\",\"checked\":true}]},{\"name\":\"Roles\",\"unique\":\"roles\",\"checked\":true,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-role\",\"checked\":true},{\"name\":\"Update\",\"unique\":\"update-role\",\"checked\":true},{\"name\":\"Delete\",\"unique\":\"delete-role\",\"checked\":true}]}]','2023-07-30 03:51:38','2023-07-30 03:51:38',NULL),('0dc1ab31-2cd2-4096-84f2-a334a8e1cb43','customer','','customer','[{\"name\":\"Dashboard\",\"unique\":\"dashboard\",\"checked\":false},{\"name\":\"Hearing Aids\",\"unique\":\"hearing-aids\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-hearing-aid\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-hearing-aid\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-hearing-aid\",\"checked\":false}]},{\"name\":\"Accessories\",\"unique\":\"accessories\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-accessory\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-accessory\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-accessory\",\"checked\":false}]},{\"name\":\"Variations\",\"unique\":\"variations\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-variation\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-variation\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-variation\",\"checked\":false}]},{\"name\":\"Discounts\",\"unique\":\"discounts\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-discount\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-discount\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-discount\",\"checked\":false}]},{\"name\":\"Branches\",\"unique\":\"branches\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-branch\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-branch\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-branch\",\"checked\":false}]},{\"name\":\"Articles\",\"unique\":\"articles\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-article\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-article\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-article\",\"checked\":false}]},{\"name\":\"Promos\",\"unique\":\"promos\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-promo\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-promo\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-promo\",\"checked\":false}]},{\"name\":\"Videos\",\"unique\":\"videos\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-video\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-video\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-video\",\"checked\":false}]},{\"name\":\"Services\",\"unique\":\"services\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-service\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-service\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-service\",\"checked\":false}]},{\"name\":\"Faqs\",\"unique\":\"faqs\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-faq\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-faq\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-faq\",\"checked\":false}]},{\"name\":\"Stats\",\"unique\":\"stats\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-stat\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-stat\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-stat\",\"checked\":false}]},{\"name\":\"Histories\",\"unique\":\"histories\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-history\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-history\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-history\",\"checked\":false}]},{\"name\":\"Inquiries\",\"unique\":\"inquiries\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-inquiry\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-inquiry\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-inquiry\",\"checked\":false}]},{\"name\":\"Pages\",\"unique\":\"pages\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-page\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-page\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-page\",\"checked\":false}]},{\"name\":\"Users\",\"unique\":\"users\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-user\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-user\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-user\",\"checked\":false}]},{\"name\":\"Roles\",\"unique\":\"roles\",\"checked\":false,\"actions\":[{\"name\":\"Add\",\"unique\":\"add-role\",\"checked\":false},{\"name\":\"Update\",\"unique\":\"update-role\",\"checked\":false},{\"name\":\"Delete\",\"unique\":\"delete-role\",\"checked\":false}]}]','2023-07-30 03:51:38','2023-07-30 03:51:38',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_addresses` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `house_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barangay` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discounted` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_details_user_id_foreign` (`user_id`),
  CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES ('65816da9-1074-486d-9c49-eab355bf7e7b','bbeacb12-70b2-451a-8f33-b512cb6e695e','EbsOWu3Vh3MqggnXxep2','Mark Angelo','Terante','Mark Angelo Terante',NULL,NULL,'mark-angelo-terante',0,'2023-07-30 03:51:38','2023-07-30 03:51:38',NULL),('77d48968-ef64-4bf7-8021-a227e73a2a43','0dc1ab31-2cd2-4096-84f2-a334a8e1cb42','123724734','Admin','Admin','Admin Admin','094581612912','839191262','admin-admin',0,'2023-07-30 03:51:38','2023-07-30 03:51:38',NULL);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('0dc1ab31-2cd2-4096-84f2-a334a8e1cb42','admin@admin.com',NULL,'$2y$10$MieOk27U9bUNWQgQrN.L6ut3o/kSKnSnphKu2sdsbddp/We/RxLKe',1,NULL,'2023-07-30 03:51:38','2022-11-16 03:51:41',NULL,'0dc1ab31-2cd2-4096-84f2-a334a8e1cb42'),('bbeacb12-70b2-451a-8f33-b512cb6e695e','markangeloterante@gmail.com',NULL,'$2y$10$/YvrZ6Hks9ELAzQhU7MtweCQyUxSSYCl4I8/LOzFmjugiMgFE9H0q',1,NULL,'2023-07-30 03:51:38','2023-07-30 05:28:26',NULL,'0dc1ab31-2cd2-4096-84f2-a334a8e1cb43');
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

-- Dump completed on 2023-07-30 13:58:33
