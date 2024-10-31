-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for cuoiky
CREATE DATABASE IF NOT EXISTS `cuoiky` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cuoiky`;

-- Dumping structure for table cuoiky.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `total_cost` decimal(38,2) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlnnelfsha11xmo2ndjq66fvro` (`customer_id`),
  KEY `FKq83pan5xy2a6rn0qsl9bckqai` (`room_id`),
  KEY `FKkgseyy7t56x7lkjgu3wah5s3t` (`user_id`),
  CONSTRAINT `FKkgseyy7t56x7lkjgu3wah5s3t` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKlnnelfsha11xmo2ndjq66fvro` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKq83pan5xy2a6rn0qsl9bckqai` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cuoiky.booking: ~7 rows (approximately)
INSERT INTO `booking` (`id`, `end_date`, `start_date`, `total_cost`, `customer_id`, `room_id`, `user_id`) VALUES
	(1, '2024-06-29', '2024-06-27', 300000.00, 1, 1, NULL),
	(2, '2024-06-28', '2024-06-25', 44444.00, 1, 3, NULL),
	(3, '2024-06-30', '2024-06-25', 600000.00, 1, 1, NULL),
	(4, '2024-07-01', '2024-06-30', 200000.00, 1, 1, NULL),
	(8, '2024-06-27', '2024-06-27', 100000.00, 1, 1, NULL),
	(10, '2024-06-30', '2024-06-30', 11111.00, 4, 3, NULL);

-- Dumping structure for table cuoiky.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cuoiky.customer: ~2 rows (approximately)
INSERT INTO `customer` (`id`, `address`, `email`, `first_name`, `last_name`, `phone_number`, `image_url`) VALUES
	(1, 'D5/27 ấp 4 xã Tân Quý Tây, Bình chánh, HCM', 'thongkuninedoan@gmail.com', 'Đoàn', 'Thông', '0901489465', '/images/nam.png'),
	(2, 'D5/27 ấp 4 xã Tân Quý Tây, Bình chánh, HCM', 'thongkuninedoan@gmail.com', 'Đoàn', 'Thông', '0901489465', NULL),
	(3, 'D5/27 ấp 4 xã Tân Quý Tây, Bình chánh, HCM', 'thongkuninedoan@gmail.com', 'Đoàn Minh', 'Thông', '0901489466', NULL),
	(4, 'D5/27 ấp 4 xã Tân Quý Tây, Bình chánh, HCM', 'tri@gmail.com', 'Phan Huỳnh', 'Minh Trí', '0901489467', NULL);

-- Dumping structure for table cuoiky.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `booking_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4jd6uuk7w0d72riyre2w14fl7` (`booking_id`),
  KEY `FK5e32ukwo9uknwhylogvta4po6` (`customer_id`),
  CONSTRAINT `FK4jd6uuk7w0d72riyre2w14fl7` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  CONSTRAINT `FK5e32ukwo9uknwhylogvta4po6` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cuoiky.invoice: ~4 rows (approximately)
INSERT INTO `invoice` (`id`, `amount`, `issue_date`, `booking_id`, `customer_id`) VALUES
	(1, 0.06, '2024-06-30', 1, 3),
	(2, NULL, NULL, 1, 1),
	(4, 100000, '2024-07-07', 8, 1),
	(5, 10000, '2024-06-30', 10, 4);

-- Dumping structure for table cuoiky.invoice_detail
CREATE TABLE IF NOT EXISTS `invoice_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `invoice_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKit1rbx4thcr6gx6bm3gxub3y4` (`invoice_id`),
  CONSTRAINT `FKit1rbx4thcr6gx6bm3gxub3y4` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cuoiky.invoice_detail: ~0 rows (approximately)

-- Dumping structure for table cuoiky.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(250) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cuoiky.role: ~2 rows (approximately)
INSERT INTO `role` (`id`, `description`, `name`) VALUES
	(1, 'Standard user role', 'USER'),
	(2, 'Administrator role', 'ADMIN');

-- Dumping structure for table cuoiky.room
CREATE TABLE IF NOT EXISTS `room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `available` bit(1) NOT NULL,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `num_beds` int NOT NULL,
  `price_per_night` decimal(38,2) NOT NULL,
  `quantity` decimal(38,2) NOT NULL,
  `room_number` varchar(255) NOT NULL,
  `room_type` enum('DOUBLE','FAMILY','SINGLE','SUITE') NOT NULL,
  `views` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKfvetq5dj3wcvmdf19bbof0os6` (`room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cuoiky.room: ~4 rows (approximately)
INSERT INTO `room` (`id`, `available`, `description`, `image_url`, `num_beds`, `price_per_night`, `quantity`, `room_number`, `room_type`, `views`) VALUES
	(1, b'1', 'nothing', '/images/room4.jpg', 3, 100000.00, 20.00, '1144', 'FAMILY', 0),
	(2, b'1', 'gfd', '/images/room2.jpg', 2, 100000.00, 1.00, '112', 'DOUBLE', 1),
	(3, b'1', 'gfdhgf', '/images/room3.jpg', 3, 11111.00, 20.00, '123', 'SINGLE', 0),
	(9, b'0', 'nothing', NULL, 3, 100000.00, 1.00, '1789', 'SUITE', 0);

-- Dumping structure for table cuoiky.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UK589idila9li6a4arw1t8ht1gx` (`phone`),
  UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cuoiky.user: ~0 rows (approximately)
INSERT INTO `user` (`id`, `email`, `password`, `phone`, `provider`, `username`) VALUES
	(1, 'user1@gmail.com', '$2a$10$8QGp8QNtt32r1cLpM/Zkc..bMuDgiHT/gYmrhti2UQKfOPJFRwig2', '0901489465', NULL, 'user1');

-- Dumping structure for table cuoiky.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cuoiky.user_role: ~0 rows (approximately)
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
	(1, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
