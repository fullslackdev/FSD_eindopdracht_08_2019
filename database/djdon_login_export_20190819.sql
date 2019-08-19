-- --------------------------------------------------------
-- Host:                         10.8.0.1
-- Server version:               10.3.17-MariaDB-1:10.3.17+maria~bionic-log - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for djdon_login
CREATE DATABASE IF NOT EXISTS `djdon_login` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `djdon_login`;

-- Dumping structure for table djdon_login.access
CREATE TABLE IF NOT EXISTS `access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create` tinyint(1) NOT NULL DEFAULT 0,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `update` tinyint(1) NOT NULL DEFAULT 0,
  `delete` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_access_role_id` (`role_id`),
  CONSTRAINT `FK_access_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table djdon_login.access: ~0 rows (approximately)
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
/*!40000 ALTER TABLE `access` ENABLE KEYS */;

-- Dumping structure for table djdon_login.group
CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table djdon_login.group: ~3 rows (approximately)
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` (`id`, `name`, `description`, `active`) VALUES
	(1, 'administrator', 'Can create, delete and modify roles, access and users.', 1),
	(2, 'producer', 'Can upload a demo and send message about their own demo\'s.', 1),
	(3, 'promoteam', 'Can listen, download and give feedback about demo\'s. Can also send internal messages about demo\'s.', 1);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;

-- Dumping structure for table djdon_login.login_info
CREATE TABLE IF NOT EXISTS `login_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `header_info` text COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `login_successful` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_login_info_user_id` (`user_id`),
  CONSTRAINT `FK_login_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table djdon_login.login_info: ~80 rows (approximately)
/*!40000 ALTER TABLE `login_info` DISABLE KEYS */;
INSERT INTO `login_info` (`id`, `user_id`, `last_login`, `ip_address`, `header_info`, `login_successful`) VALUES
	(2, 2, '2019-07-29 16:57:12', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(3, NULL, '2019-07-29 16:57:45', '157.97.112.154', '{"content-length":"22","accept-language":"en-US,en;q=0.5","cookie":"ID=2A772B3A8545F33700B068FC30BF83F5","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(4, 2, '2019-07-29 17:06:23', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=D487C647D723F638ED0DD2443A2EA76F; user=bart","host":"dondiabolo.com","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(5, 2, '2019-07-29 17:06:44', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","host":"dondiabolo.com","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(6, 2, '2019-07-29 17:15:55', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=2A772B3A8545F33700B068FC30BF83F5","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(7, 2, '2019-07-29 17:18:25', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=D34E3B223BAE3371FA16CEA21A59799F","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(8, 2, '2019-07-29 17:19:52', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=AEA0F5ED831C26B1E464CBC0A148A403","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(9, 2, '2019-07-29 17:20:12', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=DDCDF7D6255AE8E97301B8FF55B3EE48","host":"dondiabolo.com","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(10, 2, '2019-07-29 17:22:45', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=9F3DFBD4BC77191A0A03B76BA7E38A9D","host":"dondiabolo.com","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(11, 2, '2019-07-29 17:23:22', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=C5623821B9F22B8EF560E55EC664770E","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(12, 2, '2019-07-29 17:24:35', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=9C015A35C0DFF4C84C5AF1F8D28F9CF8","host":"dondiabolo.com","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(13, 2, '2019-07-29 17:25:47', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=6FF0B9347E9F6FFF1414D8BF12B14103","host":"dondiabolo.com","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(14, 2, '2019-07-29 17:26:25', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=DF0D97CE9720E544C813AD85BB1260D3","host":"dondiabolo.com","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(15, 2, '2019-07-29 17:28:10', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=85C0493CFA9157822D904E8F85C28882","host":"dondiabolo.com","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(16, 2, '2019-07-29 17:28:48', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=C42FB4DC6460616B7327F30AA8FAF00B","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(17, 2, '2019-07-29 17:29:57', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=EC2F229FFD70FB0F0CD465A0BE521287; ID=3025A6A5B0811CEC4D386562AC6AC177","host":"dondiabolo.com","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(18, 1, '2019-07-29 17:30:12', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","host":"dondiabolo.com","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(19, 2, '2019-07-29 17:32:45', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=1382B4B7BFF21158187E3B720228C6AE","host":"dondiabolo.com","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(20, 4, '2019-07-29 17:32:55', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","cookie":"ID=F539A2AAAD83BF2FE84648DAFDF43402","host":"dondiabolo.com","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(21, 3, '2019-07-29 17:40:47', '185.232.20.156', '{"content-length":"20","accept-language":"en-us","origin":"https://fullslack.dev","host":"fullslack.dev","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"br, gzip, deflate","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8","user-agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Safari/605.1.15"}', 0),
	(22, 3, '2019-07-29 18:08:42', '185.232.20.156', '{"content-length":"20","cookie":"ID=F9A88C026954FF3E3819A1A9159B9603","accept-language":"en-us","origin":"https://fullslack.dev","host":"fullslack.dev","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"br, gzip, deflate","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8","user-agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Safari/605.1.15"}', 0),
	(23, 1, '2019-07-29 18:09:46', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(24, 2, '2019-07-29 18:10:12', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=B698F792F38D5DE3F6CA1EB33F66F046","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(25, 8, '2019-07-29 18:13:44', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","cookie":"ID=519E9F453046343F832E40086D6F3A04","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(26, 1, '2019-07-29 18:14:13', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","cookie":"ID=715CF2F63490F3AADF55ADA9BE0F9A72","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(27, 2, '2019-07-30 08:34:21', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(28, 1, '2019-07-30 08:45:54', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","cookie":"ID=BA013F86BBEDFD42E446995E0F945B3B","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(29, 3, '2019-07-30 09:56:06', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","cookie":"ID=478D99C81FD850AB8A1C51C0838BBB20","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(30, 1, '2019-07-30 09:56:23', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","cookie":"ID=F123C9D8D0D7156B2E971E577FD4FE7C","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(31, 2, '2019-07-31 09:49:15', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=70D214DCE7446FBA83FE6F55E567140F","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(32, 9, '2019-07-31 09:49:21', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=6410B57375637AB91FB2656D8975C3DC","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(33, 10, '2019-07-31 09:49:45', '157.97.112.154', '{"content-length":"19","accept-language":"en-US,en;q=0.5","cookie":"ID=6410B57375637AB91FB2656D8975C3DC","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(34, 10, '2019-07-31 09:49:56', '157.97.112.154', '{"content-length":"19","accept-language":"en-US,en;q=0.5","cookie":"ID=FE3EDE1B70196278888CD51A051834D9","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(35, 10, '2019-07-31 09:50:14', '157.97.112.154', '{"content-length":"19","accept-language":"en-US,en;q=0.5","cookie":"ID=18C6CB8C7E407B2B173E45EE28D600F9","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(36, 10, '2019-07-31 09:50:41', '157.97.112.154', '{"content-length":"19","accept-language":"en-US,en;q=0.5","cookie":"ID=1C944ADCCC2A0A8DF8D3B1BAF1EEC8B3","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(37, 11, '2019-07-31 14:28:34', '157.97.112.154', '{"content-length":"35","accept-language":"en-US,en;q=0.5","cookie":"ID=97A71E21930DB9B71232523931922391","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(38, 11, '2019-07-31 14:28:42', '157.97.112.154', '{"content-length":"35","accept-language":"en-US,en;q=0.5","cookie":"ID=FC3D3DC6568BB71311E2E0AF3DD829BE","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(39, 11, '2019-07-31 14:28:53', '157.97.112.154', '{"content-length":"35","accept-language":"en-US,en;q=0.5","cookie":"ID=026C0EE8C139F285FA052B5F68D5AC18","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(40, 11, '2019-07-31 14:29:32', '157.97.112.154', '{"content-length":"35","accept-language":"en-US,en;q=0.5","cookie":"ID=534B03431C70340996B2D90942CBCC3D","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","cache-control":"max-age=0","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(41, 11, '2019-07-31 14:35:39', '157.97.112.154', '{"content-length":"35","accept-language":"en-US,en;q=0.5","cookie":"ID=0D8DF3826C4414A939A9D9F5133B51DC","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(42, 11, '2019-07-31 14:39:20', '157.97.112.154', '{"content-length":"35","accept-language":"en-US,en;q=0.5","cookie":"ID=0FE0CE37EEF33B2202C9DDA13E28A7B5","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(43, 1, '2019-08-01 09:44:56', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(44, 11, '2019-08-01 12:01:20', '157.97.112.154', '{"content-length":"35","accept-language":"en-US,en;q=0.5","cookie":"ID=060C264CE1791D910ABF1EF2C7BE6F37","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(45, 11, '2019-08-01 12:02:37', '157.97.112.154', '{"content-length":"35","accept-language":"en-US,en;q=0.5","cookie":"ID=617A2F927DFBD35248CB8DB39D5E01DF","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(46, 2, '2019-08-01 12:20:00', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=FA1F670979AE803025EFB16CFCFFF53F","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(47, 1, '2019-08-01 12:20:33', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","cookie":"ID=B4659A63D528D93851207D329221CE77","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(48, 2, '2019-08-01 12:20:47', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=FA5194738F6E97015C869F37EED21F21","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(49, 11, '2019-08-01 12:21:00', '157.97.112.154', '{"content-length":"35","accept-language":"en-US,en;q=0.5","cookie":"ID=816940838469289F31471D787B69F2C2","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(50, 2, '2019-08-03 15:41:29', '94.210.1.236', '{"content-length":"18","accept-language":"en-US,en;q=0.5","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(51, 2, '2019-08-04 11:37:04', '94.210.1.236', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=B4ADF030B10C70F4A0843D53C99770C9","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(52, 9, '2019-08-05 08:45:59', '94.210.1.236', '{"content-length":"18","accept-language":"en-US,en;q=0.5","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(53, NULL, '2019-08-05 08:54:03', '94.210.1.236', '{"content-length":"20","accept-language":"en-US,en;q=0.5","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(54, 2, '2019-08-05 08:54:20', '94.210.1.236', '{"content-length":"18","accept-language":"en-US,en;q=0.5","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(55, 2, '2019-08-05 09:04:26', '94.210.1.236', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=AF151381C382F207105776393E9DF31D","method":"POST","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","pwd":"bart","user":"bart","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0"}', 1),
	(56, 2, '2019-08-05 09:13:13', '94.210.1.236', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=D279CD9A165886AEAEC17ED4B024584D","method":"POST","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","pwd":"bart","user":"bart","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0"}', 1),
	(57, 1, '2019-08-05 09:15:27', '94.210.1.236', '{"content-length":"20","accept-language":"en-US,en;q=0.5","cookie":"ID=1F921B69E9D6128A61497D67D5A87C9D","method":"POST","parameter: user":"admin","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8","parameter: pwd":"admin","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0"}', 1),
	(58, 2, '2019-08-05 09:21:42', '94.210.1.236', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=B574D0AD9966868A20DAD93FD14BC142","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":"{\\"method\\":\\"POST\\",\\"parameter: user\\":\\"bart\\",\\"parameter: pwd\\":\\"bart\\"}","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(59, 2, '2019-08-05 09:32:10', '94.210.1.236', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=76A1055F6F615789024304942628C23F","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":"[{\\"method\\":\\"POST\\",\\"parameter: user\\":\\"bart\\",\\"parameter: pwd\\":\\"bart\\"}]","accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(60, 2, '2019-08-05 09:42:14', '94.210.1.236', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"ID=A088150AAF87A8113F5971F8EAF12A8A","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","parameter: user":"bart","parameter: pwd":"bart"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(61, 2, '2019-08-05 09:46:03', '94.210.1.236', '{"content-length":"18","accept-language":"en-US,en;q=0.5","cookie":"user=bart; ID=BC7F24562C24850199834EC3204964AF","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"bart","user":"bart"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(62, 9, '2019-08-05 14:07:52', '157.97.112.154', '{"content-length":"27","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"23$hd thidP","user":"henk"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(63, 9, '2019-08-05 14:08:40', '157.97.112.154', '{"content-length":"28","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":"henk"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(64, 2, '2019-08-06 15:45:29', '157.97.112.154', '{"content-length":"18","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":"bart"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(65, NULL, '2019-08-12 13:22:04', '157.97.112.154', '{"content-length":"10","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":""}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(66, NULL, '2019-08-12 13:23:20', '157.97.112.154', '{"content-length":"14","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"close","parameters":[{"method":"POST","pwd":"\'\\r\\n","user":"\'"}],"accept-encoding":"gzip, deflate","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(67, 1, '2019-08-12 13:23:29', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"close","parameters":[{"method":"POST","pwd":"","user":"admin"}],"accept-encoding":"gzip, deflate","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(68, 1, '2019-08-12 13:23:46', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","cookie":"ID=6C261372D7DC851CF99692956AE94CEA","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"close","parameters":[{"method":"POST","pwd":"","user":"admin"}],"accept-encoding":"gzip, deflate","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(69, 1, '2019-08-12 18:25:08', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":"admin"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(70, 1, '2019-08-14 09:21:58', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":"admin"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(71, 1, '2019-08-14 09:25:12', '157.97.112.154', '{"content-length":"20","accept-language":"en-US,en;q=0.5","cookie":"ID=6A5CEC6109D2F19C48661A32FA58EB84","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"close","parameters":[{"method":"POST","pwd":"","user":"admin"}],"accept-encoding":"gzip, deflate","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(72, 1, '2019-08-14 12:01:35', '157.97.112.154', '{"content-length":"28","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":"administrator"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(73, 2, '2019-08-14 12:01:47', '157.97.112.154', '{"content-length":"26","accept-language":"en-US,en;q=0.5","cookie":"ID=B2EE939EBC96D84932E25DF748C15310","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":"bart.loeffen"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(74, 12, '2019-08-18 15:22:18', '94.210.1.236', '{"content-length":"31","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":"bart.4"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(75, NULL, '2019-08-18 19:22:23', '83.128.182.76', '{"content-length":"21","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":"admini"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(76, NULL, '2019-08-18 19:22:29', '83.128.182.76', '{"content-length":"22","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":"admini"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(77, NULL, '2019-08-18 19:22:35', '83.128.182.76', '{"content-length":"24","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":"admini"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(78, NULL, '2019-08-18 19:22:40', '83.128.182.76', '{"content-length":"19","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":";","user":"admini"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(79, NULL, '2019-08-18 19:25:11', '83.128.182.76', '{"content-length":"19","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"close","parameters":[{"method":"POST","pwd":"\'","user":"admini"}],"accept-encoding":"gzip, deflate","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 0),
	(80, 14, '2019-08-18 19:32:10', '83.128.182.76', '{"content-length":"30","accept-language":"en-US,en;q=0.5","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":"abcdef"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1),
	(81, 15, '2019-08-18 19:35:46', '83.128.182.76', '{"content-length":"31","accept-language":"en-US,en;q=0.5","cookie":"ID=9AFE1D0F3F9D7F3FE37C85EE474DF164","request-uri":"/HttpSessionServletTest/LoginServlet","host":"fullslack.dev","upgrade-insecure-requests":"1","content-type":"application/x-www-form-urlencoded","connection":"keep-alive","parameters":[{"method":"POST","pwd":"","user":"abcdefg"}],"accept-encoding":"gzip, deflate, br","user-agent":"Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0","accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}', 1);
/*!40000 ALTER TABLE `login_info` ENABLE KEYS */;

-- Dumping structure for procedure djdon_login.new_user
DELIMITER //
CREATE DEFINER=`root`@`10.8.0.%` PROCEDURE `new_user`(
	IN group_name VARCHAR(50),
	IN user_username VARCHAR(40),
	IN user_password VARCHAR(200),
	IN info_firstname VARCHAR(50),
	IN info_lastname VARCHAR(50),
	IN info_country CHAR(2),
	IN info_email VARCHAR(100),
	IN info_validation VARCHAR(100),
	OUT success BOOLEAN)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK; -- rollback any error in the transaction
		SET success = FALSE;
		-- RESIGNAL; -- use for debug only, else output variable will not be set correctly
	END;
	
	START TRANSACTION;	
		SET @GroupID = (SELECT id FROM `group` WHERE `name` = group_name);
		INSERT INTO user (group_id, username, password, active)
			VALUES (@GroupID, user_username, user_password, 1);
		SET @UserID = LAST_INSERT_ID();
		INSERT INTO user_info (user_id, firstname, lastname, country, email, `validation`)
			VALUES (@UserID, info_firstname, info_lastname, info_country, info_email, info_validation);
		SET success = TRUE;
	COMMIT; -- if either inserts fails then this will not be executed
END//
DELIMITER ;

-- Dumping structure for table djdon_login.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_role_group_id` (`group_id`),
  CONSTRAINT `FK_role_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table djdon_login.role: ~0 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table djdon_login.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_password` tinyint(1) NOT NULL DEFAULT 0,
  `salt` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK_user_group_id` (`group_id`),
  CONSTRAINT `FK_user_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table djdon_login.user: ~15 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `group_id`, `username`, `password`, `temp_password`, `salt`, `secret`, `active`) VALUES
	(1, 1, 'administrator', '$argon2id$v=19$m=102400,t=8,p=2$Rty9dXviU16o36w4to6a4Q$iSLfJpHm/A6K+t1xhjbfDEqCz4WsieetaIZ+yyqbZYs', 0, 'dK09XhczjxVvFBkBuXrF2oLdoBLQrm8y7WnAckj6VC8=', 'oEiOgaldsR/Tuor6Mfzkh7fHIfntefDVZ8s5sMHiQARS+5bSdBrbLNPxKFu7ZjAN+WMqJSRXPCQ4AIl9', 1),
	(2, 2, 'bart.loeffen', '$argon2id$v=19$m=102400,t=8,p=2$BKnsx3ALYVbF3eXbnKFIoA$aVJnjpSm50pjVkCahoOyX4GeAm+g08A6uau38AGz6zc', 0, NULL, NULL, 1),
	(3, 2, 'danny.sukdeo', '$argon2id$v=19$m=102400,t=8,p=2$NDHFd0+OWjeo+olpKJGt8A$VMhmiCAfyV2hukBjKv1MWd1TWYbHcckyCehdFDMoibA', 0, NULL, NULL, 1),
	(4, 3, 'chaya.kanhai', '$argon2id$v=19$m=102400,t=8,p=2$snCsMsJzhozAgflceuDqbw$C/tFs2fP9jPvfg0xAoH28TW6zNSyw63fuv4PDA1zIN4', 0, NULL, NULL, 0),
	(5, 3, 'joris.kalkhoven', '$argon2id$v=19$m=102400,t=8,p=2$uoznmNqdRX7POWExp/RdzQ$tLCpM8acvSrkb2H2+r3mpYEMzFh/WLVtspWthInfjIY', 0, NULL, NULL, 1),
	(6, 2, 'mark.vlek', '$argon2id$v=19$m=102400,t=8,p=2$09X6SYrkh20vrDlf25Av9Q$HtxtQK+izuefRp1NczbzVA4XlaVdPpI3vk/AideJ0O0', 0, NULL, NULL, 1),
	(7, 2, 'anton.vu', '$argon2id$v=19$m=102400,t=8,p=2$V/FDGXIIo+ELEWaXO72D7Q$HeD1ojFfrhfW/4LNlOcllHGtBiVSOXidy1YAxeRjrgM', 0, NULL, NULL, 1),
	(8, 3, 'kitty.oost', '$argon2id$v=19$m=102400,t=8,p=2$rWXxN16/1c2wJRiBvudCSw$mhILxtFlGwZhUc3wD+1GYYi3SjGSPDYnp8kR0Z/BIQU', 0, NULL, NULL, 1),
	(9, 2, 'henk.1', '$argon2id$v=19$m=102400,t=8,p=2$4DdRw6c8Jzy47SDOVD+dhg$puLY9mSyrQV9aVQHdA1zR42qXB8jkWhgVytFh4Aua9U', 0, NULL, NULL, 0),
	(10, 3, 'henk.2', '$argon2id$v=19$m=102400,t=8,p=2$4DdRw6c8Jzy47SDOVD+dhg$puLY9mSyrQV9aVQHdA1zR42qXB8jkWhgVytFh4Aua9U', 0, NULL, NULL, 1),
	(11, 2, 'bart.1', '$argon2id$v=19$m=102400,t=12,p=2$HcKQ9ECVyKuNxMNTZg5cVA$gWIGPDYxiXlgLZcOS/CDo9Kxi5Gc7Rcwm0jHtTc16HE', 1, NULL, NULL, 1),
	(12, 2, 'bart.4', '$argon2id$v=19$m=102400,t=12,p=2$QK0ZKKbU1fXjlgWP2hj8KA$9zIDlD3EeQvvDap5idmzjW7ClDP07+7ViDi/GaidSag', 0, NULL, NULL, 1),
	(13, 2, 'z3fq0n', '$argon2id$v=19$m=102400,t=12,p=2$7tLyy9JUfFCbve8g2rdhfA$Gkmep0EANe4fMDK/Y/1gWGNgheh2iq++BV9z6esBF5w', 0, NULL, NULL, 1),
	(14, 2, 'abcdef', '$argon2id$v=19$m=102400,t=12,p=2$BwJfd8sWeSYCd8SA7DxSQQ$YyElLglIgOYt4o4zyP3xBsRDYs9CDoFLMnn1CjY6Rww', 0, NULL, NULL, 1),
	(15, 2, 'abcdefg', '$argon2id$v=19$m=102400,t=12,p=2$Ky9+aaIq/Y2YMRyHxwufDg$Qfd9dJj3WRs67st59bBDrJkcfc1WCu/CZT3tuzyGuHk', 0, NULL, NULL, 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table djdon_login.user_info
CREATE TABLE IF NOT EXISTS `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_not_valid` tinyint(1) NOT NULL DEFAULT 0,
  `validation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_user_info_user_id` (`user_id`),
  CONSTRAINT `FK_user_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table djdon_login.user_info: ~15 rows (approximately)
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` (`id`, `user_id`, `firstname`, `lastname`, `country`, `email`, `email_not_valid`, `validation`) VALUES
	(1, 1, 'Hertog', 'Jan', 'CZ', 'koning.pintenman@onze.god', 0, NULL),
	(2, 2, 'Bart', 'Loeffen', 'NL', 'bart@loeffen.com', 0, NULL),
	(3, 3, 'Danny', 'Sukdeo', 'AW', 'danny.sukdeo@gmail.com', 0, NULL),
	(4, 4, 'Chaya', 'Kanhai', 'SR', 'chayakanhai@msn.com', 0, NULL),
	(5, 5, 'Joris', 'Kalkhoven', 'NL', 'joris.k@live.nl', 0, NULL),
	(6, 7, 'Anton', 'Vu', 'VN', 'antonvu580@hotmail.com', 0, NULL),
	(7, 6, 'Mark', 'Vlek', 'NL', 'vlekmark@gmail.com', 0, NULL),
	(8, 8, 'Kitty', 'Oost', 'NL', 'kyko.me@gmail.com', 0, NULL),
	(9, 9, 'Henk', '9', 'DE', 'henk@henk.de', 0, NULL),
	(10, 10, 'Henk', '10', 'RU', 'henk@henk.cccp', 0, NULL),
	(14, 11, 'Bart', 'Loeffen', 'NL', 'loeffen@hotmail.com', 0, NULL),
	(15, 12, 'Bart', 'Loeffen', 'KP', 'loeffen@gmail.com', 0, NULL),
	(16, 13, 'asdf', 'asdf', 'NL', 'mart.visser@noviuniversity.com', 0, 'z1SskL82CsInAt1ys0bcgZp6tcwWkdJbooPEIzHyC49foqdSmS7YOiG18DXC7AzPHTRZBHQgoGjUiHy7nrmT3ItGeytmNYKqEbrK'),
	(17, 14, 'asdf', 'asdf', 'NL', 'a@b.com', 0, 'RLSHlRly6FtUkgO7g0XGH5FGUgnXwzMhws0RrmoEIPFayx3LASql6kgY3pXK2nuK5kOSsfCRxWjaA5Dbm7jzKbH94vhyDbXIuD69'),
	(18, 15, 'asdf', 'asdf', 'NL', 'ab@b.com', 0, 'bVNH0XZbKmchrIYPRWdySifCkkBR5s9XcZuvR9Ibou6EFsmuKkwEiBCNO9tEm6M5Mhk5M8LUht8Pou7OTLwoeMC1xQjA9UjpEzVl');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
