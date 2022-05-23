/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.18-log : Database - pay
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pay` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pay`;

/*Table structure for table `tb_leibie` */

DROP TABLE IF EXISTS `tb_leibie`;

CREATE TABLE `tb_leibie` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '类别名称',
  `createperson` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tb_leibie` */

insert  into `tb_leibie`(`id`,`name`,`createperson`,`createtime`) values (1,'开发部',NULL,NULL),(2,'市场部',NULL,NULL),(3,'销售部',NULL,NULL),(4,'测试部',NULL,NULL);

/*Table structure for table `tb_pay` */

DROP TABLE IF EXISTS `tb_pay`;

CREATE TABLE `tb_pay` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `dep` varchar(100) DEFAULT NULL COMMENT '部门',
  `basepay` varchar(100) DEFAULT NULL COMMENT '基本工资',
  `jixiaopay` varchar(100) DEFAULT NULL COMMENT '绩效工资',
  `fourx` varchar(100) DEFAULT NULL COMMENT '四险 基本的20%',
  `zhufang` varchar(100) DEFAULT NULL COMMENT '住房公积金 基本的8%',
  `traffic` varchar(100) DEFAULT NULL COMMENT '交通费',
  `communi` varchar(100) DEFAULT NULL COMMENT '通讯费',
  `mealallow` varchar(100) DEFAULT NULL COMMENT '就餐补助',
  `attendsub` varchar(100) DEFAULT NULL COMMENT '考勤扣除额',
  `otmoney` varchar(100) DEFAULT NULL COMMENT '加班金额',
  `award` varchar(100) DEFAULT NULL COMMENT '奖金',
  `shouldgive` varchar(100) DEFAULT NULL COMMENT '应发工资',
  `tax` varchar(100) DEFAULT NULL COMMENT '个人所得税',
  `reallygive` varchar(100) DEFAULT NULL COMMENT '实发工资',
  `createperson` varchar(150) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tb_pay` */

insert  into `tb_pay`(`id`,`name`,`dep`,`basepay`,`jixiaopay`,`fourx`,`zhufang`,`traffic`,`communi`,`mealallow`,`attendsub`,`otmoney`,`award`,`shouldgive`,`tax`,`reallygive`,`createperson`,`createtime`) values (2,'555','555','100','0','20.00','8.00','0','0','0','20','0','0','72.00','2.16','69.84','admin','2015-04-02 13:32:49'),(3,'555','555','100','0','20.00','8.00','0','0','0','25','0','0','72.00','2.16','70.84','admin','2015-04-02 13:32:49'),(4,'999','qweq999','7000','11','1400.00','560.00','500','500','500','30','600','900','8051.00','1055.20','6995.80','admin','2015-04-02 16:21:43'),(5,'李小小','营销部门','9800','0','1960.00','784.00','0','0','0','55','0','0','7056.00','856.20','6199.80','admin','2015-04-03 13:16:12'),(6,'许雯','市场部门','8900','0.0','1780.00','712.00','12','12','12','0.0','12','12','6468.00','738.60','5729.40','admin','2015-04-04 15:13:03'),(7,'胡志明','市场部门','9500','460','1900.00','760.00','86','200','150','0.0','300','500','8536.00','1152.20','7383.80','admin','2015-04-04 15:52:44'),(8,'嘻嘻','xx部分','7000','500','1400.00','560.00','100','10','500','0.0','200','1000','7350.00','915.00','6435.00','admin','2018-11-18 21:29:00');

/*Table structure for table `tb_reward` */

DROP TABLE IF EXISTS `tb_reward`;

CREATE TABLE `tb_reward` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `dep` varchar(100) DEFAULT NULL COMMENT '部门',
  `type` varchar(10) DEFAULT NULL COMMENT '奖惩类型（请假，加班）',
  `leavetype` varchar(10) DEFAULT NULL COMMENT '请假类型',
  `leaveday` varchar(100) DEFAULT NULL COMMENT '请假天数',
  `otday` varchar(100) DEFAULT NULL COMMENT '加班天数',
  `money` varchar(100) DEFAULT NULL COMMENT '金额（病假减去，加班加上）',
  `createperson` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `tb_reward` */

insert  into `tb_reward`(`id`,`name`,`dep`,`type`,`leavetype`,`leaveday`,`otday`,`money`,`createperson`,`createtime`) values (1,'555','555','1','1','2','0','2','admin','2015-04-03 13:05:01'),(3,'999','qweq999','2','-1','0','5','5','admin','2015-04-03 13:05:41'),(4,'李小小','营销部门','2','1','5','1','1336.36','admin','2015-04-03 13:32:33'),(5,'李小小','营销部门','1','1','3','0','11760.00','admin','2015-04-03 14:03:40'),(6,'999','qweq999','2','-1','0','9','8590.91','admin','2015-04-03 14:18:07'),(7,'李小小','营销部门','1','1','2','0','356.36','admin','2015-04-04 10:29:19'),(8,'胡志明','市场部门','1','2','3','0','1295.45','admin','2015-04-04 15:54:20'),(9,'胡志明','市场部门','1','1','2','0','345.45','admin','2015-04-04 15:54:32'),(10,'胡志明','市场部门','2','-1','0','1','1295.45','admin','2015-04-04 15:55:49'),(11,'嘻嘻','xx部分','1','1','2','0','254.55','admin','2018-11-18 21:30:06'),(12,'嘻嘻','xx部分','2','-1','0','2','1909.09','admin','2018-11-18 21:30:19');

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL COMMENT '角色名称',
  `createperson` varchar(80) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tb_role` */

insert  into `tb_role`(`id`,`name`,`createperson`,`createtime`) values (1,'管理员','admin','2015-01-23 00:00:00'),(2,'员工','admin','2015-01-23 00:00:00');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `roleid` int(8) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL COMMENT '用户名',
  `password` varchar(80) DEFAULT NULL,
  `truename` varchar(80) DEFAULT NULL COMMENT '真实名称',
  `phone` varchar(80) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `age` varchar(100) DEFAULT NULL COMMENT '年龄',
  `sex` int(8) DEFAULT NULL COMMENT '性别 1-男 2-女',
  `dep` varchar(100) DEFAULT NULL COMMENT '部门',
  `degree` varchar(200) DEFAULT NULL COMMENT '学历',
  `job` varchar(100) DEFAULT NULL COMMENT '职位',
  `pic` varchar(100) DEFAULT NULL COMMENT '照片',
  `idno` varchar(80) DEFAULT NULL COMMENT '身份证号',
  `mianmao` varchar(80) DEFAULT NULL COMMENT '政治面貌',
  `email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `createperson` varchar(200) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`roleid`,`username`,`password`,`truename`,`phone`,`address`,`age`,`sex`,`dep`,`degree`,`job`,`pic`,`idno`,`mianmao`,`email`,`createperson`,`createtime`) values (1,1,'admin','admin','管理员','13698745213','深圳市南山区世界之窗一路','5',1,'管理员','5','管理员','','656565656565656565','1','56@126.com','admin','2014-02-10 14:42:05'),(3,2,'xuwen','xuwen','许雯','075598788888','深圳市福田区竹子林','18',2,'市场部门','1','销售','','656565656565656565','1','56@126.com','admin','2014-02-10 14:42:05'),(4,2,'huanzhe','huanzhe','换换001','0755-1234545','深圳市罗湖区区委政府','11',1,'信息部','5','销售',NULL,'653985375454565469','1','56@126.com','admin','2014-02-10 23:37:11'),(24,2,'zhangguochao','zhangguochao','张国超','0755-1234545','深圳市罗湖区区委政2','22',2,'人力资源部','5','销售',NULL,'653985375454565466','1','56@126.com','admin','2014-04-14 12:53:53'),(25,2,'zenglongyi','zenglongyi','曾龙驿','0755-1234545','深圳市罗湖区区建委','22',1,'信息部','5','销售',NULL,'653985375454565451','1','56@126.com','admin','2014-04-16 13:19:17'),(26,2,'张三001','zhangsan001','ss','07551234545','深圳市宝安区1号路天桥旁边','12',0,'市场销售','5','销售','','653987875454565451','1','56@126.com','admin','2014-04-16 13:19:59'),(28,2,'huanzhe002','huanzhe002','李小小','0755-1234545','深圳市南山区科技园中区','32',2,'营销部门','5','销售',NULL,'653987875454565452','1','56@126.com','admin','2014-04-16 22:49:22'),(29,2,'yisheng002','yisheng002','ss','13874754555','武汉市武昌区人民南路1号','32',2,'营销部门','2','参军','','6987875555565323553','2','111111@111.com','admin','2014-04-17 13:13:13'),(30,2,'999','999','999','13874754559','武汉市武昌区人民南路1号','32',1,'qweq999','5','销售','','','4','56@126.com','admin','2015-03-31 20:38:06'),(31,2,'555','555','555','13874754557','深圳市南山区科技园中区','22',1,'开发部','1','开发部','uploadimages/1428132410131_1776900261.jpg','63666666666666666','1','66@126.com','admin','2015-04-01 13:08:29'),(32,2,'huzhiming','huzhiming','胡志明','07556566666','深圳市南山区科技园','30',1,'市场部门','5','销售','uploadimages/1428133818088_844047594.jpg','6666666878585858585','1','222@126.com','admin','2015-04-04 15:50:19'),(33,2,'cc','123456','嘻嘻','23213212','xxx地址','32',1,'xx部分','1','22','uploadimages/1542547471282_1836074327.jpg','32432432','1','432@qq.com','admin','2018-11-18 21:24:33');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
