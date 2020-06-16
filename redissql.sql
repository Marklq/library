/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.7.26 : Database - j2ee
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`j2ee` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `j2ee`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

/*Table structure for table `j2ee_amerce` */

DROP TABLE IF EXISTS `j2ee_amerce`;

CREATE TABLE `j2ee_amerce` (
  `amerce_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借阅id（自增）',
  `borrow_id` int(11) NOT NULL COMMENT '借阅证号（读者id）',
  `name` varchar(15) NOT NULL COMMENT '读者姓名',
  `book_name` varchar(32) NOT NULL,
  `book_id` char(7) NOT NULL COMMENT '书籍编号',
  `borrow_time` datetime NOT NULL COMMENT '借书时间',
  `should_r_time` datetime NOT NULL COMMENT '应还时间',
  `return_time` datetime NOT NULL COMMENT '还书时间',
  `fines` double NOT NULL COMMENT '罚款金额',
  PRIMARY KEY (`amerce_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_amerce` */

insert  into `j2ee_amerce`(`amerce_id`,`borrow_id`,`name`,`book_name`,`book_id`,`borrow_time`,`should_r_time`,`return_time`,`fines`) values (2,2,'梅恩2','计算机网络','TQ_2323','2017-12-08 18:49:31','2017-12-12 18:49:29','2017-12-13 14:15:52',4.56),(3,2,'梅恩2','大学物理','ME_5353','2017-12-08 18:49:30','2017-12-13 18:49:29','2017-12-14 20:27:52',6),(4,2,'梅恩2','计算机网络','TQ_2323','2017-12-13 14:15:28','2017-12-16 14:15:28','2017-12-21 18:59:17',29.759999999999998),(5,2,'梅恩2','计算机组成原理','ME_3535','2017-12-14 20:27:35','2017-12-15 20:27:35','2017-12-21 19:02:57',34.08),(6,2,'梅恩2','大学物理','ME_5353','2017-12-14 20:27:36','2017-12-15 20:27:36','2017-12-21 19:03:02',34.08);

/*Table structure for table `j2ee_books` */

DROP TABLE IF EXISTS `j2ee_books`;

CREATE TABLE `j2ee_books` (
  `book_id` varchar(255) NOT NULL COMMENT '书籍编号',
  `book_name` varchar(32) NOT NULL COMMENT '书名',
  `book_type` int(1) NOT NULL COMMENT '类别（1->全部、2->文学类、3->历史类、4->悬疑类、5->心理健康类）',
  `author` varchar(32) NOT NULL COMMENT '作者',
  `press` varchar(50) NOT NULL COMMENT '出版社',
  `publish_date` date NOT NULL COMMENT '出版日期',
  `price` double NOT NULL COMMENT '价格',
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记日期',
  `is_borrow` int(1) NOT NULL DEFAULT '4' COMMENT '是否可借（大于0可借）',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_books` */

insert  into `j2ee_books`(`book_id`,`book_name`,`book_type`,`author`,`press`,`publish_date`,`price`,`register_time`,`is_borrow`) values ('00a116d1-4e9e-4c8c-b81e-b5e212d25ebf','javaweb',1,'梅恩3','华清出版','2020-05-01',50,'2020-06-11 00:00:00',100),('5ab2beb2-242a-47a9-8df0-a37d7d039629','故事会',2,'梅恩2','华清出版','2020-05-01',10,'2020-06-10 00:00:00',20),('9a81b430-adf8-477b-a67f-dfe1e8b41d81','故事会',0,'梅恩','华清出版','2020-05-01',10,'2020-06-10 00:00:00',0),('f7c30390-d059-4d3f-bcea-c863f69d2c3e','javaweb',3,'梅恩3','华清出版','2020-05-01',50,'2020-06-10 00:00:00',50),('ME_3535','计算机组成原理',5,'肖西川','十教出版社','2015-11-10',88.88,'2017-12-07 20:47:48',1),('ME_5353','大学物理',4,'廖欢','成大出版社','2017-11-11',88.66,'2017-12-07 21:03:39',5),('TQ_2323','计算机网络',2,'梅恩','成大出版社','2017-12-07',44.22,'2017-12-07 20:44:54',6);

/*Table structure for table `j2ee_borrow` */

DROP TABLE IF EXISTS `j2ee_borrow`;

CREATE TABLE `j2ee_borrow` (
  `borrow_id` int(11) NOT NULL,
  `book_id` char(7) NOT NULL,
  `borrow_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `should_r_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_return` tinyint(1) NOT NULL DEFAULT '0',
  `return_time` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`,`borrow_id`,`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_borrow` */

insert  into `j2ee_borrow`(`borrow_id`,`book_id`,`borrow_time`,`should_r_time`,`is_return`,`return_time`,`id`) values (2,'TX_1435','2017-12-03 16:24:57','2017-12-11 18:49:29',1,'2017-12-03 20:52:06',1),(2,'TX_1435','2017-12-03 16:25:02','2017-12-11 18:49:29',1,'2017-12-03 20:52:27',2),(2,'TX_1435','2017-12-03 17:10:42','2017-12-11 18:49:29',1,'2017-12-03 20:54:54',3),(2,'TX_1435','2017-12-03 20:55:18','2017-12-11 18:49:29',1,'2017-12-03 21:06:32',4),(2,'TX_1435','2017-12-03 20:55:19','2017-12-11 18:49:29',1,'2017-12-03 21:06:40',5),(2,'TX_1435','2017-12-03 20:57:51','2017-12-11 18:49:29',1,'2017-12-03 21:06:41',6),(2,'TX_1435','2017-12-03 20:59:59','2017-12-11 18:49:29',1,'2017-12-03 21:06:43',7),(2,'TX_1435','2017-12-03 21:06:09','2017-12-11 18:49:29',1,'2017-12-03 21:06:44',8),(2,'TX_1435','2017-12-03 21:11:09','2017-12-11 18:49:29',1,'2017-12-03 21:11:20',9),(2,'TX_1435','2017-12-03 21:11:10','2017-12-11 18:49:29',1,'2017-12-03 21:11:29',10),(2,'TX_1435','2017-12-03 21:11:25','2017-12-11 18:49:29',1,'2017-12-03 21:11:32',11),(2,'TX_1435','2017-12-03 21:18:37','2017-12-11 18:49:29',1,'2017-12-03 21:18:52',12),(2,'TX_1435','2017-12-03 21:18:38','2017-12-11 18:49:29',1,'2017-12-03 22:09:42',13),(2,'TX_1435','2017-12-03 22:09:31','2017-12-11 18:49:29',1,'2017-12-03 22:09:45',14),(2,'TX_1435','2017-12-03 22:09:47','2017-12-11 18:49:29',1,'2017-12-08 10:50:24',15),(2,'ME_3535','2017-12-08 10:55:25','2017-12-11 18:49:29',1,'2017-12-08 14:17:32',17),(2,'ME_5353','2017-12-08 14:13:52','2017-12-11 18:49:29',1,'2017-12-08 14:17:41',18),(2,'TQ_2323','2017-12-08 14:14:02','2017-12-11 18:49:29',1,'2017-12-08 14:14:17',19),(2,'TQ_2323','2017-12-08 14:14:06','2017-12-11 18:49:29',1,'2017-12-08 14:16:54',20),(2,'ME_3535','2017-12-08 14:23:18','2017-12-11 18:49:29',1,'2017-12-08 14:23:22',21),(2,'ME_3535','2017-12-08 14:36:17','2017-12-11 18:49:29',1,'2017-12-08 14:36:29',22),(2,'TQ_2323','2017-12-08 14:36:47','2017-12-11 18:49:29',1,'2017-12-08 14:36:56',23),(2,'ME_3535','2017-12-08 14:37:19','2017-12-11 18:49:29',1,'2017-12-08 14:37:48',24),(2,'ME_3535','2017-12-08 14:41:21','2017-12-11 18:49:29',1,'2017-12-08 14:56:20',25),(4,'ME_3535','2017-12-08 18:22:30','2017-12-11 18:49:29',1,'2017-12-08 18:29:23',26),(4,'ME_3535','2017-12-08 18:22:54','2017-12-11 18:49:29',1,'2017-12-08 18:29:27',27),(4,'ME_3535','2017-12-08 18:22:55','2017-12-11 18:49:29',1,'2017-12-08 18:29:29',28),(4,'ME_3535','2017-12-08 18:22:56','2017-12-11 18:49:29',1,'2017-12-08 18:29:38',29),(4,'ME_3535','2017-12-08 18:22:57','2017-12-11 18:49:29',1,'2017-12-08 18:30:00',30),(4,'ME_3535','2017-12-08 18:22:57','2017-12-11 18:49:29',1,'2017-12-08 18:30:02',31),(4,'TQ_2323','2017-12-08 18:30:20','2017-12-11 18:49:29',0,NULL,32),(2,'ME_3535','2017-12-08 18:49:29','2017-12-12 18:49:29',1,'2017-12-08 18:53:26',33),(2,'ME_5353','2017-12-08 18:49:30','2017-12-13 18:49:29',1,'2017-12-14 20:27:53',34),(2,'TQ_2323','2017-12-08 18:49:31','2017-12-12 18:49:29',1,'2017-12-13 14:15:52',35),(2,'ME_5353','2017-12-13 14:15:27','2017-12-16 14:15:27',1,'2017-12-14 20:27:56',36),(2,'TQ_2323','2017-12-13 14:15:28','2017-12-16 14:15:28',1,'2017-12-21 18:59:18',37),(2,'ME_3535','2017-12-14 20:27:35','2017-12-15 20:27:35',1,'2017-12-21 19:02:58',38),(2,'ME_5353','2017-12-14 20:27:36','2017-12-15 20:27:36',1,'2017-12-21 19:03:03',39),(2,'TQ_2323','2017-12-14 20:27:37','2017-12-15 20:27:37',0,NULL,40),(2,'ME_2123','2017-12-14 20:29:41','2017-12-15 20:29:41',1,'2017-12-14 20:29:46',41),(2,'ME_5353','2017-12-21 18:59:04','2017-12-22 18:59:04',0,NULL,42),(2,'ME_3535','2017-12-21 19:02:23','2017-12-22 19:02:23',0,NULL,43),(2,'ME_3535','2017-12-21 19:02:23','2017-12-22 19:02:23',0,NULL,44),(2,'ME_3535','2017-12-21 19:02:24','2017-12-22 19:02:24',0,NULL,45),(2,'ME_3535','2017-12-21 19:02:24','2017-12-22 19:02:24',0,NULL,46),(2,'ME_3535','2017-12-21 19:02:25','2017-12-22 19:02:25',0,NULL,47),(2,'ME_3535','2017-12-21 19:02:25','2017-12-20 19:02:25',0,NULL,48);

/*Table structure for table `j2ee_master` */

DROP TABLE IF EXISTS `j2ee_master`;

CREATE TABLE `j2ee_master` (
  `sys_id` char(6) NOT NULL,
  `account` varchar(15) NOT NULL,
  `password` varchar(18) NOT NULL,
  `name` varchar(15) NOT NULL,
  `sex` char(1) NOT NULL,
  `entry_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_master` */

insert  into `j2ee_master`(`sys_id`,`account`,`password`,`name`,`sex`,`entry_time`) values ('103616','dd','123','梅恩','男','2017-12-01 16:32:35');

/*Table structure for table `j2ee_reader` */

DROP TABLE IF EXISTS `j2ee_reader`;

CREATE TABLE `j2ee_reader` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id（自增）',
  `account` varchar(15) NOT NULL,
  `password` varchar(18) NOT NULL,
  `head_image` varchar(150) DEFAULT NULL,
  `nickname` varchar(15) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL COMMENT '1男2女3保密',
  `birthday` date DEFAULT NULL,
  `student_id` varchar(15) DEFAULT NULL,
  `borrow_number` tinyint(1) NOT NULL DEFAULT '0',
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(15) NOT NULL COMMENT '用户真实名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_reader` */

insert  into `j2ee_reader`(`id`,`account`,`password`,`head_image`,`nickname`,`sex`,`birthday`,`student_id`,`borrow_number`,`register_time`,`name`) values (1,'meien1','123456',NULL,NULL,NULL,NULL,NULL,0,'2017-12-01 11:33:56','梅恩1'),(2,'meien','123','images/p1.jpg','测试昵称',3,NULL,'123123',8,'2017-12-01 11:46:25','梅恩2'),(3,'test','123',NULL,NULL,NULL,NULL,NULL,0,'2017-12-01 12:20:37','梅恩3'),(4,'2323','123',NULL,'么',2,NULL,'563',1,'2017-12-03 17:16:43','梅恩4'),(5,'test','12',NULL,'meien',3,NULL,'12',0,'2017-12-03 17:17:26','梅恩5'),(6,'meien','23',NULL,'me;lk',1,NULL,'5435',0,'2017-12-03 17:18:03','梅恩6'),(7,'232323','12',NULL,'么',1,NULL,'563',0,'2017-12-03 17:19:10','梅恩7'),(8,'xxc','123',NULL,NULL,3,NULL,'232',0,'2017-12-08 12:03:33','肖西川'),(9,'meien4343','123123',NULL,NULL,3,NULL,'2353',0,'2017-12-21 19:00:22','test');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
