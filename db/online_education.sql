/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.18-log : Database - online_education
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`online_education` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `online_education`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 用户信息',6,'add_userprofile'),(17,'Can change 用户信息',6,'change_userprofile'),(18,'Can delete 用户信息',6,'delete_userprofile'),(19,'Can add 轮播图',7,'add_banner'),(20,'Can change 轮播图',7,'change_banner'),(21,'Can delete 轮播图',7,'delete_banner'),(22,'Can add 邮箱验证码',8,'add_emailverifyrecord'),(23,'Can change 邮箱验证码',8,'change_emailverifyrecord'),(24,'Can delete 邮箱验证码',8,'delete_emailverifyrecord'),(25,'Can view log entry',1,'view_logentry'),(26,'Can view group',3,'view_group'),(27,'Can view permission',2,'view_permission'),(28,'Can view content type',4,'view_contenttype'),(29,'Can view session',5,'view_session'),(30,'Can view 轮播图',7,'view_banner'),(31,'Can view 邮箱验证码',8,'view_emailverifyrecord'),(32,'Can view 用户信息',6,'view_userprofile'),(33,'Can add Bookmark',9,'add_bookmark'),(34,'Can change Bookmark',9,'change_bookmark'),(35,'Can delete Bookmark',9,'delete_bookmark'),(36,'Can add User Setting',10,'add_usersettings'),(37,'Can change User Setting',10,'change_usersettings'),(38,'Can delete User Setting',10,'delete_usersettings'),(39,'Can add User Widget',11,'add_userwidget'),(40,'Can change User Widget',11,'change_userwidget'),(41,'Can delete User Widget',11,'delete_userwidget'),(42,'Can add log entry',12,'add_log'),(43,'Can change log entry',12,'change_log'),(44,'Can delete log entry',12,'delete_log'),(45,'Can view Bookmark',9,'view_bookmark'),(46,'Can view log entry',12,'view_log'),(47,'Can view User Setting',10,'view_usersettings'),(48,'Can view User Widget',11,'view_userwidget'),(49,'Can add revision',13,'add_revision'),(50,'Can change revision',13,'change_revision'),(51,'Can delete revision',13,'delete_revision'),(52,'Can add version',14,'add_version'),(53,'Can change version',14,'change_version'),(54,'Can delete version',14,'delete_version'),(55,'Can view revision',13,'view_revision'),(56,'Can view version',14,'view_version'),(57,'Can add 课程',15,'add_course'),(58,'Can change 课程',15,'change_course'),(59,'Can delete 课程',15,'delete_course'),(60,'Can add 章节',16,'add_lesson'),(61,'Can change 章节',16,'change_lesson'),(62,'Can delete 章节',16,'delete_lesson'),(63,'Can add 视频',17,'add_video'),(64,'Can change 视频',17,'change_video'),(65,'Can delete 视频',17,'delete_video'),(66,'Can add 课程资源',18,'add_courseresource'),(67,'Can change 课程资源',18,'change_courseresource'),(68,'Can delete 课程资源',18,'delete_courseresource'),(69,'Can view 课程',15,'view_course'),(70,'Can view 课程资源',18,'view_courseresource'),(71,'Can view 章节',16,'view_lesson'),(72,'Can view 视频',17,'view_video'),(73,'Can add 城市',19,'add_citydict'),(74,'Can change 城市',19,'change_citydict'),(75,'Can delete 城市',19,'delete_citydict'),(76,'Can add 课程机构',20,'add_courseorg'),(77,'Can change 课程机构',20,'change_courseorg'),(78,'Can delete 课程机构',20,'delete_courseorg'),(79,'Can add 教师',21,'add_teacher'),(80,'Can change 教师',21,'change_teacher'),(81,'Can delete 教师',21,'delete_teacher'),(82,'Can view 城市',19,'view_citydict'),(83,'Can view 课程机构',20,'view_courseorg'),(84,'Can view 教师',21,'view_teacher'),(85,'Can add 用户咨询',22,'add_userask'),(86,'Can change 用户咨询',22,'change_userask'),(87,'Can delete 用户咨询',22,'delete_userask'),(88,'Can add 课程评论',23,'add_coursecomments'),(89,'Can change 课程评论',23,'change_coursecomments'),(90,'Can delete 课程评论',23,'delete_coursecomments'),(91,'Can add 用户收藏',24,'add_userfavorite'),(92,'Can change 用户收藏',24,'change_userfavorite'),(93,'Can delete 用户收藏',24,'delete_userfavorite'),(94,'Can add 用户消息',25,'add_usermessage'),(95,'Can change 用户消息',25,'change_usermessage'),(96,'Can delete 用户消息',25,'delete_usermessage'),(97,'Can add 用户课程',26,'add_usercourse'),(98,'Can change 用户课程',26,'change_usercourse'),(99,'Can delete 用户课程',26,'delete_usercourse'),(100,'Can view 课程评论',23,'view_coursecomments'),(101,'Can view 用户咨询',22,'view_userask'),(102,'Can view 用户课程',26,'view_usercourse'),(103,'Can view 用户收藏',24,'view_userfavorite'),(104,'Can view 用户消息',25,'view_usermessage'),(105,'Can add captcha store',27,'add_captchastore'),(106,'Can change captcha store',27,'change_captchastore'),(107,'Can delete captcha store',27,'delete_captchastore'),(108,'Can view captcha store',27,'view_captchastore');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_user` */

/*Table structure for table `captcha_captchastore` */

DROP TABLE IF EXISTS `captcha_captchastore`;

CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `response` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `hashkey` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `captcha_captchastore` */

/*Table structure for table `courses_course` */

DROP TABLE IF EXISTS `courses_course`;

CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `describe` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `degree` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `learn_time` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `courses_course` */

insert  into `courses_course`(`id`,`name`,`describe`,`detail`,`degree`,`learn_time`,`students`,`fav_nums`,`image`,`click_nums`,`category`,`add_time`,`course_org_id`) values (1,'初识小说','了解什么是小说，小说要怎么入门','了解什么是小说，小说要怎么入门','cj',60,5,0,'courses/2018/03/baishifuxiezuo.jpg',0,'文字创作','2018-03-04 22:25:00.000000',1),(2,'小说架构','了解小说整体架构','了解小说整体架构','zj',60,2,0,'courses/2018/03/gaoshengqichezhuanxiu.jpg',0,'文字创作','2018-03-04 22:29:00.000000',1);

/*Table structure for table `courses_courseresource` */

DROP TABLE IF EXISTS `courses_courseresource`;

CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `download` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `courses_courseresource` */

/*Table structure for table `courses_lesson` */

DROP TABLE IF EXISTS `courses_lesson`;

CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `courses_lesson` */

insert  into `courses_lesson`(`id`,`name`,`add_time`,`course_id`) values (1,'第一章、什么是小说','2018-03-05 00:19:00.000000',1);

/*Table structure for table `courses_video` */

DROP TABLE IF EXISTS `courses_video`;

CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `courses_video` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(27,'captcha','captchastore'),(4,'contenttypes','contenttype'),(15,'courses','course'),(18,'courses','courseresource'),(16,'courses','lesson'),(17,'courses','video'),(23,'operation','coursecomments'),(22,'operation','userask'),(26,'operation','usercourse'),(24,'operation','userfavorite'),(25,'operation','usermessage'),(19,'organization','citydict'),(20,'organization','courseorg'),(21,'organization','teacher'),(13,'reversion','revision'),(14,'reversion','version'),(5,'sessions','session'),(7,'users','banner'),(8,'users','emailverifyrecord'),(6,'users','userprofile'),(9,'xadmin','bookmark'),(12,'xadmin','log'),(10,'xadmin','usersettings'),(11,'xadmin','userwidget');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2018-03-04 21:56:48.889017'),(2,'contenttypes','0002_remove_content_type_name','2018-03-04 21:56:49.014032'),(3,'auth','0001_initial','2018-03-04 21:56:49.420530'),(4,'auth','0002_alter_permission_name_max_length','2018-03-04 21:56:49.498663'),(5,'auth','0003_alter_user_email_max_length','2018-03-04 21:56:49.498663'),(6,'auth','0004_alter_user_username_opts','2018-03-04 21:56:49.498663'),(7,'auth','0005_alter_user_last_login_null','2018-03-04 21:56:49.514290'),(8,'auth','0006_require_contenttypes_0002','2018-03-04 21:56:49.514290'),(9,'auth','0007_alter_validators_add_error_messages','2018-03-04 21:56:49.514290'),(10,'auth','0008_alter_user_username_max_length','2018-03-04 21:56:49.529916'),(11,'auth','0009_alter_user_last_name_max_length','2018-03-04 21:56:49.529916'),(12,'users','0001_initial','2018-03-04 21:56:50.103767'),(13,'admin','0001_initial','2018-03-04 21:56:50.306721'),(14,'admin','0002_logentry_remove_auto_add','2018-03-04 21:56:50.306721'),(15,'sessions','0001_initial','2018-03-04 21:56:50.404739'),(16,'captcha','0001_initial','2018-03-04 21:58:28.452203'),(17,'reversion','0001_initial','2018-03-04 21:58:28.827250'),(18,'reversion','0002_auto_20141216_1509','2018-03-04 21:58:28.842870'),(19,'reversion','0003_auto_20160601_1600','2018-03-04 21:58:28.842870'),(20,'reversion','0004_auto_20160611_1202','2018-03-04 21:58:28.842870'),(21,'reversion','0001_squashed_0004_auto_20160611_1202','2018-03-04 21:58:28.858497'),(22,'organization','0001_initial','2018-03-04 22:01:41.467335'),(23,'courses','0001_initial','2018-03-04 22:01:41.948522'),(24,'operation','0001_initial','2018-03-04 22:01:42.576793'),(25,'xadmin','0001_initial','2018-03-04 22:01:44.562431');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('vyev9yywi1aujf5uz7dsctrbx4a9em16','NjRjYWIxZTdmMmI2ZjQ5NzRlZTEzYWNjNGRmN2FmNzlkNmZlZWI4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc0ZjE0M2E4ZTYyYjk3NDIzOTAzNTEyZWJmZTNhNjJlNDAzMTBlMDMiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwibGVzc29uIl0sIiJdfQ==','2018-03-19 00:27:12.948234');

/*Table structure for table `operation_coursecomments` */

DROP TABLE IF EXISTS `operation_coursecomments`;

CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `operation_coursecomments` */

/*Table structure for table `operation_userask` */

DROP TABLE IF EXISTS `operation_userask`;

CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `course_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `operation_userask` */

/*Table structure for table `operation_usercourse` */

DROP TABLE IF EXISTS `operation_usercourse`;

CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `operation_usercourse` */

/*Table structure for table `operation_userfavorite` */

DROP TABLE IF EXISTS `operation_userfavorite`;

CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `operation_userfavorite` */

/*Table structure for table `operation_usermessage` */

DROP TABLE IF EXISTS `operation_usermessage`;

CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `operation_usermessage` */

/*Table structure for table `organization_citydict` */

DROP TABLE IF EXISTS `organization_citydict`;

CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `describe` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `organization_citydict` */

insert  into `organization_citydict`(`id`,`name`,`describe`,`add_time`) values (1,'西安市','中国古都','2018-03-04 22:12:00.000000'),(2,'延安市','革命老区','2018-03-04 22:12:00.000000'),(3,'北京市','中国帝都','2018-03-04 22:13:00.000000');

/*Table structure for table `organization_courseorg` */

DROP TABLE IF EXISTS `organization_courseorg`;

CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `describe` longtext COLLATE utf8_unicode_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `students` int(11) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `organization_courseorg` */

insert  into `organization_courseorg`(`id`,`name`,`describe`,`click_nums`,`fav_nums`,`image`,`address`,`category`,`students`,`course_nums`,`add_time`,`city_id`) values (1,'白师傅小说课堂','老白“师傅”专业的小说写作教学',0,0,'org/2018/03/baishifuxiezuo.jpg','延安市宝塔区','personal',5,5,'2018-03-04 22:13:00.000000',2),(2,'高升汽车专修学院','专业的汽修摇篮',0,0,'org/2018/03/gaoshengqichezhuanxiu.jpg','西安市未央区','colleges',100,50,'2018-03-04 22:14:00.000000',1),(3,'高杨职业技术学院','各色各样的职业技术等你来学',0,0,'org/2018/03/f2deb48f8c5494ee8d482fae2ff5e0fe99257e1a.gif','延安市宝塔区','colleges',100,60,'2018-03-04 22:17:00.000000',2);

/*Table structure for table `organization_teacher` */

DROP TABLE IF EXISTS `organization_teacher`;

CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `work_position` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `points` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `organization_teacher` */

insert  into `organization_teacher`(`id`,`name`,`work_years`,`work_company`,`work_position`,`points`,`click_nums`,`fav_nums`,`image`,`add_time`,`org_id`) values (1,'白师傅',4,'金天国际','传销头目','精神控制',0,0,'teacher/2018/03/u25980245702118333203fm27gp0.jpg','2018-03-04 22:18:00.000000',1),(2,'高太尉',3,'高升汽修学院','校长','能文能武',0,0,'teacher/2018/03/u411746764288387648fm27gp0.jpg','2018-03-04 22:20:00.000000',2),(3,'老痰杨',10,'高杨电影制片厂','导演','极其猥琐',0,0,'teacher/2018/03/f2deb48f8c5494ee8d482fae2ff5e0fe99257e1a.gif','2018-03-04 22:22:00.000000',3);

/*Table structure for table `reversion_revision` */

DROP TABLE IF EXISTS `reversion_revision`;

CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_users_userprofile_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `reversion_revision` */

/*Table structure for table `reversion_version` */

DROP TABLE IF EXISTS `reversion_version`;

CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serialized_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `object_repr` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_content_type_id_objec_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_version_content_type_id_7d0ff25c_fk_django_co` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `reversion_version` */

/*Table structure for table `users_banner` */

DROP TABLE IF EXISTS `users_banner`;

CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users_banner` */

/*Table structure for table `users_emailverifyrecord` */

DROP TABLE IF EXISTS `users_emailverifyrecord`;

CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `send_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users_emailverifyrecord` */

/*Table structure for table `users_userprofile` */

DROP TABLE IF EXISTS `users_userprofile`;

CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nickname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users_userprofile` */

insert  into `users_userprofile`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`,`nickname`,`birthday`,`gender`,`address`,`mobile`,`image`) values (1,'pbkdf2_sha256$100000$M6LFDzFBnJfm$FQ+1LECDw/MDdY+RJR8fy4KMX5oEoorrIkywbA/5l28=','2018-03-04 22:03:20.727672',1,'root','','','undeadfrost@live.com',1,1,'2018-03-04 22:03:13.435841','',NULL,'male','',NULL,'image/default.png');

/*Table structure for table `users_userprofile_groups` */

DROP TABLE IF EXISTS `users_userprofile_groups`;

CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users_userprofile_groups` */

/*Table structure for table `users_userprofile_user_permissions` */

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;

CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users_userprofile_user_permissions` */

/*Table structure for table `xadmin_bookmark` */

DROP TABLE IF EXISTS `xadmin_bookmark`;

CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `url_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `query` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `xadmin_bookmark` */

/*Table structure for table `xadmin_log` */

DROP TABLE IF EXISTS `xadmin_log`;

CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `xadmin_log` */

insert  into `xadmin_log`(`id`,`action_time`,`ip_addr`,`object_id`,`object_repr`,`action_flag`,`message`,`content_type_id`,`user_id`) values (1,'2018-03-04 22:12:48.296452','127.0.0.1','1','西安市','create','已添加。',19,1),(2,'2018-03-04 22:12:59.378817','127.0.0.1','2','延安市','create','已添加。',19,1),(3,'2018-03-04 22:13:09.634258','127.0.0.1','3','北京市','create','已添加。',19,1),(4,'2018-03-04 22:14:41.263012','127.0.0.1','1','白师傅小说课堂','create','已添加。',20,1),(5,'2018-03-04 22:15:25.493997','127.0.0.1','2','高升汽车专修学院','create','已添加。',20,1),(6,'2018-03-04 22:18:11.611790','127.0.0.1','3','高杨职业技术学院','create','已添加。',20,1),(7,'2018-03-04 22:20:08.400262','127.0.0.1','1','[白师傅小说课堂]的教师: 白师傅','create','已添加。',21,1),(8,'2018-03-04 22:22:43.519065','127.0.0.1','2','[高升汽车专修学院]的教师: 高太尉','create','已添加。',21,1),(9,'2018-03-04 22:23:24.380951','127.0.0.1','3','[高杨职业技术学院]的教师: 老痰杨','create','已添加。',21,1),(10,'2018-03-04 22:27:34.451161','127.0.0.1','1','初识小说','create','已添加。',15,1),(11,'2018-03-04 22:29:35.199870','127.0.0.1','2','小说架构','create','已添加。',15,1),(12,'2018-03-05 00:20:24.659294','127.0.0.1','1','《初识小说》课程的章节 >> 第一章、什么是小说','create','已添加。',16,1);

/*Table structure for table `xadmin_usersettings` */

DROP TABLE IF EXISTS `xadmin_usersettings`;

CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `xadmin_usersettings` */

insert  into `xadmin_usersettings`(`id`,`key`,`value`,`user_id`) values (1,'dashboard:home:pos','',1);

/*Table structure for table `xadmin_userwidget` */

DROP TABLE IF EXISTS `xadmin_userwidget`;

CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `widget_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `xadmin_userwidget` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
