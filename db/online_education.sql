/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50718
Source Host           : localhost:6666
Source Database       : online_education

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-11-06 21:30:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
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

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
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

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 用户信息', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 用户信息', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 用户信息', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 轮播图', '7', 'add_banner');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 轮播图', '7', 'change_banner');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 轮播图', '7', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 邮箱验证码', '8', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 邮箱验证码', '8', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 邮箱验证码', '8', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('25', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('26', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('27', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('28', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('29', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('30', 'Can view 轮播图', '7', 'view_banner');
INSERT INTO `auth_permission` VALUES ('31', 'Can view 邮箱验证码', '8', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 用户信息', '6', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('33', 'Can add Bookmark', '9', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('34', 'Can change Bookmark', '9', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete Bookmark', '9', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('36', 'Can add User Setting', '10', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('37', 'Can change User Setting', '10', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('38', 'Can delete User Setting', '10', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('39', 'Can add User Widget', '11', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('40', 'Can change User Widget', '11', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('41', 'Can delete User Widget', '11', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('42', 'Can add log entry', '12', 'add_log');
INSERT INTO `auth_permission` VALUES ('43', 'Can change log entry', '12', 'change_log');
INSERT INTO `auth_permission` VALUES ('44', 'Can delete log entry', '12', 'delete_log');
INSERT INTO `auth_permission` VALUES ('45', 'Can view Bookmark', '9', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('46', 'Can view log entry', '12', 'view_log');
INSERT INTO `auth_permission` VALUES ('47', 'Can view User Setting', '10', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('48', 'Can view User Widget', '11', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('49', 'Can add revision', '13', 'add_revision');
INSERT INTO `auth_permission` VALUES ('50', 'Can change revision', '13', 'change_revision');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete revision', '13', 'delete_revision');
INSERT INTO `auth_permission` VALUES ('52', 'Can add version', '14', 'add_version');
INSERT INTO `auth_permission` VALUES ('53', 'Can change version', '14', 'change_version');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete version', '14', 'delete_version');
INSERT INTO `auth_permission` VALUES ('55', 'Can view revision', '13', 'view_revision');
INSERT INTO `auth_permission` VALUES ('56', 'Can view version', '14', 'view_version');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 课程', '15', 'add_course');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 课程', '15', 'change_course');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 课程', '15', 'delete_course');
INSERT INTO `auth_permission` VALUES ('60', 'Can add 章节', '16', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('61', 'Can change 章节', '16', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('62', 'Can delete 章节', '16', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('63', 'Can add 视频', '17', 'add_video');
INSERT INTO `auth_permission` VALUES ('64', 'Can change 视频', '17', 'change_video');
INSERT INTO `auth_permission` VALUES ('65', 'Can delete 视频', '17', 'delete_video');
INSERT INTO `auth_permission` VALUES ('66', 'Can add 课程资源', '18', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('67', 'Can change 课程资源', '18', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('68', 'Can delete 课程资源', '18', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('69', 'Can view 课程', '15', 'view_course');
INSERT INTO `auth_permission` VALUES ('70', 'Can view 课程资源', '18', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('71', 'Can view 章节', '16', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 视频', '17', 'view_video');
INSERT INTO `auth_permission` VALUES ('73', 'Can add 城市', '19', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('74', 'Can change 城市', '19', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete 城市', '19', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('76', 'Can add 课程机构', '20', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('77', 'Can change 课程机构', '20', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('78', 'Can delete 课程机构', '20', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('79', 'Can add 教师', '21', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('80', 'Can change 教师', '21', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('81', 'Can delete 教师', '21', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('82', 'Can view 城市', '19', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('83', 'Can view 课程机构', '20', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('84', 'Can view 教师', '21', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('85', 'Can add 用户咨询', '22', 'add_userask');
INSERT INTO `auth_permission` VALUES ('86', 'Can change 用户咨询', '22', 'change_userask');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete 用户咨询', '22', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('88', 'Can add 课程评论', '23', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('89', 'Can change 课程评论', '23', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('90', 'Can delete 课程评论', '23', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('91', 'Can add 用户收藏', '24', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('92', 'Can change 用户收藏', '24', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('93', 'Can delete 用户收藏', '24', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('94', 'Can add 用户消息', '25', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('95', 'Can change 用户消息', '25', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('96', 'Can delete 用户消息', '25', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('97', 'Can add 用户课程', '26', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('98', 'Can change 用户课程', '26', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete 用户课程', '26', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('100', 'Can view 课程评论', '23', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('101', 'Can view 用户咨询', '22', 'view_userask');
INSERT INTO `auth_permission` VALUES ('102', 'Can view 用户课程', '26', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('103', 'Can view 用户收藏', '24', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('104', 'Can view 用户消息', '25', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('105', 'Can add captcha store', '27', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('106', 'Can change captcha store', '27', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('107', 'Can delete captcha store', '27', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('108', 'Can view captcha store', '27', 'view_captchastore');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
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

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `response` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `hashkey` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('1', 'ENBA', 'enba', '609cf64531e9455ba34321375491ee4885938d91', '2018-03-29 10:10:29.999684');
INSERT INTO `captcha_captchastore` VALUES ('2', 'AILL', 'aill', '0b40f93af3a2fe15408b8b05c32ef030e3680f2c', '2018-03-29 10:10:33.714991');
INSERT INTO `captcha_captchastore` VALUES ('3', 'PJZJ', 'pjzj', '17d818091a99d56b7a9648dbebf4127e9f3042c3', '2018-05-22 11:56:29.963996');

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
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
  `tag` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_cell` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `you_need_now` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('1', '初识小说', '了解什么是小说，小说要怎么入门', '<p>&nbsp; &nbsp; 了解什么是小说，小说要怎么入门</p>', 'cj', '60', '5', '1', 'courses/2018/03/baishifuxiezuo.jpg', '61', '文字创作', '2018-03-04 22:25:00.000000', '1', '文字创作', '1', '老师是好人', '好好学习，天天向上', '0');
INSERT INTO `courses_course` VALUES ('2', '小说架构', '了解小说整体架构', '<p>&nbsp; &nbsp; 了解小说整体架构</p>', 'zj', '60', '2', '0', 'courses/2018/03/gaoshengqichezhuanxiu.jpg', '43', '文字创作', '2018-03-04 22:29:00.000000', '1', '文字创作', '1', '老师是好人', '好好学习，天天向上', '0');
INSERT INTO `courses_course` VALUES ('3', '了解汽车种类', '了解汽车种类', '<p>&nbsp; &nbsp; 了解汽车种类</p>', 'cj', '60', '1', '0', 'courses/2018/03/20180305163915_91.png', '15', '汽车维修', '2018-03-05 16:38:00.000000', '2', '汽车维修', '2', '老师是好人', '好好学习，天天向上', '1');
INSERT INTO `courses_course` VALUES ('9', '发布测试', '发布测试', '<p>发布测试</p>', 'cj', '10', '0', '0', 'courses/2018/03/20180318113108_79.jpg', '4', '测试', '2018-03-18 11:30:00.000000', '1', '测试', '4', '老师是好人', '好好学习，天天向上', '1');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES ('1', '小说结构', 'courses/resource/2018/03/20180307215716_91.apk', '2018-03-07 21:48:00.000000', '1');

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
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

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('1', '第一章、什么是小说', '2018-03-05 00:19:00.000000', '1');

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `video_file` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES ('1', '1.1 了解小说', '2018-03-07 15:01:00.000000', '1', 'videos/2018/03/20180307151958_95.mp4', '10');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
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

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('27', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('15', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('18', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('16', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('17', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('23', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('22', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('26', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('24', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('25', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('19', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('20', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('21', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('13', 'reversion', 'revision');
INSERT INTO `django_content_type` VALUES ('14', 'reversion', 'version');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('9', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('12', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('10', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('11', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-03-04 21:56:48.889017');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-03-04 21:56:49.014032');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-03-04 21:56:49.420530');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-03-04 21:56:49.498663');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-03-04 21:56:49.498663');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-03-04 21:56:49.498663');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-03-04 21:56:49.514290');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-03-04 21:56:49.514290');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-03-04 21:56:49.514290');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-03-04 21:56:49.529916');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2018-03-04 21:56:49.529916');
INSERT INTO `django_migrations` VALUES ('12', 'users', '0001_initial', '2018-03-04 21:56:50.103767');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0001_initial', '2018-03-04 21:56:50.306721');
INSERT INTO `django_migrations` VALUES ('14', 'admin', '0002_logentry_remove_auto_add', '2018-03-04 21:56:50.306721');
INSERT INTO `django_migrations` VALUES ('15', 'sessions', '0001_initial', '2018-03-04 21:56:50.404739');
INSERT INTO `django_migrations` VALUES ('16', 'captcha', '0001_initial', '2018-03-04 21:58:28.452203');
INSERT INTO `django_migrations` VALUES ('17', 'reversion', '0001_initial', '2018-03-04 21:58:28.827250');
INSERT INTO `django_migrations` VALUES ('18', 'reversion', '0002_auto_20141216_1509', '2018-03-04 21:58:28.842870');
INSERT INTO `django_migrations` VALUES ('19', 'reversion', '0003_auto_20160601_1600', '2018-03-04 21:58:28.842870');
INSERT INTO `django_migrations` VALUES ('20', 'reversion', '0004_auto_20160611_1202', '2018-03-04 21:58:28.842870');
INSERT INTO `django_migrations` VALUES ('21', 'reversion', '0001_squashed_0004_auto_20160611_1202', '2018-03-04 21:58:28.858497');
INSERT INTO `django_migrations` VALUES ('22', 'organization', '0001_initial', '2018-03-04 22:01:41.467335');
INSERT INTO `django_migrations` VALUES ('23', 'courses', '0001_initial', '2018-03-04 22:01:41.948522');
INSERT INTO `django_migrations` VALUES ('24', 'operation', '0001_initial', '2018-03-04 22:01:42.576793');
INSERT INTO `django_migrations` VALUES ('25', 'xadmin', '0001_initial', '2018-03-04 22:01:44.562431');
INSERT INTO `django_migrations` VALUES ('26', 'courses', '0002_course_tag', '2018-03-05 12:10:50.911720');
INSERT INTO `django_migrations` VALUES ('27', 'courses', '0003_auto_20180305_2338', '2018-03-05 23:39:15.400070');
INSERT INTO `django_migrations` VALUES ('28', 'courses', '0004_video_video_file', '2018-03-07 15:00:34.885759');
INSERT INTO `django_migrations` VALUES ('29', 'courses', '0005_video_learn_times', '2018-03-07 15:22:05.119807');
INSERT INTO `django_migrations` VALUES ('30', 'courses', '0006_auto_20180314_1159', '2018-03-14 11:59:14.590941');
INSERT INTO `django_migrations` VALUES ('31', 'courses', '0007_auto_20180317_1738', '2018-03-17 17:39:47.623302');
INSERT INTO `django_migrations` VALUES ('32', 'organization', '0002_auto_20180317_1738', '2018-03-17 17:39:47.791988');
INSERT INTO `django_migrations` VALUES ('33', 'users', '0002_auto_20180317_1738', '2018-03-17 17:39:47.853791');
INSERT INTO `django_migrations` VALUES ('34', 'organization', '0003_remove_courseorg_course_nums', '2018-03-17 23:05:03.847374');
INSERT INTO `django_migrations` VALUES ('35', 'organization', '0004_courseorg_course_nums', '2018-03-17 23:23:00.925193');
INSERT INTO `django_migrations` VALUES ('36', 'organization', '0005_remove_courseorg_course_nums', '2018-03-18 11:30:14.010218');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0nu82wvde32vsmg46hyxkp7iu56x1grf', 'ZmVkODcyYjA4MjUxZWQzZDVjMTgwNzQ0M2E5NTBjNjE5MzgyMWZhODp7fQ==', '2018-03-23 11:58:41.025536');
INSERT INTO `django_session` VALUES ('0rrjaqc0e1tfphg09dm4pvmr229fz5np', 'N2QzOTU4ZjdlN2QyODNhYzM0ZWRjODNkMWQyZDVmMDgzNTFlNTY5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgiLCJMSVNUX1FVRVJZIjpbWyJ1c2VycyIsInVzZXJwcm9maWxlIl0sIiJdfQ==', '2018-03-27 17:03:46.238123');
INSERT INTO `django_session` VALUES ('1fys1swr398qhsuucatwb77kfvxghwt9', 'Y2U0ZDA4YTJlMjdmMTc5MzlhNmNkNDRjMDNiNTRkNGRiMTAwN2YxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgiLCJMSVNUX1FVRVJZIjpbWyJhdXRoIiwiZ3JvdXAiXSwiIl19', '2018-04-27 17:22:20.810255');
INSERT INTO `django_session` VALUES ('2xpnym7rky0b67ls3dwb2d3fwkxjhtp6', 'OGRmYzRjYjM2ZTZiYjI2ZGI3ODkzZGZkMjJiMmUzOTk5YzQ2NjEzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgiLCJMSVNUX1FVRVJZIjpbWyJvcmdhbml6YXRpb24iLCJ0ZWFjaGVyIl0sIiJdfQ==', '2018-04-01 13:26:31.869760');
INSERT INTO `django_session` VALUES ('4pypt6wwf26u0qodttolq2c4dojcg1hf', 'MjczODJjYjhiZmU4Yzc2ZGVhMGZmZGNmYzI1NmM4NWRiNzY5Mzc2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgifQ==', '2018-03-28 19:51:38.983464');
INSERT INTO `django_session` VALUES ('4q9yg4vz0zgk5xutmwnwf8qgwf3utauk', 'ZTlkODcxMzA5MmNmNzM4NmFlODgwY2VmMjJiN2QxZWRlOTNkZDY1MDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjhjMDBmMWZhMjBkMTdmYTlmYmE3OTE5MTkzNzAzNTBhY2U2MDk3MWUifQ==', '2018-03-23 10:34:41.290945');
INSERT INTO `django_session` VALUES ('51y83n7f59mkd9ekxlwzaxhp07wgj74n', 'ZmVkODcyYjA4MjUxZWQzZDVjMTgwNzQ0M2E5NTBjNjE5MzgyMWZhODp7fQ==', '2018-03-23 12:07:28.419719');
INSERT INTO `django_session` VALUES ('85aymj3bwh7k8xhi45er9etc3w9cwd23', 'NzUxYjU4NmRkNTYyNTFlNmU2Y2I1ZmVkN2JlMGM0NjE4NThhNDYwNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgiLCJMSVNUX1FVRVJZIjpbWyJvcGVyYXRpb24iLCJ1c2VybWVzc2FnZSJdLCIiXX0=', '2018-03-27 23:20:03.065343');
INSERT INTO `django_session` VALUES ('8t7nxuqrf3pey1njm2v4o3570paiw9mv', 'MjczODJjYjhiZmU4Yzc2ZGVhMGZmZGNmYzI1NmM4NWRiNzY5Mzc2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgifQ==', '2018-03-31 17:00:11.702753');
INSERT INTO `django_session` VALUES ('b1ydt8dt470phpn4llf3q8l7arecb339', 'MjczODJjYjhiZmU4Yzc2ZGVhMGZmZGNmYzI1NmM4NWRiNzY5Mzc2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgifQ==', '2018-03-28 16:14:51.514541');
INSERT INTO `django_session` VALUES ('b5lskoy2pskk1rnrk4wa3k8vv8r3kofq', 'OTk0OTg5NGM4YzAwYWJiZjI4NWIzZTgwOWQxMmM4YzM5NmE2NjkzMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc0ZjE0M2E4ZTYyYjk3NDIzOTAzNTEyZWJmZTNhNjJlNDAzMTBlMDMifQ==', '2018-03-23 11:57:08.705140');
INSERT INTO `django_session` VALUES ('c8mrrfl0peyv4pufenykhx5y9840i5wm', 'MjczODJjYjhiZmU4Yzc2ZGVhMGZmZGNmYzI1NmM4NWRiNzY5Mzc2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgifQ==', '2018-03-27 20:44:49.441936');
INSERT INTO `django_session` VALUES ('cnlrj2lvjpwp4qmi8226nujkox8iwzfh', 'ZTE3ZTMyMDczZWMxZGMzOGY2ZTdhNjQxZmZkZGEyNWFkZjdhMTAxOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgiLCJMSVNUX1FVRVJZIjpbWyJvcmdhbml6YXRpb24iLCJjb3Vyc2VvcmciXSwiIl19', '2018-03-28 20:30:57.155988');
INSERT INTO `django_session` VALUES ('duvvr6he3ehtmd8lriszqfu6qa4a5mu1', 'MjczODJjYjhiZmU4Yzc2ZGVhMGZmZGNmYzI1NmM4NWRiNzY5Mzc2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgifQ==', '2018-03-26 20:46:50.726515');
INSERT INTO `django_session` VALUES ('ebc4k010x0imyosnzn921731czw32nuc', 'OGYxZTZkNGVkYjM2MjE5MDk4MDExNWI2NTJlNjBiNjE4ODJjNDE4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwibGVzc29uIl0sIiJdfQ==', '2018-03-31 16:58:14.439019');
INSERT INTO `django_session` VALUES ('g94kiqcqlzyeeon4w4s1nn45l5l215cl', 'OTk0OTg5NGM4YzAwYWJiZjI4NWIzZTgwOWQxMmM4YzM5NmE2NjkzMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc0ZjE0M2E4ZTYyYjk3NDIzOTAzNTEyZWJmZTNhNjJlNDAzMTBlMDMifQ==', '2018-03-23 16:42:09.123796');
INSERT INTO `django_session` VALUES ('j2lvgukiusymm2yn3fktbwou47xgbdiw', 'ZTkxNmU0ZTkxNTdiZGE2MWViZDdiY2EyNDkxNTM3MjdhZGY0ZWY0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgiLCJMSVNUX1FVRVJZIjpbWyJvcGVyYXRpb24iLCJ1c2VyY291cnNlIl0sIiJdfQ==', '2018-03-27 18:21:04.094178');
INSERT INTO `django_session` VALUES ('jg1be58bajza9affp7rc8s48bnjs2q4b', 'ZTlkODcxMzA5MmNmNzM4NmFlODgwY2VmMjJiN2QxZWRlOTNkZDY1MDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjhjMDBmMWZhMjBkMTdmYTlmYmE3OTE5MTkzNzAzNTBhY2U2MDk3MWUifQ==', '2018-03-19 11:13:46.786336');
INSERT INTO `django_session` VALUES ('l0qynconvu9au9l41nnjvctm3sj2szub', 'OGRmYzRjYjM2ZTZiYjI2ZGI3ODkzZGZkMjJiMmUzOTk5YzQ2NjEzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgiLCJMSVNUX1FVRVJZIjpbWyJvcmdhbml6YXRpb24iLCJ0ZWFjaGVyIl0sIiJdfQ==', '2018-03-31 17:45:24.649915');
INSERT INTO `django_session` VALUES ('lalrjt0u0v9hrvlupdud6bna7lrh4rxn', 'MjczODJjYjhiZmU4Yzc2ZGVhMGZmZGNmYzI1NmM4NWRiNzY5Mzc2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgifQ==', '2018-04-01 12:14:12.385785');
INSERT INTO `django_session` VALUES ('oe5pc1unw9d04om2uqip15iehw666kno', 'OTk0OTg5NGM4YzAwYWJiZjI4NWIzZTgwOWQxMmM4YzM5NmE2NjkzMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc0ZjE0M2E4ZTYyYjk3NDIzOTAzNTEyZWJmZTNhNjJlNDAzMTBlMDMifQ==', '2018-03-23 11:39:49.586223');
INSERT INTO `django_session` VALUES ('peb33qh2ywiehfmlnicg5l3rkn8lfxpi', 'OTk0OTg5NGM4YzAwYWJiZjI4NWIzZTgwOWQxMmM4YzM5NmE2NjkzMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc0ZjE0M2E4ZTYyYjk3NDIzOTAzNTEyZWJmZTNhNjJlNDAzMTBlMDMifQ==', '2018-03-23 11:37:00.802713');
INSERT INTO `django_session` VALUES ('prhhi3prfzayhrizilj6hlasbgeqvy5a', 'OTk0OTg5NGM4YzAwYWJiZjI4NWIzZTgwOWQxMmM4YzM5NmE2NjkzMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc0ZjE0M2E4ZTYyYjk3NDIzOTAzNTEyZWJmZTNhNjJlNDAzMTBlMDMifQ==', '2018-03-23 11:54:43.127504');
INSERT INTO `django_session` VALUES ('puxar4zkdlgr9mwplcrmjp7fzufmrqam', 'OTk0OTg5NGM4YzAwYWJiZjI4NWIzZTgwOWQxMmM4YzM5NmE2NjkzMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc0ZjE0M2E4ZTYyYjk3NDIzOTAzNTEyZWJmZTNhNjJlNDAzMTBlMDMifQ==', '2018-03-23 12:13:50.223137');
INSERT INTO `django_session` VALUES ('vyev9yywi1aujf5uz7dsctrbx4a9em16', 'NDIzMzhmZGJjOTlmMzMyYzI5YWY1ZTBhNjg4OTBjZTdlZDRjNjZlNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc0ZjE0M2E4ZTYyYjk3NDIzOTAzNTEyZWJmZTNhNjJlNDAzMTBlMDMiLCJMSVNUX1FVRVJZIjpbWyJ1c2VycyIsInVzZXJwcm9maWxlIl0sIiJdfQ==', '2018-03-24 21:25:07.822244');
INSERT INTO `django_session` VALUES ('xwagsxiucrv5dzlxbk4knnes6eq6vedl', 'OTk0OTg5NGM4YzAwYWJiZjI4NWIzZTgwOWQxMmM4YzM5NmE2NjkzMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc0ZjE0M2E4ZTYyYjk3NDIzOTAzNTEyZWJmZTNhNjJlNDAzMTBlMDMifQ==', '2018-03-23 11:54:00.355316');
INSERT INTO `django_session` VALUES ('z0u33hrvjgpmgyunxl1rxctszeqh548t', 'MjczODJjYjhiZmU4Yzc2ZGVhMGZmZGNmYzI1NmM4NWRiNzY5Mzc2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyYTIxODA0NmJiYzExMjBjMWNhNzUxOTYwOTBkN2M2NjAxZGIwZTgifQ==', '2018-04-01 12:24:34.696544');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES ('1', '白师傅真厉害', '2018-03-08 22:00:00.000000', '1', '2');
INSERT INTO `operation_coursecomments` VALUES ('2', '白师傅洗脑能力真强', '2018-03-08 22:15:45.157938', '1', '1');
INSERT INTO `operation_coursecomments` VALUES ('3', '白师傅同话能力比较强', '2018-03-17 17:12:35.353284', '1', '1');

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `course_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES ('1', '2018-03-09 16:23:27.276867', '1', '1');
INSERT INTO `operation_usercourse` VALUES ('2', '2018-03-13 18:25:55.924748', '3', '1');

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES ('2', '2', '1', '2018-03-05 15:36:58.152395', '2');
INSERT INTO `operation_userfavorite` VALUES ('24', '1', '1', '2018-03-14 10:06:25.369025', '1');
INSERT INTO `operation_userfavorite` VALUES ('28', '6', '1', '2018-03-17 16:53:56.138512', '1');
INSERT INTO `operation_userfavorite` VALUES ('39', '1', '3', '2018-03-18 12:08:17.745468', '1');
INSERT INTO `operation_userfavorite` VALUES ('41', '1', '2', '2018-03-18 12:27:24.070614', '1');

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------
INSERT INTO `operation_usermessage` VALUES ('1', '1', '消息测试', '1', '2018-03-13 23:19:00.000000');
INSERT INTO `operation_usermessage` VALUES ('2', '1', '消息测试2', '1', '2018-03-13 23:19:00.000000');
INSERT INTO `operation_usermessage` VALUES ('3', '1', 'test1', '1', '2018-03-13 23:44:00.000000');
INSERT INTO `operation_usermessage` VALUES ('4', '3', '欢迎注册!', '0', '2018-03-19 20:39:43.091390');
INSERT INTO `operation_usermessage` VALUES ('5', '4', '欢迎注册!', '0', '2018-03-26 09:26:19.063322');

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `describe` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES ('1', '西安市', '中国古都', '2018-03-04 22:12:00.000000');
INSERT INTO `organization_citydict` VALUES ('2', '延安市', '革命老区', '2018-03-04 22:12:00.000000');
INSERT INTO `organization_citydict` VALUES ('3', '北京市', '中国帝都', '2018-03-04 22:13:00.000000');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
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
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('1', '白师傅小说课堂', '<p>&nbsp; &nbsp; 老白“师傅”专业的小说写作教学</p>', '116', '1', 'org/2018/03/baishifuxiezuo.jpg', '延安市宝塔区', 'personal', '5', '2018-03-04 22:13:00.000000', '2');
INSERT INTO `organization_courseorg` VALUES ('2', '高升汽车专修学院', '专业的汽修摇篮', '1', '0', 'org/2018/03/gaoshengqichezhuanxiu.jpg', '西安市未央区', 'colleges', '100', '2018-03-04 22:14:00.000000', '1');
INSERT INTO `organization_courseorg` VALUES ('3', '高杨职业技术学院', '各色各样的职业技术等你来学', '7', '0', 'org/2018/03/f2deb48f8c5494ee8d482fae2ff5e0fe99257e1a.gif', '延安市宝塔区', 'colleges', '100', '2018-03-04 22:17:00.000000', '2');
INSERT INTO `organization_courseorg` VALUES ('4', '魔兽训练营', '<p><img src=\"/media/org/ueditor/484_20180314203052.jpg\" title=\"\" alt=\"c2cec3fdfc039245b5488b128c94a4c27d1e2529.jpg\"/>\r\n &nbsp; &nbsp; 魔兽世界爱好者</p>', '6', '0', 'org/2018/03/20180314122114_56.jpg', '西安市未央区徐家湾', 'personal', '0', '2018-03-14 12:19:00.000000', '1');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
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
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('1', '白师傅', '4', '金天国际', '传销头目', '精神控制', '132', '1', 'teacher/2018/03/u25980245702118333203fm27gp0.jpg', '2018-03-04 22:18:00.000000', '1', '2001-02-07');
INSERT INTO `organization_teacher` VALUES ('2', '高太尉', '3', '高升汽修学院', '校长', '能文能武', '7', '0', 'teacher/2018/03/u411746764288387648fm27gp0.jpg', '2018-03-04 22:20:00.000000', '2', '1984-02-29');
INSERT INTO `organization_teacher` VALUES ('3', '老痰杨', '10', '高杨电影制片厂', '导演', '极其猥琐', '11', '0', 'teacher/2018/03/f2deb48f8c5494ee8d482fae2ff5e0fe99257e1a.gif', '2018-03-04 22:22:00.000000', '3', '1983-11-17');
INSERT INTO `organization_teacher` VALUES ('4', '金鱼残', '3', '东莞金鱼佬小学', '金鱼佬', '饲养金鱼', '0', '0', 'teacher/2018/03/20180314122249_32.jpg', '2404-07-05 12:21:00.000000', '4', '1987-07-02');
INSERT INTO `organization_teacher` VALUES ('5', '淫三', '1', '金天国际', '传销员', '逻辑性很强', '1', '0', 'teacher/2018/03/20180318132631_53.jpg', '2018-03-18 13:25:00.000000', '1', '2004-10-26');

-- ----------------------------
-- Table structure for reversion_revision
-- ----------------------------
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

-- ----------------------------
-- Records of reversion_revision
-- ----------------------------

-- ----------------------------
-- Table structure for reversion_version
-- ----------------------------
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

-- ----------------------------
-- Records of reversion_version
-- ----------------------------

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES ('1', '1', 'banner/2018/03/20180314102828_9.jpg', 'http://www.baidu.com', '1', '2018-03-14 10:28:00.000000');
INSERT INTO `users_banner` VALUES ('2', '2', 'banner/2018/03/20180314102942_28.jpg', 'http://www.baidu.com', '2', '2018-03-14 10:28:00.000000');
INSERT INTO `users_banner` VALUES ('3', '3', 'banner/2018/03/20180314102957_60.jpg', 'http://www.baidu.com', '3', '2018-03-14 10:29:00.000000');
INSERT INTO `users_banner` VALUES ('4', '4', 'banner/2018/03/20180314103007_84.jpg', 'http://www.baidu.com', '4', '2018-03-14 10:29:00.000000');

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `send_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES ('1', 'MXICTxytuCFiJtlm', '550179354@qq.com', 'register', '2018-03-05 11:11:57.875025');
INSERT INTO `users_emailverifyrecord` VALUES ('2', 'x3oVavwxpRRqJG7I', '1016651545@qq.com', 'update_email', '2018-03-12 21:40:00.521896');
INSERT INTO `users_emailverifyrecord` VALUES ('3', 'iFf0HCsZznFXCccc', '1016651545@qq.com', 'update_email', '2018-03-12 21:44:07.906570');
INSERT INTO `users_emailverifyrecord` VALUES ('4', '8nuOfYJNwWkmXK4A', '1016651545@qq.com', 'update_email', '2018-03-12 21:46:08.727727');
INSERT INTO `users_emailverifyrecord` VALUES ('5', 'pu9fQALNbdbzx5ag', '1016651545@qq.com', 'register', '2018-03-19 20:39:43.096401');
INSERT INTO `users_emailverifyrecord` VALUES ('6', 'o24LBisIYd7RLFSD', '2155846011@qq.com', 'register', '2018-03-26 09:26:19.068757');
INSERT INTO `users_emailverifyrecord` VALUES ('7', 'H2OIojFlJzjp3YHB', '550179354@qq.com', 'forget', '2018-03-26 15:03:25.925530');
INSERT INTO `users_emailverifyrecord` VALUES ('8', 'hRxOBXYGMVTgLyJD', '550179354@qq.com', 'forget', '2018-03-26 15:15:42.024735');
INSERT INTO `users_emailverifyrecord` VALUES ('9', 'ZnetmwEXjOt2ccZL', '550179354@qq.com', 'forget', '2018-03-26 15:16:06.384577');
INSERT INTO `users_emailverifyrecord` VALUES ('10', 'xKJ8cdk9zvT7NyXx', '550179354@qq.com', 'forget', '2018-03-26 15:16:48.318849');
INSERT INTO `users_emailverifyrecord` VALUES ('11', 'SLiF5PIKzNopMQpv', '550179354@qq.com', 'forget', '2018-03-26 19:37:26.866343');
INSERT INTO `users_emailverifyrecord` VALUES ('12', 'fqIyf4PP70f2e6lJ', '550179354@qq.com', 'forget', '2018-03-26 19:38:18.392497');
INSERT INTO `users_emailverifyrecord` VALUES ('13', 'ECi9lQdJU2l0bBuw', '550179354@qq.com', 'forget', '2018-03-26 19:52:09.010820');
INSERT INTO `users_emailverifyrecord` VALUES ('14', 'tXB77o6cvChuARoe', '550179354@qq.com', 'forget', '2018-03-26 19:53:30.900138');
INSERT INTO `users_emailverifyrecord` VALUES ('15', 'cPvcZCBg5hbje82h', '550179354@qq.com', 'forget', '2018-03-27 17:50:53.823993');
INSERT INTO `users_emailverifyrecord` VALUES ('16', 'zQJ2OaHzEDgPabRl', '550179354@qq.com', 'forget', '2018-03-27 17:58:47.691716');
INSERT INTO `users_emailverifyrecord` VALUES ('17', 'QNjhUW574RiDaOPH', '550179354@qq.com', 'forget', '2018-03-27 18:00:06.711746');
INSERT INTO `users_emailverifyrecord` VALUES ('18', '5qRWuu6dlYuLOG8D', '550179354@qq.com', 'forget', '2018-03-27 18:02:00.910973');
INSERT INTO `users_emailverifyrecord` VALUES ('19', 'T33IBwkzajOVbiQk', '550179354@qq.com', 'forget', '2018-03-27 18:04:04.117084');
INSERT INTO `users_emailverifyrecord` VALUES ('20', 't3z7iLrQaIksO1hg', '550179354@qq.com', 'forget', '2018-03-27 18:06:20.787569');
INSERT INTO `users_emailverifyrecord` VALUES ('21', 'rQI9c1Ym43rAdcbx', '550179354@qq.com', 'forget', '2018-03-27 18:07:10.556654');
INSERT INTO `users_emailverifyrecord` VALUES ('22', 'ckLvdTwq6whItgTH', '550179354@qq.com', 'forget', '2018-03-27 18:10:08.065768');
INSERT INTO `users_emailverifyrecord` VALUES ('23', 'LvePMx2oyT4fdPel', '550179354@qq.com', 'forget', '2018-03-27 18:15:05.419675');
INSERT INTO `users_emailverifyrecord` VALUES ('24', '0XqIhXkHWvPsb1NU', '550179354@qq.com', 'forget', '2018-03-27 18:15:33.830738');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
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
  `gender` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$100000$cgsaExBAvsiR$fHodjONMOsYzdY8Kxz4F25PBpCDMuccb7wzfinUFVmI=', '2018-04-13 16:34:03.970776', '1', 'root', '', '', 'undeadfrost@live.com', '1', '1', '2018-03-04 22:03:00.000000', 'Frost', '2018-03-13', 'male', '西安市未央区凤城十路', '13720737094', 'image/2018/03/20180313151047_41.jpg');
INSERT INTO `users_userprofile` VALUES ('2', 'pbkdf2_sha256$100000$GLPwhxNzFTHl$H1YDFK8JBjdg9i/0FP//OCDoAvCSk0uwEjMuDRi3P3Q=', '2018-03-17 16:48:22.968285', '0', '550179354@qq.com', '', '', '550179354@qq.com', '0', '1', '2018-03-05 11:11:00.000000', 'libo', null, 'male', '西安市未央区凤城十路', null, 'image/2018/03/20180317164840_65.jpg');
INSERT INTO `users_userprofile` VALUES ('3', 'pbkdf2_sha256$100000$a74tEQ1gjeNK$oHK7Qk1oVz1Vq1ezs7tGSCD3FLqqPe/eaV9KvJSMncM=', null, '0', '1016651545@qq.com', '', '', '1016651545@qq.com', '0', '0', '2018-03-19 20:39:43.015183', '', null, 'male', '', null, 'image/default.png');
INSERT INTO `users_userprofile` VALUES ('4', 'pbkdf2_sha256$100000$PcdXLTeJhgW0$6Nx1bcsZGAnuNzJ7tt01IsjhMMEgCayoW0S2OtsR4OA=', null, '0', '2155846011@qq.com', '', '', '2155846011@qq.com', '0', '0', '2018-03-26 09:26:18.984110', '', null, 'male', '', null, 'image/default.png');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
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

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
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

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
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

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-03-04 22:12:48.296452', '127.0.0.1', '1', '西安市', 'create', '已添加。', '19', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-03-04 22:12:59.378817', '127.0.0.1', '2', '延安市', 'create', '已添加。', '19', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-03-04 22:13:09.634258', '127.0.0.1', '3', '北京市', 'create', '已添加。', '19', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-03-04 22:14:41.263012', '127.0.0.1', '1', '白师傅小说课堂', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-03-04 22:15:25.493997', '127.0.0.1', '2', '高升汽车专修学院', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-03-04 22:18:11.611790', '127.0.0.1', '3', '高杨职业技术学院', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-03-04 22:20:08.400262', '127.0.0.1', '1', '[白师傅小说课堂]的教师: 白师傅', 'create', '已添加。', '21', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-03-04 22:22:43.519065', '127.0.0.1', '2', '[高升汽车专修学院]的教师: 高太尉', 'create', '已添加。', '21', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-03-04 22:23:24.380951', '127.0.0.1', '3', '[高杨职业技术学院]的教师: 老痰杨', 'create', '已添加。', '21', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-03-04 22:27:34.451161', '127.0.0.1', '1', '初识小说', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-03-04 22:29:35.199870', '127.0.0.1', '2', '小说架构', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-03-05 00:20:24.659294', '127.0.0.1', '1', '《初识小说》课程的章节 >> 第一章、什么是小说', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-03-05 16:39:46.239165', '127.0.0.1', '3', '了解汽车种类', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-03-05 23:43:06.678848', '127.0.0.1', '3', '了解汽车种类', 'change', '修改 teacher', '15', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-03-05 23:43:23.987638', '127.0.0.1', '2', '小说架构', 'change', '修改 teacher 和 tag', '15', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-03-05 23:43:32.848158', '127.0.0.1', '1', '初识小说', 'change', '修改 teacher 和 tag', '15', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-03-07 15:19:58.521152', '127.0.0.1', '1', '《初识小说》课程的章节 >> 第一章、什么是小说章节的视频 >> 1.1 了解小说', 'create', '已添加。', '17', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-03-07 15:36:20.860380', '127.0.0.1', '1', '《初识小说》课程的章节 >> 第一章、什么是小说章节的视频 >> 1.1 了解小说', 'change', '修改 learn_times', '17', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-03-07 21:57:16.143498', '127.0.0.1', '1', '《初识小说》课程的资源: 小说结构', 'create', '已添加。', '18', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-03-08 22:01:11.503412', '127.0.0.1', '1', 'CourseComments object (1)', 'create', '已添加。', '23', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-03-08 22:17:51.362710', '127.0.0.1', '1', 'root', 'change', '修改 last_login，nickname 和 address', '6', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-03-08 22:18:03.572779', '127.0.0.1', '2', '550179354@qq.com', 'change', '修改 last_login，nickname 和 address', '6', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-03-09 18:31:30.210603', '127.0.0.1', '3', '[高杨职业技术学院]的教师: 老痰杨', 'change', '修改 click_nums', '21', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-03-09 18:31:36.086522', '127.0.0.1', '2', '[高升汽车专修学院]的教师: 高太尉', 'change', '修改 click_nums', '21', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-03-10 21:25:07.727220', '127.0.0.1', '1', 'root', 'change', '修改 last_login 和 image', '6', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-03-13 17:03:43.477804', '127.0.0.1', '1', 'root', 'change', '修改 last_login 和 birthday', '6', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-03-13 23:19:53.432091', '127.0.0.1', '1', 'UserMessage object (1)', 'create', '已添加。', '25', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2018-03-13 23:20:02.721460', '127.0.0.1', '2', 'UserMessage object (2)', 'create', '已添加。', '25', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-03-13 23:44:05.561935', '127.0.0.1', '3', 'UserMessage object (3)', 'create', '已添加。', '25', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-03-14 10:28:28.066868', '127.0.0.1', '1', '1(位于第1位)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-03-14 10:29:42.732707', '127.0.0.1', '2', '2(位于第2位)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-03-14 10:29:57.452648', '127.0.0.1', '3', '3(位于第3位)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-03-14 10:30:07.434348', '127.0.0.1', '4', '4(位于第4位)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-03-14 12:21:14.287204', '127.0.0.1', '4', '魔兽训练营', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-03-14 12:22:49.035064', '127.0.0.1', '4', '[魔兽训练营]的教师: 金鱼残', 'create', '已添加。', '21', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-03-14 12:23:30.539517', '127.0.0.1', '4', '魔兽入门', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-03-14 12:24:31.493593', '127.0.0.1', '5', '魔兽历史', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-03-14 17:01:35.065756', '127.0.0.1', '5', '魔兽历史', 'change', '修改 detail', '15', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-03-14 17:39:49.575167', '127.0.0.1', '5', '魔兽历史', 'change', '修改 detail', '15', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2018-03-14 19:33:15.962159', '127.0.0.1', '5', '魔兽历史', 'change', '修改 detail', '15', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2018-03-14 20:30:56.916881', '127.0.0.1', '4', '魔兽训练营', 'change', '修改 describe', '20', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2018-03-16 19:40:10.945083', '127.0.0.1', '6', '电影观看指南', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2018-03-17 17:44:34.298974', '127.0.0.1', '4', '[魔兽训练营]的教师: 金鱼残', 'change', '修改 birthday 和 add_time', '21', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2018-03-17 17:44:47.239779', '127.0.0.1', '3', '[高杨职业技术学院]的教师: 老痰杨', 'change', '修改 birthday', '21', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2018-03-17 17:45:10.986323', '127.0.0.1', '2', '[高升汽车专修学院]的教师: 高太尉', 'change', '修改 birthday', '21', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2018-03-17 17:45:24.206232', '127.0.0.1', '1', '[白师傅小说课堂]的教师: 白师傅', 'change', '修改 birthday', '21', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2018-03-17 23:28:33.603074', '127.0.0.1', '7', '如何学习小说写作', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2018-03-17 23:29:59.298169', '127.0.0.1', '7', '如何学习小说写作', 'change', '修改 detail', '15', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2018-03-17 23:34:08.830492', '127.0.0.1', '7', '如何学习小说写作', 'change', '没有字段被修改。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2018-03-17 23:38:57.226973', '127.0.0.1', '1', '白师傅小说课堂', 'change', '修改 describe 和 course_nums', '20', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2018-03-17 23:39:12.517722', '127.0.0.1', '7', '如何学习小说写作', 'change', '没有字段被修改。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2018-03-17 23:40:55.442079', '127.0.0.1', '6', '电影观看指南', 'change', '没有字段被修改。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2018-03-17 23:40:59.034733', '127.0.0.1', '5', '魔兽历史', 'change', '没有字段被修改。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2018-03-17 23:41:02.277314', '127.0.0.1', '4', '魔兽入门', 'change', '修改 detail', '15', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2018-03-17 23:41:05.030683', '127.0.0.1', '3', '了解汽车种类', 'change', '修改 detail', '15', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2018-03-17 23:41:08.230517', '127.0.0.1', '2', '小说架构', 'change', '修改 detail', '15', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2018-03-17 23:41:13.762531', '127.0.0.1', '3', '了解汽车种类', 'change', '没有字段被修改。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2018-03-17 23:41:16.774746', '127.0.0.1', '1', '初识小说', 'change', '修改 detail', '15', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2018-03-18 10:03:49.409831', '127.0.0.1', null, '', 'delete', '批量删除 1 个 课程', null, '1');
INSERT INTO `xadmin_log` VALUES ('60', '2018-03-18 10:07:50.656551', '127.0.0.1', '8', '测试课程', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2018-03-18 10:09:33.322155', '127.0.0.1', null, '', 'delete', '批量删除 1 个 课程', null, '1');
INSERT INTO `xadmin_log` VALUES ('62', '2018-03-18 10:10:24.310239', '127.0.0.1', null, '', 'delete', '批量删除 1 个 课程', null, '1');
INSERT INTO `xadmin_log` VALUES ('63', '2018-03-18 10:14:45.257428', '127.0.0.1', null, '', 'delete', '批量删除 1 个 课程', null, '1');
INSERT INTO `xadmin_log` VALUES ('64', '2018-03-18 10:29:47.306096', '127.0.0.1', null, '', 'delete', '批量删除 1 个 课程', null, '1');
INSERT INTO `xadmin_log` VALUES ('65', '2018-03-18 11:31:08.855555', '127.0.0.1', '9', '发布测试', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2018-03-18 13:26:31.763459', '127.0.0.1', '5', '[白师傅小说课堂]的教师: 淫三', 'create', '已添加。', '21', '1');
INSERT INTO `xadmin_log` VALUES ('67', '2018-03-19 20:33:15.399574', '127.0.0.1', '9', '发布测试', 'change', '修改 is_banner', '15', '1');
INSERT INTO `xadmin_log` VALUES ('68', '2018-03-19 20:33:21.503755', '127.0.0.1', '3', '了解汽车种类', 'change', '修改 is_banner', '15', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
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

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
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

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
