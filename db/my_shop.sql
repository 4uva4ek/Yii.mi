-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.41-log - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных my_shop
CREATE DATABASE IF NOT EXISTS `my_shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `my_shop`;


-- Дамп структуры для таблица my_shop.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(255) NOT NULL AUTO_INCREMENT,
  `cat_left` int(10) unsigned NOT NULL,
  `cat_right` int(10) unsigned NOT NULL,
  `cat_level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `cat_left` (`cat_left`,`cat_right`,`cat_level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы my_shop.categories: ~2 rows (приблизительно)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`cat_id`, `cat_left`, `cat_right`, `cat_level`) VALUES
	(1, 1, 2, 1),
	(2, 2, 3, 1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- Дамп структуры для таблица my_shop.categories_data
CREATE TABLE IF NOT EXISTS `categories_data` (
  `cat_id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  CONSTRAINT `FK_categories_data_categories` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы my_shop.categories_data: ~1 rows (приблизительно)
DELETE FROM `categories_data`;
/*!40000 ALTER TABLE `categories_data` DISABLE KEYS */;
INSERT INTO `categories_data` (`cat_id`, `title`, `description`, `published`) VALUES
	(1, '123', '123', 0);
/*!40000 ALTER TABLE `categories_data` ENABLE KEYS */;


-- Дамп структуры для таблица my_shop.migration
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы my_shop.migration: ~2 rows (приблизительно)
DELETE FROM `migration`;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` (`version`, `apply_time`) VALUES
	('m000000_000000_base', 1430588138),
	('m150502_173348_create_user_table', 1430588162);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;


-- Дамп структуры для таблица my_shop.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) DEFAULT NULL,
  `email_confirm_token` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `type_reg` varchar(50) DEFAULT 'local',
  PRIMARY KEY (`id`),
  KEY `idx_user_username` (`username`),
  KEY `idx_user_email` (`email`),
  KEY `idx_user_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы my_shop.user: ~4 rows (приблизительно)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `created_at`, `updated_at`, `username`, `auth_key`, `email_confirm_token`, `password_hash`, `password_reset_token`, `email`, `status`, `type_reg`) VALUES
	(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '123', '5WdvCF-k3joOWXf4xUsDhi29SxexxaSi', '0nD65byqtd9cUQ4ht7BbriUtJMdGLj4p', '$2y$13$rXonr8GuOhlj1PvEGDEGpuUovEITfhl4CzZLyecBWV9GbZDjBeNgm', NULL, '123@12.ru', 2, 'local'),
	(2, '0000-00-00 00:00:00', '2015-05-04 21:56:23', '123123', 'IANzBlluFMNp-hLtKbY3xfSW3zS6LLbj', 'QWj2Gru4EPT3M-jPMKoY4D-iHq62P1CJ', '$2y$13$wmOv2lvOMPZnVt2Vgri5U.aiHUYi.yzRFoAlClJgxLQny3T2BCoRe', 'UpFJOxWG5p1oeCvf8Tv-8QvNhtsQefM1_1430764506', 'milo.petrova@gmail.com', 1, 'local'),
	(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1234', 'RS0j1VDU4TK5O4k4jaGKz7hq6S8ea-OQ', 'lOziaSrbVingyQc-btbtXVCt0Rb51NUr', '$2y$13$XnMmKGY2hjUaposFI4rRBOLOUrlHPVGmCVea7lpsSMALop.kGsWXa', NULL, 'milo.petrova2@gmail.com', 2, 'local'),
	(4, '2015-05-03 09:54:19', '2015-05-03 09:54:19', '2222', 'uO0Q7RT3wdX7auztwlNNgciLejjMkpTL', 'p2eao-xy_iTsvNcOWGVj4zwv959h-x_N', '$2y$13$2UXqsGTh8xF7JOFGLYL0v./elxxRIMBDXrghdgQ9jfL621oux8Bw2', NULL, '123@122.ru', 2, 'local');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
