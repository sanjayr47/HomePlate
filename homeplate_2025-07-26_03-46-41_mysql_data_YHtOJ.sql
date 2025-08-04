-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: homeplate
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `account_transactions`
--

DROP TABLE IF EXISTS `account_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint NOT NULL,
  `current_balance` decimal(24,2) NOT NULL,
  `amount` decimal(24,2) NOT NULL,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'collected',
  `created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_transactions`
--

LOCK TABLES `account_transactions` WRITE;
/*!40000 ALTER TABLE `account_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `add_ons`
--

DROP TABLE IF EXISTS `add_ons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `add_ons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `stock_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unlimited',
  `addon_stock` int NOT NULL DEFAULT '0',
  `sell_count` int NOT NULL DEFAULT '0',
  `addon_category_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_ons`
--

LOCK TABLES `add_ons` WRITE;
/*!40000 ALTER TABLE `add_ons` DISABLE KEYS */;
INSERT INTO `add_ons` VALUES (1,'Water',10.00,'2023-09-08 16:47:03','2023-09-08 16:47:03',1,1,'unlimited',0,0,NULL);
/*!40000 ALTER TABLE `add_ons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_categories`
--

DROP TABLE IF EXISTS `addon_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_categories`
--

LOCK TABLES `addon_categories` WRITE;
/*!40000 ALTER TABLE `addon_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_settings`
--

DROP TABLE IF EXISTS `addon_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon_settings` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `test_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `settings_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'live',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `additional_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `payment_settings_id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_settings`
--

LOCK TABLES `addon_settings` WRITE;
/*!40000 ALTER TABLE `addon_settings` DISABLE KEYS */;
INSERT INTO `addon_settings` VALUES ('070c6bbd-d777-11ed-96f4-0c7a158e4469','twilio','{\"gateway\":\"twilio\",\"mode\":\"live\",\"status\":\"0\",\"sid\":null,\"messaging_service_sid\":null,\"token\":null,\"from\":null,\"otp_template\":null}','{\"gateway\":\"twilio\",\"mode\":\"live\",\"status\":\"0\",\"sid\":null,\"messaging_service_sid\":null,\"token\":null,\"from\":null,\"otp_template\":null}','sms_config','live',1,NULL,'2023-08-12 07:01:29',NULL),('070c766c-d777-11ed-96f4-0c7a158e4469','2factor','{\"gateway\":\"2factor\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":null}','{\"gateway\":\"2factor\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":null}','sms_config','live',1,NULL,'2023-08-12 07:01:36',NULL),('0d8a9308-d6a5-11ed-962c-0c7a158e4469','mercadopago','{\"gateway\":\"mercadopago\",\"mode\":\"test\",\"status\":0,\"access_token\":null,\"public_key\":null}','{\"gateway\":\"mercadopago\",\"mode\":\"test\",\"status\":0,\"access_token\":null,\"public_key\":null}','payment_config','test',0,NULL,'2023-09-08 18:07:21','{\"gateway_title\":null,\"gateway_image\":\"2023-09-09-64fc19a924305.png\"}'),('0d8a9e49-d6a5-11ed-962c-0c7a158e4469','liqpay','{\"gateway\":\"liqpay\",\"mode\":\"test\",\"status\":0,\"private_key\":null,\"public_key\":null}','{\"gateway\":\"liqpay\",\"mode\":\"test\",\"status\":0,\"private_key\":null,\"public_key\":null}','payment_config','test',0,NULL,'2023-09-08 18:07:47','{\"gateway_title\":null,\"gateway_image\":\"2023-09-09-64fc19c308041.png\"}'),('101befdf-d44b-11ed-8564-0c7a158e4469','paypal','{\"gateway\":\"paypal\",\"mode\":\"test\",\"status\":0,\"client_id\":null,\"client_secret\":null}','{\"gateway\":\"paypal\",\"mode\":\"test\",\"status\":0,\"client_id\":null,\"client_secret\":null}','payment_config','test',0,NULL,'2023-09-08 18:08:04','{\"gateway_title\":null,\"gateway_image\":\"2023-09-09-64fc19d453744.png\"}'),('133d9647-cabb-11ed-8fec-0c7a158e4469','hyper_pay','{\"gateway\":\"hyper_pay\",\"mode\":\"test\",\"status\":\"0\",\"entity_id\":\"data\",\"access_code\":\"data\"}','{\"gateway\":\"hyper_pay\",\"mode\":\"test\",\"status\":\"0\",\"entity_id\":\"data\",\"access_code\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:32:42','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('1821029f-d776-11ed-96f4-0c7a158e4469','msg91','{\"gateway\":\"msg91\",\"mode\":\"live\",\"status\":\"0\",\"template_id\":null,\"auth_key\":null}','{\"gateway\":\"msg91\",\"mode\":\"live\",\"status\":\"0\",\"template_id\":null,\"auth_key\":null}','sms_config','live',1,NULL,'2023-08-12 07:01:48',NULL),('18210f2b-d776-11ed-96f4-0c7a158e4469','nexmo','{\"gateway\":\"nexmo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"api_secret\":\"\",\"token\":\"\",\"from\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"nexmo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"api_secret\":\"\",\"token\":\"\",\"from\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,'2023-04-10 02:14:44',NULL),('18fbb21f-d6ad-11ed-962c-0c7a158e4469','foloosi','{\"gateway\":\"foloosi\",\"mode\":\"test\",\"status\":\"0\",\"merchant_key\":\"data\"}','{\"gateway\":\"foloosi\",\"mode\":\"test\",\"status\":\"0\",\"merchant_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:34:33','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('2767d142-d6a1-11ed-962c-0c7a158e4469','paytm','{\"gateway\":\"paytm\",\"mode\":\"test\",\"status\":0,\"merchant_key\":null,\"merchant_id\":null,\"merchant_website_link\":null}','{\"gateway\":\"paytm\",\"mode\":\"test\",\"status\":0,\"merchant_key\":null,\"merchant_id\":null,\"merchant_website_link\":null}','payment_config','test',0,NULL,'2023-09-08 18:08:21','{\"gateway_title\":null,\"gateway_image\":\"2023-09-09-64fc19e5542b7.png\"}'),('3201d2e6-c937-11ed-a424-0c7a158e4469','amazon_pay','{\"gateway\":\"amazon_pay\",\"mode\":\"test\",\"status\":\"0\",\"pass_phrase\":\"data\",\"access_code\":\"data\",\"merchant_identifier\":\"data\"}','{\"gateway\":\"amazon_pay\",\"mode\":\"test\",\"status\":\"0\",\"pass_phrase\":\"data\",\"access_code\":\"data\",\"merchant_identifier\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:36:07','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('4593b25c-d6a1-11ed-962c-0c7a158e4469','paytabs','{\"gateway\":\"paytabs\",\"mode\":\"test\",\"status\":0,\"profile_id\":null,\"server_key\":null,\"base_url\":null}','{\"gateway\":\"paytabs\",\"mode\":\"test\",\"status\":0,\"profile_id\":null,\"server_key\":null,\"base_url\":null}','payment_config','test',0,NULL,'2023-09-08 18:08:41','{\"gateway_title\":null,\"gateway_image\":\"2023-09-09-64fc19f90bf16.png\"}'),('4e9b8dfb-e7d1-11ed-a559-0c7a158e4469','bkash','{\"gateway\":\"bkash\",\"mode\":\"test\",\"status\":0,\"app_key\":null,\"app_secret\":null,\"username\":null,\"password\":null}','{\"gateway\":\"bkash\",\"mode\":\"test\",\"status\":0,\"app_key\":null,\"app_secret\":null,\"username\":null,\"password\":null}','payment_config','test',0,NULL,'2023-09-08 18:08:55','{\"gateway_title\":null,\"gateway_image\":\"2023-09-09-64fc1a06f2df1.png\"}'),('544a24a4-c872-11ed-ac7a-0c7a158e4469','fatoorah','{\"gateway\":\"fatoorah\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\"}','{\"gateway\":\"fatoorah\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:36:24','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('58c1bc8a-d6ac-11ed-962c-0c7a158e4469','ccavenue','{\"gateway\":\"ccavenue\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"data\",\"working_key\":\"data\",\"access_code\":\"data\"}','{\"gateway\":\"ccavenue\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"data\",\"working_key\":\"data\",\"access_code\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 03:42:38','{\"gateway_title\":null,\"gateway_image\":\"2023-04-13-643783f01d386.png\"}'),('5e2d2ef9-d6ab-11ed-962c-0c7a158e4469','thawani','{\"gateway\":\"thawani\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"data\",\"private_key\":\"data\"}','{\"gateway\":\"thawani\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"data\",\"private_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:50:40','{\"gateway_title\":null,\"gateway_image\":\"2023-04-13-64378f9856f29.png\"}'),('60cc83cc-d5b9-11ed-b56f-0c7a158e4469','sixcash','{\"gateway\":\"sixcash\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"data\",\"secret_key\":\"data\",\"merchant_number\":\"data\",\"base_url\":\"data\"}','{\"gateway\":\"sixcash\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"data\",\"secret_key\":\"data\",\"merchant_number\":\"data\",\"base_url\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:16:17','{\"gateway_title\":null,\"gateway_image\":\"2023-04-12-6436774e77ff9.png\"}'),('68579846-d8e8-11ed-8249-0c7a158e4469','alphanet_sms','{\"gateway\":\"alphanet_sms\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"alphanet_sms\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),('6857a2e8-d8e8-11ed-8249-0c7a158e4469','sms_to','{\"gateway\":\"sms_to\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"sms_to\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),('74c30c00-d6a6-11ed-962c-0c7a158e4469','hubtel','{\"gateway\":\"hubtel\",\"mode\":\"test\",\"status\":\"0\",\"account_number\":\"data\",\"api_id\":\"data\",\"api_key\":\"data\"}','{\"gateway\":\"hubtel\",\"mode\":\"test\",\"status\":\"0\",\"account_number\":\"data\",\"api_id\":\"data\",\"api_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:37:43','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('74e46b0a-d6aa-11ed-962c-0c7a158e4469','tap','{\"gateway\":\"tap\",\"mode\":\"test\",\"status\":\"0\",\"secret_key\":\"data\"}','{\"gateway\":\"tap\",\"mode\":\"test\",\"status\":\"0\",\"secret_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:50:09','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('761ca96c-d1eb-11ed-87ca-0c7a158e4469','swish','{\"gateway\":\"swish\",\"mode\":\"test\",\"status\":\"0\",\"number\":\"data\"}','{\"gateway\":\"swish\",\"mode\":\"test\",\"status\":\"0\",\"number\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:17:02','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('7b1c3c5f-d2bd-11ed-b485-0c7a158e4469','payfast','{\"gateway\":\"payfast\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"data\",\"secured_key\":\"data\"}','{\"gateway\":\"payfast\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"data\",\"secured_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:18:13','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('8592417b-d1d1-11ed-a984-0c7a158e4469','esewa','{\"gateway\":\"esewa\",\"mode\":\"test\",\"status\":\"0\",\"merchantCode\":\"data\"}','{\"gateway\":\"esewa\",\"mode\":\"test\",\"status\":\"0\",\"merchantCode\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:17:38','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('9162a1dc-cdf1-11ed-affe-0c7a158e4469','viva_wallet','{\"gateway\":\"viva_wallet\",\"mode\":\"test\",\"status\":\"0\",\"client_id\": \"\",\"client_secret\": \"\", \"source_code\":\"\"}\n','{\"gateway\":\"viva_wallet\",\"mode\":\"test\",\"status\":\"0\",\"client_id\": \"\",\"client_secret\": \"\", \"source_code\":\"\"}\n','payment_config','test',0,NULL,NULL,NULL),('998ccc62-d6a0-11ed-962c-0c7a158e4469','stripe','{\"gateway\":\"stripe\",\"mode\":\"test\",\"status\":\"1\",\"api_key\":\"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\",\"published_key\":\"pk_live_51RoLgBFa4cICSTgMFks5x4EBALEpY1IfA4QAnOo25ScrGrZwtYFpCfVI6jRoAiBcdaJU8YR4rWqsVOGWBcWjDEl000to2qNlRH\"}','{\"gateway\":\"stripe\",\"mode\":\"test\",\"status\":\"1\",\"api_key\":\"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\",\"published_key\":\"pk_live_51RoLgBFa4cICSTgMFks5x4EBALEpY1IfA4QAnOo25ScrGrZwtYFpCfVI6jRoAiBcdaJU8YR4rWqsVOGWBcWjDEl000to2qNlRH\"}','payment_config','test',1,NULL,'2025-07-25 01:29:47','{\"gateway_title\":\"Payment\",\"gateway_image\":\"2023-09-09-64fc1a1ebd052.png\",\"storage\":\"public\"}'),('a3313755-c95d-11ed-b1db-0c7a158e4469','iyzi_pay','{\"gateway\":\"iyzi_pay\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\",\"secret_key\":\"data\",\"base_url\":\"data\"}','{\"gateway\":\"iyzi_pay\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\",\"secret_key\":\"data\",\"base_url\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:20:02','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('a76c8993-d299-11ed-b485-0c7a158e4469','momo','{\"gateway\":\"momo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\",\"api_user\":\"data\",\"subscription_key\":\"data\"}','{\"gateway\":\"momo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\",\"api_user\":\"data\",\"subscription_key\":\"data\"}','payment_config','live',0,NULL,'2023-08-30 04:19:28','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('a8608119-cc76-11ed-9bca-0c7a158e4469','moncash','{\"gateway\":\"moncash\",\"mode\":\"test\",\"status\":\"0\",\"client_id\":\"data\",\"secret_key\":\"data\"}','{\"gateway\":\"moncash\",\"mode\":\"test\",\"status\":\"0\",\"client_id\":\"data\",\"secret_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:47:34','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('ad5af1c1-d6a2-11ed-962c-0c7a158e4469','razor_pay','{\"gateway\":\"razor_pay\",\"mode\":\"test\",\"status\":0,\"api_key\":null,\"api_secret\":null}','{\"gateway\":\"razor_pay\",\"mode\":\"test\",\"status\":0,\"api_key\":null,\"api_secret\":null}','payment_config','test',0,NULL,'2023-09-08 18:09:33','{\"gateway_title\":null,\"gateway_image\":\"2023-09-09-64fc1a2d3b25a.png\"}'),('ad5b02a0-d6a2-11ed-962c-0c7a158e4469','senang_pay','{\"gateway\":\"senang_pay\",\"mode\":\"test\",\"status\":0,\"callback_url\":null,\"secret_key\":null,\"merchant_id\":null}','{\"gateway\":\"senang_pay\",\"mode\":\"test\",\"status\":0,\"callback_url\":null,\"secret_key\":null,\"merchant_id\":null}','payment_config','test',0,NULL,'2023-09-08 18:09:51','{\"gateway_title\":null,\"gateway_image\":\"2023-09-09-64fc1a3fef9ea.png\"}'),('b6c333f6-d8e9-11ed-8249-0c7a158e4469','akandit_sms','{\"gateway\":\"akandit_sms\",\"mode\":\"live\",\"status\":0,\"username\":\"\",\"password\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"akandit_sms\",\"mode\":\"live\",\"status\":0,\"username\":\"\",\"password\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),('b6c33c87-d8e9-11ed-8249-0c7a158e4469','global_sms','{\"gateway\":\"global_sms\",\"mode\":\"live\",\"status\":0,\"user_name\":\"\",\"password\":\"\",\"from\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"global_sms\",\"mode\":\"live\",\"status\":0,\"user_name\":\"\",\"password\":\"\",\"from\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),('b8992bd4-d6a0-11ed-962c-0c7a158e4469','paymob_accept','{\"gateway\":\"paymob_accept\",\"mode\":\"live\",\"status\":0,\"callback_url\":null,\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}','{\"gateway\":\"paymob_accept\",\"mode\":\"live\",\"status\":0,\"callback_url\":null,\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}','payment_config','live',0,NULL,'2023-09-08 18:10:19','{\"gateway_title\":null,\"gateway_image\":\"2023-09-09-64fc1a5bb7958.png\"}'),('c41c0dcd-d119-11ed-9f67-0c7a158e4469','maxicash','{\"gateway\":\"maxicash\",\"mode\":\"test\",\"status\":\"0\",\"merchantId\":\"data\",\"merchantPassword\":\"data\"}','{\"gateway\":\"maxicash\",\"mode\":\"test\",\"status\":\"0\",\"merchantId\":\"data\",\"merchantPassword\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:49:15','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('c9249d17-cd60-11ed-b879-0c7a158e4469','pvit','{\"gateway\":\"pvit\",\"mode\":\"test\",\"status\":\"0\",\"mc_tel_merchant\": \"\",\"access_token\": \"\", \"mc_merchant_code\": \"\"}','{\"gateway\":\"pvit\",\"mode\":\"test\",\"status\":\"0\",\"mc_tel_merchant\": \"\",\"access_token\": \"\", \"mc_merchant_code\": \"\"}','payment_config','test',0,NULL,NULL,NULL),('cb0081ce-d775-11ed-96f4-0c7a158e4469','releans','{\"gateway\":\"releans\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"from\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"releans\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"from\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,'2023-04-10 02:14:44',NULL),('d4f3f5f1-d6a0-11ed-962c-0c7a158e4469','flutterwave','{\"gateway\":\"flutterwave\",\"mode\":\"test\",\"status\":0,\"secret_key\":null,\"public_key\":null,\"hash\":null}','{\"gateway\":\"flutterwave\",\"mode\":\"test\",\"status\":0,\"secret_key\":null,\"public_key\":null,\"hash\":null}','payment_config','test',0,NULL,'2023-09-08 18:10:44','{\"gateway_title\":null,\"gateway_image\":\"2023-09-09-64fc1a74e1c4a.png\"}'),('d822f1a5-c864-11ed-ac7a-0c7a158e4469','paystack','{\"gateway\":\"paystack\",\"mode\":\"test\",\"status\":0,\"public_key\":null,\"secret_key\":null,\"merchant_email\":null}','{\"gateway\":\"paystack\",\"mode\":\"test\",\"status\":0,\"public_key\":null,\"secret_key\":null,\"merchant_email\":null}','payment_config','test',0,NULL,'2023-09-08 18:11:02','{\"gateway_title\":null,\"gateway_image\":\"2023-09-09-64fc1a8629213.png\"}'),('daec8d59-c893-11ed-ac7a-0c7a158e4469','xendit','{\"gateway\":\"xendit\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\"}','{\"gateway\":\"xendit\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:35:46','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('dc0f5fc9-d6a5-11ed-962c-0c7a158e4469','worldpay','{\"gateway\":\"worldpay\",\"mode\":\"test\",\"status\":\"0\",\"OrgUnitId\":\"data\",\"jwt_issuer\":\"data\",\"mac\":\"data\",\"merchantCode\":\"data\",\"xml_password\":\"data\"}','{\"gateway\":\"worldpay\",\"mode\":\"test\",\"status\":\"0\",\"OrgUnitId\":\"data\",\"jwt_issuer\":\"data\",\"mac\":\"data\",\"merchantCode\":\"data\",\"xml_password\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:35:26','{\"gateway_title\":null,\"gateway_image\":\"\"}'),('e0450278-d8eb-11ed-8249-0c7a158e4469','signal_wire','{\"gateway\":\"signal_wire\",\"mode\":\"live\",\"status\":0,\"project_id\":\"\",\"token\":\"\",\"space_url\":\"\",\"from\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"signal_wire\",\"mode\":\"live\",\"status\":0,\"project_id\":\"\",\"token\":\"\",\"space_url\":\"\",\"from\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),('e0450b40-d8eb-11ed-8249-0c7a158e4469','paradox','{\"gateway\":\"paradox\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\"}','{\"gateway\":\"paradox\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\"}','sms_config','live',0,NULL,NULL,NULL),('ea346efe-cdda-11ed-affe-0c7a158e4469','ssl_commerz','{\"gateway\":\"ssl_commerz\",\"mode\":\"test\",\"status\":0,\"store_id\":null,\"store_password\":null}','{\"gateway\":\"ssl_commerz\",\"mode\":\"test\",\"status\":0,\"store_id\":null,\"store_password\":null}','payment_config','test',0,NULL,'2023-09-08 18:11:22','{\"gateway_title\":null,\"gateway_image\":\"2023-09-09-64fc1a9a82fad.png\"}'),('eed88336-d8ec-11ed-8249-0c7a158e4469','hubtel','{\"gateway\":\"hubtel\",\"mode\":\"live\",\"status\":0,\"sender_id\":\"\",\"client_id\":\"\",\"client_secret\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"hubtel\",\"mode\":\"live\",\"status\":0,\"sender_id\":\"\",\"client_id\":\"\",\"client_secret\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),('f149c546-d8ea-11ed-8249-0c7a158e4469','viatech','{\"gateway\":\"viatech\",\"mode\":\"live\",\"status\":0,\"api_url\":\"\",\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"viatech\",\"mode\":\"live\",\"status\":0,\"api_url\":\"\",\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),('f149cd9c-d8ea-11ed-8249-0c7a158e4469','019_sms','{\"gateway\":\"019_sms\",\"mode\":\"live\",\"status\":0,\"password\":\"\",\"username\":\"\",\"username_for_token\":\"\",\"sender\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"019_sms\",\"mode\":\"live\",\"status\":0,\"password\":\"\",\"username\":\"\",\"username_for_token\":\"\",\"sender\":\"\",\"otp_template\":\"\"}','sms_config','live',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `addon_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_features`
--

DROP TABLE IF EXISTS `admin_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_features`
--

LOCK TABLES `admin_features` WRITE;
/*!40000 ALTER TABLE `admin_features` DISABLE KEYS */;
INSERT INTO `admin_features` VALUES (1,'24h Support',NULL,'24/7 customer support service to support you.','2024-11-20-673ddcc68c215.png',1,'2023-09-08 15:29:24','2024-11-19 22:57:42'),(2,'Easy Payment',NULL,'Smart and easy payment system to maintain your business.','2024-11-20-673ddc9bea507.png',1,'2023-09-08 15:41:25','2024-11-19 22:56:59'),(3,'Fast Delivery',NULL,'Fastest delivery system to reach your customer.','2024-11-20-673ddc5ab89dd.png',1,'2023-09-08 15:42:02','2024-11-19 22:55:54'),(4,'Resonable Price',NULL,'Start your business in cheap cost. In your budget','2024-11-20-673ddc346f0f1.png',1,'2023-09-08 15:42:46','2024-11-19 22:55:16');
/*!40000 ALTER TABLE `admin_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Master Admin',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_special_criterias`
--

DROP TABLE IF EXISTS `admin_special_criterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_special_criterias` (
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_special_criterias`
--

LOCK TABLES `admin_special_criterias` WRITE;
/*!40000 ALTER TABLE `admin_special_criterias` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_special_criterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_testimonials`
--

DROP TABLE IF EXISTS `admin_testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reviewer_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_testimonials`
--

LOCK TABLES `admin_testimonials` WRITE;
/*!40000 ALTER TABLE `admin_testimonials` DISABLE KEYS */;
INSERT INTO `admin_testimonials` VALUES (1,'Jhon Doe','President of Sales','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!','2024-11-20-673ddeda95053.png',NULL,1,'2023-09-08 16:20:42','2024-11-19 23:06:34');
/*!40000 ALTER TABLE `admin_testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_wallets`
--

DROP TABLE IF EXISTS `admin_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint unsigned NOT NULL,
  `total_commission_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `digital_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `manual_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_wallets`
--

LOCK TABLES `admin_wallets` WRITE;
/*!40000 ALTER TABLE `admin_wallets` DISABLE KEYS */;
INSERT INTO `admin_wallets` VALUES (1,1,0.00,20.00,0.00,'2025-07-25 01:54:57','2025-07-25 01:54:57',0.00);
/*!40000 ALTER TABLE `admin_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint unsigned NOT NULL,
  `zone_id` bigint unsigned DEFAULT NULL,
  `is_logged_in` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Homeplate','App','+917991195087','admin@homeplate.life',NULL,'$2y$10$vEOSZz1mpkGl1BcOPdHdFemzVVzxvy0emtiGigsKwsZJsCPLsgo3K',NULL,'2025-07-22 22:50:07','2025-07-23 05:23:15',1,NULL,1);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisements`
--

DROP TABLE IF EXISTS `advertisements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint unsigned NOT NULL,
  `add_type` enum('video_promotion','restaurant_promotion') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'restaurant_promotion',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `pause_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancellation_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `is_rating_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_review_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_updated` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` bigint unsigned NOT NULL,
  `created_by_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','running','approved','expired','denied','paused') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisements`
--

LOCK TABLES `advertisements` WRITE;
/*!40000 ALTER TABLE `advertisements` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergies`
--

DROP TABLE IF EXISTS `allergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `allergy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergies`
--

LOCK TABLES `allergies` WRITE;
/*!40000 ALTER TABLE `allergies` DISABLE KEYS */;
/*!40000 ALTER TABLE `allergies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergy_food`
--

DROP TABLE IF EXISTS `allergy_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergy_food` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `food_id` bigint unsigned NOT NULL,
  `allergy_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergy_food`
--

LOCK TABLES `allergy_food` WRITE;
/*!40000 ALTER TABLE `allergy_food` DISABLE KEYS */;
/*!40000 ALTER TABLE `allergy_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `data` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_settings`
--

DROP TABLE IF EXISTS `business_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_settings`
--

LOCK TABLES `business_settings` WRITE;
/*!40000 ALTER TABLE `business_settings` DISABLE KEYS */;
INSERT INTO `business_settings` VALUES (1,'cash_on_delivery','{\"status\":\"1\"}','2021-05-11 03:56:38','2021-09-09 22:27:34'),(2,'stripe','{\"status\":\"0\",\"api_key\":null,\"published_key\":null}','2021-05-11 03:57:02','2021-09-09 22:28:18'),(4,'mail_config','{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}',NULL,'2023-09-06 23:04:39'),(5,'fcm_project_id','homeplate-vr',NULL,'2025-07-22 23:40:54'),(6,'push_notification_key',NULL,NULL,NULL),(7,'order_pending_message','{\"status\":0,\"message\":null}',NULL,NULL),(8,'order_confirmation_msg','{\"status\":0,\"message\":null}',NULL,NULL),(9,'order_processing_message','{\"status\":0,\"message\":null}',NULL,NULL),(10,'out_for_delivery_message','{\"status\":0,\"message\":null}',NULL,NULL),(11,'order_delivered_message','{\"status\":0,\"message\":null}',NULL,NULL),(12,'delivery_boy_assign_message','{\"status\":0,\"message\":null}',NULL,NULL),(13,'delivery_boy_start_message','{\"status\":0,\"message\":null}',NULL,NULL),(14,'delivery_boy_delivered_message','{\"status\":0,\"message\":null}',NULL,NULL),(15,'terms_and_conditions',NULL,NULL,'2021-06-29 06:44:49'),(16,'business_name','HomePlate',NULL,'2025-07-23 05:38:02'),(17,'currency','SGD',NULL,'2025-07-23 05:38:02'),(18,'logo','2024-11-20-673ddfe2754d3.png',NULL,NULL),(19,'phone','+6586735769',NULL,'2025-07-23 05:38:02'),(20,'email_address','homeplatesg@gmail.com',NULL,'2025-07-23 05:38:03'),(21,'address','306 Tanglin Rd, Singapore 247973',NULL,'2025-07-23 05:38:03'),(22,'footer_text','Footer Text',NULL,NULL),(23,'customer_verification',NULL,NULL,NULL),(24,'map_api_key','AIzaSyCQ4ZZN-vhn-xwBIU7ZC-yJHKDFGqHb96M',NULL,'2025-07-23 04:03:19'),(25,'privacy_policy',NULL,NULL,'2021-06-28 09:46:55'),(26,'about_us',NULL,NULL,'2021-06-29 06:43:25'),(27,'minimum_shipping_charge','0',NULL,NULL),(28,'per_km_shipping_charge','0',NULL,NULL),(29,'ssl_commerz_payment','{\"status\":\"0\",\"store_id\":null,\"store_password\":null}','2021-07-04 08:52:20','2021-09-09 22:28:30'),(30,'razor_pay','{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}','2021-07-04 08:53:04','2021-09-09 22:28:25'),(31,'digital_payment','{\"status\":\"1\"}','2021-07-04 08:53:10','2021-10-16 03:11:55'),(32,'paypal','{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}','2021-07-04 08:53:18','2021-09-09 22:28:36'),(33,'paystack','{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":null,\"merchantEmail\":null}','2021-07-04 09:14:07','2021-10-16 03:12:17'),(34,'senang_pay','{\"status\":null,\"secret_key\":null,\"published_key\":null,\"merchant_id\":null}','2021-07-04 09:14:13','2021-09-09 22:28:04'),(35,'order_handover_message','{\"status\":0,\"message\":null}',NULL,NULL),(36,'order_cancled_message','{\"status\":0,\"message\":null}',NULL,NULL),(37,'timezone','Asia/Kuala_Lumpur',NULL,'2025-07-23 05:38:02'),(38,'order_delivery_verification','1',NULL,NULL),(39,'currency_symbol_position','right',NULL,NULL),(40,'schedule_order','1',NULL,NULL),(41,'app_minimum_version','0',NULL,NULL),(42,'tax',NULL,NULL,NULL),(43,'admin_commission','0',NULL,NULL),(44,'country','SG',NULL,'2025-07-23 05:38:03'),(45,'app_url','up_comming',NULL,NULL),(46,'default_location','{\"lat\":\"1.2975264986905133\",\"lng\":\"103.81419149090453\"}',NULL,'2025-07-23 05:38:03'),(47,'twilio_sms','{\"status\":\"0\",\"sid\":null,\"messaging_service_id\":null,\"token\":null,\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}','2021-10-16 03:10:30','2021-10-16 03:10:30'),(48,'nexmo_sms','{\"status\":\"0\",\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}','2021-10-16 03:10:22','2021-10-16 03:10:22'),(49,'2factor_sms','{\"status\":\"0\",\"api_key\":\"Your otp is #OTP#.\"}','2021-10-16 03:10:36','2021-10-16 03:10:36'),(50,'msg91_sms','{\"status\":\"0\",\"template_id\":null,\"authkey\":null}','2021-10-16 03:09:59','2021-10-16 03:09:59'),(51,'admin_order_notification','1',NULL,NULL),(52,'free_delivery_over',NULL,NULL,NULL),(53,'maintenance_mode','0','2021-09-09 21:33:55','2021-09-09 21:33:58'),(54,'app_minimum_version_android',NULL,NULL,NULL),(55,'app_minimum_version_ios',NULL,NULL,NULL),(56,'app_url_android',NULL,NULL,NULL),(57,'app_url_ios',NULL,NULL,NULL),(58,'dm_maximum_orders','5',NULL,NULL),(59,'flutterwave','{\"status\":\"1\",\"public_key\":null,\"secret_key\":null,\"hash\":null}','2021-09-23 06:51:28','2021-10-16 03:12:01'),(60,'order_confirmation_model','deliveryman',NULL,NULL),(61,'mercadopago','{\"status\":null,\"public_key\":null,\"access_token\":null}',NULL,'2021-10-16 03:12:09'),(62,'popular_food','1',NULL,NULL),(63,'popular_restaurant','1',NULL,NULL),(64,'new_restaurant','1',NULL,NULL),(65,'landing_page_text','{\"header_title_1\":\"Food App\",\"header_title_2\":\"Why stay hungry when you can order from StackFood\",\"header_title_3\":\"Get 10% OFF on your first order\",\"about_title\":\"StackFood is Best Delivery Service Near You\",\"why_choose_us\":\"Why Choose Us?\",\"why_choose_us_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"testimonial_title\":\"Trusted by Customer & Restaurant Owner\",\"footer_article\":\"Suspendisse ultrices at diam lectus nullam. Nisl, sagittis viverra enim erat tortor ultricies massa turpis. Arcu pulvinar.\"}','2021-10-31 15:21:57','2021-10-31 15:21:57'),(66,'landing_page_links','{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https:\\/\\/stackfood.6amtech.com\\/\"}','2021-10-31 15:21:57','2021-10-31 15:21:57'),(67,'speciality','[{\"img\":\"clean_&_cheap_icon.png\",\"title\":\"Clean & Cheap Price\"},{\"img\":\"best_dishes_icon.png\",\"title\":\"Best Dishes Near You\"},{\"img\":\"virtual_restaurant_icon.png\",\"title\":\"Your Own Virtual Restaurant\"}]','2021-10-31 15:21:57','2021-10-31 15:21:57'),(68,'testimonial','[{\"img\":\"2021-10-28-617aa5a9e4b4a.png\",\"name\":\"Barry Allen\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A\\r\\n                    aliquam amet animi blanditiis consequatur debitis dicta\\r\\n                    distinctio, enim error eum iste libero modi nam natus\\r\\n                    perferendis possimus quasi sint sit tempora voluptatem. Est,\\r\\n                    exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9b13c57b.png\",\"name\":\"Sophia Martino\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9db9752d.png\",\"name\":\"Alan Turing\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9faa8c78.png\",\"name\":\"Ann Marie\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"}]','2021-10-31 15:21:57','2021-10-31 15:21:57'),(69,'most_reviewed_foods','1',NULL,NULL),(70,'paymob_accept','{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}',NULL,'2021-11-12 21:02:39'),(71,'timeformat','24',NULL,NULL),(72,'canceled_by_restaurant','0',NULL,NULL),(73,'canceled_by_deliveryman','0',NULL,NULL),(74,'show_dm_earning',NULL,NULL,NULL),(75,'toggle_veg_non_veg','1',NULL,NULL),(76,'toggle_dm_registration','1',NULL,'2025-07-23 21:14:06'),(77,'toggle_restaurant_registration','1',NULL,'2025-07-23 20:39:46'),(78,'recaptcha','{\"status\":\"0\",\"site_key\":null,\"secret_key\":null}','2022-01-09 20:03:59','2022-01-09 20:03:59'),(79,'language','[\"en\"]',NULL,NULL),(80,'schedule_order_slot_duration','0',NULL,NULL),(81,'digit_after_decimal_point','2',NULL,NULL),(82,'icon','2024-11-20-673ddfe277380.png',NULL,NULL),(83,'delivery_charge_comission','0','2022-07-03 17:07:00','2022-07-03 17:07:00'),(84,'dm_max_cash_in_hand','10000','2022-07-03 17:07:00','2022-07-03 17:07:00'),(85,'theme','1','2022-07-03 17:37:00','2022-07-03 17:37:00'),(86,'dm_tips_status',NULL,NULL,NULL),(87,'wallet_status','0',NULL,NULL),(88,'loyalty_point_status','0',NULL,NULL),(89,'ref_earning_status','0',NULL,NULL),(90,'wallet_add_refund','0',NULL,NULL),(91,'loyalty_point_exchange_rate','0',NULL,NULL),(92,'ref_earning_exchange_rate','0',NULL,NULL),(93,'loyalty_point_item_purchase_point','0',NULL,NULL),(94,'loyalty_point_minimum_point','0',NULL,NULL),(95,'order_refunded_message','{\"status\":0,\"message\":null}',NULL,NULL),(96,'fcm_credentials','{\"apiKey\":\"AIzaSyDuT_VKzAa2_mN_-aDCfwe3sLhavUdsVuI\",\"authDomain\":\"homeplate-vr.firebaseapp.com\",\"projectId\":\"homeplate-vr\",\"storageBucket\":\"homeplate-vr.firebasestorage.app\",\"messagingSenderId\":\"485022874761\",\"appId\":\"1:485022874761:web:768b68fc8d31ee89ff9a58\",\"measurementId\":\"G-HSELNM15NC\"}',NULL,'2025-07-22 23:40:54'),(97,'feature','[]',NULL,NULL),(98,'tax_included',NULL,'2023-03-20 04:07:28','2023-03-20 04:07:28'),(99,'site_direction','ltr','2023-03-20 04:07:28','2023-03-20 04:07:28'),(100,'system_language','[{\"id\":1,\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":true}]','2023-07-10 00:56:39','2023-07-10 00:56:39'),(101,'take_away','1','2023-07-10 00:56:39','2023-07-10 00:56:39'),(102,'repeat_order_option','1','2023-07-10 00:56:39','2023-07-10 00:56:39'),(103,'home_delivery','1','2023-07-10 00:56:39','2023-07-10 00:56:39'),(104,'refund_active_status','1','2023-07-10 00:56:58','2023-07-10 00:56:58'),(105,'business_model','{\"commission\":1,\"subscription\":0}','2023-07-10 00:56:58','2023-07-10 00:56:58'),(106,'cookies_text','Cookies',NULL,NULL),(107,'social_login','[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"0\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]','2023-09-06 23:04:50','2023-09-06 23:04:50'),(108,'apple_login','[{\"login_medium\":\"apple\",\"client_id\":\"\",\"client_secret\":\"\",\"team_id\":\"\",\"key_id\":\"\",\"service_file\":\"\",\"redirect_url\":\"\",\"status\":\"\"}]','2023-09-06 23:04:50','2023-09-06 23:04:50'),(109,'order_notification_type','firebase',NULL,'2025-07-23 05:38:02'),(110,'additional_charge_status',NULL,NULL,NULL),(111,'additional_charge_name','Additional Charge',NULL,NULL),(112,'additional_charge',NULL,NULL,NULL),(113,'partial_payment_status',NULL,NULL,NULL),(114,'partial_payment_method','both',NULL,NULL),(115,'dm_picture_upload_status',NULL,NULL,NULL),(116,'add_fund_status','0',NULL,NULL),(117,'landing_page','1','2023-09-08 15:23:08','2023-09-08 15:23:08'),(118,'check_subscription_validity_on','2025-07-26','2023-09-08 16:46:14','2025-07-26 10:51:11'),(119,'check_daily_subscription_validity_check','2025-07-26','2024-10-18 20:55:27','2025-07-26 10:30:44'),(120,'guest_checkout_status','0',NULL,NULL),(121,'country_picker_status','1',NULL,NULL),(122,'free_delivery_distance',NULL,NULL,NULL),(123,'check_daily_stock_on','2024-11-20','2024-10-18 20:57:20','2024-11-19 23:13:37'),(124,'instant_order','1',NULL,NULL),(125,'customer_date_order_sratus','0',NULL,NULL),(126,'customer_order_date','0',NULL,NULL),(127,'order_subscription',NULL,NULL,NULL),(128,'schedule_order_slot_duration_time_formate','min',NULL,NULL),(129,'manual_login_status','1',NULL,NULL),(130,'otp_login_status','0',NULL,NULL),(131,'social_login_status','0',NULL,NULL),(132,'google_login_status','0',NULL,NULL),(133,'facebook_login_status','0',NULL,NULL),(134,'apple_login_status','0',NULL,NULL),(135,'email_verification_status','0',NULL,NULL),(136,'phone_verification_status','0',NULL,NULL),(137,'push_notification_service_file_content','{\r\n  \"type\": \"service_account\",\r\n  \"project_id\": \"homeplate-vr\",\r\n  \"private_key_id\": \"0686af614c08e2d3e38217536b9586989d60c8c8\",\r\n  \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCvNeYKNivm6IJ6\\n/utHDomZ4skKA5441XgvSQzH8bEmXQVkAdBzrTPb1uTcK0PbE1Xbx6lHiHy7lHyE\\n5ff9dp0yuZtYYYz5EBaw5fHaRQi9IZTQMs6l6AyMYV97YAOdG4mQl6DFUK4+nR8I\\n42HLa3QTPz2GuzUeOQA2qBJQYezUdpJY2ELkat19NALM0JXCVpfY1L8XY890TOpW\\nfuEZxQu7QC9MxN38oVhFGdtYCnStfPv96MEpzCaR9aMDxvSRNwj6FKrHgKNEQaah\\nWOQuN+LwODvWHIlAf0mhOHaLupof4SQ98GlAnrEOqMQTny+hPXIfMIayRT8FgEto\\nFNeIi6UPAgMBAAECggEAAO7bi8BgGXmxgDAtVpKIPw6LHYeJZyoT2sSb0dDCrb6f\\nEbpEvuj0Nr59N4LveJIwydvVVfEvINyYkSicWngwPB3q6tySIJ1qUYTX9d6aPk+Y\\neEdc/Fsw/epi1MhdHJAR+ngkPgjA9MpnaOe1FJ084AFdNYN3s/J/wsrAVjc/SJ5a\\nxMiygW0GxSQEkeGpV+X+UMQgB4TF5rNLYcgtRCI5ZZylhAx21OyGlUldcfOh1096\\nR/MVXfpskCt5C8+jIhh2SX/onr5TyetECoVt1dGGm7yT962CY7gA9jB6EruIbzaJ\\n/qo0ISHIMIVMWaozPYzC3SnipUWDwontAXi3wao7OQKBgQDgGVgz3IGwprmQKAnq\\no4+8vg0wv8TIxZMnBefmREhKcWt+X8ta8ybVwpWayPEyDL2ChbBErOrz2v7vqtm/\\nEl9iBsPQkY4Ot4teClBdIksOWphY+OU/mcNWGR71u1UpYs9+rDVaDItiwLGec+dV\\nsTgPJgyh+rJgYkfsfAz+V22ovQKBgQDIJvO+QLxJUpl32idUJ1UAsNQtC3rGhMVw\\nXtmx/LzqfGmAvJOjwsxK5lBeZrK4CKyz1pPxznQ9SCzSrj9nkjX/AGArJ1DQhJpw\\nW0Xh0nIEzfggSuUVZ1zT2TL75H2GMnPJXMV6yQu8HHYkLxXP2gOdtdcDaPgSrbhW\\nj88zInSfuwKBgDlt5U+tE8NMhsNtr1TlQ6Gv5rt2eZymHVbjyZEWMJx7QnvpWrjd\\nFTe0nRhEpKMZ5rr7PbfrxG5n0etjklfIAo+hgi8CDjCxUtLvu7aSYj+0cdRjPIS3\\nB/sZhvicYG+xtdEVmrqP+mx9S0d7Fm68csxXCOe90lam+R2ekMnhZ+XVAoGAEalW\\nQsiFlNbEEg5fAA8Eci4oWt0zdUcMARFtlkYeCXb2/FQnlwC+dDGEj//x70lcq/XY\\nUjMMkMfIpMKZd7MwLpNC6Svr9qps0lNLhFTEmOXv6jGRq2TWjR8SX6XW6buT+gXE\\nq0QIVA4S4riA7Tlorkb4dSWTFlrb9E92UiXNMrcCgYEAy6IwwWmS748SUrix4TWH\\nvfz6GlTa0OgNe1eNQ/kAxdAJlNIGyrQ7/2KgfTvozvkc0UOYNjTZvGd92dAYQojL\\nxtpm1BTsBRXAhqFTWyzVdC7CNEMyS0cz0LnkOTcdFIHNu6Rya49tRLVVES6+VZRg\\nO4q70BwucnNuswCQRyowUgo=\\n-----END PRIVATE KEY-----\\n\",\r\n  \"client_email\": \"firebase-adminsdk-fbsvc@homeplate-vr.iam.gserviceaccount.com\",\r\n  \"client_id\": \"116781834278339101016\",\r\n  \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\",\r\n  \"token_uri\": \"https://oauth2.googleapis.com/token\",\r\n  \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\",\r\n  \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40homeplate-vr.iam.gserviceaccount.com\",\r\n  \"universe_domain\": \"googleapis.com\"\r\n}','2025-07-22 23:40:53','2025-07-22 23:40:53'),(138,'map_api_key_server','AIzaSyCQ4ZZN-vhn-xwBIU7ZC-yJHKDFGqHb96M','2025-07-23 04:03:19','2025-07-23 04:03:19'),(139,'admin_free_delivery_status',NULL,'2025-07-23 05:38:03','2025-07-23 05:38:03'),(140,'admin_free_delivery_option',NULL,'2025-07-23 05:38:03','2025-07-23 05:38:03'),(141,'cash_in_hand_overflow_restaurant','0','2025-07-23 20:39:45','2025-07-23 20:39:45'),(142,'cash_in_hand_overflow_restaurant_amount',NULL,'2025-07-23 20:39:46','2025-07-23 20:39:46'),(143,'min_amount_to_pay_restaurant',NULL,'2025-07-23 20:39:46','2025-07-23 20:39:46'),(144,'restaurant_review_reply',NULL,'2025-07-23 20:39:46','2025-07-23 20:39:46'),(145,'extra_packaging_charge','0','2025-07-23 20:39:46','2025-07-23 20:39:46'),(146,'min_amount_to_pay_dm',NULL,'2025-07-23 21:14:06','2025-07-23 21:14:06'),(147,'cash_in_hand_overflow_delivery_man','0','2025-07-23 21:14:06','2025-07-23 21:14:06');
/*!40000 ALTER TABLE `business_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('stackfood1753249739app_envlive_cache0a9570aef91eca04c7a8caeae1902765','i:12;',1753499142),('stackfood1753249739app_envlive_cache0a9570aef91eca04c7a8caeae1902765:timer','i:1753499142;',1753499142),('stackfood1753249739app_envlive_cache1a95d51eeb4157c7e66b1789f533561b','i:16;',1753411050),('stackfood1753249739app_envlive_cache1a95d51eeb4157c7e66b1789f533561b:timer','i:1753411050;',1753411050),('stackfood1753249739app_envlive_cache2387844986fc815280421e15821acfbc','i:4;',1753267944),('stackfood1753249739app_envlive_cache2387844986fc815280421e15821acfbc:timer','i:1753267944;',1753267944),('stackfood1753249739app_envlive_cache431122a3b4981e9ec9b740816636cbd1','i:6;',1753439411),('stackfood1753249739app_envlive_cache431122a3b4981e9ec9b740816636cbd1:timer','i:1753439411;',1753439411),('stackfood1753249739app_envlive_cache55d517658d01cbd79379d0be579c6821','i:1;',1753314479),('stackfood1753249739app_envlive_cache55d517658d01cbd79379d0be579c6821:timer','i:1753314479;',1753314479),('stackfood1753249739app_envlive_cache70a23ed3b9be30a7c3532816b3628082','i:5;',1753411056),('stackfood1753249739app_envlive_cache70a23ed3b9be30a7c3532816b3628082:timer','i:1753411056;',1753411056),('stackfood1753249739app_envlive_cacheadvertisements_beb4dbf9af069aa2df7b147229965085','O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}',1753499562),('stackfood1753249739app_envlive_cachebanners_beb4dbf9af069aa2df7b147229965085','a:0:{}',1753499562),('stackfood1753249739app_envlive_cachebusiness_settings_all_data','O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:146:{i:0;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:16:\"cash_on_delivery\";s:5:\"value\";s:14:\"{\"status\":\"1\"}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:16:\"cash_on_delivery\";s:5:\"value\";s:14:\"{\"status\":\"1\"}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:1;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:6:\"stripe\";s:5:\"value\";s:50:\"{\"status\":\"0\",\"api_key\":null,\"published_key\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:6:\"stripe\";s:5:\"value\";s:50:\"{\"status\":\"0\",\"api_key\":null,\"published_key\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:2;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:11:\"mail_config\";s:5:\"value\";s:112:\"{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:11:\"mail_config\";s:5:\"value\";s:112:\"{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:3;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:14:\"fcm_project_id\";s:5:\"value\";s:12:\"homeplate-vr\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:14:\"fcm_project_id\";s:5:\"value\";s:12:\"homeplate-vr\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:4;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:21:\"push_notification_key\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:21:\"push_notification_key\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:5;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:21:\"order_pending_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:21:\"order_pending_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:6;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:22:\"order_confirmation_msg\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:22:\"order_confirmation_msg\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:7;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:24:\"order_processing_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:24:\"order_processing_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:8;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:24:\"out_for_delivery_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:24:\"out_for_delivery_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:9;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:23:\"order_delivered_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:23:\"order_delivered_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:10;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:27:\"delivery_boy_assign_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:27:\"delivery_boy_assign_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:11;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:26:\"delivery_boy_start_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:26:\"delivery_boy_start_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:12;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:30:\"delivery_boy_delivered_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:30:\"delivery_boy_delivered_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:13;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:20:\"terms_and_conditions\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:20:\"terms_and_conditions\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:14;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:13:\"business_name\";s:5:\"value\";s:9:\"HomePlate\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:13:\"business_name\";s:5:\"value\";s:9:\"HomePlate\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:15;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:8:\"currency\";s:5:\"value\";s:3:\"SGD\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:8:\"currency\";s:5:\"value\";s:3:\"SGD\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:16;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:4:\"logo\";s:5:\"value\";s:28:\"2024-11-20-673ddfe2754d3.png\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:4:\"logo\";s:5:\"value\";s:28:\"2024-11-20-673ddfe2754d3.png\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:17;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:5:\"phone\";s:5:\"value\";s:11:\"+6586735769\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:5:\"phone\";s:5:\"value\";s:11:\"+6586735769\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:18;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:13:\"email_address\";s:5:\"value\";s:21:\"homeplatesg@gmail.com\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:13:\"email_address\";s:5:\"value\";s:21:\"homeplatesg@gmail.com\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:19;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:7:\"address\";s:5:\"value\";s:32:\"306 Tanglin Rd, Singapore 247973\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:7:\"address\";s:5:\"value\";s:32:\"306 Tanglin Rd, Singapore 247973\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:20;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:11:\"footer_text\";s:5:\"value\";s:11:\"Footer Text\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:11:\"footer_text\";s:5:\"value\";s:11:\"Footer Text\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:21;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:21:\"customer_verification\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:21:\"customer_verification\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:22;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:11:\"map_api_key\";s:5:\"value\";s:39:\"AIzaSyCQ4ZZN-vhn-xwBIU7ZC-yJHKDFGqHb96M\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:11:\"map_api_key\";s:5:\"value\";s:39:\"AIzaSyCQ4ZZN-vhn-xwBIU7ZC-yJHKDFGqHb96M\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:23;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:14:\"privacy_policy\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:14:\"privacy_policy\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:24;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:8:\"about_us\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:8:\"about_us\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:25;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:23:\"minimum_shipping_charge\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:23:\"minimum_shipping_charge\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:26;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:22:\"per_km_shipping_charge\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:22:\"per_km_shipping_charge\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:27;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:19:\"ssl_commerz_payment\";s:5:\"value\";s:52:\"{\"status\":\"0\",\"store_id\":null,\"store_password\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:19:\"ssl_commerz_payment\";s:5:\"value\";s:52:\"{\"status\":\"0\",\"store_id\":null,\"store_password\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:28;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:9:\"razor_pay\";s:5:\"value\";s:51:\"{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:9:\"razor_pay\";s:5:\"value\";s:51:\"{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:29;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:15:\"digital_payment\";s:5:\"value\";s:14:\"{\"status\":\"1\"}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:15:\"digital_payment\";s:5:\"value\";s:14:\"{\"status\":\"1\"}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:30;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:6:\"paypal\";s:5:\"value\";s:59:\"{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:6:\"paypal\";s:5:\"value\";s:59:\"{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:31;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:8:\"paystack\";s:5:\"value\";s:87:\"{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":null,\"merchantEmail\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:8:\"paystack\";s:5:\"value\";s:87:\"{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":null,\"merchantEmail\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:32;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:10:\"senang_pay\";s:5:\"value\";s:73:\"{\"status\":null,\"secret_key\":null,\"published_key\":null,\"merchant_id\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:10:\"senang_pay\";s:5:\"value\";s:73:\"{\"status\":null,\"secret_key\":null,\"published_key\":null,\"merchant_id\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:33;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:22:\"order_handover_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:22:\"order_handover_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:34;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:21:\"order_cancled_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:21:\"order_cancled_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:35;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:8:\"timezone\";s:5:\"value\";s:17:\"Asia/Kuala_Lumpur\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:8:\"timezone\";s:5:\"value\";s:17:\"Asia/Kuala_Lumpur\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:36;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:27:\"order_delivery_verification\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:27:\"order_delivery_verification\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:37;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:24:\"currency_symbol_position\";s:5:\"value\";s:5:\"right\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:24:\"currency_symbol_position\";s:5:\"value\";s:5:\"right\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:38;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:14:\"schedule_order\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:14:\"schedule_order\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:39;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:19:\"app_minimum_version\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:19:\"app_minimum_version\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:40;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:3:\"tax\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:3:\"tax\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:41;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:16:\"admin_commission\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:16:\"admin_commission\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:42;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:7:\"country\";s:5:\"value\";s:2:\"SG\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:7:\"country\";s:5:\"value\";s:2:\"SG\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:43;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:7:\"app_url\";s:5:\"value\";s:10:\"up_comming\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:7:\"app_url\";s:5:\"value\";s:10:\"up_comming\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:44;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:16:\"default_location\";s:5:\"value\";s:55:\"{\"lat\":\"1.2975264986905133\",\"lng\":\"103.81419149090453\"}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:16:\"default_location\";s:5:\"value\";s:55:\"{\"lat\":\"1.2975264986905133\",\"lng\":\"103.81419149090453\"}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:45;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:10:\"twilio_sms\";s:5:\"value\";s:114:\"{\"status\":\"0\",\"sid\":null,\"messaging_service_id\":null,\"token\":null,\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:10:\"twilio_sms\";s:5:\"value\";s:114:\"{\"status\":\"0\",\"sid\":null,\"messaging_service_id\":null,\"token\":null,\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:46;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:9:\"nexmo_sms\";s:5:\"value\";s:154:\"{\"status\":\"0\",\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:9:\"nexmo_sms\";s:5:\"value\";s:154:\"{\"status\":\"0\",\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:47;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:11:\"2factor_sms\";s:5:\"value\";s:45:\"{\"status\":\"0\",\"api_key\":\"Your otp is #OTP#.\"}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:11:\"2factor_sms\";s:5:\"value\";s:45:\"{\"status\":\"0\",\"api_key\":\"Your otp is #OTP#.\"}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:48;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:9:\"msg91_sms\";s:5:\"value\";s:48:\"{\"status\":\"0\",\"template_id\":null,\"authkey\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:9:\"msg91_sms\";s:5:\"value\";s:48:\"{\"status\":\"0\",\"template_id\":null,\"authkey\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:49;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:24:\"admin_order_notification\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:24:\"admin_order_notification\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:50;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:18:\"free_delivery_over\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:18:\"free_delivery_over\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:51;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:16:\"maintenance_mode\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:16:\"maintenance_mode\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:52;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:27:\"app_minimum_version_android\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:27:\"app_minimum_version_android\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:53;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:23:\"app_minimum_version_ios\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:23:\"app_minimum_version_ios\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:54;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:15:\"app_url_android\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:15:\"app_url_android\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:55;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:11:\"app_url_ios\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:11:\"app_url_ios\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:56;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:17:\"dm_maximum_orders\";s:5:\"value\";s:1:\"5\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:17:\"dm_maximum_orders\";s:5:\"value\";s:1:\"5\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:57;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:11:\"flutterwave\";s:5:\"value\";s:62:\"{\"status\":\"1\",\"public_key\":null,\"secret_key\":null,\"hash\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:11:\"flutterwave\";s:5:\"value\";s:62:\"{\"status\":\"1\",\"public_key\":null,\"secret_key\":null,\"hash\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:58;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:24:\"order_confirmation_model\";s:5:\"value\";s:11:\"deliveryman\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:24:\"order_confirmation_model\";s:5:\"value\";s:11:\"deliveryman\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:59;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:11:\"mercadopago\";s:5:\"value\";s:53:\"{\"status\":null,\"public_key\":null,\"access_token\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:11:\"mercadopago\";s:5:\"value\";s:53:\"{\"status\":null,\"public_key\":null,\"access_token\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:60;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:12:\"popular_food\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:12:\"popular_food\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:61;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:18:\"popular_restaurant\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:18:\"popular_restaurant\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:62;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:14:\"new_restaurant\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:14:\"new_restaurant\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:63;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:17:\"landing_page_text\";s:5:\"value\";s:526:\"{\"header_title_1\":\"Food App\",\"header_title_2\":\"Why stay hungry when you can order from StackFood\",\"header_title_3\":\"Get 10% OFF on your first order\",\"about_title\":\"StackFood is Best Delivery Service Near You\",\"why_choose_us\":\"Why Choose Us?\",\"why_choose_us_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"testimonial_title\":\"Trusted by Customer & Restaurant Owner\",\"footer_article\":\"Suspendisse ultrices at diam lectus nullam. Nisl, sagittis viverra enim erat tortor ultricies massa turpis. Arcu pulvinar.\"}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:17:\"landing_page_text\";s:5:\"value\";s:526:\"{\"header_title_1\":\"Food App\",\"header_title_2\":\"Why stay hungry when you can order from StackFood\",\"header_title_3\":\"Get 10% OFF on your first order\",\"about_title\":\"StackFood is Best Delivery Service Near You\",\"why_choose_us\":\"Why Choose Us?\",\"why_choose_us_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"testimonial_title\":\"Trusted by Customer & Restaurant Owner\",\"footer_article\":\"Suspendisse ultrices at diam lectus nullam. Nisl, sagittis viverra enim erat tortor ultricies massa turpis. Arcu pulvinar.\"}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:64;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:18:\"landing_page_links\";s:5:\"value\";s:227:\"{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https:\\/\\/stackfood.6amtech.com\\/\"}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:18:\"landing_page_links\";s:5:\"value\";s:227:\"{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https:\\/\\/stackfood.6amtech.com\\/\"}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:65;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:10:\"speciality\";s:5:\"value\";s:202:\"[{\"img\":\"clean_&_cheap_icon.png\",\"title\":\"Clean & Cheap Price\"},{\"img\":\"best_dishes_icon.png\",\"title\":\"Best Dishes Near You\"},{\"img\":\"virtual_restaurant_icon.png\",\"title\":\"Your Own Virtual Restaurant\"}]\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:10:\"speciality\";s:5:\"value\";s:202:\"[{\"img\":\"clean_&_cheap_icon.png\",\"title\":\"Clean & Cheap Price\"},{\"img\":\"best_dishes_icon.png\",\"title\":\"Best Dishes Near You\"},{\"img\":\"virtual_restaurant_icon.png\",\"title\":\"Your Own Virtual Restaurant\"}]\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:66;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:11:\"testimonial\";s:5:\"value\";s:1662:\"[{\"img\":\"2021-10-28-617aa5a9e4b4a.png\",\"name\":\"Barry Allen\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A\\r\\n                    aliquam amet animi blanditiis consequatur debitis dicta\\r\\n                    distinctio, enim error eum iste libero modi nam natus\\r\\n                    perferendis possimus quasi sint sit tempora voluptatem. Est,\\r\\n                    exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9b13c57b.png\",\"name\":\"Sophia Martino\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9db9752d.png\",\"name\":\"Alan Turing\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9faa8c78.png\",\"name\":\"Ann Marie\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"}]\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:11:\"testimonial\";s:5:\"value\";s:1662:\"[{\"img\":\"2021-10-28-617aa5a9e4b4a.png\",\"name\":\"Barry Allen\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A\\r\\n                    aliquam amet animi blanditiis consequatur debitis dicta\\r\\n                    distinctio, enim error eum iste libero modi nam natus\\r\\n                    perferendis possimus quasi sint sit tempora voluptatem. Est,\\r\\n                    exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9b13c57b.png\",\"name\":\"Sophia Martino\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9db9752d.png\",\"name\":\"Alan Turing\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9faa8c78.png\",\"name\":\"Ann Marie\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"}]\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:67;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:19:\"most_reviewed_foods\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:19:\"most_reviewed_foods\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:68;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:13:\"paymob_accept\";s:5:\"value\";s:80:\"{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:13:\"paymob_accept\";s:5:\"value\";s:80:\"{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:69;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:10:\"timeformat\";s:5:\"value\";s:2:\"24\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:10:\"timeformat\";s:5:\"value\";s:2:\"24\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:70;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:22:\"canceled_by_restaurant\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:22:\"canceled_by_restaurant\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:71;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:23:\"canceled_by_deliveryman\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:23:\"canceled_by_deliveryman\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:72;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:15:\"show_dm_earning\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:15:\"show_dm_earning\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:73;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:18:\"toggle_veg_non_veg\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:18:\"toggle_veg_non_veg\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:74;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:22:\"toggle_dm_registration\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:22:\"toggle_dm_registration\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:75;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:30:\"toggle_restaurant_registration\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:30:\"toggle_restaurant_registration\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:76;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:9:\"recaptcha\";s:5:\"value\";s:48:\"{\"status\":\"0\",\"site_key\":null,\"secret_key\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:9:\"recaptcha\";s:5:\"value\";s:48:\"{\"status\":\"0\",\"site_key\":null,\"secret_key\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:77;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:8:\"language\";s:5:\"value\";s:6:\"[\"en\"]\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:8:\"language\";s:5:\"value\";s:6:\"[\"en\"]\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:78;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:28:\"schedule_order_slot_duration\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:28:\"schedule_order_slot_duration\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:79;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:25:\"digit_after_decimal_point\";s:5:\"value\";s:1:\"2\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:25:\"digit_after_decimal_point\";s:5:\"value\";s:1:\"2\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:80;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:4:\"icon\";s:5:\"value\";s:28:\"2024-11-20-673ddfe277380.png\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:4:\"icon\";s:5:\"value\";s:28:\"2024-11-20-673ddfe277380.png\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:81;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:25:\"delivery_charge_comission\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:25:\"delivery_charge_comission\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:82;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:19:\"dm_max_cash_in_hand\";s:5:\"value\";s:5:\"10000\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:19:\"dm_max_cash_in_hand\";s:5:\"value\";s:5:\"10000\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:83;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:5:\"theme\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:5:\"theme\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:84;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:14:\"dm_tips_status\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:14:\"dm_tips_status\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:85;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:13:\"wallet_status\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:13:\"wallet_status\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:86;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:20:\"loyalty_point_status\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:20:\"loyalty_point_status\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:87;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:18:\"ref_earning_status\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:18:\"ref_earning_status\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:88;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:17:\"wallet_add_refund\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:17:\"wallet_add_refund\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:89;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:27:\"loyalty_point_exchange_rate\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:27:\"loyalty_point_exchange_rate\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:90;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:25:\"ref_earning_exchange_rate\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:25:\"ref_earning_exchange_rate\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:91;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:33:\"loyalty_point_item_purchase_point\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:33:\"loyalty_point_item_purchase_point\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:92;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:27:\"loyalty_point_minimum_point\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:27:\"loyalty_point_minimum_point\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:93;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:22:\"order_refunded_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:22:\"order_refunded_message\";s:5:\"value\";s:27:\"{\"status\":0,\"message\":null}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:94;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:15:\"fcm_credentials\";s:5:\"value\";s:292:\"{\"apiKey\":\"AIzaSyDuT_VKzAa2_mN_-aDCfwe3sLhavUdsVuI\",\"authDomain\":\"homeplate-vr.firebaseapp.com\",\"projectId\":\"homeplate-vr\",\"storageBucket\":\"homeplate-vr.firebasestorage.app\",\"messagingSenderId\":\"485022874761\",\"appId\":\"1:485022874761:web:768b68fc8d31ee89ff9a58\",\"measurementId\":\"G-HSELNM15NC\"}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:15:\"fcm_credentials\";s:5:\"value\";s:292:\"{\"apiKey\":\"AIzaSyDuT_VKzAa2_mN_-aDCfwe3sLhavUdsVuI\",\"authDomain\":\"homeplate-vr.firebaseapp.com\",\"projectId\":\"homeplate-vr\",\"storageBucket\":\"homeplate-vr.firebasestorage.app\",\"messagingSenderId\":\"485022874761\",\"appId\":\"1:485022874761:web:768b68fc8d31ee89ff9a58\",\"measurementId\":\"G-HSELNM15NC\"}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:95;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:7:\"feature\";s:5:\"value\";s:2:\"[]\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:7:\"feature\";s:5:\"value\";s:2:\"[]\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:96;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:12:\"tax_included\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:12:\"tax_included\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:97;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:14:\"site_direction\";s:5:\"value\";s:3:\"ltr\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:14:\"site_direction\";s:5:\"value\";s:3:\"ltr\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:98;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:15:\"system_language\";s:5:\"value\";s:66:\"[{\"id\":1,\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":true}]\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:15:\"system_language\";s:5:\"value\";s:66:\"[{\"id\":1,\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":true}]\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:99;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:9:\"take_away\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:9:\"take_away\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:100;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:19:\"repeat_order_option\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:19:\"repeat_order_option\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:101;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:13:\"home_delivery\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:13:\"home_delivery\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:102;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:20:\"refund_active_status\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:20:\"refund_active_status\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:103;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:14:\"business_model\";s:5:\"value\";s:33:\"{\"commission\":1,\"subscription\":0}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:14:\"business_model\";s:5:\"value\";s:33:\"{\"commission\":1,\"subscription\":0}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:104;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:12:\"cookies_text\";s:5:\"value\";s:7:\"Cookies\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:12:\"cookies_text\";s:5:\"value\";s:7:\"Cookies\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:105;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:12:\"social_login\";s:5:\"value\";s:148:\"[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"0\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:12:\"social_login\";s:5:\"value\";s:148:\"[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"0\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:106;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:11:\"apple_login\";s:5:\"value\";s:133:\"[{\"login_medium\":\"apple\",\"client_id\":\"\",\"client_secret\":\"\",\"team_id\":\"\",\"key_id\":\"\",\"service_file\":\"\",\"redirect_url\":\"\",\"status\":\"\"}]\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:11:\"apple_login\";s:5:\"value\";s:133:\"[{\"login_medium\":\"apple\",\"client_id\":\"\",\"client_secret\":\"\",\"team_id\":\"\",\"key_id\":\"\",\"service_file\":\"\",\"redirect_url\":\"\",\"status\":\"\"}]\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:107;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:23:\"order_notification_type\";s:5:\"value\";s:8:\"firebase\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:23:\"order_notification_type\";s:5:\"value\";s:8:\"firebase\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:108;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:24:\"additional_charge_status\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:24:\"additional_charge_status\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:109;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:22:\"additional_charge_name\";s:5:\"value\";s:17:\"Additional Charge\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:22:\"additional_charge_name\";s:5:\"value\";s:17:\"Additional Charge\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:110;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:17:\"additional_charge\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:17:\"additional_charge\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:111;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:22:\"partial_payment_status\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:22:\"partial_payment_status\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:112;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:22:\"partial_payment_method\";s:5:\"value\";s:4:\"both\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:22:\"partial_payment_method\";s:5:\"value\";s:4:\"both\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:113;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:24:\"dm_picture_upload_status\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:24:\"dm_picture_upload_status\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:114;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:15:\"add_fund_status\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:15:\"add_fund_status\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:115;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:12:\"landing_page\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:12:\"landing_page\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:116;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:30:\"check_subscription_validity_on\";s:5:\"value\";s:10:\"2025-07-26\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:30:\"check_subscription_validity_on\";s:5:\"value\";s:10:\"2025-07-26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:117;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:39:\"check_daily_subscription_validity_check\";s:5:\"value\";s:10:\"2025-07-26\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:39:\"check_daily_subscription_validity_check\";s:5:\"value\";s:10:\"2025-07-26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:118;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:21:\"guest_checkout_status\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:21:\"guest_checkout_status\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:119;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:21:\"country_picker_status\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:21:\"country_picker_status\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:120;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:22:\"free_delivery_distance\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:22:\"free_delivery_distance\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:121;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:20:\"check_daily_stock_on\";s:5:\"value\";s:10:\"2024-11-20\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:20:\"check_daily_stock_on\";s:5:\"value\";s:10:\"2024-11-20\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:122;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:13:\"instant_order\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:13:\"instant_order\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:123;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:26:\"customer_date_order_sratus\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:26:\"customer_date_order_sratus\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:124;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:19:\"customer_order_date\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:19:\"customer_order_date\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:125;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:18:\"order_subscription\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:18:\"order_subscription\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:126;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:41:\"schedule_order_slot_duration_time_formate\";s:5:\"value\";s:3:\"min\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:41:\"schedule_order_slot_duration_time_formate\";s:5:\"value\";s:3:\"min\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:127;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:19:\"manual_login_status\";s:5:\"value\";s:1:\"1\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:19:\"manual_login_status\";s:5:\"value\";s:1:\"1\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:128;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:16:\"otp_login_status\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:16:\"otp_login_status\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:129;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:19:\"social_login_status\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:19:\"social_login_status\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:130;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:19:\"google_login_status\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:19:\"google_login_status\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:131;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:21:\"facebook_login_status\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:21:\"facebook_login_status\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:132;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:18:\"apple_login_status\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:18:\"apple_login_status\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:133;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:25:\"email_verification_status\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:25:\"email_verification_status\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:134;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:25:\"phone_verification_status\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:25:\"phone_verification_status\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:135;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:38:\"push_notification_service_file_content\";s:5:\"value\";s:2387:\"{\r\n  \"type\": \"service_account\",\r\n  \"project_id\": \"homeplate-vr\",\r\n  \"private_key_id\": \"0686af614c08e2d3e38217536b9586989d60c8c8\",\r\n  \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCvNeYKNivm6IJ6\\n/utHDomZ4skKA5441XgvSQzH8bEmXQVkAdBzrTPb1uTcK0PbE1Xbx6lHiHy7lHyE\\n5ff9dp0yuZtYYYz5EBaw5fHaRQi9IZTQMs6l6AyMYV97YAOdG4mQl6DFUK4+nR8I\\n42HLa3QTPz2GuzUeOQA2qBJQYezUdpJY2ELkat19NALM0JXCVpfY1L8XY890TOpW\\nfuEZxQu7QC9MxN38oVhFGdtYCnStfPv96MEpzCaR9aMDxvSRNwj6FKrHgKNEQaah\\nWOQuN+LwODvWHIlAf0mhOHaLupof4SQ98GlAnrEOqMQTny+hPXIfMIayRT8FgEto\\nFNeIi6UPAgMBAAECggEAAO7bi8BgGXmxgDAtVpKIPw6LHYeJZyoT2sSb0dDCrb6f\\nEbpEvuj0Nr59N4LveJIwydvVVfEvINyYkSicWngwPB3q6tySIJ1qUYTX9d6aPk+Y\\neEdc/Fsw/epi1MhdHJAR+ngkPgjA9MpnaOe1FJ084AFdNYN3s/J/wsrAVjc/SJ5a\\nxMiygW0GxSQEkeGpV+X+UMQgB4TF5rNLYcgtRCI5ZZylhAx21OyGlUldcfOh1096\\nR/MVXfpskCt5C8+jIhh2SX/onr5TyetECoVt1dGGm7yT962CY7gA9jB6EruIbzaJ\\n/qo0ISHIMIVMWaozPYzC3SnipUWDwontAXi3wao7OQKBgQDgGVgz3IGwprmQKAnq\\no4+8vg0wv8TIxZMnBefmREhKcWt+X8ta8ybVwpWayPEyDL2ChbBErOrz2v7vqtm/\\nEl9iBsPQkY4Ot4teClBdIksOWphY+OU/mcNWGR71u1UpYs9+rDVaDItiwLGec+dV\\nsTgPJgyh+rJgYkfsfAz+V22ovQKBgQDIJvO+QLxJUpl32idUJ1UAsNQtC3rGhMVw\\nXtmx/LzqfGmAvJOjwsxK5lBeZrK4CKyz1pPxznQ9SCzSrj9nkjX/AGArJ1DQhJpw\\nW0Xh0nIEzfggSuUVZ1zT2TL75H2GMnPJXMV6yQu8HHYkLxXP2gOdtdcDaPgSrbhW\\nj88zInSfuwKBgDlt5U+tE8NMhsNtr1TlQ6Gv5rt2eZymHVbjyZEWMJx7QnvpWrjd\\nFTe0nRhEpKMZ5rr7PbfrxG5n0etjklfIAo+hgi8CDjCxUtLvu7aSYj+0cdRjPIS3\\nB/sZhvicYG+xtdEVmrqP+mx9S0d7Fm68csxXCOe90lam+R2ekMnhZ+XVAoGAEalW\\nQsiFlNbEEg5fAA8Eci4oWt0zdUcMARFtlkYeCXb2/FQnlwC+dDGEj//x70lcq/XY\\nUjMMkMfIpMKZd7MwLpNC6Svr9qps0lNLhFTEmOXv6jGRq2TWjR8SX6XW6buT+gXE\\nq0QIVA4S4riA7Tlorkb4dSWTFlrb9E92UiXNMrcCgYEAy6IwwWmS748SUrix4TWH\\nvfz6GlTa0OgNe1eNQ/kAxdAJlNIGyrQ7/2KgfTvozvkc0UOYNjTZvGd92dAYQojL\\nxtpm1BTsBRXAhqFTWyzVdC7CNEMyS0cz0LnkOTcdFIHNu6Rya49tRLVVES6+VZRg\\nO4q70BwucnNuswCQRyowUgo=\\n-----END PRIVATE KEY-----\\n\",\r\n  \"client_email\": \"firebase-adminsdk-fbsvc@homeplate-vr.iam.gserviceaccount.com\",\r\n  \"client_id\": \"116781834278339101016\",\r\n  \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\",\r\n  \"token_uri\": \"https://oauth2.googleapis.com/token\",\r\n  \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\",\r\n  \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40homeplate-vr.iam.gserviceaccount.com\",\r\n  \"universe_domain\": \"googleapis.com\"\r\n}\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:38:\"push_notification_service_file_content\";s:5:\"value\";s:2387:\"{\r\n  \"type\": \"service_account\",\r\n  \"project_id\": \"homeplate-vr\",\r\n  \"private_key_id\": \"0686af614c08e2d3e38217536b9586989d60c8c8\",\r\n  \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCvNeYKNivm6IJ6\\n/utHDomZ4skKA5441XgvSQzH8bEmXQVkAdBzrTPb1uTcK0PbE1Xbx6lHiHy7lHyE\\n5ff9dp0yuZtYYYz5EBaw5fHaRQi9IZTQMs6l6AyMYV97YAOdG4mQl6DFUK4+nR8I\\n42HLa3QTPz2GuzUeOQA2qBJQYezUdpJY2ELkat19NALM0JXCVpfY1L8XY890TOpW\\nfuEZxQu7QC9MxN38oVhFGdtYCnStfPv96MEpzCaR9aMDxvSRNwj6FKrHgKNEQaah\\nWOQuN+LwODvWHIlAf0mhOHaLupof4SQ98GlAnrEOqMQTny+hPXIfMIayRT8FgEto\\nFNeIi6UPAgMBAAECggEAAO7bi8BgGXmxgDAtVpKIPw6LHYeJZyoT2sSb0dDCrb6f\\nEbpEvuj0Nr59N4LveJIwydvVVfEvINyYkSicWngwPB3q6tySIJ1qUYTX9d6aPk+Y\\neEdc/Fsw/epi1MhdHJAR+ngkPgjA9MpnaOe1FJ084AFdNYN3s/J/wsrAVjc/SJ5a\\nxMiygW0GxSQEkeGpV+X+UMQgB4TF5rNLYcgtRCI5ZZylhAx21OyGlUldcfOh1096\\nR/MVXfpskCt5C8+jIhh2SX/onr5TyetECoVt1dGGm7yT962CY7gA9jB6EruIbzaJ\\n/qo0ISHIMIVMWaozPYzC3SnipUWDwontAXi3wao7OQKBgQDgGVgz3IGwprmQKAnq\\no4+8vg0wv8TIxZMnBefmREhKcWt+X8ta8ybVwpWayPEyDL2ChbBErOrz2v7vqtm/\\nEl9iBsPQkY4Ot4teClBdIksOWphY+OU/mcNWGR71u1UpYs9+rDVaDItiwLGec+dV\\nsTgPJgyh+rJgYkfsfAz+V22ovQKBgQDIJvO+QLxJUpl32idUJ1UAsNQtC3rGhMVw\\nXtmx/LzqfGmAvJOjwsxK5lBeZrK4CKyz1pPxznQ9SCzSrj9nkjX/AGArJ1DQhJpw\\nW0Xh0nIEzfggSuUVZ1zT2TL75H2GMnPJXMV6yQu8HHYkLxXP2gOdtdcDaPgSrbhW\\nj88zInSfuwKBgDlt5U+tE8NMhsNtr1TlQ6Gv5rt2eZymHVbjyZEWMJx7QnvpWrjd\\nFTe0nRhEpKMZ5rr7PbfrxG5n0etjklfIAo+hgi8CDjCxUtLvu7aSYj+0cdRjPIS3\\nB/sZhvicYG+xtdEVmrqP+mx9S0d7Fm68csxXCOe90lam+R2ekMnhZ+XVAoGAEalW\\nQsiFlNbEEg5fAA8Eci4oWt0zdUcMARFtlkYeCXb2/FQnlwC+dDGEj//x70lcq/XY\\nUjMMkMfIpMKZd7MwLpNC6Svr9qps0lNLhFTEmOXv6jGRq2TWjR8SX6XW6buT+gXE\\nq0QIVA4S4riA7Tlorkb4dSWTFlrb9E92UiXNMrcCgYEAy6IwwWmS748SUrix4TWH\\nvfz6GlTa0OgNe1eNQ/kAxdAJlNIGyrQ7/2KgfTvozvkc0UOYNjTZvGd92dAYQojL\\nxtpm1BTsBRXAhqFTWyzVdC7CNEMyS0cz0LnkOTcdFIHNu6Rya49tRLVVES6+VZRg\\nO4q70BwucnNuswCQRyowUgo=\\n-----END PRIVATE KEY-----\\n\",\r\n  \"client_email\": \"firebase-adminsdk-fbsvc@homeplate-vr.iam.gserviceaccount.com\",\r\n  \"client_id\": \"116781834278339101016\",\r\n  \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\",\r\n  \"token_uri\": \"https://oauth2.googleapis.com/token\",\r\n  \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\",\r\n  \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40homeplate-vr.iam.gserviceaccount.com\",\r\n  \"universe_domain\": \"googleapis.com\"\r\n}\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:136;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:18:\"map_api_key_server\";s:5:\"value\";s:39:\"AIzaSyCQ4ZZN-vhn-xwBIU7ZC-yJHKDFGqHb96M\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:18:\"map_api_key_server\";s:5:\"value\";s:39:\"AIzaSyCQ4ZZN-vhn-xwBIU7ZC-yJHKDFGqHb96M\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:137;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:26:\"admin_free_delivery_status\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:26:\"admin_free_delivery_status\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:138;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:26:\"admin_free_delivery_option\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:26:\"admin_free_delivery_option\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:139;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:32:\"cash_in_hand_overflow_restaurant\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:32:\"cash_in_hand_overflow_restaurant\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:140;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:39:\"cash_in_hand_overflow_restaurant_amount\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:39:\"cash_in_hand_overflow_restaurant_amount\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:141;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:28:\"min_amount_to_pay_restaurant\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:28:\"min_amount_to_pay_restaurant\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:142;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:23:\"restaurant_review_reply\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:23:\"restaurant_review_reply\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:143;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:22:\"extra_packaging_charge\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:22:\"extra_packaging_charge\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:144;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:20:\"min_amount_to_pay_dm\";s:5:\"value\";N;}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:20:\"min_amount_to_pay_dm\";s:5:\"value\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:145;O:26:\"App\\Models\\BusinessSetting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:17:\"business_settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:7:\"storage\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:3:\"key\";s:34:\"cash_in_hand_overflow_delivery_man\";s:5:\"value\";s:1:\"0\";}s:11:\"\0*\0original\";a:2:{s:3:\"key\";s:34:\"cash_in_hand_overflow_delivery_man\";s:5:\"value\";s:1:\"0\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"storage\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:3:\"key\";i:1;s:5:\"value\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}',2068858271),('stackfood1753249739app_envlive_cachebusiness_settings_currency_symbol','s:1:\"$\";',2068858885),('stackfood1753249739app_envlive_cachebusiness_settings_icon_storage','s:6:\"public\";',2068858885),('stackfood1753249739app_envlive_cachebusiness_settings_keys','a:81:{s:16:\"cash_on_delivery\";s:14:\"{\"status\":\"1\"}\";s:20:\"terms_and_conditions\";N;s:13:\"business_name\";s:9:\"HomePlate\";s:4:\"logo\";s:28:\"2024-11-20-673ddfe2754d3.png\";s:5:\"phone\";s:11:\"+6586735769\";s:13:\"email_address\";s:21:\"homeplatesg@gmail.com\";s:7:\"address\";s:32:\"306 Tanglin Rd, Singapore 247973\";s:11:\"footer_text\";s:11:\"Footer Text\";s:21:\"customer_verification\";N;s:14:\"privacy_policy\";N;s:8:\"about_us\";N;s:15:\"digital_payment\";s:14:\"{\"status\":\"1\"}\";s:27:\"order_delivery_verification\";s:1:\"1\";s:24:\"currency_symbol_position\";s:5:\"right\";s:14:\"schedule_order\";s:1:\"1\";s:16:\"admin_commission\";s:1:\"0\";s:7:\"country\";s:2:\"SG\";s:16:\"default_location\";s:55:\"{\"lat\":\"1.2975264986905133\",\"lng\":\"103.81419149090453\"}\";s:18:\"free_delivery_over\";N;s:16:\"maintenance_mode\";s:1:\"0\";s:27:\"app_minimum_version_android\";N;s:23:\"app_minimum_version_ios\";N;s:15:\"app_url_android\";N;s:11:\"app_url_ios\";N;s:12:\"popular_food\";s:1:\"1\";s:18:\"popular_restaurant\";s:1:\"1\";s:14:\"new_restaurant\";s:1:\"1\";s:19:\"most_reviewed_foods\";s:1:\"1\";s:10:\"timeformat\";s:2:\"24\";s:22:\"canceled_by_restaurant\";s:1:\"0\";s:23:\"canceled_by_deliveryman\";s:1:\"0\";s:15:\"show_dm_earning\";N;s:18:\"toggle_veg_non_veg\";s:1:\"1\";s:22:\"toggle_dm_registration\";s:1:\"1\";s:30:\"toggle_restaurant_registration\";s:1:\"1\";s:28:\"schedule_order_slot_duration\";s:1:\"0\";s:4:\"icon\";s:28:\"2024-11-20-673ddfe277380.png\";s:5:\"theme\";s:1:\"1\";s:14:\"dm_tips_status\";N;s:13:\"wallet_status\";s:1:\"0\";s:20:\"loyalty_point_status\";s:1:\"0\";s:18:\"ref_earning_status\";s:1:\"0\";s:27:\"loyalty_point_exchange_rate\";s:1:\"0\";s:25:\"ref_earning_exchange_rate\";s:1:\"0\";s:33:\"loyalty_point_item_purchase_point\";s:1:\"0\";s:27:\"loyalty_point_minimum_point\";s:1:\"0\";s:12:\"tax_included\";N;s:9:\"take_away\";s:1:\"1\";s:19:\"repeat_order_option\";s:1:\"1\";s:13:\"home_delivery\";s:1:\"1\";s:20:\"refund_active_status\";s:1:\"1\";s:14:\"business_model\";s:33:\"{\"commission\":1,\"subscription\":0}\";s:12:\"cookies_text\";s:7:\"Cookies\";s:24:\"additional_charge_status\";N;s:22:\"additional_charge_name\";s:17:\"Additional Charge\";s:17:\"additional_charge\";N;s:22:\"partial_payment_status\";N;s:22:\"partial_payment_method\";s:4:\"both\";s:24:\"dm_picture_upload_status\";N;s:15:\"add_fund_status\";s:1:\"0\";s:21:\"guest_checkout_status\";s:1:\"0\";s:21:\"country_picker_status\";s:1:\"1\";s:22:\"free_delivery_distance\";N;s:13:\"instant_order\";s:1:\"1\";s:26:\"customer_date_order_sratus\";s:1:\"0\";s:19:\"customer_order_date\";s:1:\"0\";s:18:\"order_subscription\";N;s:19:\"manual_login_status\";s:1:\"1\";s:16:\"otp_login_status\";s:1:\"0\";s:19:\"social_login_status\";s:1:\"0\";s:19:\"google_login_status\";s:1:\"0\";s:21:\"facebook_login_status\";s:1:\"0\";s:18:\"apple_login_status\";s:1:\"0\";s:25:\"email_verification_status\";s:1:\"0\";s:25:\"phone_verification_status\";s:1:\"0\";s:26:\"admin_free_delivery_status\";N;s:26:\"admin_free_delivery_option\";N;s:28:\"min_amount_to_pay_restaurant\";N;s:23:\"restaurant_review_reply\";N;s:22:\"extra_packaging_charge\";s:1:\"0\";s:20:\"min_amount_to_pay_dm\";N;}',2068858885),('stackfood1753249739app_envlive_cachebusiness_settings_logo_storage','s:6:\"public\";',2068858885),('stackfood1753249739app_envlive_cachec2a7afa55e76e15a3fa11adec1f59c52','i:6;',1753314419),('stackfood1753249739app_envlive_cachec2a7afa55e76e15a3fa11adec1f59c52:timer','i:1753314419;',1753314419),('stackfood1753249739app_envlive_cachecampaigns_6a7d4a34670a041b5fe2498fa7598db9','O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}',1753319417),('stackfood1753249739app_envlive_cachecampaigns_87ed0247a40a6540b3a009df6a699def','O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}',1753440149),('stackfood1753249739app_envlive_cachecampaigns_e534d0dd11333d28828f0aa15e4e598d','O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}',1753499562),('stackfood1753249739app_envlive_cachedata_settings_about_us','N;',2068859004),('stackfood1753249739app_envlive_cachedata_settings_cancellation_policy','N;',2068859004),('stackfood1753249739app_envlive_cachedata_settings_cancellation_policy_status','N;',2068859004),('stackfood1753249739app_envlive_cachedata_settings_deliveryman_page_data','N;',2068859004),('stackfood1753249739app_envlive_cachedata_settings_maintenance_mode','a:0:{}',2068627819),('stackfood1753249739app_envlive_cachedata_settings_privacy_policy','N;',2068859004),('stackfood1753249739app_envlive_cachedata_settings_promotional_banner','a:2:{s:24:\"promotional_banner_image\";s:28:\"2024-11-20-673de16545487.png\";s:24:\"promotional_banner_title\";s:11:\"Demo Banner\";}',2068627819),('stackfood1753249739app_envlive_cachedata_settings_promotional_banner_storage','s:6:\"public\";',2068627819),('stackfood1753249739app_envlive_cachedata_settings_refund_policy','N;',2068859004),('stackfood1753249739app_envlive_cachedata_settings_refund_policy_status','N;',2068859004),('stackfood1753249739app_envlive_cachedata_settings_restaurant_page_data','N;',2068859004),('stackfood1753249739app_envlive_cachedata_settings_shipping_policy','N;',2068859004),('stackfood1753249739app_envlive_cachedata_settings_shipping_policy_status','N;',2068859004),('stackfood1753249739app_envlive_cachedata_settings_terms_and_conditions','N;',2068859004),('stackfood1753249739app_envlive_cachede2666eca40f99561e8461ecddaa5420','i:25;',1753387323),('stackfood1753249739app_envlive_cachede2666eca40f99561e8461ecddaa5420:timer','i:1753387323;',1753387323),('stackfood1753249739app_envlive_cachee9b6cc1432541b9ceebf113eee05eeba','i:2;',1753439410),('stackfood1753249739app_envlive_cachee9b6cc1432541b9ceebf113eee05eeba:timer','i:1753439410;',1753439410),('stackfood1753249739app_envlive_cachef1f70ec40aaa556905d4a030501c0ba4','i:4;',1753499140),('stackfood1753249739app_envlive_cachef1f70ec40aaa556905d4a030501c0ba4:timer','i:1753499140;',1753499140);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_restaurant`
--

DROP TABLE IF EXISTS `campaign_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_restaurant` (
  `campaign_id` bigint unsigned NOT NULL,
  `restaurant_id` bigint unsigned NOT NULL,
  `campaign_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_restaurant`
--

LOCK TABLES `campaign_restaurant` WRITE;
/*!40000 ALTER TABLE `campaign_restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaigns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `add_on_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `add_on_qtys` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `item_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(24,3) NOT NULL,
  `quantity` int NOT NULL,
  `variations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variation_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,5,2,1,'\"[]\"','\"[]\"','App\\Models\\Food',20.000,1,'[]','2025-07-23 21:21:31','2025-07-23 21:21:31','[]');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_back_histories`
--

DROP TABLE IF EXISTS `cash_back_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_back_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cash_back_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `cashback_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `calculated_amount` double(23,3) NOT NULL DEFAULT '0.000',
  `cashback_amount` double(23,3) NOT NULL DEFAULT '0.000',
  `min_purchase` double(23,3) NOT NULL DEFAULT '0.000',
  `max_discount` double(23,3) NOT NULL DEFAULT '0.000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_back_histories`
--

LOCK TABLES `cash_back_histories` WRITE;
/*!40000 ALTER TABLE `cash_back_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_back_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_backs`
--

DROP TABLE IF EXISTS `cash_backs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_backs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '["all"]',
  `cashback_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `same_user_limit` int NOT NULL DEFAULT '1',
  `total_used` int NOT NULL DEFAULT '0',
  `cashback_amount` double(23,3) NOT NULL DEFAULT '0.000',
  `min_purchase` double(23,3) NOT NULL DEFAULT '0.000',
  `max_discount` double(23,3) NOT NULL DEFAULT '0.000',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_backs`
--

LOCK TABLES `cash_backs` WRITE;
/*!40000 ALTER TABLE `cash_backs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_backs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int NOT NULL,
  `position` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Demo Category','2024-11-20-673de06ce3aa7.png',0,0,1,'2023-09-08 16:29:05','2024-11-19 23:13:16',0,'demo-category'),(2,'Demo Sub Category','def.png',1,1,1,'2023-09-08 16:29:46','2023-09-08 16:29:46',0,'demo-sub-category');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characteristic_restaurant`
--

DROP TABLE IF EXISTS `characteristic_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characteristic_restaurant` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint unsigned NOT NULL,
  `characteristic_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristic_restaurant`
--

LOCK TABLES `characteristic_restaurant` WRITE;
/*!40000 ALTER TABLE `characteristic_restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `characteristic_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characteristics`
--

DROP TABLE IF EXISTS `characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characteristics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `characteristic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristics`
--

LOCK TABLES `characteristics` WRITE;
/*!40000 ALTER TABLE `characteristics` DISABLE KEYS */;
/*!40000 ALTER TABLE `characteristics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `feedback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `seen` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sender_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_id` bigint unsigned NOT NULL,
  `receiver_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_message_id` bigint unsigned DEFAULT NULL,
  `last_message_time` timestamp NULL DEFAULT NULL,
  `unread_message_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (1,2,'2025-07-26 10:58:37','2025-07-26 10:59:13','customer',1,'vendor',2,'2025-07-26 10:59:07',0);
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_uses` bigint DEFAULT '0',
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `customer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '["all"]',
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisine_restaurant`
--

DROP TABLE IF EXISTS `cuisine_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine_restaurant` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint unsigned NOT NULL,
  `cuisine_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine_restaurant`
--

LOCK TABLES `cuisine_restaurant` WRITE;
/*!40000 ALTER TABLE `cuisine_restaurant` DISABLE KEYS */;
INSERT INTO `cuisine_restaurant` VALUES (1,1,1);
/*!40000 ALTER TABLE `cuisine_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisines`
--

DROP TABLE IF EXISTS `cuisines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisines` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisines`
--

LOCK TABLES `cuisines` WRITE;
/*!40000 ALTER TABLE `cuisines` DISABLE KEYS */;
INSERT INTO `cuisines` VALUES (1,'Demo Cuisine','2024-11-20-673de04034619.png',1,'demo-cuisine','2023-09-08 16:25:54','2024-11-19 23:12:32');
/*!40000 ALTER TABLE `cuisines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'US Dollar','USD','$',1.00,NULL,NULL),(2,'Canadian Dollar','CAD','CA$',1.00,NULL,NULL),(3,'Euro','EUR','€',1.00,NULL,NULL),(4,'United Arab Emirates Dirham','AED','د.إ.‏',1.00,NULL,NULL),(5,'Afghan Afghani','AFN','؋',1.00,NULL,NULL),(6,'Albanian Lek','ALL','L',1.00,NULL,NULL),(7,'Armenian Dram','AMD','֏',1.00,NULL,NULL),(8,'Argentine Peso','ARS','$',1.00,NULL,NULL),(9,'Australian Dollar','AUD','$',1.00,NULL,NULL),(10,'Azerbaijani Manat','AZN','₼',1.00,NULL,NULL),(11,'Bosnia-Herzegovina Convertible Mark','BAM','KM',1.00,NULL,NULL),(12,'Bangladeshi Taka','BDT','৳',1.00,NULL,NULL),(13,'Bulgarian Lev','BGN','лв.',1.00,NULL,NULL),(14,'Bahraini Dinar','BHD','د.ب.‏',1.00,NULL,NULL),(15,'Burundian Franc','BIF','FBu',1.00,NULL,NULL),(16,'Brunei Dollar','BND','B$',1.00,NULL,NULL),(17,'Bolivian Boliviano','BOB','Bs',1.00,NULL,NULL),(18,'Brazilian Real','BRL','R$',1.00,NULL,NULL),(19,'Botswanan Pula','BWP','P',1.00,NULL,NULL),(20,'Belarusian Ruble','BYN','Br',1.00,NULL,NULL),(21,'Belize Dollar','BZD','$',1.00,NULL,NULL),(22,'Congolese Franc','CDF','FC',1.00,NULL,NULL),(23,'Swiss Franc','CHF','CHf',1.00,NULL,NULL),(24,'Chilean Peso','CLP','$',1.00,NULL,NULL),(25,'Chinese Yuan','CNY','¥',1.00,NULL,NULL),(26,'Colombian Peso','COP','$',1.00,NULL,NULL),(27,'Costa Rican Colón','CRC','₡',1.00,NULL,NULL),(28,'Cape Verdean Escudo','CVE','$',1.00,NULL,NULL),(29,'Czech Republic Koruna','CZK','Kč',1.00,NULL,NULL),(30,'Djiboutian Franc','DJF','Fdj',1.00,NULL,NULL),(31,'Danish Krone','DKK','Kr.',1.00,NULL,NULL),(32,'Dominican Peso','DOP','RD$',1.00,NULL,NULL),(33,'Algerian Dinar','DZD','د.ج.‏',1.00,NULL,NULL),(34,'Estonian Kroon','EEK','kr',1.00,NULL,NULL),(35,'Egyptian Pound','EGP','E£‏',1.00,NULL,NULL),(36,'Eritrean Nakfa','ERN','Nfk',1.00,NULL,NULL),(37,'Ethiopian Birr','ETB','Br',1.00,NULL,NULL),(38,'British Pound Sterling','GBP','£',1.00,NULL,NULL),(39,'Georgian Lari','GEL','GEL',1.00,NULL,NULL),(40,'Ghanaian Cedi','GHS','GH¢',1.00,NULL,NULL),(41,'Guinean Franc','GNF','FG',1.00,NULL,NULL),(42,'Guatemalan Quetzal','GTQ','Q',1.00,NULL,NULL),(43,'Hong Kong Dollar','HKD','HK$',1.00,NULL,NULL),(44,'Honduran Lempira','HNL','L',1.00,NULL,NULL),(45,'Croatian Kuna','HRK','kn',1.00,NULL,NULL),(46,'Hungarian Forint','HUF','Ft',1.00,NULL,NULL),(47,'Indonesian Rupiah','IDR','Rp',1.00,NULL,NULL),(48,'Israeli New Sheqel','ILS','₪',1.00,NULL,NULL),(49,'Indian Rupee','INR','₹',1.00,NULL,NULL),(50,'Iraqi Dinar','IQD','ع.د',1.00,NULL,NULL),(51,'Iranian Rial','IRR','﷼',1.00,NULL,NULL),(52,'Icelandic Króna','ISK','kr',1.00,NULL,NULL),(53,'Jamaican Dollar','JMD','$',1.00,NULL,NULL),(54,'Jordanian Dinar','JOD','د.ا‏',1.00,NULL,NULL),(55,'Japanese Yen','JPY','¥',1.00,NULL,NULL),(56,'Kenyan Shilling','KES','Ksh',1.00,NULL,NULL),(57,'Cambodian Riel','KHR','៛',1.00,NULL,NULL),(58,'Comorian Franc','KMF','FC',1.00,NULL,NULL),(59,'South Korean Won','KRW','CF',1.00,NULL,NULL),(60,'Kuwaiti Dinar','KWD','د.ك.‏',1.00,NULL,NULL),(61,'Kazakhstani Tenge','KZT','₸.',1.00,NULL,NULL),(62,'Lebanese Pound','LBP','ل.ل.‏',1.00,NULL,NULL),(63,'Sri Lankan Rupee','LKR','Rs',1.00,NULL,NULL),(64,'Lithuanian Litas','LTL','Lt',1.00,NULL,NULL),(65,'Latvian Lats','LVL','Ls',1.00,NULL,NULL),(66,'Libyan Dinar','LYD','د.ل.‏',1.00,NULL,NULL),(67,'Moroccan Dirham','MAD','د.م.‏',1.00,NULL,NULL),(68,'Moldovan Leu','MDL','L',1.00,NULL,NULL),(69,'Malagasy Ariary','MGA','Ar',1.00,NULL,NULL),(70,'Macedonian Denar','MKD','Ден',1.00,NULL,NULL),(71,'Myanma Kyat','MMK','K',1.00,NULL,NULL),(72,'Macanese Pataca','MOP','MOP$',1.00,NULL,NULL),(73,'Mauritian Rupee','MUR','Rs',1.00,NULL,NULL),(74,'Mexican Peso','MXN','$',1.00,NULL,NULL),(75,'Malaysian Ringgit','MYR','RM',1.00,NULL,NULL),(76,'Mozambican Metical','MZN','MT',1.00,NULL,NULL),(77,'Namibian Dollar','NAD','N$',1.00,NULL,NULL),(78,'Nigerian Naira','NGN','₦',1.00,NULL,NULL),(79,'Nicaraguan Córdoba','NIO','C$',1.00,NULL,NULL),(80,'Norwegian Krone','NOK','kr',1.00,NULL,NULL),(81,'Nepalese Rupee','NPR','Re.',1.00,NULL,NULL),(82,'New Zealand Dollar','NZD','$',1.00,NULL,NULL),(83,'Omani Rial','OMR','ر.ع.‏',1.00,NULL,NULL),(84,'Panamanian Balboa','PAB','B/.',1.00,NULL,NULL),(85,'Peruvian Nuevo Sol','PEN','S/',1.00,NULL,NULL),(86,'Philippine Peso','PHP','₱',1.00,NULL,NULL),(87,'Pakistani Rupee','PKR','Rs',1.00,NULL,NULL),(88,'Polish Zloty','PLN','zł',1.00,NULL,NULL),(89,'Paraguayan Guarani','PYG','₲',1.00,NULL,NULL),(90,'Qatari Rial','QAR','ر.ق.‏',1.00,NULL,NULL),(91,'Romanian Leu','RON','lei',1.00,NULL,NULL),(92,'Serbian Dinar','RSD','din.',1.00,NULL,NULL),(93,'Russian Ruble','RUB','₽.',1.00,NULL,NULL),(94,'Rwandan Franc','RWF','FRw',1.00,NULL,NULL),(95,'Saudi Riyal','SAR','ر.س.‏',1.00,NULL,NULL),(96,'Sudanese Pound','SDG','ج.س.',1.00,NULL,NULL),(97,'Swedish Krona','SEK','kr',1.00,NULL,NULL),(98,'Singapore Dollar','SGD','$',1.00,NULL,NULL),(99,'Somali Shilling','SOS','Sh.so.',1.00,NULL,NULL),(100,'Syrian Pound','SYP','LS‏',1.00,NULL,NULL),(101,'Thai Baht','THB','฿',1.00,NULL,NULL),(102,'Tunisian Dinar','TND','د.ت‏',1.00,NULL,NULL),(103,'Tongan Paʻanga','TOP','T$',1.00,NULL,NULL),(104,'Turkish Lira','TRY','₺',1.00,NULL,NULL),(105,'Trinidad and Tobago Dollar','TTD','$',1.00,NULL,NULL),(106,'New Taiwan Dollar','TWD','NT$',1.00,NULL,NULL),(107,'Tanzanian Shilling','TZS','TSh',1.00,NULL,NULL),(108,'Ukrainian Hryvnia','UAH','₴',1.00,NULL,NULL),(109,'Ugandan Shilling','UGX','USh',1.00,NULL,NULL),(110,'Uruguayan Peso','UYU','$',1.00,NULL,NULL),(111,'Uzbekistan Som','UZS','so\'m',1.00,NULL,NULL),(112,'Venezuelan Bolívar','VEF','Bs.F.',1.00,NULL,NULL),(113,'Vietnamese Dong','VND','₫',1.00,NULL,NULL),(114,'CFA Franc BEAC','XAF','FCFA',1.00,NULL,NULL),(115,'CFA Franc BCEAO','XOF','CFA',1.00,NULL,NULL),(116,'Yemeni Rial','YER','﷼‏',1.00,NULL,NULL),(117,'South African Rand','ZAR','R',1.00,NULL,NULL),(118,'Zambian Kwacha','ZMK','ZK',1.00,NULL,NULL),(119,'Zimbabwean Dollar','ZWL','Z$',1.00,NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_addresses`
--

DROP TABLE IF EXISTS `customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `contact_person_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint unsigned NOT NULL,
  `floor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_addresses`
--

LOCK TABLES `customer_addresses` WRITE;
/*!40000 ALTER TABLE `customer_addresses` DISABLE KEYS */;
INSERT INTO `customer_addresses` VALUES (1,'home','+6589104610','Blk 642 Jurong West Street 61, #01-60, Singapore 640642','1.3404001850155092','103.69581989943981',2,'Zubaida Beevi','2025-07-25 18:29:10','2025-07-25 18:29:10',2,'60','Jurong West st  61','#01');
/*!40000 ALTER TABLE `customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_m_reviews`
--

DROP TABLE IF EXISTS `d_m_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_m_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_m_reviews`
--

LOCK TABLES `d_m_reviews` WRITE;
/*!40000 ALTER TABLE `d_m_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `d_m_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_settings`
--

DROP TABLE IF EXISTS `data_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_settings`
--

LOCK TABLES `data_settings` WRITE;
/*!40000 ALTER TABLE `data_settings` DISABLE KEYS */;
INSERT INTO `data_settings` VALUES (1,'admin_login_url','admin','login_admin','2023-06-20 16:55:51','2023-06-20 16:55:51'),(2,'admin_employee_login_url','admin-employee','login_admin_employee','2023-06-20 16:55:51','2023-06-20 16:55:51'),(3,'restaurant_login_url','restaurant','login_restaurant','2023-06-20 16:55:51','2023-06-20 16:55:51'),(4,'restaurant_employee_login_url','restaurant-employee','login_restaurant_employee','2023-06-20 16:55:51','2023-06-20 16:55:51'),(5,'header_title','Why stay Hungry !','admin_landing_page','2023-06-20 17:59:39','2023-06-20 17:59:39'),(6,'header_sub_title','when you can order always form','admin_landing_page','2023-06-20 17:59:39','2023-06-20 17:59:39'),(7,'header_tag_line','Start Your Business or Download the App','admin_landing_page','2023-06-20 17:59:39','2023-06-20 17:59:39'),(8,'header_app_button_name','Order Now','admin_landing_page','2023-06-20 17:59:39','2023-06-20 17:59:39'),(9,'header_app_button_status','1','admin_landing_page','2023-06-20 17:59:39','2023-06-20 17:59:39'),(10,'header_button_content','https://stackfood-web.6amtech.com/','admin_landing_page','2023-06-20 17:59:39','2023-06-20 17:59:39'),(11,'header_image_content','{\"header_content_image\":\"2024-11-20-673ddb105c3c8.png\",\"header_bg_image\":\"2024-11-20-673dde5b9c3c4.png\",\"header_content_image_storage\":\"public\",\"header_bg_image_storage\":\"public\"}','admin_landing_page','2023-06-20 18:01:47','2024-11-19 23:04:27'),(12,'header_floating_content','{\"header_floating_total_order\":\"5000\",\"header_floating_total_user\":\"999\",\"header_floating_total_reviews\":\"2330\"}','admin_landing_page','2023-06-20 18:04:04','2023-06-20 18:04:04'),(13,'about_us_image_content','2024-11-20-673ddf4556906.png','admin_landing_page','2023-06-20 18:10:05','2024-11-19 23:08:21'),(14,'about_us_title','Stack Food','admin_landing_page','2023-06-20 18:10:05','2023-06-20 18:10:05'),(15,'about_us_sub_title','is Best Delivery Service Near You','admin_landing_page','2023-06-20 18:10:05','2023-06-20 18:10:05'),(16,'about_us_text','We make food delivery more interesting.\r\nFind the greatest deals from the restaurants near you.\r\nTesty & healthy dishes. Bring a restaurant into your home.','admin_landing_page','2023-06-20 18:10:06','2023-06-20 18:12:42'),(17,'about_us_app_button_name','Download Now','admin_landing_page','2023-06-20 18:10:06','2023-06-20 18:10:06'),(18,'about_us_app_button_status','1','admin_landing_page','2023-06-20 18:10:06','2023-06-20 18:10:06'),(19,'about_us_button_content','https://play.google.com/store/','admin_landing_page','2023-06-20 18:10:06','2023-06-20 18:10:06'),(20,'feature_title','Stunning Features','admin_landing_page','2023-06-20 18:13:41','2023-06-20 18:13:41'),(21,'feature_sub_title','Remarkable Features that You Can Count!','admin_landing_page','2023-06-20 18:13:41','2023-06-20 18:13:41'),(22,'services_title','Our Platform','admin_landing_page','2023-06-20 18:29:43','2023-06-20 18:29:43'),(23,'services_sub_title','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','admin_landing_page','2023-06-20 18:29:43','2023-06-20 18:44:11'),(24,'services_order_title_1','Order your food','admin_landing_page','2023-06-20 18:45:36','2023-06-20 18:45:36'),(25,'services_order_title_2','Use stackfood app','admin_landing_page','2023-06-20 18:45:36','2023-06-20 18:45:36'),(26,'services_order_description_1','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ex odio,  turpis accumsan congue. Quisque blandit dui P','admin_landing_page','2023-06-20 18:45:36','2023-06-20 18:45:36'),(27,'services_order_description_2','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ex odio,  turpis accumsan congue. Quisque blandit dui P','admin_landing_page','2023-06-20 18:45:36','2023-06-20 18:45:36'),(28,'services_order_button_name','Download Now','admin_landing_page','2023-06-20 18:45:36','2023-06-20 18:45:36'),(29,'services_order_button_status','1','admin_landing_page','2023-06-20 18:45:36','2023-06-20 18:45:36'),(30,'services_order_button_link','https://play.google.com/store/','admin_landing_page','2023-06-20 18:45:36','2023-06-20 18:45:36'),(31,'services_manage_restaurant_title_1','Manage your order','admin_landing_page','2023-06-20 18:47:13','2023-06-20 18:47:13'),(32,'services_manage_restaurant_title_2','Manage your wallet','admin_landing_page','2023-06-20 18:47:13','2023-06-20 18:47:13'),(33,'services_manage_restaurant_description_1','Manage customer order very easily by using StackFood Restaurant Panel & Restaurant APP','admin_landing_page','2023-06-20 18:47:13','2023-06-20 18:47:13'),(34,'services_manage_restaurant_description_2','Manage restaurant wallet and monitor restaurant earnings and transactions.','admin_landing_page','2023-06-20 18:47:13','2023-06-20 18:47:13'),(35,'services_manage_restaurant_button_name','Download Now','admin_landing_page','2023-06-20 18:47:13','2023-06-20 18:47:13'),(36,'services_manage_restaurant_button_status','1','admin_landing_page','2023-06-20 18:47:13','2023-06-20 18:47:13'),(37,'services_manage_restaurant_button_link','https://play.google.com/','admin_landing_page','2023-06-20 18:47:13','2023-06-20 18:47:13'),(38,'services_manage_delivery_title_1','Deliver your food','admin_landing_page','2023-06-20 18:47:57','2023-06-20 18:47:57'),(39,'services_manage_delivery_title_2','Earn by delivery','admin_landing_page','2023-06-20 18:47:57','2023-06-20 18:47:57'),(40,'services_manage_delivery_description_1','Download Delivery Man App from Play store & App Store and Register as Delivery Man to provide food all over the area.','admin_landing_page','2023-06-20 18:47:57','2023-06-20 18:47:57'),(41,'services_manage_delivery_description_2','Become a delivery man and earn from every food delivery','admin_landing_page','2023-06-20 18:47:57','2023-06-20 18:47:57'),(42,'services_manage_delivery_button_name','Download Now','admin_landing_page','2023-06-20 18:47:57','2023-06-20 18:47:57'),(43,'services_manage_delivery_button_status','1','admin_landing_page','2023-06-20 18:47:57','2023-06-20 18:47:57'),(44,'services_manage_delivery_button_link','https://play.google.com/','admin_landing_page','2023-06-20 18:47:57','2023-06-20 18:47:57'),(45,'earn_money_title','Why Choose Us?','admin_landing_page','2023-06-20 18:48:17','2023-06-20 18:48:17'),(46,'earn_money_sub_title','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','admin_landing_page','2023-06-20 18:48:17','2023-06-20 18:48:17'),(47,'earn_money_reg_title','Earn Money From StackFood','admin_landing_page','2023-06-20 18:51:41','2023-06-20 18:51:41'),(48,'earn_money_restaurant_req_button_name','Be a Seller','admin_landing_page','2023-06-20 18:51:41','2023-06-20 18:51:41'),(49,'earn_money_restaurant_req_button_status','1','admin_landing_page','2023-06-20 18:51:41','2023-06-20 18:51:41'),(50,'earn_money_restaurant_req_button_link','https://play.google.com/','admin_landing_page','2023-06-20 18:51:41','2023-06-20 18:51:41'),(51,'earn_money_delivety_man_req_button_name','Be Deliveryman','admin_landing_page','2023-06-20 18:51:41','2023-06-20 18:51:41'),(52,'earn_money_delivery_man_req_button_status','1','admin_landing_page','2023-06-20 18:51:41','2023-06-20 18:51:41'),(53,'earn_money_delivery_man_req_button_link','https://play.google.com/','admin_landing_page','2023-06-20 18:51:41','2023-06-20 18:51:41'),(54,'earn_money_reg_image','2024-11-20-673dde9fd2f49.png','admin_landing_page','2023-06-20 18:51:41','2024-11-19 23:05:35'),(55,'why_choose_us_title','Why Choose Us?','admin_landing_page','2023-06-20 18:51:57','2023-06-20 18:51:57'),(56,'why_choose_us_sub_title','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','admin_landing_page','2023-06-20 18:51:57','2023-06-20 18:51:57'),(57,'why_choose_us_title_1','Find your daily meal','admin_landing_page','2023-06-20 18:53:32','2023-06-20 18:53:32'),(58,'why_choose_us_image_1','2024-11-20-673dec427c97c.png','admin_landing_page','2023-06-20 18:53:32','2024-11-20 00:03:46'),(59,'why_choose_us_title_2','Easy to food ordering system','admin_landing_page','2023-06-20 18:53:46','2023-06-20 18:53:46'),(60,'why_choose_us_image_2','2024-11-20-673decaa4a377.png','admin_landing_page','2023-06-20 18:53:46','2024-11-20 00:05:30'),(61,'why_choose_us_title_3','Fastest food delivery service','admin_landing_page','2023-06-20 18:54:02','2023-06-20 18:54:02'),(62,'why_choose_us_image_3','2024-11-20-673decbf6f8d1.png','admin_landing_page','2023-06-20 18:54:02','2024-11-20 00:05:51'),(63,'why_choose_us_title_4','Track your food order','admin_landing_page','2023-06-20 18:54:19','2023-06-20 18:54:19'),(64,'why_choose_us_image_4','2024-11-20-673dec82a9ef1.png','admin_landing_page','2023-06-20 18:54:19','2024-11-20 00:04:50'),(65,'testimonial_title','We satisfied some Customer & Restaurant Owners','admin_landing_page','2023-06-21 09:24:53','2023-06-21 09:24:53'),(66,'news_letter_title','Sign Up to Our Newsletter','admin_landing_page','2023-06-21 09:25:14','2023-06-21 09:25:14'),(67,'news_letter_sub_title','Receive Latest News, Updates and Many Other News Every Week','admin_landing_page','2023-06-21 09:25:14','2023-06-21 09:25:14'),(68,'footer_data','Stackfood is a complete package! It\'s time to empower your online food business with powerful features!','admin_landing_page','2023-06-21 09:26:16','2023-06-21 09:26:16'),(69,'react_header_title','StackFood','react_landing_page','2023-06-21 09:41:59','2023-06-21 09:41:59'),(70,'react_header_sub_title','Find Restaurants Near You','react_landing_page','2023-06-21 09:41:59','2023-06-21 09:41:59'),(71,'react_header_image','2024-11-20-673de1dcad721.png','react_landing_page','2023-06-21 09:41:59','2024-11-19 23:19:24'),(72,'react_restaurant_section_title','Open your own restaurant','react_landing_page','2023-06-21 09:48:57','2023-06-21 09:48:57'),(73,'react_restaurant_section_sub_title','Register as seller and open shop to start your business','react_landing_page','2023-06-21 09:48:57','2023-06-21 09:48:57'),(74,'react_restaurant_section_button_name','Register','react_landing_page','2023-06-21 09:48:57','2023-06-21 09:48:57'),(75,'react_restaurant_section_button_status','1','react_landing_page','2023-06-21 09:48:57','2023-06-21 09:48:57'),(76,'react_restaurant_section_image','2024-11-20-673de3284b0b0.png','react_landing_page','2023-06-21 09:48:57','2024-11-19 23:24:56'),(77,'react_restaurant_section_link_data','https://stackfood-admin.6amtech.com/restaurant/apply','react_landing_page','2023-06-21 09:48:57','2023-06-21 09:48:57'),(78,'react_delivery_section_title','Become a Delivery Man','react_landing_page','2023-06-21 09:48:57','2023-06-21 09:48:57'),(79,'react_delivery_section_sub_title','Register as delivery man and earn money','react_landing_page','2023-06-21 09:48:57','2023-06-21 09:48:57'),(80,'react_delivery_section_button_name','Register','react_landing_page','2023-06-21 09:48:57','2023-06-21 09:48:57'),(81,'react_delivery_section_button_status','1','react_landing_page','2023-06-21 09:48:57','2023-06-21 09:48:57'),(82,'react_delivery_section_image','2024-11-20-673de328554f4.png','react_landing_page','2023-06-21 09:48:57','2024-11-19 23:24:56'),(83,'react_delivery_section_link_data','https://stackfood-admin.6amtech.com/deliveryman/apply','react_landing_page','2023-06-21 09:48:57','2023-06-21 09:48:57'),(84,'react_download_apps_banner_image','2024-11-20-673de3604644a.png','react_landing_page','2023-06-21 09:50:18','2024-11-19 23:25:52'),(85,'react_download_apps_title','Download app to enjoy more!','react_landing_page','2023-06-21 09:52:39','2023-06-21 09:52:39'),(86,'react_download_apps_sub_title','All the best restaurants are one click away','react_landing_page','2023-06-21 09:52:39','2023-06-21 09:52:39'),(87,'react_download_apps_tag','Download our app from google play store & app store.','react_landing_page','2023-06-21 09:52:39','2023-06-21 09:52:39'),(88,'react_download_apps_button_name','https://play.google.com/','react_landing_page','2023-06-21 09:52:39','2023-06-21 09:52:39'),(89,'react_download_apps_button_status','1','react_landing_page','2023-06-21 09:52:39','2023-06-21 09:52:39'),(90,'react_download_apps_image','2024-11-20-673de3972bc7e.png','react_landing_page','2023-06-21 09:52:39','2024-11-19 23:26:47'),(91,'react_download_apps_link_data','{\"react_download_apps_link_status\":\"1\",\"react_download_apps_link\":\"https:\\/\\/www.apple.com\\/app-store\\/\"}','react_landing_page','2023-06-21 09:52:39','2023-06-21 09:52:39'),(92,'news_letter_title','Lets Connect !','react_landing_page','2023-06-21 09:53:57','2023-06-21 09:53:57'),(93,'news_letter_sub_title','Stay upto date with restaurants around you. Subscribe with email.','react_landing_page','2023-06-21 09:53:57','2023-06-21 09:53:57'),(94,'footer_data','is Best Delivery Service Near You','react_landing_page','2023-06-21 09:55:11','2023-06-21 09:55:11'),(95,'promotional_banner_image','2024-11-20-673de16545487.png','promotional_banner','2023-09-08 17:11:53','2024-11-19 23:17:25'),(96,'promotional_banner_title','Demo Banner','promotional_banner','2023-09-08 17:11:53','2023-09-08 17:11:53');
/*!40000 ALTER TABLE `data_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_histories`
--

DROP TABLE IF EXISTS `delivery_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_histories`
--

LOCK TABLES `delivery_histories` WRITE;
/*!40000 ALTER TABLE `delivery_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_man_wallets`
--

DROP TABLE IF EXISTS `delivery_man_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_man_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint unsigned NOT NULL,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_man_wallets`
--

LOCK TABLES `delivery_man_wallets` WRITE;
/*!40000 ALTER TABLE `delivery_man_wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_man_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_men`
--

DROP TABLE IF EXISTS `delivery_men`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_men` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `earning` tinyint(1) NOT NULL DEFAULT '1',
  `current_orders` int NOT NULL DEFAULT '0',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zone_wise',
  `restaurant_id` bigint DEFAULT NULL,
  `application_status` enum('approved','denied','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `order_count` int unsigned NOT NULL DEFAULT '0',
  `assigned_order_count` int unsigned NOT NULL DEFAULT '0',
  `vehicle_id` bigint unsigned DEFAULT NULL,
  `shift_id` bigint unsigned DEFAULT NULL,
  `additional_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `additional_documents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_men_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_men`
--

LOCK TABLES `delivery_men` WRITE;
/*!40000 ALTER TABLE `delivery_men` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_men` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disbursement_details`
--

DROP TABLE IF EXISTS `disbursement_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disbursement_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `disbursement_id` bigint unsigned NOT NULL,
  `restaurant_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `disbursement_amount` double(23,3) NOT NULL DEFAULT '0.000',
  `payment_method` bigint unsigned NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disbursement_details`
--

LOCK TABLES `disbursement_details` WRITE;
/*!40000 ALTER TABLE `disbursement_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `disbursement_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disbursement_withdrawal_methods`
--

DROP TABLE IF EXISTS `disbursement_withdrawal_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disbursement_withdrawal_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `withdrawal_method_id` bigint unsigned NOT NULL,
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disbursement_withdrawal_methods`
--

LOCK TABLES `disbursement_withdrawal_methods` WRITE;
/*!40000 ALTER TABLE `disbursement_withdrawal_methods` DISABLE KEYS */;
INSERT INTO `disbursement_withdrawal_methods` VALUES (1,2,NULL,2,'PayNow','{\"paynow_number_to_payout_to\":\"+65 8516 8736\"}',1,'2025-07-23 21:11:28','2025-07-24 08:51:37');
/*!40000 ALTER TABLE `disbursement_withdrawal_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disbursements`
--

DROP TABLE IF EXISTS `disbursements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disbursements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `total_amount` double(23,3) NOT NULL DEFAULT '0.000',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disbursements`
--

LOCK TABLES `disbursements` WRITE;
/*!40000 ALTER TABLE `disbursements` DISABLE KEYS */;
/*!40000 ALTER TABLE `disbursements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `restaurant_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `background_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy` tinyint(1) NOT NULL DEFAULT '0',
  `refund` tinyint(1) NOT NULL DEFAULT '0',
  `cancelation` tinyint(1) NOT NULL DEFAULT '0',
  `contact` tinyint(1) NOT NULL DEFAULT '0',
  `facebook` tinyint(1) NOT NULL DEFAULT '0',
  `instagram` tinyint(1) NOT NULL DEFAULT '0',
  `twitter` tinyint(1) NOT NULL DEFAULT '0',
  `linkedin` tinyint(1) NOT NULL DEFAULT '0',
  `pinterest` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,'Change Password Request','<p>The following user has forgotten his password &amp; requested to change/reset their password.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>User Name: {userName}</strong></p>',NULL,NULL,NULL,'2023-06-21-64928742ceb74.png','','','Footer Text Please contact us for any queries; we’re always happy to help.','© 2023 StackFood. All rights reserved.','admin','forget_password','5',1,1,1,1,1,1,1,1,1,1,'2023-06-20 18:19:43','2023-06-21 00:14:42',NULL),(2,'New Restaurant Registration Request','<p>Please find below the details of the new Restaurant registration:</p>\r\n\r\n<p><strong>Restaurant Name: </strong>{restaurantName}</p>\r\n\r\n<p>To review the Restaurant from the respective Module, go to:&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Or you can directly review the Restaurant here &rarr;</p>\r\n\r\n<p>&nbsp;</p>',NULL,'2023-06-21-649287b247980.png','2023-06-21-649287b247c83.png',NULL,'Review Request','','Please contact us for any queries; we’re always happy to help.','© 2023 StackFood. All rights reserved.','admin','restaurant_registration','1',1,1,1,1,1,1,1,1,1,1,'2023-06-20 18:26:41','2023-06-21 00:16:34',NULL),(3,'New Deliveryman Registration Request','<p>Please find below the details of the new Deliveryman registration:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Deliveryman Name: </strong>{deliveryManName}</p>\r\n\r\n<p>To review the Restaurant from the respective Module, go to:&nbsp;</p>\r\n\r\n<p><strong>Deliveryman Management&rarr;New Deliveryman</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Or you can directly review the Restaurant here &rarr;</p>\r\n\r\n<p>&nbsp;</p>',NULL,'2023-06-21-649287e9b49f8.png','2023-06-21-649287e9b4d4a.png',NULL,'Review Request','','Please contact us for any queries; we’re always happy to help.','© 2023 StackFood. All rights reserved.','admin','dm_registration','1',1,1,1,1,1,1,1,1,1,1,'2023-06-20 18:35:57','2023-06-21 00:18:47',NULL),(4,'New Withdraw Request','<p>Please find below the details of the new Withdraw Request:</p>\r\n\r\n<p><br />\r\n<strong>Restaurant Name: </strong>{restaurantName}</p>\r\n\r\n<p>To review the Refund Request, go to:&nbsp;<br />\r\nTransactions &amp; Reports&rarr;Withdraw Requests</p>\r\n\r\n<p>Or you can directly review the Restaurant here &rarr;</p>',NULL,NULL,NULL,'2023-06-21-6492898f6f2aa.png','Review Request','','Please contact us for any queries; we’re always happy to help.','© 2023 Stackfood. All rights reserved.','admin','withdraw_request','6',1,1,1,1,1,1,1,1,1,1,'2023-06-21 00:24:31','2023-06-21 00:24:31',NULL),(5,'“BUY ONE GET ONE” Campaign Join Request','<p>Please find below the details of the new Campaign Join Request:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Restaurant Name: </strong>{restaurantName}</p>\r\n\r\n<p>To review the Refund Request, go to:&nbsp;</p>\r\n\r\n<p><strong>Campaigns&rarr;Basic Campaigns&rarr;Buy One Get One</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Or you can directly review the Restaurant here &rarr;</p>\r\n\r\n<p>&nbsp;</p>',NULL,'2023-06-21-64928a71d990e.png','2023-06-21-64928a71d9bca.png',NULL,'Review Request','','Please contact us for any queries; we’re always happy to help.','© 2023 Stack Food. All rights reserved.','admin','campaign_request','1',1,1,1,1,1,1,1,1,1,1,'2023-06-21 00:28:17','2023-06-21 00:28:17',NULL),(6,'You Have A Refund Request.','<p>Please find below the details of the new Refund Request:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Customer Name: </strong>{userName}</p>\r\n\r\n<p><strong>Order ID: </strong>{orderId}</p>\r\n\r\n<p>Review the Restaurant here &rarr;</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,'2023-06-21-64928b0c3415a.png',NULL,'Review Request','','Please contact us for any queries; we’re always happy to help.','© 2023 StackFood. All rights reserved.','admin','refund_request','2',1,1,1,1,1,1,1,1,1,1,'2023-06-21 00:30:52','2023-06-21 00:30:52',NULL),(7,'Your Registration has been Submitted Success','<p>Dear {userName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Restaurant Registration Request.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Soon you&rsquo;ll know if your Restaurant registration is accepted or declined by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,'2023-06-21-64928c23e1ee1.png','','','Please contact us for any queries; we’re always happy to help.','© 2023 Stack Food. All rights reserved.','restaurant','registration','5',1,1,1,1,1,1,1,1,1,1,'2023-06-21 00:35:31','2023-06-21 00:36:15',NULL),(8,'Congratulations! Your Registration is Approve','<p>Dear {userName},</p>\r\n\r\n<p>Your registration is approved by the Admin.&nbsp;</p>\r\n\r\n<p><strong>First</strong>, you need to log in to your Restaurant panel.&nbsp;</p>\r\n\r\n<p><strong>After that,</strong> please set up your Restaurant and start selling!&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>Click here</strong><strong> &rarr; </strong><a href=\"https://stackfood-admin.6amtech.com/restaurant-panel/business-settings/restaurant-setup\">https://stackfood-admin.6amtech.com/restaurant-panel/business-settings/restaurant-setup</a></p>',NULL,NULL,NULL,'2023-06-21-64928ccce5098.png','','','Please contact us for any queries; we’re always happy to help.','© 2023 ستاكفود. كل الحقوق محفوظة.','restaurant','approve','5',1,1,1,1,1,1,1,1,1,1,'2023-06-21 00:38:20','2023-06-21 00:38:20',NULL),(9,'Your Registration has been Rejected','<p>Dear {userName} ,&nbsp;</p>\r\n\r\n<p>We&rsquo;re sorry to announce that your Restaurant registration was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>To find out more, please contact us.&nbsp;</p>',NULL,NULL,NULL,'2023-06-21-64928d568a579.png','','','Please contact us for any queries; we’re always happy to help.','© 2023 Stackfood. All rights reserved.','restaurant','deny','5',1,1,1,1,1,1,1,1,1,1,'2023-06-21 00:40:38','2023-06-21 00:40:38',NULL),(10,'Congratulations! Your Withdrawal is Approved!','<p>Dear {userName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you requested to withdraw is approved by the Admin and transferred to your bank account.</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,'2023-06-21-64928df27058a.png','Review Request','','Please contact us for any queries; we’re always happy to help.','© 2023 StackFood. All rights reserved.','restaurant','withdraw_approve','6',1,1,1,1,1,1,1,1,1,1,'2023-06-21 00:43:14','2023-06-21 00:43:14',NULL),(11,'Your Withdraw Request was Rejected.','<p>Dear {userName} ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you requested to withdraw was rejected by the Admin.</p>\r\n\r\n<p>Reason: Insufficient Balance.</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,'2023-06-21-64928ead57d52.png','Review Request','','Please contact us for any queries; we’re always happy to help.','© 2023 StackFood. All rights reserved.','restaurant','withdraw_deny','6',1,1,1,1,1,1,1,1,1,1,'2023-06-21 00:46:21','2023-06-21 00:46:21',NULL),(12,'Your Request is Completed!','<p>Dear {userName} ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Campaign Request.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Soon you&rsquo;ll know if your request is approved or rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>',NULL,'2023-06-21-64928f57d4793.png','2023-06-21-64928f57d4a3e.png',NULL,'See Status','','Please contact us for any queries; we’re always happy to help.','© 2023 Stack Food. All rights reserved.','restaurant','campaign_request','1',1,1,1,1,1,1,1,1,1,1,'2023-06-21 00:49:11','2023-06-21 00:50:03',NULL),(13,'Congratulations! Your Request is Approved!','<p>Dear {userName} ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your request to join &lsquo;&rsquo;BUY ONE GET ONE&rdquo; campaign is approved by the Admin.</p>\r\n\r\n<p>&nbsp;</p>',NULL,'2023-06-21-649290d86eb06.png','2023-06-21-649290d86ede0.png',NULL,'View Status','','Please contact us for any queries; we’re always happy to help.','© 2023 Stackfood. All rights reserved.','restaurant','campaign_approve','1',1,1,1,1,1,1,1,1,1,1,'2023-06-21 00:55:36','2023-06-21 00:55:36',NULL),(14,'Your Campaign Join Request Was Rejected.','<p>Dear {userName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your request to join the &ldquo;Buy One Get One&rdquo; campaign was rejected by the admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Reason: Irrelevant Foods.</p>\r\n\r\n<p>&nbsp;</p>',NULL,'2023-06-21-6492918e7d5f6.png','2023-06-21-6492918e7da37.png',NULL,'','','Please contact us for any queries; we’re always happy to help.','© 2023 StackFood. All rights reserved.','restaurant','campaign_deny','7',1,1,1,1,1,1,1,1,1,1,'2023-06-21 00:58:38','2023-06-21 00:58:57',NULL),(15,'Your Registration is Completed!','<p>Dear {userName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Deliveryman Registration Request.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Soon you&rsquo;ll know if your Deliveryman registration is accepted or declined by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,'2023-06-21-649292352bbb1.png','','','Please contact us for any queries; we’re always happy to help.','© 2023 Stack Food. All rights reserved.','dm','registration','5',1,1,1,0,1,1,1,1,1,1,'2023-06-21 01:01:25','2023-06-21 01:01:25',NULL),(16,'Congratulations! Your Registration is Approve','<p>Dear {deliveryManName} ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your registration is approved by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Here&rsquo;s what to do next:&nbsp;</strong></p>\r\n\r\n<ol>\r\n	<li>Download the Deliveryman app</li>\r\n	<li>Login with the below credentials.</li>\r\n</ol>\r\n\r\n<p><strong>After that,</strong> please set up your account and start delivery!&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>Click here</strong><strong> to download the app&rarr; </strong><em>Download link to the StackFood Deliveryman app</em></p>',NULL,NULL,NULL,'2023-06-21-649292f1aa096.png','','','Please contact us for any queries; we’re always happy to help.','© 2023 Stackfood. All rights reserved.','dm','approve','5',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:04:33','2023-06-21 01:04:47',NULL),(17,'Your Registration has been Rejected','<p>Dear {deliveryManName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;re sorry to announce that your Deliveryman registration was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>To find out more, please contact us.</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,'2023-06-21-649293646ff54.png','','','Please contact us for any queries; we’re always happy to help.','© 2023 StackFood. All rights reserved.','dm','deny','5',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:06:28','2023-06-21 01:06:28',NULL),(18,'Your Account is Suspended.','<p>Dear {deliveryManName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your Deliveryman account has been suspended by the Admin/Restaurant.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please contact the related person to know more.</p>\r\n\r\n<p>&nbsp;</p>',NULL,'2023-06-21-649293fa34204.png','2023-06-21-6492941da37bc.png',NULL,'','','Please contact us for any queries; we’re always happy to help.','© 2023 Stack Food. All rights reserved.','dm','suspend','7',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:08:58','2023-06-21 01:09:33',NULL),(19,'Cash Collected.','<p>Dear User,</p>\r\n\r\n<p>{transactionId}</p>\r\n\r\n<p>The Admin has collected cash from you.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,'2023-06-21-64929477319d2.png','See Details','','Please contact us for any queries; we’re always happy to help.','© 2023 Stack Food. All rights reserved.','dm','cash_collect','6',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:11:03','2023-06-21 01:11:03',NULL),(20,'Reset Your Password','<p>Please click on this link to reset your Password&nbsp;&rarr;</p>',NULL,NULL,NULL,'2023-06-21-649294c9ca03d.png','','','Please contact us for any queries; we’re always happy to help.','© 2023 StackFood. All rights reserved.','dm','forget_password','4',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:12:25','2023-06-21 01:12:25',NULL),(21,'Your Registration is Successful!','<p>Congratulations!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You&rsquo;ve successfully registered.</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,'2023-06-21-6492959c850ac.png','','','Please contact us for any queries; we’re always happy to help.','© 2023 Stackfood. All rights reserved.','user','registration','5',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:15:56','2023-06-21 01:15:56',NULL),(22,'Please Register with The OTP','<p>ONE MORE STEP:&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please copy the following OTP &amp; paste it on your sign-up page to complete your registration.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,'2023-06-21-6492967f1bfac.png','','','Please contact us for any queries; we’re always happy to help.','© 2023 Stack Food. All rights reserved.','user','registration_otp','4',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:19:43','2023-06-21 01:19:43',NULL),(23,'Confirm Your Login with OTP.','<p>Please copy the following OTP &amp; paste it on your Log in page to confirm your account.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,'2023-06-21-64929700e4548.png','','','Please contact us for any queries; we’re always happy to help.','© 2023 ستاكفود. كل الحقوق محفوظة.','user','login_otp','4',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:21:13','2023-06-21 01:21:52',NULL),(24,'Please Verify Your Delivery.','<p>Please give the following OTP to your Deliveryman to ensure your order.</p>',NULL,NULL,NULL,'2023-06-21-64929767a486d.png','','','Please contact us for any queries; we’re always happy to help.','© 2023 Stackfood. All rights reserved.','user','order_verification','4',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:23:35','2023-06-21 01:23:35',NULL),(25,'Your Order is Successful','<p>Hi {userName},</p>\r\n\r\n<p>Your order is successful. Please find your invoice below.</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,NULL,'Review Request','','Please contact us for any queries; we’re always happy to help.','© 2023 Stackfood. All rights reserved.','user','new_order','3',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:25:02','2023-06-21 01:25:02',NULL),(26,'Refund Order','<p>Hi {userName},</p>\r\n\r\n<p>We&rsquo;ve refunded your requested amount. Please find your refund invoice below.</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,NULL,'','','Please contact us for any queries; we’re always happy to help.','© 2023 Stack Food. All rights reserved.','user','refund_order','9',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:26:53','2023-06-21 01:27:32',NULL),(27,'Your Refund Request was Rejected.','<p>Dear {userName} ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you requested for a refund was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>To know more, please contact us.</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,'2023-06-21-649298c0949c3.png',NULL,'','','Please contact us for any queries; we’re always happy to help.','© 2023 Stackfood. All rights reserved.','user','refund_request_deny','8',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:29:20','2023-06-21 01:29:20',NULL),(28,'Reset Your Password','<p>Please click on this link to reset your Password&nbsp;&rarr;</p>',NULL,NULL,NULL,'2023-06-21-64929958a6442.png','','','Please contact us for any queries; we’re always happy to help.','© 2023 StackFood. All rights reserved.','user','forget_password','4',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:31:52','2023-06-21 01:31:52',NULL),(29,'Fund Added to your Wallet.','<p>Dear {userName}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Admin has sent funds to your Wallet.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>',NULL,NULL,NULL,'2023-06-21-649299ada7670.png','Review Request','','Please contact us for any queries; we’re always happy to help.','© 2023 StackFood. All rights reserved.','user','add_fund','6',1,1,1,1,1,1,1,1,1,1,'2023-06-21 01:33:17','2023-06-21 01:33:17',NULL);
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verifications`
--

DROP TABLE IF EXISTS `email_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verifications`
--

LOCK TABLES `email_verifications` WRITE;
/*!40000 ALTER TABLE `email_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_roles`
--

DROP TABLE IF EXISTS `employee_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_roles`
--

LOCK TABLES `employee_roles` WRITE;
/*!40000 ALTER TABLE `employee_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `amount` decimal(23,3) NOT NULL DEFAULT '0.000',
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `restaurant_id` bigint unsigned DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,'discount_on_product',5.000,100000,'2025-07-25 01:54:57','2025-07-25 01:54:57','vendor',2,'',NULL,NULL),(2,'discount_on_product',0.000,100000,'2025-07-25 01:54:57','2025-07-25 01:54:57','admin',NULL,'',NULL,NULL);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `category_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `restaurant_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int NOT NULL DEFAULT '0',
  `avg_rating` double(16,14) NOT NULL DEFAULT '0.00000000000000',
  `rating_count` int NOT NULL DEFAULT '0',
  `rating` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maximum_cart_quantity` int DEFAULT NULL,
  `is_halal` tinyint(1) NOT NULL DEFAULT '0',
  `item_stock` int NOT NULL DEFAULT '0',
  `sell_count` int NOT NULL DEFAULT '0',
  `stock_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unlimited',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Demo Food','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!','2024-11-20-673de0bf27b2a.png',2,'[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}]','[]','[\"1\"]','[]','[]',100.00,0.00,'percent',10.00,'percent','00:00:00','23:59:00',0,1,1,'2023-09-08 17:05:12','2024-11-19 23:14:39',0,0.00000000000000,0,NULL,0,'demo-food',5,0,0,0,'unlimited'),(2,'Pizza','Good pizza','2025-07-23-6880dd50d5249.png',1,'[{\"id\":\"1\",\"position\":1}]','[]','[\"\"]','[]','[]',25.00,0.00,'percent',5.00,'amount','12:35:00','23:57:00',0,1,2,'2025-07-23 21:02:08','2025-07-26 10:54:02',1,5.00000000000000,1,'{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}',0,'pizza',3,0,6,4,'limited'),(3,'Poppy\'s Signature Panipuri','Poppy’s Signature PaniPuri\nA burst of bold flavours in every bite! Our signature PaniPuri is a delightful medley of crispy puris filled with spiced mashed potatoes, tangy tamarind water, zesty mint chutney, and a touch of our secret masala. Fresh, fiery, and fantastically fun — it’s the ultimate street food experience, served with love and a pop of tradition only at Poppy’s!','2025-07-25-68827b8949fee.png',2,'[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}]','[]','[\"\"]','[]','[]',10.00,0.00,'percent',5.00,'percent','02:27:00','04:56:00',1,1,3,'2025-07-25 02:29:29','2025-07-25 02:29:29',0,0.00000000000000,0,NULL,0,'poppys-signature-panipuri',50,1,20,0,'daily');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_nutrition`
--

DROP TABLE IF EXISTS `food_nutrition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_nutrition` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `food_id` bigint unsigned NOT NULL,
  `nutrition_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_nutrition`
--

LOCK TABLES `food_nutrition` WRITE;
/*!40000 ALTER TABLE `food_nutrition` DISABLE KEYS */;
INSERT INTO `food_nutrition` VALUES (1,2,1);
/*!40000 ALTER TABLE `food_nutrition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_tag`
--

DROP TABLE IF EXISTS `food_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `food_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_tag`
--

LOCK TABLES `food_tag` WRITE;
/*!40000 ALTER TABLE `food_tag` DISABLE KEYS */;
INSERT INTO `food_tag` VALUES (1,1,1);
/*!40000 ALTER TABLE `food_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (1,'49.47.130.87',NULL,'2025-07-23 03:51:24','2025-07-23 03:51:24'),(2,'49.47.130.87',NULL,'2025-07-23 03:51:24','2025-07-23 03:51:24'),(3,'49.47.130.87',NULL,'2025-07-23 03:51:24','2025-07-23 03:51:24'),(4,'136.62.52.231',NULL,'2025-07-23 05:24:54','2025-07-23 05:24:54'),(5,'136.62.52.231',NULL,'2025-07-23 05:24:56','2025-07-23 05:24:56'),(6,'136.62.52.231',NULL,'2025-07-24 09:00:04','2025-07-24 09:00:04'),(7,'136.62.52.231',NULL,'2025-07-24 09:00:06','2025-07-24 09:00:06'),(8,'136.62.52.231',NULL,'2025-07-24 09:00:07','2025-07-24 09:00:07'),(9,'136.62.52.231',NULL,'2025-07-24 09:00:10','2025-07-24 09:00:10'),(10,'136.62.52.231',NULL,'2025-07-24 09:00:11','2025-07-24 09:00:11'),(11,'136.62.52.231',NULL,'2025-07-24 09:02:18','2025-07-24 09:02:18'),(12,'103.252.200.124',NULL,'2025-07-25 02:07:40','2025-07-25 02:07:40'),(13,'103.252.200.124',NULL,'2025-07-25 02:07:41','2025-07-25 02:07:41');
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incentive_logs`
--

DROP TABLE IF EXISTS `incentive_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incentive_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint unsigned NOT NULL,
  `zone_id` bigint unsigned NOT NULL,
  `earning` decimal(23,3) NOT NULL DEFAULT '0.000',
  `incentive` decimal(23,3) NOT NULL DEFAULT '0.000',
  `date` date DEFAULT NULL,
  `today_earning` decimal(23,3) NOT NULL DEFAULT '0.000',
  `working_hours` decimal(23,3) NOT NULL DEFAULT '0.000',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incentive_logs`
--

LOCK TABLES `incentive_logs` WRITE;
/*!40000 ALTER TABLE `incentive_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `incentive_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incentives`
--

DROP TABLE IF EXISTS `incentives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incentives` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint unsigned NOT NULL,
  `earning` decimal(23,3) NOT NULL,
  `incentive` decimal(23,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incentives`
--

LOCK TABLES `incentives` WRITE;
/*!40000 ALTER TABLE `incentives` DISABLE KEYS */;
/*!40000 ALTER TABLE `incentives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_campaigns`
--

DROP TABLE IF EXISTS `item_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_campaigns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `category_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `restaurant_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maximum_cart_quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_campaigns`
--

LOCK TABLES `item_campaigns` WRITE;
/*!40000 ALTER TABLE `item_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `logable_id` bigint unsigned NOT NULL,
  `logable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `action_details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `before_state` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `after_state` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `restaurant_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `loyalty_point_transactions`
--

DROP TABLE IF EXISTS `loyalty_point_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty_point_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `transaction_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `debit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalty_point_transactions`
--

LOCK TABLES `loyalty_point_transactions` WRITE;
/*!40000 ALTER TABLE `loyalty_point_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `loyalty_point_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_configs`
--

DROP TABLE IF EXISTS `mail_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryption` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_configs`
--

LOCK TABLES `mail_configs` WRITE;
/*!40000 ALTER TABLE `mail_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint unsigned DEFAULT NULL,
  `sender_id` bigint unsigned DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,2,'Hi',NULL,1,'2025-07-26 10:58:37','2025-07-26 10:59:11'),(2,1,1,'Hi',NULL,1,'2025-07-26 10:59:07','2025-07-26 10:59:13');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_05_05_081114_create_admins_table',1),(5,'2021_05_05_102600_create_attributes_table',1),(6,'2021_05_05_102742_create_categories_table',1),(7,'2021_05_06_102004_create_vendors_table',1),(8,'2021_05_06_153204_create_restaurants_table',1),(9,'2021_05_08_113436_create_add_ons_table',2),(47,'2021_05_08_123446_create_food_table',10),(48,'2021_05_08_141209_create_currencies_table',10),(49,'2021_05_09_050232_create_orders_table',10),(50,'2021_05_09_051907_create_reviews_table',10),(51,'2021_05_09_054237_create_order_details_table',10),(52,'2021_05_10_105324_create_mail_configs_table',10),(53,'2021_05_10_152713_create_business_settings_table',10),(54,'2021_05_11_111722_create_banners_table',11),(55,'2021_05_11_134442_create_coupons_table',11),(56,'2021_05_12_053344_create_conversations_table',11),(57,'2021_05_12_055454_create_delivery_men_table',12),(58,'2021_05_12_060138_create_d_m_reviews_table',12),(59,'2021_05_12_060527_create_track_deliverymen_table',12),(60,'2021_05_12_061345_create_email_verifications_table',12),(61,'2021_05_12_061454_create_delivery_histories_table',12),(62,'2021_05_12_061718_create_wishlists_table',12),(63,'2021_05_12_061924_create_notifications_table',12),(64,'2021_05_12_062152_create_customer_addresses_table',12),(68,'2021_05_12_062412_create_order_delivery_histories_table',13),(69,'2021_05_19_115112_create_zones_table',13),(70,'2021_05_19_120612_create_restaurant_zone_table',13),(71,'2021_06_07_103835_add_column_to_vendor_table',14),(73,'2021_06_07_112335_add_column_to_vendors_table',15),(74,'2021_06_08_162354_add_column_to_restaurants_table',16),(77,'2021_06_09_115719_add_column_to_add_ons_table',17),(78,'2021_06_10_091547_add_column_to_coupons_table',18),(79,'2021_06_12_070530_rename_banners_table',19),(80,'2021_06_12_091154_add_column_on_campaigns_table',20),(87,'2021_06_12_091848_create_item_campaigns_table',21),(92,'2021_06_13_155531_create_campaign_restaurant_table',22),(93,'2021_06_14_090520_add_item_campaign_id_column_to_reviews_table',23),(94,'2021_06_14_091735_add_item_campaign_id_column_to_order_details_table',24),(95,'2021_06_14_120713_create_new_banners_table',25),(96,'2021_06_15_103656_add_zone_id_column_to_banners_table',26),(97,'2021_06_16_110322_create_discounts_table',27),(100,'2021_06_17_150243_create_withdraw_requests_table',28),(103,'2016_06_01_000001_create_oauth_auth_codes_table',30),(104,'2016_06_01_000002_create_oauth_access_tokens_table',30),(105,'2016_06_01_000003_create_oauth_refresh_tokens_table',30),(106,'2016_06_01_000004_create_oauth_clients_table',30),(107,'2016_06_01_000005_create_oauth_personal_access_clients_table',30),(108,'2021_06_21_051135_add_delivery_charge_to_orders_table',31),(110,'2021_06_23_080009_add_role_id_to_admins_table',32),(111,'2021_06_27_140224_add_interest_column_to_users_table',33),(113,'2021_06_27_142558_change_column_to_restaurants_table',34),(114,'2021_06_27_152139_add_restaurant_id_column_to_wishlists_table',35),(115,'2021_06_28_142443_add_restaurant_id_column_to_customer_addresses_table',36),(118,'2021_06_29_134119_add_schedule_column_to_orders_table',37),(122,'2021_06_30_084854_add_cm_firebase_token_column_to_users_table',38),(123,'2021_06_30_133932_add_code_column_to_coupons_table',39),(127,'2021_07_01_151103_change_column_food_id_from_admin_wallet_histories_table',40),(129,'2021_07_04_142159_add_callback_column_to_orders_table',41),(131,'2021_07_05_155506_add_cm_firebase_token_to_vendors_table',42),(133,'2021_07_05_162404_add_otp_to_orders_table',43),(134,'2021_07_13_133941_create_admin_roles_table',44),(135,'2021_07_14_074431_add_status_to_delivery_men_table',45),(136,'2021_07_14_104102_create_vendor_employees_table',46),(137,'2021_07_14_110011_create_employee_roles_table',46),(138,'2021_07_15_124141_add_cover_photo_to_restaurants_table',47),(143,'2021_06_17_145949_create_wallets_table',48),(144,'2021_06_19_052600_create_admin_wallets_table',48),(145,'2021_07_19_103748_create_delivery_man_wallets_table',48),(146,'2021_07_19_105442_create_account_transactions_table',48),(147,'2021_07_19_110152_create_order_transactions_table',48),(148,'2021_07_19_134356_add_column_to_notifications_table',49),(149,'2021_07_25_125316_add_available_to_delivery_men_table',50),(150,'2021_07_25_154722_add_columns_to_restaurants_table',51),(151,'2021_07_29_162336_add_schedule_order_column_to_restaurants_table',52),(152,'2021_07_31_140756_create_phone_verifications_table',53),(153,'2021_08_01_151717_add_column_to_order_transactions_table',54),(154,'2021_08_01_163520_add_column_to_admin_wallets_table',54),(155,'2021_08_02_141909_change_time_column_to_restaurants_table',55),(157,'2021_08_02_183356_add_tax_column_to_restaurants_table',56),(158,'2021_08_04_215618_add_zone_id_column_to_restaurants_table',57),(159,'2021_08_06_123001_add_address_column_to_orders_table',58),(160,'2021_08_06_123326_add_zone_wise_topic_column_to_zones_table',58),(161,'2021_08_08_112127_add_scheduled_column_on_orders_table',59),(162,'2021_08_08_203108_add_status_column_to_users_table',60),(163,'2021_08_11_193805_add_product_discount_ammount_column_to_orders_table',61),(165,'2021_08_12_112511_add_addons_column_to_order_details_table',62),(166,'2021_08_12_195346_add_zone_id_to_notifications_table',63),(167,'2021_08_14_110131_create_user_notifications_table',64),(168,'2021_08_14_175657_add_order_count_column_to_foods_table',65),(169,'2021_08_14_180044_add_order_count_column_to_users_table',65),(170,'2021_08_19_051055_add_earnign_column_to_deliverymen_table',66),(171,'2021_08_19_051721_add_original_delivery_charge_column_to_orders_table',66),(172,'2021_08_19_055839_create_provide_d_m_earnings_table',67),(173,'2021_08_19_112810_add_original_delivery_charge_column_to_order_transactions_table',67),(174,'2021_08_19_114851_add_columns_to_delivery_man_wallets_table',67),(175,'2021_08_21_162616_change_comission_column_to_restaurants_table',68),(176,'2021_06_17_054551_create_soft_credentials_table',69),(177,'2021_08_22_232507_add_failed_column_to_orders_table',69),(178,'2021_09_04_172723_add_column_reviews_section_to_restaurants_table',69),(179,'2021_09_11_164936_change_delivery_address_column_to_orders_table',70),(180,'2021_09_11_165426_change_address_column_to_customer_addresses_table',70),(181,'2021_09_23_120332_change_available_column_to_delivery_men_table',71),(182,'2021_10_03_214536_add_active_column_to_restaurants_table',72),(183,'2021_10_04_123739_add_priority_column_to_categories_table',72),(184,'2021_10_06_200730_add_restaurant_id_column_to_demiverymen_table',72),(185,'2021_10_07_223332_add_self_delivery_column_to_restaurants_table',72),(186,'2021_10_11_214123_change_add_ons_column_to_order_details_table',72),(187,'2021_10_11_215352_add_adjustment_column_to_orders_table',72),(188,'2021_10_24_184553_change_column_to_account_transactions_table',73),(189,'2021_10_24_185143_change_column_to_add_ons_table',73),(190,'2021_10_24_185525_change_column_to_admin_roles_table',73),(191,'2021_10_24_185831_change_column_to_admin_wallets_table',73),(192,'2021_10_24_190550_change_column_to_coupons_table',73),(193,'2021_10_24_190826_change_column_to_delivery_man_wallets_table',73),(194,'2021_10_24_191018_change_column_to_discounts_table',73),(195,'2021_10_24_191209_change_column_to_employee_roles_table',73),(196,'2021_10_24_191343_change_column_to_food_table',73),(197,'2021_10_24_191514_change_column_to_item_campaigns_table',73),(198,'2021_10_24_191626_change_column_to_orders_table',73),(199,'2021_10_24_191938_change_column_to_order_details_table',73),(200,'2021_10_24_192341_change_column_to_order_transactions_table',73),(201,'2021_10_24_192621_change_column_to_provide_d_m_earnings_table',73),(202,'2021_10_24_192820_change_column_type_to_restaurants_table',73),(203,'2021_10_24_192959_change_column_type_to_restaurant_wallets_table',73),(204,'2021_11_02_123115_add_delivery_time_column_to_restaurants_table',74),(205,'2021_11_02_170217_add_total_uses_column_to_coupons_table',74),(206,'2021_12_01_131746_add_status_column_to_reviews_table',75),(207,'2021_12_01_135115_add_status_column_to_d_m_reviews_table',75),(208,'2021_12_13_125126_rename_comlumn_set_menu_to_food_table',75),(209,'2021_12_13_132438_add_zone_id_column_to_admins_table',75),(210,'2021_12_18_174714_add_application_status_column_to_delivery_men_table',75),(211,'2021_12_20_185736_change_status_column_to_vendors_table',75),(212,'2021_12_22_114414_create_translations_table',75),(213,'2022_01_05_133920_add_sosial_data_column_to_users_table',75),(214,'2022_01_05_172441_add_veg_non_veg_column_to_restaurants_table',75),(215,'2022_01_20_151449_add_restaurant_id_column_on_employee_roles_table',76),(216,'2022_01_31_124517_add_veg_column_to_item_campaigns_table',76),(217,'2022_02_01_101248_change_coupon_code_column_length_to_coupons_table',76),(218,'2022_02_01_104336_change_column_length_to_notifications_table',76),(219,'2022_02_06_160701_change_column_length_to_item_campaigns_table',76),(220,'2022_02_06_161110_change_column_length_to_campaigns_table',76),(221,'2022_02_07_091359_add_zone_id_column_on_orders_table',76),(222,'2022_02_07_101547_change_name_column_to_categories_table',76),(223,'2022_02_07_152844_add_zone_id_column_to_order_transactions_table',76),(224,'2022_02_07_162330_add_zone_id_column_to_users_table',76),(225,'2022_02_07_173644_add_column_to_food_table',76),(226,'2022_02_07_181314_add_column_to_delivery_men_table',76),(227,'2022_02_07_183001_add_total_order_count_column_to_restaurants_table',76),(228,'2022_01_19_060356_create_restaurant_schedule_table',77),(229,'2022_03_31_103418_create_wallet_transactions_table',78),(230,'2022_03_31_103827_create_loyalty_point_transactions_table',78),(231,'2022_04_09_161150_add_wallet_point_columns_to_users_table',78),(232,'2022_04_12_121040_create_social_media_table',78),(233,'2022_04_17_140353_change_column_transaction_referance_to_orders_table',78),(234,'2022_04_10_030533_create_newsletters_table',79),(235,'2022_05_14_122133_add_dm_tips_column_to_orders_table',80),(236,'2022_05_14_122603_add_dm_tips_column_to_order_transactions_table',80),(237,'2022_05_14_131338_add_processing_time_column_to_orders_table',80),(238,'2022_05_17_153333_add_ref_code_to_users_table',80),(239,'2022_05_22_162129_add_new_columns_to_customer_addresses_table',80),(240,'2022_06_26_170341_add_delivery_fee_comission_to_ordertransactions',80),(241,'2022_06_29_112637_add_delivery_fee_column_to_zones_table',80),(242,'2022_06_29_125553_add_rename_delivery_charge_column_to_restaurants_table',80),(243,'2022_06_29_151416_create_time_logs_table',80),(244,'2022_07_31_103626_add_free_delivery_by_column_to_orders_table',81),(245,'2022_08_06_122044_create_user_infos_table',82),(246,'2022_08_06_124645_create_messages_table',82),(247,'2022_08_16_095504_update_converstions_table',82),(248,'2022_09_13_113428_change_data_column_to_user_notifications_table',83),(249,'2022_09_20_002050_create_refunds_table',84),(250,'2022_09_20_050949_add_refund_request_cancel_column_to_orders_table',84),(251,'2022_09_20_233442_create_refund_reasons_table',84),(252,'2022_09_29_095242_create_subscription_packages_table',84),(253,'2022_09_29_101701_create_restaurant_subscriptions_table',84),(254,'2022_09_29_102521_create_subscription_transactions_table',84),(255,'2022_10_04_094314_add_restaurant_model_column_to_restaurants_table',84),(256,'2022_11_05_105722_alter_table_order_details_change_variation',84),(257,'2022_11_13_144443_create_contact_messages_table',84),(258,'2022_11_16_091912_create_expenses_table',84),(259,'2022_11_16_092235_add_expense_column_to_order_transactions_table',84),(260,'2023_01_05_153438_add_status_col_to_campaign_restaurant_table',85),(261,'2023_01_07_162303_add_maximum_delivery_charge_col_to_zones_table',85),(262,'2023_01_07_162740_add_maximum_delivery_charge_col_to_restaurants_table',85),(263,'2023_01_08_104102_create_vehicles_table',85),(264,'2023_01_08_124859_add_vehicle_id_col_to_delivery_men_table',85),(265,'2023_01_08_152910_create_tags_table',85),(266,'2023_01_08_153321_create_food_tags_table',85),(267,'2023_01_09_115851_add_max_cod_order_amount_col_to_zones_table',85),(268,'2023_01_09_132704_create_order_cancel_reasons_table',85),(269,'2023_01_09_132841_add_cancellation_reason_col_to_orders_table',85),(270,'2023_01_09_173540_add_recommended_col_to_foods_table',85),(271,'2023_01_09_180114_create_cuisines_table',85),(272,'2023_01_09_180928_add_cuisine_id_col_to_restaurants_table',85),(273,'2023_01_10_112851_alter_refund_amount_col_to_refunds_table',85),(274,'2023_01_10_175439_add_tax_status_col_to_orders_table',85),(275,'2023_01_11_142252_add_customer_id_col_to_coupons_table',85),(276,'2023_01_12_142420_add_restaurant_id_col_to_expenses_table',85),(277,'2023_01_12_143506_add_restaurant_expense_col_to_order_transactions_table',85),(278,'2023_01_12_145658_add_coupon_created_by_col_to_orders_table',85),(279,'2023_01_14_103226_add_slug_by_col_to_campaigns_table',85),(280,'2023_01_14_105544_add_slug_col_to_categories_table',85),(281,'2023_01_14_105607_add_slug_by_col_to_restaurants_table',85),(282,'2023_01_24_152947_add_vehicle_id_col_to_orders_table',85),(283,'2023_01_25_133959_add_slug_col_to_food_table',85),(284,'2023_01_25_145750_add_slug_col_to_item_campaigns_table',85),(285,'2023_01_28_100238_remane_discription_col_to__order_id_to_expenses_table',85),(286,'2023_01_28_100425_add_description_col_to_expenses_table',85),(287,'2023_01_28_161813_create_cuisine_restaurants_table',85),(288,'2023_01_28_185144_remove_col_cuisine_id_from_restaurant_table',85),(289,'2023_01_30_121227_add_col_to_discount_on_product_by_order_table',85),(290,'2023_02_01_114155_add_distance_col_to_orders_table',85),(291,'2023_02_01_151408_add_commission_percentage_col_to_order_transactions_table',85),(292,'2023_02_01_182929_add_discount_amount_by_restaurant_col_to_order_transactions_table',85),(293,'2023_02_06_121643_add_fcm_token_web_to_vendors_table',85),(294,'2023_02_08_113749_add_ref_by_col_to_users_table',86),(295,'2023_02_08_163747_create_withdrawal_methods_table',86),(296,'2023_02_08_165109_add_cols_to_withdraw_requests_table',86),(297,'2023_02_14_112313_create_incentive_logs_table',86),(298,'2023_02_14_112417_create_incentives_table',86),(299,'2023_02_14_165851_add_delivery_man_id_col_to_wallet_transactions_table',86),(300,'2023_02_14_172250_change_amount_col_to_expenses_table',86),(301,'2023_02_15_131107_add_otp_hit_count_cols_in_phone_verifications_table',86),(302,'2023_02_16_104809_add_hit_count_at_col_in_password_resets_table',86),(303,'2023_02_16_123420_add_increased_delivery_fee_in_zones_table',86),(304,'2023_02_16_145350_create_shifts_table',86),(305,'2023_02_16_145830_add_shift_id_col_to_time_logs_table',86),(306,'2023_02_16_145934_add_shift_id_col_to_delivery_men_table',86),(307,'2023_02_18_070327_create_subscriptions_table',86),(308,'2023_02_18_070628_create_subscription_logs_table',86),(309,'2023_02_18_070757_create_subscription_pauses_table',86),(310,'2023_02_18_070826_create_subscription_schedules_table',86),(311,'2023_02_18_071042_add_subscription_id_col_to_order_table',86),(312,'2023_02_18_071609_add_is_subscription_order_col_to_order_transactions_table',86),(313,'2023_02_19_164536_create_visitor_logs_table',86),(314,'2023_03_11_120645_add_temp_block_time_col_to_phone_verifications_table',86),(315,'2023_03_11_121000_add_temp_block_time_col_to_password_resets_table',86),(316,'2023_03_16_163907_add_order_subscription_col_in_restaurant_table',86),(317,'2023_03_18_121906_add_order_cancel_note_col_in_orders_table',86),(318,'2023_03_18_144849_add_temp_token_col_in_users_table',86),(319,'2023_03_19_153620_add_increase_delivery_charge_message_col_in_zones_table',86),(320,'2023_03_13_144714_create_logs_table',87),(321,'2023_04_08_132653_add_created_by_col_to_password_resets_table',87),(322,'2023_04_17_112228_create_notification_messages_table',87),(323,'2023_05_07_155839_change_delivery_charge_col_in_admin_wallets_table',87),(324,'2023_05_10_162452_create_admin_testimonials_table',87),(325,'2023_05_10_184114_create_data_settings_table',87),(326,'2023_05_13_115610_create_admin_features_table',87),(327,'2023_05_14_092428_create_react_services_table',87),(328,'2023_05_14_104308_create_react_promotional_banners_table',87),(329,'2023_05_18_161133_create_email_templates_table',87),(330,'2023_05_31_154309_create_admin_special_criterias_table',87),(331,'2023_06_11_040112_add_cutlery_col_in_orders_table',87),(332,'2023_06_11_171524_change_delivery_time_col_in_restaurants_table',87),(333,'2023_06_13_112622_add_cutlery_on_restaurants_table',87),(334,'2023_07_05_135741_add_service_charge_col_to_orders_table',88),(335,'2023_07_05_145800_add_service_charge_col_to_order_transactions_table',88),(336,'2023_07_25_130949_create_wallet_payments_table',88),(337,'2023_07_25_131036_create_wallet_bonuses_table',88),(338,'2023_07_25_131958_add_user_id_col_expenses_table',88),(339,'2023_07_26_171058_create_order_payments_table',88),(340,'2023_07_31_235517_add_maximum_cart_quantity_col_to_food',88),(341,'2023_07_31_235555_add_maximum_cart_quantity_col_to_item_campaigns',88),(342,'2023_08_02_043239_add_meta_data_to_restaurants_table',88),(343,'2023_08_05_232205_add_payment_status_to_subscription_transactions_table',88),(344,'0000_00_00_000000_create_websockets_statistics_entries_table',89),(345,'2023_08_30_130431_create_offline_payment_methods_table',89),(346,'2023_08_30_130446_create_offline_payments_table',89),(347,'2023_08_30_162632_add_announcement_cols_to_restaurants_table',89),(348,'2023_08_30_171559_create_guests_table',89),(349,'2023_08_30_181336_add_is_guest_col_to_orders_table',89),(350,'2023_09_03_174650_add_qr_code_col_to_restaurants_table',89),(351,'2023_10_02_114519_create_carts_table',89),(352,'2023_10_04_142129_add_free_delivery_distance_col_to_restaurants_table',89),(353,'2023_10_18_124954_create_restaurant_configs_table',89),(354,'2023_10_19_093057_create_restaurant_tags_table',89),(355,'2023_10_22_183705_add_additional_data_col_in_restaurants_table',89),(356,'2023_10_25_173519_add_additional_data_col_to_delivery_men_table',89),(357,'2023_10_26_105254_change_name_col_on_user_infos',89),(358,'2023_10_29_114625_add_created_by_col_to_account_transactions_table',89),(359,'2023_10_29_161701_create_disbursements_table',89),(360,'2023_10_29_161757_create_disbursement_details_table',89),(361,'2023_10_29_183055_create_disbursement_withdrawal_methods_table',89),(362,'2023_10_30_093234_add_type_col_to_withdraw_requests_table',89),(363,'2023_11_21_132325_add_current_language_key_col_to_users_table',90),(364,'2024_03_09_094824_add_is_default_col_to_order_cancel_reasons_table',91),(365,'2024_03_19_124736_add_halal_tag_status_col_to_restaurant_configs_table',91),(366,'2024_03_19_132910_add_is_halal_col_to_food_table',91),(367,'2024_03_21_113032_add_body_2_col_to_email_templates',91),(368,'2024_04_21_041436_create_cash_backs_table',92),(369,'2024_04_21_042152_create_cash_back_histories_table',92),(370,'2024_04_21_115033_add_cashback_ref_amount_cols_to_orders_table',92),(371,'2024_04_21_115411_add_extra_packaging_cols_to_restaurant_configs_table',92),(372,'2024_04_21_124756_add_extra_packaging_ref_bonus_amount_col_to_order_transactions_table',92),(373,'2024_04_21_134012_add_reply_col_to_reviews_table',92),(374,'2024_04_22_112655_create_variations_table',92),(375,'2024_04_22_112708_create_variation_options_table',92),(376,'2024_04_22_115714_create_characteristics_table',92),(377,'2024_04_22_115813_create_characteristic_restaurants_table',92),(378,'2024_04_22_164150_add_stock_col_to_food_table',92),(379,'2024_04_24_115636_create_priority_lists_table',92),(380,'2024_04_24_124714_add_variation_option_col_on_cart_table',92),(381,'2024_04_24_173317_add_stock_col_to_add_ons_table',92),(382,'2024_06_06_115927_create_storages_table',93),(383,'2024_06_08_114756_create_advertisements_table',93),(384,'2024_06_15_130020_create_notification_settings_table',93),(385,'2024_06_26_044400_add_change_file_col_to_messages_table',93),(386,'2024_06_30_030925_create_restaurant_notification_settings_table',93),(387,'2024_08_12_154153_create_cache_table',94),(388,'2024_08_24_110338_add_some_new_cols_to_restaurant_subscriptions_table',95),(389,'2024_08_24_111725_add_some_new_cols_to_subscription_transactions_table',95),(390,'2024_08_25_175919_create_subscription_billing_and_refund_histories_table',95),(391,'2024_09_30_154821_add_is_email_verified_col_to_users_table',95),(392,'2024_10_01_164138_add_package_id_col_to_restaurants_table',95),(393,'2024_10_03_153429_add_display_name_col_to_zones_table',95),(394,'2024_10_05_001615_create_allergies_table',95),(395,'2024_10_05_001629_create_nutritions_table',95),(396,'2024_10_05_001848_create_allergy_food_table',95),(397,'2024_10_05_001952_create_food_nutrition_table',95),(398,'2024_10_19_134056_add_phone_col_to_password_resets_table',95),(399,'2024_11_07_110310_add_dine_in_col_to_restaurant_configs',96),(400,'2024_11_10_162613_create_order_references_table',96),(401,'2025_02_06_034224_add_to_col_orders_table',97),(402,'2025_03_09_040916_create_recent_searches_table',97),(403,'2025_04_20_051619_create_react_opportunities_table',98),(404,'2025_04_21_110215_create_react_faqs_table',98),(405,'2025_05_26_115043_create_system_tax_setups_table',99),(406,'2025_05_26_115643_create_taxes_table',99),(407,'2025_05_26_120030_create_tax_additional_setups_table',99),(408,'2025_05_26_120912_create_taxables_table',99),(409,'2025_05_26_121656_create_order_taxes_table',99),(410,'2025_06_01_130624_add_addon_category_id_col_to_add_ons_table',99),(411,'2025_06_14_103839_create_addon_categories_table',99),(412,'2025_06_25_174502_add_to_cols_restaurants_table',99),(413,'2025_07_02_032306_add_to_cols_order_details_table',99),(414,'2025_07_06_070056_add_tax_type_col_to_order_table',99);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Subscribers email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `newsletters_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_messages`
--

DROP TABLE IF EXISTS `notification_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_messages`
--

LOCK TABLES `notification_messages` WRITE;
/*!40000 ALTER TABLE `notification_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('admin','customer','restaurant','deliveryman') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `mail_status` enum('active','inactive','disable') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `sms_status` enum('active','inactive','disable') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `push_notification_status` enum('active','inactive','disable') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
INSERT INTO `notification_settings` VALUES (1,'forget_password','Sent_notification_on_forget_password','forget_password','admin','active','active','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(2,'deliveryman_self_registration','Sent_notification_on_deliveryman_self_registration','deliveryman_self_registration','admin','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(3,'restaurant_self_registration','Sent_notification_on_restaurant_self_registration','restaurant_self_registration','admin','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(4,'campaign_join_request','Sent_notification_on_campaign_join_request','campaign_join_request','admin','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(5,'withdraw_request','Sent_notification_on_withdraw_request','withdraw_request','admin','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(6,'order_refund_request','Sent_notification_on_order_refund_request','order_refund_request','admin','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(7,'advertisement_add','Sent_notification_on_advertisement_add','advertisement_add','admin','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(8,'advertisement_update','Sent_notification_on_advertisement_update','advertisement_update','admin','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(9,'deliveryman_registration','Sent_notification_on_deliveryman_registration','deliveryman_registration','deliveryman','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(10,'deliveryman_registration_approval','Sent_notification_on_deliveryman_registration_approval','deliveryman_registration_approval','deliveryman','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(11,'deliveryman_registration_deny','Sent_notification_on_deliveryman_registration_deny','deliveryman_registration_deny','deliveryman','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(12,'deliveryman_account_block','Sent_notification_on_deliveryman_account_block','deliveryman_account_block','deliveryman','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(13,'deliveryman_account_unblock','Sent_notification_on_deliveryman_account_unblock','deliveryman_account_unblock','deliveryman','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(14,'deliveryman_forget_password','Sent_notification_on_deliveryman_forget_password','deliveryman_forget_password','deliveryman','active','active','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(15,'deliveryman_collect_cash','Sent_notification_on_deliveryman_collect_cash','deliveryman_collect_cash','deliveryman','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(16,'deliveryman_order_notification','Sent_notification_order_notification_to_deliveryman','deliveryman_order_notification','deliveryman','disable','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(17,'deliveryman_order_assign_or_unassign','Sent_notification_on_deliveryman_order_assign_or_unassign','deliveryman_order_assign_unassign','deliveryman','disable','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(18,'restaurant_registration','Sent_notification_on_restaurant_registration','restaurant_registration','restaurant','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(19,'restaurant_registration_approval','Sent_notification_on_restaurant_registration_approval','restaurant_registration_approval','restaurant','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(20,'restaurant_registration_deny','Sent_notification_on_restaurant_registration_deny','restaurant_registration_deny','restaurant','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(21,'restaurant_account_block','Sent_notification_on_restaurant_account_block','restaurant_account_block','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(22,'restaurant_account_unblock','Sent_notification_on_restaurant_account_unblock','restaurant_account_unblock','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(23,'restaurant_withdraw_approve','Sent_notification_on_restaurant_withdraw_approve','restaurant_withdraw_approve','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(24,'restaurant_withdraw_rejaction','Sent_notification_on_restaurant_withdraw_rejaction','restaurant_withdraw_rejaction','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(25,'restaurant_campaign_join_request','Sent_notification_on_restaurant_campaign_join_request','restaurant_campaign_join_request','restaurant','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(26,'restaurant_campaign_join_rejaction','Sent_notification_on_restaurant_campaign_join_rejaction','restaurant_campaign_join_rejaction','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(27,'restaurant_campaign_join_approval','Sent_notification_on_restaurant_campaign_join_approval','restaurant_campaign_join_approval','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(28,'restaurant_order_notification','Sent_notification_on_restaurant_order_notification','restaurant_order_notification','restaurant','disable','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(29,'restaurant_advertisement_create_by_admin','Sent_notification_on_restaurant_advertisement_create_by_admin','restaurant_advertisement_create_by_admin','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(30,'restaurant_advertisement_approval','Sent_notification_on_restaurant_advertisement_approval','restaurant_advertisement_approval','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(31,'restaurant_advertisement_deny','Sent_notification_on_restaurant_advertisement_deny','restaurant_advertisement_deny','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(32,'restaurant_advertisement_resume','Sent_notification_on_restaurant_advertisement_resume','restaurant_advertisement_resume','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(33,'restaurant_advertisement_pause','Sent_notification_on_restaurant_advertisement_pause','restaurant_advertisement_pause','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(34,'customer_registration','Sent_notification_on_customer_registration','customer_registration','customer','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(35,'customer_pos_registration','Sent_notification_on_customer_pos_registration','customer_pos_registration','customer','active','disable','disable','2024-10-18 21:01:43','2024-10-18 21:01:43'),(36,'customer_order_notification','Sent_notification_on_customer_order_notification','customer_order_notification','customer','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(37,'customer_delivery_verification','Sent_notification_on_customer_delivery_verification','customer_delivery_verification','customer','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(38,'customer_refund_request_approval','Sent_notification_on_customer_refund_request_approval','customer_refund_request_approval','customer','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(39,'customer_refund_request_rejaction','Sent_notification_on_customer_refund_request_rejaction','customer_refund_request_rejaction','customer','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(40,'customer_add_fund_to_wallet','Sent_notification_on_customer_add_fund_to_wallet','customer_add_fund_to_wallet','customer','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(41,'customer_offline_payment_approve','Sent_notification_on_customer_offline_payment_approve','customer_offline_payment_approve','customer','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(42,'customer_offline_payment_deny','Sent_notification_on_customer_offline_payment_deny','customer_offline_payment_deny','customer','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(43,'customer_account_block','Sent_notification_on_customer_account_block','customer_account_block','customer','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(44,'customer_account_unblock','Sent_notification_on_customer_account_unblock','customer_account_unblock','customer','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(45,'customer_cashback','Sent_notification_on_customer_cashback','customer_cashback','customer','disable','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(46,'customer_referral_bonus_earning','Sent_notification_on_customer_referral_bonus_earning','customer_referral_bonus_earning','customer','disable','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(47,'customer_new_referral_join','Sent_notification_on_customer_new_referral_join','customer_new_referral_join','customer','disable','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(48,'restaurant_subscription_success','Sent_notification_on_restaurant_subscription_success','restaurant_subscription_success','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(49,'restaurant_subscription_renew','Sent_notification_on_restaurant_subscription_renew','restaurant_subscription_renew','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(50,'restaurant_subscription_shift','Sent_notification_on_restaurant_subscription_shift','restaurant_subscription_shift','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(51,'restaurant_subscription_cancel','Sent_notification_on_restaurant_subscription_cancel','restaurant_subscription_cancel','restaurant','active','disable','active','2024-10-18 21:01:43','2024-10-18 21:01:43'),(52,'restaurant_subscription_plan_update','Sent_notification_on_restaurant_subscription_plan_update','restaurant_subscription_plan_update','restaurant','active','disable','inactive','2024-10-18 21:01:43','2024-10-18 21:01:43'),(53,'customer_dine_in_table_or_token','Sent_notification_on_customer_dine_in_table_or_token','customer_dine_in_table_or_token','customer','disable','disable','active','2025-07-24 02:30:15','2025-07-24 02:30:15');
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutritions`
--

DROP TABLE IF EXISTS `nutritions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutritions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nutrition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutritions`
--

LOCK TABLES `nutritions` WRITE;
/*!40000 ALTER TABLE `nutritions` DISABLE KEYS */;
INSERT INTO `nutritions` VALUES (1,'na','2025-07-23 21:02:08','2025-07-23 21:02:08');
/*!40000 ALTER TABLE `nutritions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
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
INSERT INTO `oauth_access_tokens` VALUES ('02c187400441f53687a30af580361503d21ab9e30fc263f729536e3e6fb8e013c5f10f170df66154',56,1,'RestaurantCustomerAuth','[]',0,'2021-08-14 07:26:44','2021-08-14 07:26:44','2022-08-14 13:26:44'),('03652f98734cb46633be656afd61eb9d6bef93da6cb3f97e5d862e758bc8a7458f4271c9fc525a03',56,1,'RestaurantCustomerAuth','[]',0,'2021-07-04 04:56:56','2021-07-04 04:56:56','2022-07-04 10:56:56'),('0c0698d04088cdad39a6551a639e02242373bd8cb6e115ff58d9ab11357d3295c6ba0edc08176abb',1,1,'RestaurantCustomerAuth','[]',0,'2022-07-03 23:08:38','2022-07-03 23:08:38','2023-07-04 05:08:38'),('0ce77d214106aa7d2691f22e57a52d61e83c4a74e232b6cf6409728c337a731412d5f011c265abf9',56,1,'RestaurantCustomerAuth','[]',0,'2021-08-08 14:51:24','2021-08-08 14:51:24','2022-08-08 20:51:24'),('1796645666d7dd6ef53186e095fb9c39d2128e5cca19f2e1ac8e7e7da82d6174fe98b14e94925188',56,1,'RestaurantCustomerAuth','[]',0,'2021-08-04 07:35:29','2021-08-04 07:35:29','2022-08-04 13:35:29'),('26d2f9dcc164930b349d02ffef47f9930f97391cd7c84132764c4bd161f490b45c342db4f382442e',1,1,'RestaurantCustomerAuth','[]',0,'2025-07-25 01:31:48','2025-07-25 01:31:48','2026-07-25 01:31:48'),('2919672ecc1e3dd9f2759d15f8cc54882d1d9f780cfda82fb83c8359de8654492ea6703956a7c50d',56,1,'RestaurantCustomerAuth','[]',0,'2021-07-15 08:22:28','2021-07-15 08:22:28','2022-07-15 14:22:28'),('2f49586a4ac33179f846e60afba15e655ceef494cd64f6812d4ab109336f5fb008cb3005137f700c',56,1,'RestaurantCustomerAuth','[]',0,'2021-08-03 13:21:13','2021-08-03 13:21:13','2022-08-03 19:21:13'),('3115e428f22908fa2d94bf2804d1ed2d9929cb27da233aedf24c8bc71dc8066f91b0c63a795c26e9',56,1,'RestaurantCustomerAuth','[]',0,'2021-07-31 08:33:37','2021-07-31 08:33:37','2022-07-31 14:33:37'),('36217e984b8904eb4dfd30ed62eef9d725c1e8e63a6c1485bb084ef323ad5eea852c84e17560bd54',56,1,'RestaurantCustomerAuth','[]',0,'2021-07-14 00:51:51','2021-07-14 00:51:51','2022-07-14 06:51:51'),('3abfb4980fdf3c858e1c371352db40dae9e1e40f095b00dcd09c84ff7c8189a305f1be985e4274b3',56,1,'RestaurantCustomerAuth','[]',0,'2021-06-19 03:50:53','2021-06-19 03:50:53','2022-06-19 09:50:53'),('3cd3269423e543961a7b64e8169875725eb47f8d0f309c69a4a770258de65e9c02057ed9000942da',56,1,'RestaurantCustomerAuth','[]',0,'2021-08-04 07:35:04','2021-08-04 07:35:04','2022-08-04 13:35:04'),('3e923b1f4084faba1a2e5448bd8b72e09b74db6ed25fbe14f6960a5f005107496cc507c1ba15c6e1',56,1,'RestaurantCustomerAuth','[]',0,'2021-06-22 01:32:58','2021-06-22 01:32:58','2022-06-22 07:32:58'),('4140d5b9b3d16e4bbef1b676b01f13f75d9c3fb2cada6548e50b0b2679562aace3b9b44f82f15f30',56,1,'RestaurantCustomerAuth','[]',0,'2021-08-19 17:10:26','2021-08-19 17:10:26','2022-08-19 23:10:26'),('42ee059b49880163a34848cfc528e347915f9b9358c4b69c8d98fb1dd17492e4917198a77a6d81b6',1,1,'RestaurantCustomerAuth','[]',0,'2022-07-03 22:59:58','2022-07-03 22:59:58','2023-07-04 04:59:58'),('4cfad08796e4a1eecfe8bbdc20e512e0954570168990fa60442ad41b5ecf05e4005cadcae08fbddd',56,1,'RestaurantCustomerAuth','[]',0,'2021-06-19 03:29:52','2021-06-19 03:29:52','2022-06-19 09:29:52'),('53afc11b36d08435d8ec82c42305f7aa4397d10b2d296f6e7d819e091d0d7c6d48e14cdc5e66e6c9',56,1,'RestaurantCustomerAuth','[]',0,'2021-06-23 23:08:01','2021-06-23 23:08:01','2022-06-24 05:08:01'),('5646d6337aaed0e662c059ed368372e2da241ff97a42df56310667ec321fdbf2252d92771988640a',56,1,'RestaurantCustomerAuth','[]',0,'2021-08-04 07:37:55','2021-08-04 07:37:55','2022-08-04 13:37:55'),('57cc3fb7ede5d1b60a4fb23218a28d0e49daee4ded226e584f03adb4c87547860e99eb18d0f28def',1,1,'RestaurantCustomerAuth','[]',0,'2022-07-03 23:09:37','2022-07-03 23:09:37','2023-07-04 05:09:37'),('59551e481bc1fb037bee07e1501d81dad38d4ff34fdca68a49c40d0cf423176ca111940acd359aeb',56,1,'RestaurantCustomerAuth','[]',0,'2021-08-08 14:50:59','2021-08-08 14:50:59','2022-08-08 20:50:59'),('68b06321c4bbbea81e7dfcbd8d5fae1a94a2fa0500041ee5774be2d9300c1ff7590d03604b77514a',56,1,'RestaurantCustomerAuth','[]',0,'2021-07-28 02:33:54','2021-07-28 02:33:54','2022-07-28 08:33:54'),('723ceee668cd1a7fc2e977be48cab3f31aed1ace0883692711b5cc2ddf42c2f23c6d75461172105f',56,1,'RestaurantCustomerAuth','[]',0,'2021-07-01 05:46:27','2021-07-01 05:46:27','2022-07-01 11:46:27'),('74e2dd27429bb92c12e33f891ccff32f48c22463166666705d145cfd8968d96ec992fa2cc3a36e76',56,1,'RestaurantCustomerAuth','[]',0,'2021-06-23 23:08:23','2021-06-23 23:08:23','2022-06-24 05:08:23'),('77c9389b2ab3031e09005a7e7be90d00496ff073dbbefeb57229cee5d0a240376c1f7c3c8a94faff',56,1,'RestaurantCustomerAuth','[]',0,'2021-06-19 03:38:22','2021-06-19 03:38:22','2022-06-19 09:38:22'),('7cf10043f8e537bf9b773fb421598ef009714321483c7e542c4ceeb69b374cd81a9f6167ec271826',1,1,'RestaurantCustomerAuth','[]',0,'2022-07-03 23:04:52','2022-07-03 23:04:52','2023-07-04 05:04:52'),('7dc8d139097163e9f830454a00bf6cca8bc3637e84f9ec959c376daf0a5567f5a9d283c805eea680',1,1,'RestaurantCustomerAuth','[]',0,'2025-07-24 00:22:24','2025-07-24 00:22:24','2026-07-24 00:22:24'),('8a20c4f8656e404615f9abc15a95f6754dd87e4e894677647dd17236b95d8a5d7cc243c38457b048',56,1,'RestaurantCustomerAuth','[]',0,'2021-07-04 02:36:57','2021-07-04 02:36:57','2022-07-04 08:36:57'),('8b46ab5b929aa6097229e3606d70d25ed30993640f567aa79dd002d9f55527bc6144af164aee97a2',1,1,'RestaurantCustomerAuth','[]',0,'2022-07-03 23:11:21','2022-07-03 23:11:21','2023-07-04 05:11:21'),('8fac29cec1f473ab4d3a152df0b7e168bccdc0e2f4279b66b6eb1e5377adc001d82efdcaf38417d1',2,1,'RestaurantCustomerAuth','[]',0,'2025-07-25 18:24:35','2025-07-25 18:24:35','2026-07-25 18:24:35'),('8ffc458ddbcbbbec17035dc2153c4baeebb5c54796b3a9008f24c8699197a8a2fc1111c36cc1d7da',56,1,'RestaurantCustomerAuth','[]',0,'2021-08-14 07:27:12','2021-08-14 07:27:12','2022-08-14 13:27:12'),('a092dc4a49ec27a06d8c9c335446de3d90e03363c6059cdf6fbf2113edaab5fe752053a794ac9236',56,1,'RestaurantCustomerAuth','[]',0,'2021-08-08 10:12:49','2021-08-08 10:12:49','2022-08-08 16:12:49'),('b4651c7e8bbe8a68b4959504c3a7e3705208cbdb79fcc2498b9b3d0efa9c7cadc77699590cf8f2d4',56,1,'RestaurantCustomerAuth','[]',0,'2021-06-20 03:59:46','2021-06-20 03:59:46','2022-06-20 09:59:46'),('bf24e16194d82c4e2982724df0fef68f7923d6d01ce8c5e1b64e2716d2412db6e62891f0f8dae8a6',57,1,'RestaurantCustomerAuth','[]',0,'2021-07-31 08:34:19','2021-07-31 08:34:19','2022-07-31 14:34:19'),('c1b7df78e7373f5eca5f64083ac9bbc6c9bd582adf6c143f520c8a65420d3ee050044e6f65f0a033',56,1,'RestaurantCustomerAuth','[]',0,'2021-06-24 03:40:43','2021-06-24 03:40:43','2022-06-24 09:40:43'),('dd6578c99fc90f666b9433871d28f9913fefc860d9a60427388cfcf727be6f5c10eb8b764b39c557',56,1,'RestaurantCustomerAuth','[]',0,'2021-06-28 10:20:50','2021-06-28 10:20:50','2022-06-28 16:20:50'),('ea3ca170bd7935fe3f2a9c80c74d1e8e6eda8cc197ce2066305a286d175ad250475a4657e498779b',56,1,'RestaurantCustomerAuth','[]',0,'2021-06-21 01:24:25','2021-06-21 01:24:25','2022-06-21 07:24:25'),('f0e9bba3e6ba5a0dd39acea36fc1b4f278349e61af71fe79a1b88539e88b631122e4364bb59f0634',1,1,'RestaurantCustomerAuth','[]',0,'2022-07-03 23:07:01','2022-07-03 23:07:01','2023-07-04 05:07:01');
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
  `client_id` bigint unsigned NOT NULL,
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
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','qFAwGhxq8A6SDmolyxZunXyQ4mxOH0jEezXsgaxP',NULL,'http://localhost',1,0,0,'2021-06-19 03:27:59','2021-06-19 03:27:59'),(2,NULL,'Laravel Password Grant Client','qdV021R3MGGAwRxvvqG0mWgnypwzolzusBq1L5W6','users','http://localhost',0,1,0,'2021-06-19 03:27:59','2021-06-19 03:27:59');
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
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-06-19 03:27:59','2021-06-19 03:27:59');
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
-- Table structure for table `offline_payment_methods`
--

DROP TABLE IF EXISTS `offline_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_payment_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_informations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_payment_methods`
--

LOCK TABLES `offline_payment_methods` WRITE;
/*!40000 ALTER TABLE `offline_payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_payments`
--

DROP TABLE IF EXISTS `offline_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `payment_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `customer_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `method_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_payments`
--

LOCK TABLES `offline_payments` WRITE;
/*!40000 ALTER TABLE `offline_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_cancel_reasons`
--

DROP TABLE IF EXISTS `order_cancel_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_cancel_reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_cancel_reasons`
--

LOCK TABLES `order_cancel_reasons` WRITE;
/*!40000 ALTER TABLE `order_cancel_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_cancel_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_delivery_histories`
--

DROP TABLE IF EXISTS `order_delivery_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_delivery_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery_histories`
--

LOCK TABLES `order_delivery_histories` WRITE;
/*!40000 ALTER TABLE `order_delivery_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_delivery_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `food_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `food_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `variation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `add_ons` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount_on_food` decimal(24,2) DEFAULT NULL,
  `discount_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int NOT NULL DEFAULT '1',
  `tax_amount` decimal(24,2) NOT NULL DEFAULT '1.00',
  `variant` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint unsigned DEFAULT NULL,
  `total_add_on_price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `category_id` int DEFAULT NULL,
  `discount_on_product_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_percentage` double(23,8) DEFAULT '0.00000000',
  `addon_discount` double(23,8) DEFAULT '0.00000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,2,100000,25.00,'{\"id\":2,\"name\":\"Pizza\",\"description\":\"Good pizza\",\"image\":\"2025-07-23-6880dd50d5249.png\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":\"[]\",\"choice_options\":\"[]\",\"price\":25,\"tax\":0,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"amount\",\"available_time_starts\":\"12:35:00\",\"available_time_ends\":\"23:57:00\",\"veg\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2025-07-23T13:02:08.000000Z\",\"updated_at\":\"2025-07-24T17:35:47.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"recommended\":0,\"slug\":\"pizza\",\"maximum_cart_quantity\":3,\"is_halal\":0,\"item_stock\":5,\"sell_count\":1,\"stock_type\":\"limited\",\"restaurant_name\":\"Test Restaurant 1\",\"restaurant_status\":1,\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":true,\"free_delivery\":0,\"halal_tag_status\":0,\"nutritions_name\":[\"na\"],\"allergies_name\":[],\"min_delivery_time\":28,\"max_delivery_time\":57,\"cuisines\":[],\"tax_data\":[],\"image_full_url\":\"https:\\/\\/home.homeplate.life\\/storage\\/app\\/public\\/product\\/2025-07-23-6880dd50d5249.png\",\"storage\":[{\"id\":117,\"data_type\":\"App\\\\Models\\\\Food\",\"data_id\":\"2\",\"key\":\"image\",\"value\":\"public\",\"created_at\":\"2025-07-23 21:02:08\",\"updated_at\":\"2025-07-23 21:02:08\"}],\"translations\":[{\"id\":58,\"translationable_type\":\"App\\\\Models\\\\Food\",\"translationable_id\":2,\"locale\":\"en\",\"key\":\"name\",\"value\":\"Pizza\",\"created_at\":null,\"updated_at\":null},{\"id\":59,\"translationable_type\":\"App\\\\Models\\\\Food\",\"translationable_id\":2,\"locale\":\"en\",\"key\":\"description\",\"value\":\"Good pizza\",\"created_at\":null,\"updated_at\":null}],\"new_variations\":[],\"nutritions\":[{\"id\":1,\"nutrition\":\"na\",\"created_at\":\"2025-07-23T13:02:08.000000Z\",\"updated_at\":\"2025-07-23T13:02:08.000000Z\",\"pivot\":{\"food_id\":2,\"nutrition_id\":1}}],\"allergies\":[]}','[]','[]',5.00,'discount_on_product',1,0.00,NULL,'2025-07-25 01:41:33','2025-07-25 01:41:33',NULL,0.00,1,'vendor',NULL,5.00000000,0.00000000),(2,2,100001,25.00,'{\"id\":2,\"name\":\"Pizza\",\"description\":\"Good pizza\",\"image\":\"2025-07-23-6880dd50d5249.png\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":\"[]\",\"choice_options\":\"[]\",\"price\":25,\"tax\":0,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"amount\",\"available_time_starts\":\"12:35:00\",\"available_time_ends\":\"23:57:00\",\"veg\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2025-07-23T13:02:08.000000Z\",\"updated_at\":\"2025-07-24T17:55:43.000000Z\",\"order_count\":1,\"avg_rating\":5,\"rating_count\":1,\"recommended\":0,\"slug\":\"pizza\",\"maximum_cart_quantity\":3,\"is_halal\":0,\"item_stock\":4,\"sell_count\":2,\"stock_type\":\"limited\",\"restaurant_name\":\"Test Restaurant 1\",\"restaurant_status\":1,\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":true,\"free_delivery\":0,\"halal_tag_status\":0,\"nutritions_name\":[\"na\"],\"allergies_name\":[],\"min_delivery_time\":28,\"max_delivery_time\":57,\"cuisines\":[],\"tax_data\":[],\"image_full_url\":\"https:\\/\\/home.homeplate.life\\/storage\\/app\\/public\\/product\\/2025-07-23-6880dd50d5249.png\",\"storage\":[{\"id\":117,\"data_type\":\"App\\\\Models\\\\Food\",\"data_id\":\"2\",\"key\":\"image\",\"value\":\"public\",\"created_at\":\"2025-07-23 21:02:08\",\"updated_at\":\"2025-07-23 21:02:08\"}],\"translations\":[{\"id\":58,\"translationable_type\":\"App\\\\Models\\\\Food\",\"translationable_id\":2,\"locale\":\"en\",\"key\":\"name\",\"value\":\"Pizza\",\"created_at\":null,\"updated_at\":null},{\"id\":59,\"translationable_type\":\"App\\\\Models\\\\Food\",\"translationable_id\":2,\"locale\":\"en\",\"key\":\"description\",\"value\":\"Good pizza\",\"created_at\":null,\"updated_at\":null}],\"new_variations\":[],\"nutritions\":[{\"id\":1,\"nutrition\":\"na\",\"created_at\":\"2025-07-23T13:02:08.000000Z\",\"updated_at\":\"2025-07-23T13:02:08.000000Z\",\"pivot\":{\"food_id\":2,\"nutrition_id\":1}}],\"allergies\":[]}','[]','[]',5.00,'discount_on_product',1,0.00,NULL,'2025-07-25 18:25:57','2025-07-25 18:25:57',NULL,0.00,1,'vendor',NULL,5.00000000,0.00000000),(3,2,100002,25.00,'{\"id\":2,\"name\":\"Pizza\",\"description\":\"Good pizza\",\"image\":\"2025-07-23-6880dd50d5249.png\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":\"[]\",\"choice_options\":\"[]\",\"price\":25,\"tax\":0,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"amount\",\"available_time_starts\":\"12:35:00\",\"available_time_ends\":\"23:57:00\",\"veg\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2025-07-23T13:02:08.000000Z\",\"updated_at\":\"2025-07-25T10:25:57.000000Z\",\"order_count\":1,\"avg_rating\":5,\"rating_count\":1,\"recommended\":0,\"slug\":\"pizza\",\"maximum_cart_quantity\":3,\"is_halal\":0,\"item_stock\":3,\"sell_count\":3,\"stock_type\":\"limited\",\"restaurant_name\":\"Test Restaurant 1\",\"restaurant_status\":1,\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":true,\"free_delivery\":0,\"halal_tag_status\":0,\"nutritions_name\":[\"na\"],\"allergies_name\":[],\"min_delivery_time\":28,\"max_delivery_time\":57,\"cuisines\":[],\"tax_data\":[],\"image_full_url\":\"https:\\/\\/home.homeplate.life\\/storage\\/app\\/public\\/product\\/2025-07-23-6880dd50d5249.png\",\"storage\":[{\"id\":117,\"data_type\":\"App\\\\Models\\\\Food\",\"data_id\":\"2\",\"key\":\"image\",\"value\":\"public\",\"created_at\":\"2025-07-23 21:02:08\",\"updated_at\":\"2025-07-23 21:02:08\"}],\"translations\":[{\"id\":58,\"translationable_type\":\"App\\\\Models\\\\Food\",\"translationable_id\":2,\"locale\":\"en\",\"key\":\"name\",\"value\":\"Pizza\",\"created_at\":null,\"updated_at\":null},{\"id\":59,\"translationable_type\":\"App\\\\Models\\\\Food\",\"translationable_id\":2,\"locale\":\"en\",\"key\":\"description\",\"value\":\"Good pizza\",\"created_at\":null,\"updated_at\":null}],\"new_variations\":[],\"nutritions\":[{\"id\":1,\"nutrition\":\"na\",\"created_at\":\"2025-07-23T13:02:08.000000Z\",\"updated_at\":\"2025-07-23T13:02:08.000000Z\",\"pivot\":{\"food_id\":2,\"nutrition_id\":1}}],\"allergies\":[]}','[]','[]',5.00,'discount_on_product',1,0.00,NULL,'2025-07-25 18:29:29','2025-07-25 18:29:29',NULL,0.00,1,'vendor',NULL,5.00000000,0.00000000),(4,2,100003,25.00,'{\"id\":2,\"name\":\"Pizza\",\"description\":\"Good pizza\",\"image\":\"2025-07-23-6880dd50d5249.png\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":\"[]\",\"choice_options\":\"[]\",\"price\":25,\"tax\":0,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"amount\",\"available_time_starts\":\"12:35:00\",\"available_time_ends\":\"23:57:00\",\"veg\":0,\"status\":1,\"restaurant_id\":2,\"created_at\":\"2025-07-23T13:02:08.000000Z\",\"updated_at\":\"2025-07-25T10:29:29.000000Z\",\"order_count\":1,\"avg_rating\":5,\"rating_count\":1,\"recommended\":0,\"slug\":\"pizza\",\"maximum_cart_quantity\":3,\"is_halal\":0,\"item_stock\":2,\"sell_count\":4,\"stock_type\":\"limited\",\"restaurant_name\":\"Test Restaurant 1\",\"restaurant_status\":1,\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":true,\"free_delivery\":0,\"halal_tag_status\":0,\"nutritions_name\":[\"na\"],\"allergies_name\":[],\"min_delivery_time\":28,\"max_delivery_time\":57,\"cuisines\":[],\"tax_data\":[],\"image_full_url\":\"https:\\/\\/home.homeplate.life\\/storage\\/app\\/public\\/product\\/2025-07-23-6880dd50d5249.png\",\"storage\":[{\"id\":117,\"data_type\":\"App\\\\Models\\\\Food\",\"data_id\":\"2\",\"key\":\"image\",\"value\":\"public\",\"created_at\":\"2025-07-23 21:02:08\",\"updated_at\":\"2025-07-23 21:02:08\"}],\"translations\":[{\"id\":58,\"translationable_type\":\"App\\\\Models\\\\Food\",\"translationable_id\":2,\"locale\":\"en\",\"key\":\"name\",\"value\":\"Pizza\",\"created_at\":null,\"updated_at\":null},{\"id\":59,\"translationable_type\":\"App\\\\Models\\\\Food\",\"translationable_id\":2,\"locale\":\"en\",\"key\":\"description\",\"value\":\"Good pizza\",\"created_at\":null,\"updated_at\":null}],\"new_variations\":[],\"nutritions\":[{\"id\":1,\"nutrition\":\"na\",\"created_at\":\"2025-07-23T13:02:08.000000Z\",\"updated_at\":\"2025-07-23T13:02:08.000000Z\",\"pivot\":{\"food_id\":2,\"nutrition_id\":1}}],\"allergies\":[]}','[]','[]',5.00,'discount_on_product',1,0.00,NULL,'2025-07-26 10:54:02','2025-07-26 10:54:02',NULL,0.00,1,'vendor',NULL,5.00000000,0.00000000);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payments`
--

DROP TABLE IF EXISTS `order_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `transaction_ref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `payment_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payments`
--

LOCK TABLES `order_payments` WRITE;
/*!40000 ALTER TABLE `order_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_references`
--

DROP TABLE IF EXISTS `order_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_references` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `token_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_references`
--

LOCK TABLES `order_references` WRITE;
/*!40000 ALTER TABLE `order_references` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_taxes`
--

DROP TABLE IF EXISTS `order_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_on` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` double(23,8) NOT NULL DEFAULT '0.00000000',
  `tax_amount` double(23,8) NOT NULL DEFAULT '0.00000000',
  `before_tax_amount` double(23,8) NOT NULL DEFAULT '0.00000000',
  `after_tax_amount` double(23,8) NOT NULL DEFAULT '0.00000000',
  `tax_payer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT '1',
  `tax_id` bigint unsigned NOT NULL,
  `taxable_id` bigint unsigned DEFAULT NULL,
  `taxable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `store_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_tax_setup_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_taxes_country_code_index` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_taxes`
--

LOCK TABLES `order_taxes` WRITE;
/*!40000 ALTER TABLE `order_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transactions`
--

DROP TABLE IF EXISTS `order_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned NOT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `order_amount` decimal(24,2) NOT NULL,
  `restaurant_amount` decimal(24,2) NOT NULL,
  `admin_commission` decimal(24,2) NOT NULL,
  `received_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint unsigned DEFAULT NULL,
  `dm_tips` double(24,2) NOT NULL DEFAULT '0.00',
  `delivery_fee_comission` double(24,2) NOT NULL DEFAULT '0.00',
  `admin_expense` decimal(23,3) DEFAULT '0.000',
  `restaurant_expense` double(23,3) DEFAULT '0.000',
  `commission_percentage` double(16,3) DEFAULT '0.000',
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_amount_by_restaurant` double(23,3) DEFAULT '0.000',
  `is_subscription` tinyint(1) DEFAULT '0',
  `additional_charge` double(23,3) NOT NULL DEFAULT '0.000',
  `extra_packaging_amount` double(23,3) NOT NULL DEFAULT '0.000',
  `ref_bonus_amount` double(23,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `order_transactions_zone_id_index` (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transactions`
--

LOCK TABLES `order_transactions` WRITE;
/*!40000 ALTER TABLE `order_transactions` DISABLE KEYS */;
INSERT INTO `order_transactions` VALUES (1,2,NULL,100000,20.00,20.00,0.00,'admin',NULL,'2025-07-25 01:54:57','2025-07-25 01:54:57',0.00,0.00,0.00,2,0.00,0.00,0.000,0.000,0.000,0,5.000,0,0.000,0.000,0.000);
/*!40000 ALTER TABLE `order_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `restaurant_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `delivery_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `restaurant_discount_amount` decimal(24,2) NOT NULL,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(24,2) NOT NULL DEFAULT '0.00',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `zone_id` bigint unsigned DEFAULT NULL,
  `dm_tips` double(24,2) NOT NULL DEFAULT '0.00',
  `processing_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_delivery_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_request_canceled` timestamp NULL DEFAULT NULL,
  `cancellation_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canceled_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_id` bigint unsigned DEFAULT NULL,
  `discount_on_product_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'vendor',
  `distance` double(23,3) DEFAULT '0.000',
  `subscription_id` bigint unsigned DEFAULT NULL,
  `cancellation_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tax_percentage` double(24,3) DEFAULT NULL,
  `delivery_instruction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `unavailable_item_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cutlery` tinyint(1) NOT NULL DEFAULT '0',
  `additional_charge` double(23,3) NOT NULL DEFAULT '0.000',
  `partially_paid_amount` double(23,3) NOT NULL DEFAULT '0.000',
  `order_proof` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `cash_back_id` bigint unsigned DEFAULT NULL,
  `extra_packaging_amount` double(23,3) NOT NULL DEFAULT '0.000',
  `ref_bonus_amount` double(23,3) NOT NULL DEFAULT '0.000',
  `bring_change_amount` int DEFAULT '0',
  `tax_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (100000,1,20.00,0.00,'','paid','delivered',0.00,'stripe',NULL,NULL,NULL,NULL,NULL,'take_away',1,2,'2025-07-25 01:41:33','2025-07-25 01:54:57',0.00,'2025-07-25 01:41:33',NULL,'9754','2025-07-25 01:41:33',NULL,'2025-07-25 01:43:28','2025-07-25 01:44:57','2025-07-25 01:45:09',NULL,'2025-07-25 01:54:57',NULL,NULL,NULL,'{\"contact_person_name\":\"sanjayr47\",\"contact_person_number\":\"+6585123671\",\"contact_person_email\":\"sanjay.sairajesh@gmail.com\",\"address_type\":\"others\",\"address\":\"3781 Jalan Bukit Merah, Singapore 159463\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"103.81650019437075\",\"latitude\":\"1.2846553797269258\"}',0,5.00,0.00,NULL,0.00,0,2,0.00,'20',NULL,NULL,NULL,NULL,'excluded',NULL,NULL,'vendor',2.132,NULL,NULL,0.000,NULL,NULL,0,0.000,0.000,'[]',0,NULL,0.000,0.000,0,NULL),(100001,2,44.92,0.00,'','unpaid','pending',0.00,'digital_payment',NULL,NULL,NULL,NULL,NULL,'delivery',0,2,'2025-07-25 18:25:57','2025-07-25 18:25:57',24.92,'2025-07-25 18:25:57',NULL,'3774','2025-07-25 18:25:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"contact_person_name\":\"Zubaida Beevi\",\"contact_person_number\":\"+6589104610\",\"contact_person_email\":\"jansy.g4s@gmail.com\",\"address_type\":\"others\",\"address\":\"Blk 642 Jurong West Street 61, #01-60, Singapore 640642\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"103.6956306\",\"latitude\":\"1.3404886\"}',0,5.00,24.92,NULL,0.00,0,2,0.00,NULL,NULL,NULL,NULL,NULL,'excluded',NULL,1,'vendor',17.797,NULL,NULL,0.000,NULL,NULL,0,0.000,0.000,NULL,0,NULL,0.000,0.000,0,NULL),(100002,2,44.87,0.00,'','unpaid','pending',0.00,'digital_payment',NULL,NULL,NULL,NULL,NULL,'delivery',0,2,'2025-07-25 18:29:29','2025-07-25 18:29:29',24.87,'2025-07-25 18:29:29',NULL,'3128','2025-07-25 18:29:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"contact_person_name\":\"Zubaida Beevi\",\"contact_person_number\":\"+6589104610\",\"contact_person_email\":\"jansy.g4s@gmail.com\",\"address_type\":\"home\",\"address\":\"Blk 642 Jurong West Street 61, #01-60, Singapore 640642\",\"floor\":\"60\",\"road\":\"Jurong West st  61\",\"house\":\"#01\",\"longitude\":\"103.69581989943981\",\"latitude\":\"1.3404001850155092\"}',0,5.00,24.87,NULL,0.00,0,2,0.00,NULL,NULL,NULL,NULL,NULL,'excluded',NULL,1,'vendor',17.761,NULL,NULL,0.000,'Deliver to the reception desk','Remove it from my cart',0,0.000,0.000,NULL,0,NULL,0.000,0.000,0,NULL),(100003,1,27.00,0.00,'','unpaid','pending',0.00,'digital_payment',NULL,NULL,NULL,NULL,NULL,'delivery',0,2,'2025-07-26 10:54:02','2025-07-26 10:54:02',7.00,'2025-07-26 10:54:02',NULL,'5614','2025-07-26 10:54:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"contact_person_name\":\"sanjayr47\",\"contact_person_number\":\"+6585123671\",\"contact_person_email\":\"sanjay.sairajesh@gmail.com\",\"address_type\":\"others\",\"address\":\"3781 Jalan Bukit Merah, Singapore 159463\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"103.81650019437075\",\"latitude\":\"1.2846553797269258\"}',0,5.00,7.00,NULL,0.00,0,2,0.00,NULL,NULL,NULL,NULL,NULL,'excluded',NULL,1,'vendor',2.132,NULL,NULL,0.000,'Deliver to front door',NULL,0,0.000,0.000,NULL,0,NULL,0.000,0.000,0,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint NOT NULL DEFAULT '0',
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Table structure for table `payment_requests`
--

DROP TABLE IF EXISTS `payment_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_requests` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `gateway_callback_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success_hook` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failure_hook` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payer_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `external_redirect_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `attribute_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_requests`
--

LOCK TABLES `payment_requests` WRITE;
/*!40000 ALTER TABLE `payment_requests` DISABLE KEYS */;
INSERT INTO `payment_requests` VALUES ('92bfa3e0-e591-4592-bbff-1efdd2fff2c9','1','100',20.00,NULL,'order_place','order_failed','pi_3RoTAtFa4cICSTgM1h9tDCAB','SGD','stripe','{\"business_name\":\"HomePlate\",\"business_logo\":\"https:\\/\\/home.homeplate.life\\/storage\\/app\\/public\\/business\\/2024-11-20-673ddfe2754d3.png\"}',1,'2025-07-25 01:41:37','2025-07-25 01:43:28','{\"name\":\"sanjayr47 \",\"email\":\"sanjay.sairajesh@gmail.com\",\"phone\":\"+6585123671\",\"address\":\"\"}',NULL,'{\"name\":\"receiver_name\",\"image\":\"example.png\"}','100000','order',NULL),('1662d23a-ebe7-485b-baa7-52d09043fc01','2','100',44.92,NULL,'order_place','order_failed',NULL,'SGD','stripe','{\"business_name\":\"HomePlate\",\"business_logo\":\"https:\\/\\/home.homeplate.life\\/storage\\/app\\/public\\/business\\/2024-11-20-673ddfe2754d3.png\"}',0,'2025-07-25 18:25:59','2025-07-25 18:25:59','{\"name\":\"Zubaida Beevi\",\"email\":\"jansy.g4s@gmail.com\",\"phone\":\"+6589104610\",\"address\":\"\"}',NULL,'{\"name\":\"receiver_name\",\"image\":\"example.png\"}','100001','order',NULL),('fc0f827b-1431-4900-be99-4a020eae95e7','2','100',44.87,NULL,'order_place','order_failed',NULL,'SGD','stripe','{\"business_name\":\"HomePlate\",\"business_logo\":\"https:\\/\\/home.homeplate.life\\/storage\\/app\\/public\\/business\\/2024-11-20-673ddfe2754d3.png\"}',0,'2025-07-25 18:29:31','2025-07-25 18:29:31','{\"name\":\"Zubaida Beevi\",\"email\":\"jansy.g4s@gmail.com\",\"phone\":\"+6589104610\",\"address\":\"\"}',NULL,'{\"name\":\"receiver_name\",\"image\":\"example.png\"}','100002','order',NULL),('4ee21dbb-22f1-479d-b2fd-11f8d7a296a5','1','100',27.00,NULL,'order_place','order_failed',NULL,'SGD','stripe','{\"business_name\":\"HomePlate\",\"business_logo\":\"https:\\/\\/home.homeplate.life\\/storage\\/app\\/public\\/business\\/2024-11-20-673ddfe2754d3.png\"}',0,'2025-07-26 10:54:05','2025-07-26 10:54:05','{\"name\":\"sanjayr47 \",\"email\":\"sanjay.sairajesh@gmail.com\",\"phone\":\"+6585123671\",\"address\":\"\"}',NULL,'{\"name\":\"receiver_name\",\"image\":\"example.png\"}','100003','order',NULL);
/*!40000 ALTER TABLE `payment_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_verifications`
--

DROP TABLE IF EXISTS `phone_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint NOT NULL DEFAULT '0',
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `temp_block_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_verifications_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_verifications`
--

LOCK TABLES `phone_verifications` WRITE;
/*!40000 ALTER TABLE `phone_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priority_lists`
--

DROP TABLE IF EXISTS `priority_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priority_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priority_lists`
--

LOCK TABLES `priority_lists` WRITE;
/*!40000 ALTER TABLE `priority_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `priority_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provide_d_m_earnings`
--

DROP TABLE IF EXISTS `provide_d_m_earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provide_d_m_earnings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint unsigned NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provide_d_m_earnings`
--

LOCK TABLES `provide_d_m_earnings` WRITE;
/*!40000 ALTER TABLE `provide_d_m_earnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `provide_d_m_earnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `react_faqs`
--

DROP TABLE IF EXISTS `react_faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `react_faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `react_faqs`
--

LOCK TABLES `react_faqs` WRITE;
/*!40000 ALTER TABLE `react_faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `react_faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `react_opportunities`
--

DROP TABLE IF EXISTS `react_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `react_opportunities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `react_opportunities`
--

LOCK TABLES `react_opportunities` WRITE;
/*!40000 ALTER TABLE `react_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `react_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `react_promotional_banners`
--

DROP TABLE IF EXISTS `react_promotional_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `react_promotional_banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `react_promotional_banners`
--

LOCK TABLES `react_promotional_banners` WRITE;
/*!40000 ALTER TABLE `react_promotional_banners` DISABLE KEYS */;
INSERT INTO `react_promotional_banners` VALUES (1,NULL,NULL,'2024-11-20-673de2ea6248f.png',1,'2023-09-08 14:50:10','2024-11-19 23:23:54'),(2,NULL,NULL,'2024-11-20-673de2c26ebbe.png',1,'2023-09-08 15:14:50','2024-11-19 23:23:14'),(3,NULL,NULL,'2024-11-20-673de29d5950c.png',1,'2023-09-08 15:15:01','2024-11-19 23:22:37');
/*!40000 ALTER TABLE `react_promotional_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `react_services`
--

DROP TABLE IF EXISTS `react_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `react_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `react_services`
--

LOCK TABLES `react_services` WRITE;
/*!40000 ALTER TABLE `react_services` DISABLE KEYS */;
INSERT INTO `react_services` VALUES (1,'Order Online','Order in for yourself or for the group, with no restrictions on order value','2024-11-20-673de266b0066.png',1,'2023-09-08 15:12:02','2024-11-19 23:21:42'),(2,'Fast Delivery','Order in for yourself or for the group, with no restrictions on order value','2024-11-20-673de23e20df3.png',1,'2023-09-08 15:13:05','2024-11-19 23:21:02'),(3,'Enjoy Fresh Food','Order in for yourself or for the group, with no restrictions on order value','2024-11-20-673de213ab0b5.png',1,'2023-09-08 15:13:41','2024-11-19 23:20:19');
/*!40000 ALTER TABLE `react_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recent_searches`
--

DROP TABLE IF EXISTS `recent_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recent_searches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_full_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recent_searches`
--

LOCK TABLES `recent_searches` WRITE;
/*!40000 ALTER TABLE `recent_searches` DISABLE KEYS */;
INSERT INTO `recent_searches` VALUES (1,1,'admin','Payment Method','admin/business-settings/payment-method','https://home.homeplate.life/admin/business-settings/payment-method?keyword=paypa','2025-07-26 10:40:06','2025-07-26 10:40:06');
/*!40000 ALTER TABLE `recent_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_reasons`
--

DROP TABLE IF EXISTS `refund_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund_reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_reasons`
--

LOCK TABLES `refund_reasons` WRITE;
/*!40000 ALTER TABLE `refund_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refunds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `order_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refund_amount` decimal(24,3) NOT NULL DEFAULT '0.000',
  `refund_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `refund_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_configs`
--

DROP TABLE IF EXISTS `restaurant_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint unsigned NOT NULL,
  `instant_order` tinyint(1) NOT NULL DEFAULT '0',
  `customer_date_order_sratus` tinyint(1) NOT NULL DEFAULT '0',
  `customer_order_date` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `halal_tag_status` tinyint(1) NOT NULL DEFAULT '0',
  `extra_packaging_status` tinyint(1) NOT NULL DEFAULT '0',
  `is_extra_packaging_active` tinyint(1) NOT NULL DEFAULT '0',
  `extra_packaging_amount` double(23,3) DEFAULT NULL,
  `dine_in` tinyint(1) NOT NULL DEFAULT '0',
  `schedule_advance_dine_in_booking_duration` int NOT NULL DEFAULT '0',
  `schedule_advance_dine_in_booking_duration_time_format` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'min',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_configs`
--

LOCK TABLES `restaurant_configs` WRITE;
/*!40000 ALTER TABLE `restaurant_configs` DISABLE KEYS */;
INSERT INTO `restaurant_configs` VALUES (1,2,1,0,0,'2025-07-24 00:20:50','2025-07-24 00:20:50',0,0,0,0.000,0,0,'min');
/*!40000 ALTER TABLE `restaurant_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_notification_settings`
--

DROP TABLE IF EXISTS `restaurant_notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_notification_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` bigint unsigned NOT NULL,
  `mail_status` enum('active','inactive','disable') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `sms_status` enum('active','inactive','disable') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `push_notification_status` enum('active','inactive','disable') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_notification_settings`
--

LOCK TABLES `restaurant_notification_settings` WRITE;
/*!40000 ALTER TABLE `restaurant_notification_settings` DISABLE KEYS */;
INSERT INTO `restaurant_notification_settings` VALUES (1,'subscription_success','Get_notification_on_subscription_success','restaurant_subscription_success',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(2,'subscription_renew','Get_notification_on_subscription_renew','restaurant_subscription_renew',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(3,'subscription_shift','Get_notification_on_subscription_shift','restaurant_subscription_shift',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(4,'subscription_cancel','Get_notification_on_subscription_cancel','restaurant_subscription_cancel',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(5,'subscription_plan_update','Get_notification_on_subscription_plan_update','restaurant_subscription_plan_update',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(6,'restaurant_account_block','Get_notification_on_restaurant_account_block','restaurant_account_block',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(7,'restaurant_account_unblock','Get_notification_on_restaurant_account_unblock','restaurant_account_unblock',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(8,'restaurant_withdraw_approve','Get_notification_on_restaurant_withdraw_approve','restaurant_withdraw_approve',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(9,'restaurant_withdraw_rejaction','Get_notification_on_restaurant_withdraw_rejaction','restaurant_withdraw_rejaction',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(10,'restaurant_campaign_join_request','Get_notification_on_restaurant_campaign_join_request','restaurant_campaign_join_request',2,'active','disable','disable','2025-07-25 01:43:28','2025-07-25 01:43:28'),(11,'restaurant_campaign_join_rejaction','Get_notification_on_restaurant_campaign_join_rejaction','restaurant_campaign_join_rejaction',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(12,'restaurant_campaign_join_approval','Get_notification_on_restaurant_campaign_join_approval','restaurant_campaign_join_approval',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(13,'restaurant_order_notification','Get_notification_on_restaurant_order_notification','restaurant_order_notification',2,'disable','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(14,'restaurant_advertisement_create_by_admin','Get_notification_on_restaurant_advertisement_create_by_admin','restaurant_advertisement_create_by_admin',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(15,'restaurant_advertisement_approval','Get_notification_on_restaurant_advertisement_approval','restaurant_advertisement_approval',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(16,'restaurant_advertisement_deny','Get_notification_on_restaurant_advertisement_deny','restaurant_advertisement_deny',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(17,'restaurant_advertisement_resume','Get_notification_on_restaurant_advertisement_resume','restaurant_advertisement_resume',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28'),(18,'restaurant_advertisement_pause','Get_notification_on_restaurant_advertisement_pause','restaurant_advertisement_pause',2,'active','disable','active','2025-07-25 01:43:28','2025-07-25 01:43:28');
/*!40000 ALTER TABLE `restaurant_notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_schedule`
--

DROP TABLE IF EXISTS `restaurant_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_schedule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint unsigned NOT NULL,
  `day` int NOT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_schedule`
--

LOCK TABLES `restaurant_schedule` WRITE;
/*!40000 ALTER TABLE `restaurant_schedule` DISABLE KEYS */;
INSERT INTO `restaurant_schedule` VALUES (2,2,0,'00:00:00','23:58:00',NULL,NULL),(3,2,1,'00:00:00','23:59:00',NULL,NULL),(4,2,2,'00:00:00','23:59:00',NULL,NULL),(5,2,3,'00:00:00','23:58:00',NULL,NULL),(6,2,4,'00:00:00','23:59:00',NULL,NULL),(7,2,5,'00:01:00','23:58:00',NULL,NULL),(8,2,6,'00:02:00','23:59:00',NULL,NULL);
/*!40000 ALTER TABLE `restaurant_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_subscriptions`
--

DROP TABLE IF EXISTS `restaurant_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `package_id` bigint unsigned NOT NULL,
  `restaurant_id` bigint unsigned NOT NULL,
  `expiry_date` date NOT NULL,
  `max_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `mobile_app` tinyint(1) NOT NULL DEFAULT '0',
  `chat` tinyint(1) NOT NULL DEFAULT '0',
  `review` tinyint(1) NOT NULL DEFAULT '0',
  `self_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `total_package_renewed` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `validity` int NOT NULL DEFAULT '0',
  `is_trial` tinyint(1) NOT NULL DEFAULT '0',
  `renewed_at` datetime DEFAULT NULL,
  `is_canceled` tinyint(1) NOT NULL DEFAULT '0',
  `canceled_by` enum('none','admin','restaurant') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_subscriptions`
--

LOCK TABLES `restaurant_subscriptions` WRITE;
/*!40000 ALTER TABLE `restaurant_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_tag`
--

DROP TABLE IF EXISTS `restaurant_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_tag`
--

LOCK TABLES `restaurant_tag` WRITE;
/*!40000 ALTER TABLE `restaurant_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_wallets`
--

DROP TABLE IF EXISTS `restaurant_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned NOT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT '0.00',
  `collected_cash` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_wallets`
--

LOCK TABLES `restaurant_wallets` WRITE;
/*!40000 ALTER TABLE `restaurant_wallets` DISABLE KEYS */;
INSERT INTO `restaurant_wallets` VALUES (1,1,0.00,0.00,0.00,0.00,'2024-10-18 21:05:34','2024-10-18 21:05:34'),(2,2,20.00,0.00,0.00,0.00,'2025-07-23 20:50:36','2025-07-25 01:54:57'),(3,3,0.00,0.00,0.00,0.00,'2025-07-25 02:19:36','2025-07-25 02:19:36');
/*!40000 ALTER TABLE `restaurant_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_zone`
--

DROP TABLE IF EXISTS `restaurant_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_zone` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint unsigned NOT NULL,
  `zone_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_zone`
--

LOCK TABLES `restaurant_zone` WRITE;
/*!40000 ALTER TABLE `restaurant_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `footer_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `minimum_order` decimal(24,2) NOT NULL DEFAULT '0.00',
  `comission` decimal(24,2) DEFAULT NULL,
  `schedule_order` tinyint(1) NOT NULL DEFAULT '0',
  `opening_time` time DEFAULT '10:00:00',
  `closeing_time` time DEFAULT '23:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `vendor_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `free_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `rating` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT '1',
  `take_away` tinyint(1) NOT NULL DEFAULT '1',
  `food_section` tinyint(1) NOT NULL DEFAULT '1',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint unsigned DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `off_day` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `gst` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT '0',
  `pos_system` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_shipping_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `delivery_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '30-40',
  `veg` tinyint(1) NOT NULL DEFAULT '1',
  `non_veg` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int unsigned NOT NULL DEFAULT '0',
  `total_order` int unsigned NOT NULL DEFAULT '0',
  `per_km_shipping_charge` double(16,3) unsigned DEFAULT NULL,
  `restaurant_model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'commission',
  `maximum_shipping_charge` double(23,3) DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_subscription_active` tinyint(1) DEFAULT '0',
  `cutlery` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `announcement` tinyint(1) NOT NULL DEFAULT '0',
  `announcement_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `free_delivery_distance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `additional_documents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `package_id` bigint unsigned DEFAULT NULL,
  `tin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tin_expire_date` date DEFAULT NULL,
  `tin_certificate_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurants_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Demo Restaurant','01700000000','Demo@Restaurant.com','2024-11-20-673de114ba358.png','24.16883944018075','90.30561873693928','House 1005, 1007, 1216 Road no: 09, Dhaka 1216',NULL,0.00,NULL,0,'10:00:00','23:00:00',1,1,'2023-09-08 16:35:02','2025-07-23 05:38:03',0,NULL,'2024-11-20-673de114bbfe3.png',1,1,1,10.00,1,1,1,' ',NULL,0,0,0.00,'15-20-min',1,1,0,0,NULL,'commission',NULL,'demo-restaurant',0,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL),(2,'Asian Fusion','+6586735769','homeplatesg63@gmail.com','2025-07-26-68844426e8248.png','1.2975263792400116','103.81419148296118','10 Ridley Park, Singapore 248485',NULL,0.00,NULL,1,NULL,NULL,1,2,'2025-07-23 20:49:58','2025-07-26 10:57:42',0,'{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}','2025-07-26-68844426e86ec.png',1,1,1,0.00,2,1,1,'','{\"status\":\"0\",\"code\":null}',0,0,0.00,'28-57-min',1,1,1,4,NULL,'commission',NULL,'test-restaurant-1',0,0,'Asian fusion','Best Asian fusion food in Singapore home based business','2025-07-26-68844426e8cda.png',0,NULL,NULL,'{\"status\":\"0\",\"value\":null}',NULL,NULL,NULL,'35394','2025-07-31','2025-07-23-6880da76d0f0e.jpg'),(3,'Poppy\'s PaniPuri','+6582591611','Sameeha407@gmail.com','2025-07-25-68827837e619d.png','1.3504647457514831','103.81086755543947','9R26+58 Singapore',NULL,0.00,NULL,0,'10:00:00','23:00:00',1,3,'2025-07-25 02:15:19','2025-07-25 02:20:06',0,NULL,'2025-07-25-68827837e9db0.png',1,1,1,0.00,2,1,1,' ',NULL,0,0,0.00,'30-60-minute',1,1,0,0,NULL,'commission',NULL,'poppys-panipuri',0,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'007818','2025-07-31','2025-07-25-68827837ea317.pdf');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `food_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint unsigned DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `restaurant_id` bigint unsigned DEFAULT NULL,
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,1,NULL,'[]',5,100000,'2025-07-25 01:55:43','2025-07-25 01:55:43',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media`
--

DROP TABLE IF EXISTS `social_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media`
--

LOCK TABLES `social_media` WRITE;
/*!40000 ALTER TABLE `social_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soft_credentials`
--

DROP TABLE IF EXISTS `soft_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soft_credentials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soft_credentials`
--

LOCK TABLES `soft_credentials` WRITE;
/*!40000 ALTER TABLE `soft_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `soft_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storages`
--

DROP TABLE IF EXISTS `storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storages_data_id_index` (`data_id`),
  KEY `storages_value_index` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storages`
--

LOCK TABLES `storages` WRITE;
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
INSERT INTO `storages` VALUES (1,'App\\Models\\BusinessSetting','119',NULL,'public','2025-07-26 10:30:44','2025-07-26 10:30:44'),(2,'App\\Models\\DataSetting','11',NULL,'public','2024-11-19 23:04:27','2024-11-19 23:04:27'),(3,'App\\Models\\AdminFeature','4','image','public','2024-11-19 22:55:16','2024-11-19 22:55:16'),(4,'App\\Models\\AdminFeature','3','image','public','2024-11-19 22:55:54','2024-11-19 22:55:54'),(5,'App\\Models\\AdminFeature','2','image','public','2024-11-19 22:56:59','2024-11-19 22:56:59'),(6,'App\\Models\\AdminFeature','1','image','public','2024-11-19 22:57:42','2024-11-19 22:57:42'),(7,'App\\Models\\DataSetting','57',NULL,'public','2024-11-20 00:03:46','2024-11-20 00:03:46'),(8,'App\\Models\\DataSetting','58',NULL,'public','2024-11-20 00:03:46','2024-11-20 00:03:46'),(9,'App\\Models\\DataSetting','59',NULL,'public','2024-11-20 00:05:30','2024-11-20 00:05:30'),(10,'App\\Models\\DataSetting','60',NULL,'public','2024-11-20 00:05:30','2024-11-20 00:05:30'),(11,'App\\Models\\DataSetting','61',NULL,'public','2024-11-20 00:05:51','2024-11-20 00:05:51'),(12,'App\\Models\\DataSetting','62',NULL,'public','2024-11-20 00:05:51','2024-11-20 00:05:51'),(13,'App\\Models\\DataSetting','63',NULL,'public','2024-11-20 00:04:50','2024-11-20 00:04:50'),(14,'App\\Models\\DataSetting','64',NULL,'public','2024-11-20 00:04:50','2024-11-20 00:04:50'),(15,'App\\Models\\DataSetting','47',NULL,'public','2024-11-19 23:05:35','2024-11-19 23:05:35'),(16,'App\\Models\\DataSetting','48',NULL,'public','2024-11-19 23:05:35','2024-11-19 23:05:35'),(17,'App\\Models\\DataSetting','49',NULL,'public','2024-11-19 23:05:35','2024-11-19 23:05:35'),(18,'App\\Models\\DataSetting','50',NULL,'public','2024-11-19 23:05:35','2024-11-19 23:05:35'),(19,'App\\Models\\DataSetting','51',NULL,'public','2024-11-19 23:05:35','2024-11-19 23:05:35'),(20,'App\\Models\\DataSetting','52',NULL,'public','2024-11-19 23:05:35','2024-11-19 23:05:35'),(21,'App\\Models\\DataSetting','53',NULL,'public','2024-11-19 23:05:35','2024-11-19 23:05:35'),(22,'App\\Models\\DataSetting','54',NULL,'public','2024-11-19 23:05:35','2024-11-19 23:05:35'),(23,'App\\Models\\AdminTestimonial','1','reviewer_image','public','2024-11-19 23:06:34','2024-11-19 23:06:34'),(24,'App\\Models\\DataSetting','13',NULL,'public','2024-11-19 23:08:21','2024-11-19 23:08:21'),(25,'App\\Models\\DataSetting','14',NULL,'public','2024-11-19 23:08:21','2024-11-19 23:08:21'),(26,'App\\Models\\DataSetting','15',NULL,'public','2024-11-19 23:08:21','2024-11-19 23:08:21'),(27,'App\\Models\\DataSetting','16',NULL,'public','2024-11-19 23:08:21','2024-11-19 23:08:21'),(28,'App\\Models\\DataSetting','17',NULL,'public','2024-11-19 23:08:21','2024-11-19 23:08:21'),(29,'App\\Models\\DataSetting','18',NULL,'public','2024-11-19 23:08:21','2024-11-19 23:08:21'),(30,'App\\Models\\DataSetting','19',NULL,'public','2024-11-19 23:08:21','2024-11-19 23:08:21'),(31,'App\\Models\\Cuisine','1','image','public','2024-11-19 23:12:32','2024-11-19 23:12:32'),(32,'App\\Models\\Category','1','image','public','2024-11-19 23:13:16','2024-11-19 23:13:16'),(33,'App\\Models\\BusinessSetting','123',NULL,'public','2024-11-19 23:13:37','2024-11-19 23:13:37'),(34,'App\\Models\\Food','1','image','public','2024-11-19 23:14:39','2024-11-19 23:14:39'),(35,'App\\Models\\Restaurant','1','logo','public','2024-11-19 23:16:04','2024-11-19 23:16:04'),(36,'App\\Models\\Restaurant','1','cover_photo','public','2024-11-19 23:16:04','2024-11-19 23:16:04'),(37,'App\\Models\\DataSetting','95',NULL,'public','2024-11-19 23:17:25','2024-11-19 23:17:25'),(38,'App\\Models\\DataSetting','96',NULL,'public','2024-11-19 23:17:25','2024-11-19 23:17:25'),(39,'App\\Models\\DataSetting','69',NULL,'public','2024-11-19 23:19:24','2024-11-19 23:19:24'),(40,'App\\Models\\DataSetting','70',NULL,'public','2024-11-19 23:19:24','2024-11-19 23:19:24'),(41,'App\\Models\\DataSetting','71',NULL,'public','2024-11-19 23:19:24','2024-11-19 23:19:24'),(42,'App\\Models\\ReactService','3','image','public','2024-11-19 23:20:19','2024-11-19 23:20:19'),(43,'App\\Models\\ReactService','2','image','public','2024-11-19 23:21:02','2024-11-19 23:21:02'),(44,'App\\Models\\ReactService','1','image','public','2024-11-19 23:21:42','2024-11-19 23:21:42'),(45,'App\\Models\\ReactPromotionalBanner','3','image','public','2024-11-19 23:22:37','2024-11-19 23:22:37'),(46,'App\\Models\\ReactPromotionalBanner','2','image','public','2024-11-19 23:23:14','2024-11-19 23:23:14'),(47,'App\\Models\\ReactPromotionalBanner','1','image','public','2024-11-19 23:23:54','2024-11-19 23:23:54'),(48,'App\\Models\\DataSetting','72',NULL,'public','2024-11-19 23:24:56','2024-11-19 23:24:56'),(49,'App\\Models\\DataSetting','73',NULL,'public','2024-11-19 23:24:56','2024-11-19 23:24:56'),(50,'App\\Models\\DataSetting','74',NULL,'public','2024-11-19 23:24:56','2024-11-19 23:24:56'),(51,'App\\Models\\DataSetting','75',NULL,'public','2024-11-19 23:24:56','2024-11-19 23:24:56'),(52,'App\\Models\\DataSetting','76',NULL,'public','2024-11-19 23:24:56','2024-11-19 23:24:56'),(53,'App\\Models\\DataSetting','77',NULL,'public','2024-11-19 23:24:56','2024-11-19 23:24:56'),(54,'App\\Models\\DataSetting','78',NULL,'public','2024-11-19 23:24:56','2024-11-19 23:24:56'),(55,'App\\Models\\DataSetting','79',NULL,'public','2024-11-19 23:24:56','2024-11-19 23:24:56'),(56,'App\\Models\\DataSetting','80',NULL,'public','2024-11-19 23:24:56','2024-11-19 23:24:56'),(57,'App\\Models\\DataSetting','81',NULL,'public','2024-11-19 23:24:56','2024-11-19 23:24:56'),(58,'App\\Models\\DataSetting','82',NULL,'public','2024-11-19 23:24:56','2024-11-19 23:24:56'),(59,'App\\Models\\DataSetting','83',NULL,'public','2024-11-19 23:24:56','2024-11-19 23:24:56'),(60,'App\\Models\\DataSetting','84',NULL,'public','2024-11-19 23:25:52','2024-11-19 23:25:52'),(61,'App\\Models\\DataSetting','85',NULL,'public','2024-11-19 23:26:47','2024-11-19 23:26:47'),(62,'App\\Models\\DataSetting','86',NULL,'public','2024-11-19 23:26:47','2024-11-19 23:26:47'),(63,'App\\Models\\DataSetting','87',NULL,'public','2024-11-19 23:26:47','2024-11-19 23:26:47'),(64,'App\\Models\\DataSetting','88',NULL,'public','2024-11-19 23:26:47','2024-11-19 23:26:47'),(65,'App\\Models\\DataSetting','89',NULL,'public','2024-11-19 23:26:47','2024-11-19 23:26:47'),(66,'App\\Models\\DataSetting','90',NULL,'public','2024-11-19 23:26:47','2024-11-19 23:26:47'),(67,'App\\Models\\DataSetting','91',NULL,'public','2024-11-19 23:26:47','2024-11-19 23:26:47'),(68,'App\\Models\\BusinessSetting','137',NULL,'public','2025-07-22 23:40:54','2025-07-22 23:40:54'),(69,'App\\Models\\BusinessSetting','5',NULL,'public','2025-07-22 23:40:54','2025-07-22 23:40:54'),(70,'App\\Models\\BusinessSetting','96',NULL,'public','2025-07-22 23:40:54','2025-07-22 23:40:54'),(71,'App\\Models\\BusinessSetting','24',NULL,'public','2025-07-23 04:03:19','2025-07-23 04:03:19'),(72,'App\\Models\\BusinessSetting','138',NULL,'public','2025-07-23 04:03:19','2025-07-23 04:03:19'),(73,'App\\Models\\BusinessSetting','120',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(74,'App\\Models\\BusinessSetting','121',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(75,'App\\Models\\BusinessSetting','109',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(76,'App\\Models\\BusinessSetting','110',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(77,'App\\Models\\BusinessSetting','111',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(78,'App\\Models\\BusinessSetting','112',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(79,'App\\Models\\BusinessSetting','98',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(80,'App\\Models\\BusinessSetting','16',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(81,'App\\Models\\BusinessSetting','17',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(82,'App\\Models\\BusinessSetting','37',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(83,'App\\Models\\BusinessSetting','18',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(84,'App\\Models\\BusinessSetting','82',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(85,'App\\Models\\BusinessSetting','19',NULL,'public','2025-07-23 05:38:02','2025-07-23 05:38:02'),(86,'App\\Models\\BusinessSetting','20',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(87,'App\\Models\\BusinessSetting','21',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(88,'App\\Models\\BusinessSetting','22',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(89,'App\\Models\\BusinessSetting','106',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(90,'App\\Models\\BusinessSetting','39',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(91,'App\\Models\\BusinessSetting','42',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(92,'App\\Models\\BusinessSetting','43',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(93,'App\\Models\\BusinessSetting','44',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(94,'App\\Models\\BusinessSetting','46',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(95,'App\\Models\\BusinessSetting','51',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(96,'App\\Models\\BusinessSetting','139',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(97,'App\\Models\\BusinessSetting','52',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(98,'App\\Models\\BusinessSetting','140',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(99,'App\\Models\\BusinessSetting','122',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(100,'App\\Models\\BusinessSetting','71',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(101,'App\\Models\\BusinessSetting','75',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(102,'App\\Models\\BusinessSetting','81',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(103,'App\\Models\\BusinessSetting','83',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(104,'App\\Models\\BusinessSetting','113',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(105,'App\\Models\\BusinessSetting','114',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(106,'App\\Models\\BusinessSetting','105',NULL,'public','2025-07-23 05:38:03','2025-07-23 05:38:03'),(107,'App\\Models\\BusinessSetting','141',NULL,'public','2025-07-23 20:39:46','2025-07-23 20:39:46'),(108,'App\\Models\\BusinessSetting','142',NULL,'public','2025-07-23 20:39:46','2025-07-23 20:39:46'),(109,'App\\Models\\BusinessSetting','143',NULL,'public','2025-07-23 20:39:46','2025-07-23 20:39:46'),(110,'App\\Models\\BusinessSetting','72',NULL,'public','2025-07-23 20:39:46','2025-07-23 20:39:46'),(111,'App\\Models\\BusinessSetting','77',NULL,'public','2025-07-23 20:39:46','2025-07-23 20:39:46'),(112,'App\\Models\\BusinessSetting','144',NULL,'public','2025-07-23 20:39:46','2025-07-23 20:39:46'),(113,'App\\Models\\BusinessSetting','145',NULL,'public','2025-07-23 20:39:46','2025-07-23 20:39:46'),(114,'App\\Models\\Restaurant','2','logo','public','2025-07-26 10:57:42','2025-07-26 10:57:42'),(115,'App\\Models\\Restaurant','2','cover_photo','public','2025-07-26 10:57:42','2025-07-26 10:57:42'),(116,'App\\Models\\BusinessSetting','118',NULL,'public','2025-07-26 10:51:11','2025-07-26 10:51:11'),(117,'App\\Models\\Food','2','image','public','2025-07-23 21:02:08','2025-07-23 21:02:08'),(118,'App\\Models\\BusinessSetting','146',NULL,'public','2025-07-23 21:14:06','2025-07-23 21:14:06'),(119,'App\\Models\\BusinessSetting','147',NULL,'public','2025-07-23 21:14:06','2025-07-23 21:14:06'),(120,'App\\Models\\BusinessSetting','86',NULL,'public','2025-07-23 21:14:06','2025-07-23 21:14:06'),(121,'App\\Models\\BusinessSetting','58',NULL,'public','2025-07-23 21:14:06','2025-07-23 21:14:06'),(122,'App\\Models\\BusinessSetting','73',NULL,'public','2025-07-23 21:14:06','2025-07-23 21:14:06'),(123,'App\\Models\\BusinessSetting','74',NULL,'public','2025-07-23 21:14:06','2025-07-23 21:14:06'),(124,'App\\Models\\BusinessSetting','76',NULL,'public','2025-07-23 21:14:06','2025-07-23 21:14:06'),(125,'App\\Models\\BusinessSetting','84',NULL,'public','2025-07-23 21:14:06','2025-07-23 21:14:06'),(126,'App\\Models\\BusinessSetting','115',NULL,'public','2025-07-23 21:14:06','2025-07-23 21:14:06'),(127,'App\\Models\\UserInfo','1','image','public','2025-07-26 10:57:42','2025-07-26 10:57:42'),(128,'App\\Models\\UserInfo','2','image','public','2025-07-24 07:25:11','2025-07-24 07:25:11'),(129,'App\\Models\\Restaurant','3','logo','public','2025-07-25 02:15:19','2025-07-25 02:15:19'),(130,'App\\Models\\Restaurant','3','cover_photo','public','2025-07-25 02:15:19','2025-07-25 02:15:19'),(131,'App\\Models\\Food','3','image','public','2025-07-25 02:29:29','2025-07-25 02:29:29'),(132,'App\\Models\\Restaurant','2','meta_image','public','2025-07-26 10:57:42','2025-07-26 10:57:42');
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_billing_and_refund_histories`
--

DROP TABLE IF EXISTS `subscription_billing_and_refund_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_billing_and_refund_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint unsigned NOT NULL,
  `subscription_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned DEFAULT NULL,
  `transaction_type` enum('pending_bill','refund') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending_bill',
  `amount` double(24,3) NOT NULL,
  `is_success` tinyint(1) NOT NULL DEFAULT '0',
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_billing_and_refund_histories`
--

LOCK TABLES `subscription_billing_and_refund_histories` WRITE;
/*!40000 ALTER TABLE `subscription_billing_and_refund_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_billing_and_refund_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_logs`
--

DROP TABLE IF EXISTS `subscription_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `subscription_id` bigint unsigned NOT NULL,
  `order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `failed` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_logs`
--

LOCK TABLES `subscription_logs` WRITE;
/*!40000 ALTER TABLE `subscription_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_packages`
--

DROP TABLE IF EXISTS `subscription_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `package_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(24,3) NOT NULL,
  `validity` int NOT NULL,
  `max_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unlimited',
  `max_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unlimited',
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `mobile_app` tinyint(1) NOT NULL DEFAULT '0',
  `chat` tinyint(1) NOT NULL DEFAULT '0',
  `review` tinyint(1) NOT NULL DEFAULT '0',
  `self_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `colour` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_packages`
--

LOCK TABLES `subscription_packages` WRITE;
/*!40000 ALTER TABLE `subscription_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_pauses`
--

DROP TABLE IF EXISTS `subscription_pauses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_pauses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned NOT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_pauses`
--

LOCK TABLES `subscription_pauses` WRITE;
/*!40000 ALTER TABLE `subscription_pauses` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_pauses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_schedules`
--

DROP TABLE IF EXISTS `subscription_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_schedules` (
  `subscription_id` bigint unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` int DEFAULT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_schedules`
--

LOCK TABLES `subscription_schedules` WRITE;
/*!40000 ALTER TABLE `subscription_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_transactions`
--

DROP TABLE IF EXISTS `subscription_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_transactions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  `restaurant_id` bigint unsigned NOT NULL,
  `price` double(24,3) NOT NULL DEFAULT '0.000',
  `validity` int NOT NULL DEFAULT '0',
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(24,2) NOT NULL,
  `discount` int NOT NULL DEFAULT '0',
  `package_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'success',
  `transaction_status` tinyint(1) NOT NULL DEFAULT '1',
  `restaurant_subscription_id` bigint unsigned DEFAULT NULL,
  `previous_due` double(24,3) NOT NULL DEFAULT '0.000',
  `is_trial` tinyint(1) NOT NULL DEFAULT '0',
  `plan_type` enum('renew','new_plan','first_purchased','free_trial','old_subscription') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'old_subscription',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_transactions`
--

LOCK TABLES `subscription_transactions` WRITE;
/*!40000 ALTER TABLE `subscription_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_at` date DEFAULT NULL,
  `end_at` date DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `user_id` bigint unsigned NOT NULL,
  `restaurant_id` bigint unsigned NOT NULL,
  `billing_amount` decimal(23,3) NOT NULL DEFAULT '0.000',
  `paid_amount` decimal(23,3) NOT NULL DEFAULT '0.000',
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

--
-- Table structure for table `system_tax_setups`
--

DROP TABLE IF EXISTS `system_tax_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_tax_setups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'order_wise',
  `country_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_payer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'vendor',
  `tax_ids` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_included` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_tax_setups_country_code_index` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_tax_setups`
--

LOCK TABLES `system_tax_setups` WRITE;
/*!40000 ALTER TABLE `system_tax_setups` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_tax_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Food','2023-09-08 17:05:12','2023-09-08 17:05:12');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_additional_setups`
--

DROP TABLE IF EXISTS `tax_additional_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_additional_setups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_tax_setup_id` bigint unsigned DEFAULT NULL,
  `tax_ids` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_additional_setups_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_additional_setups`
--

LOCK TABLES `tax_additional_setups` WRITE;
/*!40000 ALTER TABLE `tax_additional_setups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_additional_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxables`
--

DROP TABLE IF EXISTS `taxables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `taxable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxable_id` bigint unsigned NOT NULL,
  `tax_id` bigint unsigned NOT NULL,
  `system_tax_setup_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxables`
--

LOCK TABLES `taxables` WRITE;
/*!40000 ALTER TABLE `taxables` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` double(23,8) NOT NULL DEFAULT '0.00000000',
  `country_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxes_country_code_index` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_logs`
--

DROP TABLE IF EXISTS `time_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `online` time DEFAULT NULL,
  `offline` time DEFAULT NULL,
  `working_hour` decimal(23,3) NOT NULL DEFAULT '0.000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shift_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_logs`
--

LOCK TABLES `time_logs` WRITE;
/*!40000 ALTER TABLE `time_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_deliverymen`
--

DROP TABLE IF EXISTS `track_deliverymen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track_deliverymen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `longitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_deliverymen`
--

LOCK TABLES `track_deliverymen` WRITE;
/*!40000 ALTER TABLE `track_deliverymen` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_deliverymen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `translationable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_translationable_id_index` (`translationable_id`),
  KEY `translations_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'App\\Models\\DataSetting',69,'en','react_header_title','StackFood',NULL,NULL),(2,'App\\Models\\DataSetting',70,'en','react_header_sub_title','Find Restaurants Near You',NULL,NULL),(3,'App\\Models\\DataSetting',72,'en','react_restaurant_section_title','Open your own restaurant',NULL,NULL),(4,'App\\Models\\DataSetting',73,'en','react_restaurant_section_sub_title','Register as seller and open shop to start your business',NULL,NULL),(5,'App\\Models\\DataSetting',74,'en','react_restaurant_section_button_name','Register',NULL,NULL),(6,'App\\Models\\DataSetting',78,'en','react_delivery_section_title','Become a Delivery Man',NULL,NULL),(7,'App\\Models\\DataSetting',79,'en','react_delivery_section_sub_title','Register as delivery man and earn money',NULL,NULL),(8,'App\\Models\\DataSetting',80,'en','react_delivery_section_button_name','Register',NULL,NULL),(9,'App\\Models\\DataSetting',85,'en','react_download_apps_title','Download app to enjoy more!',NULL,NULL),(10,'App\\Models\\DataSetting',86,'en','react_download_apps_sub_title','All the best restaurants are one click away',NULL,NULL),(11,'App\\Models\\DataSetting',87,'en','react_download_apps_tag','Download our app from google play store & app store.',NULL,NULL),(12,'App\\Models\\ReactPromotionalBanner',1,'en','react_promotional_banner_title',NULL,NULL,NULL),(13,'App\\Models\\ReactPromotionalBanner',1,'en','react_promotional_banner_description',NULL,NULL,NULL),(14,'App\\Models\\ReactService',1,'en','react_service_title','Order Online',NULL,NULL),(15,'App\\Models\\ReactService',1,'en','react_service_sub_title','Order in for yourself or for the group, with no restrictions on order value',NULL,NULL),(16,'App\\Models\\ReactService',2,'en','react_service_title','Fast Delivery',NULL,NULL),(17,'App\\Models\\ReactService',2,'en','react_service_sub_title','Order in for yourself or for the group, with no restrictions on order value',NULL,NULL),(18,'App\\Models\\ReactService',3,'en','react_service_title','Enjoy Fresh Food',NULL,NULL),(19,'App\\Models\\ReactService',3,'en','react_service_sub_title','Order in for yourself or for the group, with no restrictions on order value',NULL,NULL),(20,'App\\Models\\ReactPromotionalBanner',2,'en','react_promotional_banner_title',NULL,NULL,NULL),(21,'App\\Models\\ReactPromotionalBanner',2,'en','react_promotional_banner_description',NULL,NULL,NULL),(22,'App\\Models\\ReactPromotionalBanner',3,'en','react_promotional_banner_title',NULL,NULL,NULL),(23,'App\\Models\\ReactPromotionalBanner',3,'en','react_promotional_banner_description',NULL,NULL,NULL),(24,'App\\Models\\DataSetting',14,'en','about_us_title','Stack Food',NULL,NULL),(25,'App\\Models\\DataSetting',15,'en','about_us_sub_title','is Best Delivery Service Near You',NULL,NULL),(26,'App\\Models\\DataSetting',16,'en','about_us_text','We make food delivery more interesting.\r\nFind the greatest deals from the restaurants near you.\r\nTesty & healthy dishes. Bring a restaurant into your home.',NULL,NULL),(27,'App\\Models\\DataSetting',17,'en','about_us_app_button_name','Download Now',NULL,NULL),(28,'App\\Models\\AdminFeature',1,'en','feature_name','24h Support',NULL,NULL),(29,'App\\Models\\AdminFeature',1,'en','feature_description','24/7 customer support service to support you.',NULL,NULL),(30,'App\\Models\\AdminFeature',2,'en','feature_name','Easy Payment',NULL,NULL),(31,'App\\Models\\AdminFeature',2,'en','feature_description','Smart and easy payment system to maintain your business.',NULL,NULL),(32,'App\\Models\\AdminFeature',3,'en','feature_name','Fast Delivery',NULL,NULL),(33,'App\\Models\\AdminFeature',3,'en','feature_description','Fastest delivery system to reach your customer.',NULL,NULL),(34,'App\\Models\\AdminFeature',4,'en','feature_name','Resonable Price',NULL,NULL),(35,'App\\Models\\AdminFeature',4,'en','feature_description','Start your business in cheap cost. In your budget',NULL,NULL),(36,'App\\Models\\DataSetting',47,'en','earn_money_reg_title','Earn Money From StackFood',NULL,NULL),(37,'App\\Models\\DataSetting',48,'en','earn_money_restaurant_req_button_name','Be a Seller',NULL,NULL),(38,'App\\Models\\DataSetting',51,'en','earn_money_delivety_man_req_button_name','Be Deliveryman',NULL,NULL),(39,'App\\Models\\DataSetting',57,'en','why_choose_us_title_1','Find your daily meal',NULL,NULL),(40,'App\\Models\\DataSetting',59,'en','why_choose_us_title_2','Easy to food ordering system',NULL,NULL),(41,'App\\Models\\DataSetting',61,'en','why_choose_us_title_3','Fastest food delivery service',NULL,NULL),(42,'App\\Models\\DataSetting',63,'en','why_choose_us_title_4','Track your food order',NULL,NULL),(43,'App\\Models\\Zone',1,'en','name','Demo Zone',NULL,NULL),(44,'App\\Models\\Cuisine',1,'en','cuisine_name','Demo Cuisine',NULL,NULL),(45,'App\\Models\\Category',1,'en','name','Demo Category',NULL,NULL),(46,'App\\Models\\Category',2,'en','name','Demo Sub Category',NULL,NULL),(47,'App\\Models\\Restaurant',1,'en','name','Demo Restaurant',NULL,NULL),(48,'App\\Models\\Restaurant',1,'en','address','House 1005, 1007, 1216 Road no: 09, Dhaka 1216',NULL,NULL),(49,'App\\Models\\AddOn',1,'en','name','Water',NULL,NULL),(50,'App\\Models\\Food',1,'en','name','Demo Food',NULL,NULL),(51,'App\\Models\\Food',1,'en','description','Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!',NULL,NULL),(52,'App\\Models\\Vehicle',1,'en','type','Cycle',NULL,NULL),(53,'App\\Models\\DataSetting',96,'en','promotional_banner_title','Demo Banner',NULL,NULL),(54,'App\\Models\\Zone',2,'en','name','Singapore',NULL,NULL),(55,'App\\Models\\Zone',2,'en','display_name','Singapore',NULL,NULL),(56,'App\\Models\\Restaurant',2,'en','name','Asian Fusion',NULL,NULL),(57,'App\\Models\\Restaurant',2,'en','address','10 Ridley Park, Singapore 248485',NULL,NULL),(58,'App\\Models\\Food',2,'en','name','Pizza',NULL,NULL),(59,'App\\Models\\Food',2,'en','description','Good pizza',NULL,NULL),(60,'App\\Models\\Restaurant',3,'en','name','Poppy\'s PaniPuri',NULL,NULL),(61,'App\\Models\\Restaurant',3,'en','address','9R26+58 Singapore',NULL,NULL),(62,'App\\Models\\Food',3,'en','name','Poppy\'s Signature Panipuri',NULL,NULL),(63,'App\\Models\\Food',3,'en','description','Poppy’s Signature PaniPuri\nA burst of bold flavours in every bite! Our signature PaniPuri is a delightful medley of crispy puris filled with spiced mashed potatoes, tangy tamarind water, zesty mint chutney, and a touch of our secret masala. Fresh, fiery, and fantastically fun — it’s the ultimate street food experience, served with love and a pop of tradition only at Poppy’s!',NULL,NULL),(64,'App\\Models\\Restaurant',2,'en','meta_title','Asian fusion',NULL,NULL),(65,'App\\Models\\Restaurant',2,'en','meta_description','Best Asian fusion food in Singapore home based business',NULL,NULL);
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_infos`
--

DROP TABLE IF EXISTS `user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `vendor_id` bigint unsigned DEFAULT NULL,
  `deliveryman_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_infos`
--

LOCK TABLES `user_infos` WRITE;
/*!40000 ALTER TABLE `user_infos` DISABLE KEYS */;
INSERT INTO `user_infos` VALUES (1,'Test Restaurant 1','','+6586735769','homeplatesg63@gmail.com','2025-07-26-68844426e8248.png',NULL,NULL,2,NULL,'2025-07-24 00:17:58','2025-07-26 10:57:42'),(2,'sanjayr47','','+6585123671','sanjay.sairajesh@gmail.com',NULL,NULL,1,NULL,NULL,'2025-07-24 07:25:11','2025-07-24 07:25:11');
/*!40000 ALTER TABLE `user_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint unsigned DEFAULT NULL,
  `vendor_id` bigint unsigned DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notifications`
--

LOCK TABLES `user_notifications` WRITE;
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;
INSERT INTO `user_notifications` VALUES (1,'{\"title\":\"Order Notification\",\"description\":\"New order push description\",\"order_id\":100000,\"image\":\"\",\"type\":\"new_order\"}',1,NULL,2,NULL,'2025-07-25 01:43:29','2025-07-25 01:43:29'),(2,'{\"title\":\"Order ready to be delivered\",\"description\":\"Your order is ready to be delivered, plesae share your otp with delivery man. Otp:9754, Order id:100000\",\"order_id\":100000,\"image\":\"\",\"type\":\"order_status\",\"order_status\":\"handover\"}',1,1,NULL,NULL,'2025-07-25 01:54:45','2025-07-25 01:54:45');
/*!40000 ALTER TABLE `user_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int NOT NULL DEFAULT '0',
  `login_medium` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint unsigned DEFAULT NULL,
  `wallet_balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `loyalty_point` decimal(24,3) NOT NULL DEFAULT '0.000',
  `ref_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` bigint unsigned DEFAULT NULL,
  `temp_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_language_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_ref_code_unique` (`ref_code`),
  KEY `users_zone_id_index` (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sanjayr47','','+6585123671','sanjay.sairajesh@gmail.com',NULL,0,NULL,'$2y$10$EWHSYj8ThGIaPJlrjx2oGOMwLeacaks8RSiBf4tarMGOTtcqzt3/m',NULL,'2025-07-24 00:22:24','2025-07-25 01:54:57','[1]','fmNB2lBoT6u_nJSTRTK38D:APA91bEOgTWoeFVWfMnfK5xQ4p7wOkkDded9qIWRrDMe4wyWWS7ke8JJM-1KvGD9ySerstpboTvbXnrDGB4wbQKBGDT-KrvaDLDhu66_9y_5XCRGVp_wypQ',1,1,'manual',NULL,2,0.000,0.000,'TY1XHXDP7Y',NULL,NULL,'en',0),(2,'Zubaida','Beevi','+6589104610','jansy.g4s@gmail.com',NULL,0,NULL,'$2y$10$BDzIisqGMsVe9oOfPnVIA.RSirlnXA6zKtjHjYWGl4UTGCstg4QPO',NULL,'2025-07-25 18:24:35','2025-07-25 18:24:49','[1]','ei3rpuMHRh69C64KHOprYd:APA91bEZMSEmRXB3jR5zMXg_hVs3lZ56d76d0VE5a3j1tlJzNmf4loQNDf38p0H0vl35BeXJIbQhTcpkSd0sdCHzHH9fLy-JwFbiOQSliG8RexTPsDGxGCM',1,0,NULL,NULL,2,0.000,0.000,'KHLXPLODLV',NULL,NULL,'en',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_options`
--

DROP TABLE IF EXISTS `variation_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variation_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `food_id` bigint unsigned NOT NULL,
  `variation_id` bigint unsigned NOT NULL,
  `option_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_price` double(23,3) NOT NULL DEFAULT '0.000',
  `total_stock` int NOT NULL DEFAULT '0',
  `stock_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unlimited',
  `sell_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_options`
--

LOCK TABLES `variation_options` WRITE;
/*!40000 ALTER TABLE `variation_options` DISABLE KEYS */;
INSERT INTO `variation_options` VALUES (1,1,1,'Small',10.000,0,'unlimited',0,'2024-11-19 23:14:39','2024-11-19 23:14:39'),(2,1,1,'Large',20.000,0,'unlimited',0,'2024-11-19 23:14:39','2024-11-19 23:14:39'),(3,1,2,'Demo Option-1',2.000,0,'unlimited',0,'2024-11-19 23:14:39','2024-11-19 23:14:39'),(4,1,2,'Demo Option-2',3.000,0,'unlimited',0,'2024-11-19 23:14:39','2024-11-19 23:14:39'),(5,1,2,'Demo Option-3',2.000,0,'unlimited',0,'2024-11-19 23:14:39','2024-11-19 23:14:39');
/*!40000 ALTER TABLE `variation_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variations`
--

DROP TABLE IF EXISTS `variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `food_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'multi',
  `min` int NOT NULL DEFAULT '0',
  `max` int NOT NULL DEFAULT '0',
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variations`
--

LOCK TABLES `variations` WRITE;
/*!40000 ALTER TABLE `variations` DISABLE KEYS */;
INSERT INTO `variations` VALUES (1,1,'Vatiation-1','single',0,0,1,'2024-11-19 23:14:39','2024-11-19 23:14:39'),(2,1,'Vatiation-2','multi',1,3,0,'2024-11-19 23:14:39','2024-11-19 23:14:39');
/*!40000 ALTER TABLE `variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `starting_coverage_area` double(16,2) NOT NULL,
  `maximum_coverage_area` double(16,2) NOT NULL,
  `extra_charges` double(16,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'Cycle',0.00,1000.00,0.00,1,'2023-09-08 17:07:33','2023-09-08 17:07:33');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_employees`
--

DROP TABLE IF EXISTS `vendor_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_role_id` bigint unsigned NOT NULL,
  `vendor_id` bigint unsigned NOT NULL,
  `restaurant_id` bigint unsigned NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendor_employees_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_employees`
--

LOCK TABLES `vendor_employees` WRITE;
/*!40000 ALTER TABLE `vendor_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `firebase_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token_web` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_phone_unique` (`phone`),
  UNIQUE KEY `vendors_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'Demo','Restaurant','01700000000','Demo@Restaurant.com',NULL,'$2a$12$NQBXTu9.U.jS0McEJPVEZuVcC2eAorHB8vQXCPlbcXuJM/mb9RpfO',NULL,'2023-09-08 16:35:02','2023-09-08 16:35:02',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(2,'TestFirstName','Despedida','+6586735769','homeplatesg63@gmail.com',NULL,'$2y$10$nPrav071g9LAOyrmtwYfPulwSnS5a7Ma9Ji5FNlBWK3Bq3oty5ujS',NULL,'2025-07-23 20:49:58','2025-07-26 10:51:12',NULL,NULL,NULL,NULL,NULL,1,'eAo_RxZETIGo2OiehaE2k9:APA91bHLSMS08y_xWZ7HyzJP9C5wcZNjAvlLIv2MDw8Nv9eKGXQMONqFhgBAzlJF1hsVPoZzTgJst_qy9IxpEIAIFxzKcg831Ip7wXBxFnIMcuVr9hgG6Ls','1zF5gl3rgEo22M27b3p8unHYJOJKPmcQ0tanbWDBZ7qIVl7pJ4leifnYnrvOctqDYB93begjCVVlC1kAeLXCA4x2q8HGgA5IHEkc51xNkcevb0F8wCn3BS0d',NULL),(3,'Thara','Wangwang','+6582591611','Sameeha407@gmail.com',NULL,'$2y$10$8I5riXsPbc7Xoq3b1CgRuOwAhueiiD0K9givHHjUtNej8UAZ/NVfG',NULL,'2025-07-25 02:15:19','2025-07-25 02:23:23',NULL,NULL,NULL,NULL,NULL,1,'fAk--jGdQjqe0jWUcJ4gdt:APA91bE7Ek0sY0flNZTMaEDrhOVwjvL-tMuPU30sT0OahatOmN2XwAz1eYnY-8RmE0cII-Ua1UhVXl7SdgqK_ggNML8epSlqFAZGSN1d9g4XnjkxeNWjqGw','VF3cG7CNPFwU0PvmWTlrnhtBJSXlKotZVDCoYAjqfpq33KmEe53bLM8t1NGr08qpAoLLjVeMm5xy6dg7MgJrAyCLyLaPRwVQMwWwY0YqIYVqQOhq7KZ483CA',NULL);
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor_logs`
--

DROP TABLE IF EXISTS `visitor_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `visitor_log_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `visitor_log_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `visit_count` int NOT NULL DEFAULT '0',
  `order_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_logs`
--

LOCK TABLES `visitor_logs` WRITE;
/*!40000 ALTER TABLE `visitor_logs` DISABLE KEYS */;
INSERT INTO `visitor_logs` VALUES (1,'App\\Models\\Restaurant',2,1,0,2,'2025-07-26 10:54:02','2025-07-26 10:54:02'),(2,'App\\Models\\Restaurant',2,2,0,2,'2025-07-25 18:29:29','2025-07-25 18:29:29');
/*!40000 ALTER TABLE `visitor_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_bonuses`
--

DROP TABLE IF EXISTS `wallet_bonuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_bonuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bonus_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonus_amount` double(23,3) NOT NULL DEFAULT '0.000',
  `minimum_add_amount` double(23,3) NOT NULL DEFAULT '0.000',
  `maximum_bonus_amount` double(23,3) NOT NULL DEFAULT '0.000',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_bonuses`
--

LOCK TABLES `wallet_bonuses` WRITE;
/*!40000 ALTER TABLE `wallet_bonuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_bonuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_payments`
--

DROP TABLE IF EXISTS `wallet_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `transaction_ref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `payment_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_payments`
--

LOCK TABLES `wallet_payments` WRITE;
/*!40000 ALTER TABLE `wallet_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `transaction_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `debit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT '0.000',
  `balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `transaction_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websockets_statistics_entries`
--

DROP TABLE IF EXISTS `websockets_statistics_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `websockets_statistics_entries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int NOT NULL,
  `websocket_message_count` int NOT NULL,
  `api_message_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websockets_statistics_entries`
--

LOCK TABLES `websockets_statistics_entries` WRITE;
/*!40000 ALTER TABLE `websockets_statistics_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `websockets_statistics_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `food_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraw_requests`
--

DROP TABLE IF EXISTS `withdraw_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdraw_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint unsigned DEFAULT NULL,
  `admin_id` bigint unsigned DEFAULT NULL,
  `transaction_note` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(23,3) NOT NULL DEFAULT '0.000',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_man_id` bigint unsigned DEFAULT NULL,
  `withdrawal_method_id` bigint unsigned DEFAULT NULL,
  `withdrawal_method_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw_requests`
--

LOCK TABLES `withdraw_requests` WRITE;
/*!40000 ALTER TABLE `withdraw_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdraw_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawal_methods`
--

DROP TABLE IF EXISTS `withdrawal_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawal_methods`
--

LOCK TABLES `withdrawal_methods` WRITE;
/*!40000 ALTER TABLE `withdrawal_methods` DISABLE KEYS */;
INSERT INTO `withdrawal_methods` VALUES (1,'PayPal','[{\"input_type\":\"string\",\"input_name\":\"paypal_username\",\"placeholder\":\"@username\",\"is_required\":1}]',1,1,'2025-07-23 21:08:48','2025-07-23 21:09:35'),(2,'PayNow','[{\"input_type\":\"string\",\"input_name\":\"paynow_number_to_payout_to\",\"placeholder\":\"+65\",\"is_required\":1}]',0,1,'2025-07-23 21:09:25','2025-07-23 21:09:35');
/*!40000 ALTER TABLE `withdrawal_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_wise_topic` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_shipping_charge` double(16,3) unsigned DEFAULT NULL,
  `per_km_shipping_charge` double(16,3) unsigned DEFAULT NULL,
  `maximum_shipping_charge` double(23,3) DEFAULT NULL,
  `max_cod_order_amount` double(23,3) DEFAULT NULL,
  `increased_delivery_fee` double(8,2) NOT NULL DEFAULT '0.00',
  `increased_delivery_fee_status` tinyint(1) NOT NULL DEFAULT '0',
  `increase_delivery_charge_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zones_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,'Demo Zone',_binary '\0\0\0\0\0\0\0\0\0\0	\0\0\0\�\�\�\�\�	V@�\����R:@\�\�\�\�ʂV@�\�k�\�f:@\�\�\�\���V@:\��_9@\�\�\�\��!W@1\�~܅9@\�\�\�\�b5W@H\�\�(c\\5@\�\�\�\�BW@���uz4@\�\�\�\��@V@O��C��5@\�\�\�\�b�U@s؅>[�8@\�\�\�\�\�	V@�\����R:@',1,'2023-09-08 16:23:28','2023-09-08 16:24:00','zone_1_restaurant','zone_1_customer','zone_1_delivery_man',10.000,5.000,NULL,NULL,0.00,0,NULL,NULL),(2,'Singapore',_binary '\0\0\0\0\0\0\0\0\0\0\n\0\0\02\�kA\�Y@��\�8\�\�?�\�kA\�\�Y@\�n���?\�k�eZ@\�\�VBD\�?V\�k�FZ@���\�Sq\�?�\�k�*Z@�\�(\�]\�?^\�k�O�Y@�%#\�\�\�\�?�\�kA�\�Y@eЭ@.\�?�\�k��\�Y@\�&\�19\�?*\�kA�\�Y@�\�\�\�ec\�?2\�kA\�Y@��\�8\�\�?',1,'2025-07-23 05:27:48','2025-07-23 05:33:11','zone_2_restaurant','zone_2_customer','zone_2_delivery_man',5.000,1.000,40.000,NULL,40.00,1,'rain or some other obstacle','Singapore');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'homeplate'
--

--
-- Dumping routines for database 'homeplate'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-26  3:46:41
