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
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `published` tinyint(11) NOT NULL DEFAULT '0',
  `cat_left` int(10) unsigned NOT NULL,
  `cat_right` int(10) unsigned NOT NULL,
  `cat_level` int(10) unsigned NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `seotitle` varchar(250) DEFAULT NULL,
  `description` text,
  `date_creat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_left` (`cat_left`,`cat_right`,`cat_level`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы my_shop.categories: ~4 rows (приблизительно)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `published`, `cat_left`, `cat_right`, `cat_level`, `title`, `seotitle`, `description`, `date_creat`, `date_update`) VALUES
	(1, 0, 1, 2, 1, NULL, NULL, NULL, NULL, NULL),
	(2, 0, 2, 3, 1, NULL, NULL, NULL, NULL, NULL),
	(5, 0, 1, 2, 0, NULL, NULL, NULL, NULL, NULL),
	(6, 0, 1, 2, 0, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
