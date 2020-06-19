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

/*Table structure for table `j2ee_amerce` */

DROP TABLE IF EXISTS `j2ee_amerce`;

CREATE TABLE `j2ee_amerce` (
  `amerce_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借阅id（自增）',
  `student_id` varchar(12) NOT NULL COMMENT '借阅证号（读者id）',
  `name` varchar(30) NOT NULL COMMENT '读者姓名',
  `book_name` varchar(30) NOT NULL COMMENT '书名',
  `book_Num` varchar(255) NOT NULL COMMENT '书籍编号',
  `money` double NOT NULL COMMENT '罚款金额',
  `is_pay` int(1) NOT NULL COMMENT '是否支付',
  `pay_time` date DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`amerce_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_amerce` */

insert  into `j2ee_amerce`(`amerce_id`,`student_id`,`name`,`book_name`,`book_Num`,`money`,`is_pay`,`pay_time`) values (4,'2','梅恩2','计算机网络','TQ_2323',30,1,'2020-06-02'),(5,'2','梅恩2','计算机组成原理','ME_3535',34.08,0,NULL),(6,'2','梅恩2','大学物理','ME_5353',34.08,0,NULL),(8,'adw123','王菲菲','啥也不是','jsj-13',20,1,'2020-06-19');

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
  `register_time` date NOT NULL COMMENT '登记日期',
  `is_borrow` int(4) NOT NULL COMMENT '是否可借（大于0可借）',
  `borrow_times` int(9) NOT NULL DEFAULT '0' COMMENT '借出次数',
  `book_Num` varchar(20) DEFAULT NULL COMMENT '书籍编号',
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_books` */

insert  into `j2ee_books`(`book_id`,`book_name`,`book_type`,`author`,`press`,`publish_date`,`price`,`register_time`,`is_borrow`,`borrow_times`,`book_Num`) values ('fd318e81-e942-4e3a-b647-a7ab9ebd47ad','程序员的头发保养',1,'华仔','成理工程出版社','0020-06-01',13,'2020-06-18',0,0,'rw-003'),('jsj-001','啥也不是，啥也不行',0,'佚名','成理工程出版社','0020-06-01',12,'2020-06-17',20,56,'jsj-007'),('jsj-454','故事会',2,'华仔','成理工程出版社','0020-05-01',10,'2020-06-10',0,23,'jsj-009'),('sh-666','唐老鸭与他的富婆们',2,'唐老鸭','成理工程','2020-06-03',666,'2020-06-17',0,222,'jsj-003'),('TQ_2323','计算机网络',1,'唐老鸭','成理工程出版社','2017-12-07',44.22,'2017-12-07',6,45,'jsj-006');

/*Table structure for table `j2ee_borrow` */

DROP TABLE IF EXISTS `j2ee_borrow`;

CREATE TABLE `j2ee_borrow` (
  `student_id` varchar(255) NOT NULL,
  `book_Num` char(30) NOT NULL,
  `borrow_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `should_r_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_return` tinyint(1) NOT NULL DEFAULT '0',
  `return_time` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`,`student_id`,`book_Num`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_borrow` */

insert  into `j2ee_borrow`(`student_id`,`book_Num`,`borrow_time`,`should_r_time`,`is_return`,`return_time`,`id`) values ('2','TX_1435','2017-12-03 16:24:57','2017-12-11 18:49:29',1,'2017-12-03 20:52:06',1),('2','TX_1435','2017-12-03 16:25:02','2017-12-11 18:49:29',1,'2017-12-03 20:52:27',2),('2','TX_1435','2017-12-03 17:10:42','2017-12-11 18:49:29',1,'2017-12-03 20:54:54',3),('2','TX_1435','2017-12-03 20:55:18','2017-12-11 18:49:29',1,'2017-12-03 21:06:32',4),('2','TX_1435','2017-12-03 20:55:19','2017-12-11 18:49:29',1,'2017-12-03 21:06:40',5),('2','TX_1435','2017-12-03 20:57:51','2017-12-11 18:49:29',1,'2017-12-03 21:06:41',6),('2','TX_1435','2017-12-03 20:59:59','2017-12-11 18:49:29',1,'2017-12-03 21:06:43',7),('2','TX_1435','2017-12-03 21:06:09','2017-12-11 18:49:29',1,'2017-12-03 21:06:44',8),('2','TX_1435','2017-12-03 21:11:09','2017-12-11 18:49:29',1,'2017-12-03 21:11:20',9),('2','TX_1435','2017-12-03 21:11:10','2017-12-11 18:49:29',1,'2017-12-03 21:11:29',10),('2','TX_1435','2017-12-03 21:11:25','2017-12-11 18:49:29',1,'2017-12-03 21:11:32',11),('2','TX_1435','2017-12-03 21:18:37','2017-12-11 18:49:29',1,'2017-12-03 21:18:52',12),('2','TX_1435','2017-12-03 21:18:38','2017-12-11 18:49:29',1,'2017-12-03 22:09:42',13),('2','TX_1435','2017-12-03 22:09:31','2017-12-11 18:49:29',1,'2017-12-03 22:09:45',14),('2','TX_1435','2017-12-03 22:09:47','2017-12-11 18:49:29',1,'2017-12-08 10:50:24',15),('2','ME_3535','2017-12-08 10:55:25','2017-12-11 18:49:29',1,'2017-12-08 14:17:32',17),('2','ME_5353','2017-12-08 14:13:52','2017-12-11 18:49:29',1,'2017-12-08 14:17:41',18),('2','TQ_2323','2017-12-08 14:14:02','2017-12-11 18:49:29',1,'2017-12-08 14:14:17',19),('2','TQ_2323','2017-12-08 14:14:06','2017-12-11 18:49:29',1,'2017-12-08 14:16:54',20),('2','ME_3535','2017-12-08 14:23:18','2017-12-11 18:49:29',1,'2017-12-08 14:23:22',21),('2','ME_3535','2017-12-08 14:36:17','2017-12-11 18:49:29',1,'2017-12-08 14:36:29',22),('2','TQ_2323','2017-12-08 14:36:47','2017-12-11 18:49:29',1,'2017-12-08 14:36:56',23),('2','ME_3535','2017-12-08 14:37:19','2017-12-11 18:49:29',1,'2017-12-08 14:37:48',24),('2','ME_3535','2017-12-08 14:41:21','2017-12-11 18:49:29',1,'2017-12-08 14:56:20',25),('4','ME_3535','2017-12-08 18:22:30','2017-12-11 18:49:29',1,'2017-12-08 18:29:23',26),('4','ME_3535','2017-12-08 18:22:54','2017-12-11 18:49:29',1,'2017-12-08 18:29:27',27),('4','ME_3535','2017-12-08 18:22:55','2017-12-11 18:49:29',1,'2017-12-08 18:29:29',28),('4','ME_3535','2017-12-08 18:22:56','2017-12-11 18:49:29',1,'2017-12-08 18:29:38',29),('4','ME_3535','2017-12-08 18:22:57','2017-12-11 18:49:29',1,'2017-12-08 18:30:00',30),('4','ME_3535','2017-12-08 18:22:57','2017-12-11 18:49:29',1,'2017-12-08 18:30:02',31),('4','TQ_2323','2017-12-08 18:30:20','2017-12-11 18:49:29',0,NULL,32),('2','ME_3535','2017-12-08 18:49:29','2017-12-12 18:49:29',1,'2017-12-08 18:53:26',33),('2','ME_5353','2017-12-08 18:49:30','2017-12-13 18:49:29',1,'2017-12-14 20:27:53',34),('2','TQ_2323','2017-12-08 18:49:31','2017-12-12 18:49:29',1,'2017-12-13 14:15:52',35),('2','ME_5353','2017-12-13 14:15:27','2017-12-16 14:15:27',1,'2017-12-14 20:27:56',36),('2','TQ_2323','2017-12-13 14:15:28','2017-12-16 14:15:28',1,'2017-12-21 18:59:18',37),('2','ME_3535','2017-12-14 20:27:35','2017-12-15 20:27:35',1,'2017-12-21 19:02:58',38),('2','ME_5353','2017-12-14 20:27:36','2017-12-15 20:27:36',1,'2017-12-21 19:03:03',39),('2','TQ_2323','2017-12-14 20:27:37','2017-12-15 20:27:37',0,NULL,40),('2','ME_2123','2017-12-14 20:29:41','2017-12-15 20:29:41',1,'2017-12-14 20:29:46',41),('2','ME_5353','2017-12-21 18:59:04','2017-12-22 18:59:04',0,NULL,42),('2','ME_3535','2017-12-21 19:02:23','2017-12-22 19:02:23',0,NULL,43),('2','ME_3535','2017-12-21 19:02:23','2017-12-22 19:02:23',0,NULL,44),('2','ME_3535','2017-12-21 19:02:24','2017-12-22 19:02:24',0,NULL,45),('2','ME_3535','2017-12-21 19:02:24','2017-12-22 19:02:24',0,NULL,46),('2','ME_3535','2017-12-21 19:02:25','2017-12-22 19:02:25',0,NULL,47),('2','ME_3535','2017-12-21 19:02:25','2017-12-20 19:02:25',0,NULL,48);

/*Table structure for table `j2ee_manager_role` */

DROP TABLE IF EXISTS `j2ee_manager_role`;

CREATE TABLE `j2ee_manager_role` (
  `m_id` varchar(255) NOT NULL,
  `r_id` varchar(255) NOT NULL,
  PRIMARY KEY (`m_id`,`r_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `j2ee_manager_role_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `j2ee_managers` (`id`),
  CONSTRAINT `j2ee_manager_role_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `j2ee_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_manager_role` */

insert  into `j2ee_manager_role`(`m_id`,`r_id`) values ('0722ab62-5c26-4c8b-89c5-64341f0c3e1f','2'),('08203daf-fe8c-4619-92d6-765c3095ac74','2'),('4820bca7-e99a-4e7d-9581-e561b92cb0cc','2');

/*Table structure for table `j2ee_managers` */

DROP TABLE IF EXISTS `j2ee_managers`;

CREATE TABLE `j2ee_managers` (
  `id` varchar(255) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `phoneNumber` varchar(11) NOT NULL,
  `sex` int(1) NOT NULL,
  `reg_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_managers` */

insert  into `j2ee_managers`(`id`,`username`,`password`,`phoneNumber`,`sex`,`reg_time`) values ('0722ab62-5c26-4c8b-89c5-64341f0c3e1f','dd','dd','12312341234',0,'2020-06-18'),('08203daf-fe8c-4619-92d6-765c3095ac74','admin','123','12312341234',0,'2020-06-18'),('4820bca7-e99a-4e7d-9581-e561b92cb0cc','tt','tt','12312341234',1,'2020-06-18');

/*Table structure for table `j2ee_master` */

DROP TABLE IF EXISTS `j2ee_master`;

CREATE TABLE `j2ee_master` (
  `sys_id` varchar(255) NOT NULL COMMENT 'UUID',
  `username` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `truename` varchar(15) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `reg_time` date NOT NULL COMMENT '注册时间',
  `phoneNumber` varchar(11) NOT NULL,
  PRIMARY KEY (`sys_id`),
  UNIQUE KEY `id` (`sys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_master` */

insert  into `j2ee_master`(`sys_id`,`username`,`password`,`truename`,`sex`,`reg_time`,`phoneNumber`) values ('103616','admin','admin','admin','男','2017-12-01','12233332222');

/*Table structure for table `j2ee_master_role` */

DROP TABLE IF EXISTS `j2ee_master_role`;

CREATE TABLE `j2ee_master_role` (
  `m_id` varchar(255) NOT NULL,
  `r_id` varchar(255) NOT NULL,
  PRIMARY KEY (`m_id`,`r_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `j2ee_master_role_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `j2ee_role` (`id`),
  CONSTRAINT `j2ee_master_role_ibfk_3` FOREIGN KEY (`m_id`) REFERENCES `j2ee_master` (`sys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_master_role` */

insert  into `j2ee_master_role`(`m_id`,`r_id`) values ('103616','1');

/*Table structure for table `j2ee_messages` */

DROP TABLE IF EXISTS `j2ee_messages`;

CREATE TABLE `j2ee_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(30) NOT NULL,
  `student_name` varchar(30) NOT NULL,
  `message` varchar(255) NOT NULL,
  `is_del` int(1) NOT NULL,
  `time` date NOT NULL,
  `phoneNumber` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_messages` */

insert  into `j2ee_messages`(`id`,`student_id`,`student_name`,`message`,`is_del`,`time`,`phoneNumber`) values (3,'444','dd','              我最帅      ',1,'2020-06-19','12312341234'),(5,'adw123','dd','                    22222222222222',0,'2020-06-19','12312341234');

/*Table structure for table `j2ee_readers` */

DROP TABLE IF EXISTS `j2ee_readers`;

CREATE TABLE `j2ee_readers` (
  `id` varchar(255) NOT NULL COMMENT '用户id（自增）',
  `username` varchar(15) NOT NULL,
  `password` varchar(18) NOT NULL,
  `nickname` varchar(15) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `phoneNum` varchar(11) NOT NULL,
  `reg_time` date NOT NULL,
  `trueName` varchar(15) NOT NULL COMMENT '用户真实名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_readers` */

insert  into `j2ee_readers`(`id`,`username`,`password`,`nickname`,`sex`,`student_id`,`phoneNum`,`reg_time`,`trueName`) values ('9bf3c68b-0825-419d-bf22-5e87d2b8fb95','dd','dd','qd',0,'444','123','2020-06-18','dd');

/*Table structure for table `j2ee_role` */

DROP TABLE IF EXISTS `j2ee_role`;

CREATE TABLE `j2ee_role` (
  `id` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `j2ee_role` */

insert  into `j2ee_role`(`id`,`role`) values ('1','S_ADMIN'),('2','ADMIN');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
