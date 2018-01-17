/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 5.7.20-log : Database - bms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bms`;

SET FOREIGN_KEY_CHECKS=0;
/*Table structure for table `brand` */

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `country` varbinary(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `jointime` datetime DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `brand` */

/*Table structure for table `p_classify` */

DROP TABLE IF EXISTS `p_classify`;

CREATE TABLE `p_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `p_classify` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b_id` int(255) DEFAULT NULL,
  `pc_id` int(255) DEFAULT NULL,
  `number` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `jointime` datetime DEFAULT NULL,
  `original_price` int(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `texture` int(11) DEFAULT NULL,
  `weight(g)` int(11) DEFAULT NULL,
  `unit` varchar(2) DEFAULT NULL,
  `antistop` varchar(255) DEFAULT NULL,
  `digest` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `check_status` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `comment_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `b_id` (`b_id`),
  KEY `pc_id` (`pc_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`pc_id`) REFERENCES `p_classify` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jurisdiction` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` varchar(3) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `telephone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `jointime` datetime DEFAULT NULL,
  `integral` int(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

SET FOREIGN_KEY_CHECKS=1;