/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : db_course_online

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 24/02/2024 22:34:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (1, '老师');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, '讲师操作权限', 28, 'JS');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiration` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `degree` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  `course_org_id` int(11) NULL DEFAULT NULL,
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `teacher_tell` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `you_need_know` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_course_course_org_id_4d2c4aab_fk_organizat`(`course_org_id`) USING BTREE,
  INDEX `courses_course_d9614d40`(`teacher_id`) USING BTREE,
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES (10, 'python编程', 'python编程基础知识课程', '<p style=\"white-space: normal;\">Python由荷兰国家数学与计算机科学研究中心的吉多·范罗苏姆于1990年代初设计，作为一门叫做ABC语言的替代品。Python提供了高效的高级数据结构，还能简单有效地面向对象编程。Python语法和动态类型，以及解释型语言的本质，使它成为多数平台上写脚本和快速开发应用的编程语言，随着版本的不断更新和语言新功能的添加，逐渐被用于独立的、大型项目的开发。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">Python在各个编程语言中比较适合新手学习，Python解释器易于扩展，可以使用C、C++或其他可以通过C调用的语言扩展新的功能和数据类型。Python也可用于可定制化软件中的扩展程序语言。Python丰富的标准库，提供了适用于各个主要系统平台的源码或机器码。</p><pre class=\"brush:python;toolbar:false\">print(&quot;hello&nbsp;world&quot;)</pre>', 'cj', 10, 2, 1, 'courses/2024/02/python.jpg', 24, '2024-01-15 23:34:00.000000', 18, '后端开发', 'python', 16, '什么都可以学到,按时交作业,不然叫家长！', '一颗勤学的心是本课程必要前提', 0);
INSERT INTO `courses_course` VALUES (11, '高等数学', '高等数学', '<p>高等数学是指相对于初等数学和中等数学而言，数学的对象及方法较为繁杂的一部分，中学的代数、几何以及简单的集合论初步、逻辑初步称为中等数学，将其作为中小学阶段的初等数学与大学阶段的高等数学的过渡。</p><p>通常认为，高等数学是由微积分学，较深入的代数学、几何学以及它们之间的交叉内容所形成的一门基础学科。主要内容包括：数列、极限、微积分、空间解析几何与线性代数、级数、常微分方程。工科、理科、财经类研究生考试的基础科目。</p><p><br/></p>', 'gj', 6, 2, 1, 'courses/2024/02/高等数学.jpg', 7, '2024-02-22 21:04:00.000000', 16, '高等数学', '高等数学', 14, '什么都可以学到,按时交作业,不然叫家长！', '高数虽难，不可放弃！', 0);
INSERT INTO `courses_course` VALUES (12, '公考上岸', '公考上岸', '<p>公务员考试是公务员主管部门组织录用担任一级主任科员以下及其他相当职级层次的公务员的录用考试。<br/></p><p>《中华人民共和国公务员法》规定录用担任一级主任科员以下及其他相当职级层次的公务员，采取公开考试、严格考察、平等竞争、择优录取的办法。民族自治地方依照前款规定录用公务员时，依照法律和有关规定对少数民族报考者予以适当照顾。中央机关及其直属机构公务员的录用，由中央公务员主管部门负责组织。地方各级机关公务员的录用，由省级公务员主管部门负责组织，必要时省级公务员主管部门可以授权设区的市级公务员主管部门组织。</p><p><br/></p>', 'zj', 30, 1, 2, 'courses/2024/02/公考.jpg', 5, '2024-02-22 21:08:00.000000', 17, '公考', '公考', 15, '恭喜上岸！', '一颗勤学的心是本课程必要前提', 0);

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `download` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_courseresource_course_id_5eba1332_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES (1, 'python安装包', 'course/resource/2024/02/python-3.7.0-amd64.exe', '2024-02-22 21:51:00.000000', 10);
INSERT INTO `courses_courseresource` VALUES (2, '逻辑推理资料', 'course/resource/2024/02/新建文本文档.txt', '2024-02-23 15:55:00.000000', 12);

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_lesson_course_id_16bc4882_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES (1, '1、python 基础教程', '2024-02-22 21:13:00.000000', 10);
INSERT INTO `courses_lesson` VALUES (2, '2、Python 流程控制', '2024-02-22 21:14:00.000000', 10);
INSERT INTO `courses_lesson` VALUES (3, '1、高数基础', '2024-02-22 21:15:00.000000', 11);
INSERT INTO `courses_lesson` VALUES (4, '1、常识判断', '2024-02-22 21:15:00.000000', 12);
INSERT INTO `courses_lesson` VALUES (5, '2、数量关系', '2024-02-22 21:16:00.000000', 12);
INSERT INTO `courses_lesson` VALUES (6, '3、逻辑推理', '2024-02-23 15:51:00.000000', 12);

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_video_lesson_id_59f2396e_fk_courses_lesson_id`(`lesson_id`) USING BTREE,
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES (1, '【代码在线运行系统】基于Python+Flask+SQLite3视频教程', '2024-02-22 21:16:00.000000', 1, 'https://upos-sz-mirrorcos.bilivideo.com/upgcxcode/61/01/1444460161/1444460161-1-16.mp4?e=ig8euxZM2rNcNbRVhwdVhwdlhWdVhwdVhoNvNC8BqJIzNbfq9rVEuxTEnE8L5F6VnEsSTx0vkX8fqJeYTj_lta53NCM=&uipk=5&nbs=1&deadline=1708708641&gen=playurlv2&os=bcache&oi=730762249&trid=0000fbe780cd32524ca5a10dfa2c8475418bh&mid=0&platform=html5&upsig=15b15ad1fd637276d5ded915b9c0e064&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,mid,platform&cdnid=87004&bvc=vod&nettype=0&f=h_0_0&bw=13695&logo=80000000', 10);
INSERT INTO `courses_video` VALUES (2, '逻辑推理教程', '2024-02-23 15:52:00.000000', 6, 'https://upos-sz-mirrorcos.bilivideo.com/upgcxcode/61/01/1444460161/1444460161-1-16.mp4?e=ig8euxZM2rNcNbRVhwdVhwdlhWdVhwdVhoNvNC8BqJIzNbfq9rVEuxTEnE8L5F6VnEsSTx0vkX8fqJeYTj_lta53NCM=&uipk=5&nbs=1&deadline=1708708641&gen=playurlv2&os=bcache&oi=730762249&trid=0000fbe780cd32524ca5a10dfa2c8475418bh&mid=0&platform=html5&upsig=15b15ad1fd637276d5ded915b9c0e064&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,mid,platform&cdnid=87004&bvc=vod&nettype=0&f=h_0_0&bw=13695&logo=80000000', 20);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (36, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (37, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (38, 'courses', 'course');
INSERT INTO `django_content_type` VALUES (42, 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES (40, 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES (41, 'courses', 'video');
INSERT INTO `django_content_type` VALUES (43, 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES (34, 'operation', 'userask');
INSERT INTO `django_content_type` VALUES (31, 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES (32, 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES (33, 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES (26, 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES (27, 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES (28, 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES (35, 'users', 'banner');
INSERT INTO `django_content_type` VALUES (30, 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES (29, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (44, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (39, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('4hkhf2spqr0ibsq9uzhocriievcjl5kk', 'YzUwYjg3ZmFkODk0OWYzMmM0NjQxZDU1MzczNjU5ZDY5YWMyYzRjOTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjFkY2Y3MzBkYzNiYTI4MzljOWE2MTFlZmVlZDFlMDA2ZDdhZmZkZmEiLCJMSVNUX1FVRVJZIjpbWyJ1c2VycyIsInVzZXJwcm9maWxlIl0sIiJdLCJ3aXphcmRfeGFkbWludXNlcndpZGdldF9hZG1pbl93aXphcmRfZm9ybV9wbHVnaW4iOnsic3RlcCI6IldpZGdldFx1N2M3Ylx1NTc4YiIsInN0ZXBfZGF0YSI6e30sInN0ZXBfZmlsZXMiOnt9LCJleHRyYV9kYXRhIjp7fX19', '2024-03-08 16:09:13.388463');
INSERT INTO `django_session` VALUES ('lkwsbb0b761v141scxtovq6zqnmrgf38', 'ODNmODE3OTkwZTMwN2E4YjZmMTVjM2QyODc4N2YwYTNiNmEyNThlODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjFkY2Y3MzBkYzNiYTI4MzljOWE2MTFlZmVlZDFlMDA2ZDdhZmZkZmEiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwidmlkZW8iXSwiIl19', '2024-03-08 07:10:52.304894');
INSERT INTO `django_session` VALUES ('w0bwbk6apgazg3700ou598friiki2vf7', 'ZTcyYTgzMjU2MzMzNzQ5YzJlY2YxYTdhODEzMGExMzZiZTYwNjBlMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImU1ZjUwNTBlNzNkZmI2MjE5OTg5Y2NmYzZlMDk2ZDA3NmIwZjU3ZjAiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==', '2024-01-29 23:36:01.724520');
INSERT INTO `django_session` VALUES ('x6ibztg001d4soofl6234uycxr0kcdfn', 'NTJkNmRhY2FlNDY4ZjBmNjYxN2VlNzRjMGEyMzEzOWY4ZGY0MTNhNjp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM4M2FmYTMwMDY0MTZlNzQxMjRlMzVkODU0NmQwMWIxMjQ5Mjk4OTcifQ==', '2024-03-08 15:39:59.962912');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id`(`course_id`) USING BTREE,
  INDEX `operation_coursecomm_user_id_f5ff70b3_fk_users_use`(`user_id`) USING BTREE,
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES (1, '老师讲的真不错！三连了', '2024-02-22 21:53:25.398932', 10, 3);
INSERT INTO `operation_coursecomments` VALUES (2, '龙哥讲得真不错！', '2024-02-23 16:01:06.834560', 12, 8);

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES (1, '兵慌码乱', '18725620411', 'python', '2024-02-22 21:55:31.105063');
INSERT INTO `operation_userask` VALUES (2, 'test', '18725620411', 'Java', '2024-02-23 15:59:40.498104');

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NULL DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id`(`course_id`) USING BTREE,
  INDEX `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES (8, '2024-01-15 23:36:53.635810', 10, 3);
INSERT INTO `operation_usercourse` VALUES (9, '2024-02-23 08:02:11.149670', 11, 3);
INSERT INTO `operation_usercourse` VALUES (10, '2024-02-23 15:50:14.538530', 12, 8);
INSERT INTO `operation_usercourse` VALUES (11, '2024-02-23 15:56:13.446638', 10, 8);
INSERT INTO `operation_usercourse` VALUES (12, '2024-02-23 15:58:39.172734', 11, 8);

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES (2, 12, 1, '2024-02-23 06:38:51.945827', 3);
INSERT INTO `operation_userfavorite` VALUES (3, 10, 1, '2024-02-23 06:48:04.879189', 3);
INSERT INTO `operation_userfavorite` VALUES (4, 11, 1, '2024-02-23 07:44:44.284796', 3);
INSERT INTO `operation_userfavorite` VALUES (5, 12, 1, '2024-02-23 15:49:54.711762', 8);

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------
INSERT INTO `operation_usermessage` VALUES (1, 4, '欢迎注册在线课程学习系统!', 0, '2024-01-26 20:08:31.070737');
INSERT INTO `operation_usermessage` VALUES (2, 5, '欢迎注册在线课程学习系统! --系统自动消息', 0, '2024-02-23 12:23:49.764684');
INSERT INTO `operation_usermessage` VALUES (3, 6, '欢迎注册在线课程学习系统! --系统自动消息', 0, '2024-02-23 12:24:27.930865');
INSERT INTO `operation_usermessage` VALUES (4, 7, '欢迎注册在线课程学习系统! --系统自动消息', 0, '2024-02-23 12:29:33.910710');
INSERT INTO `operation_usermessage` VALUES (5, 8, '欢迎注册在线课程学习系统! --系统自动消息', 1, '2024-02-23 15:34:52.398747');

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES (11, '重庆市', '直辖市重庆', '2024-01-15 23:32:00.000000');
INSERT INTO `organization_citydict` VALUES (12, '成都市', '四川省成都市', '2024-02-22 20:47:00.000000');
INSERT INTO `organization_citydict` VALUES (13, '北京市', '首都北京', '2024-02-22 20:47:00.000000');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organization_course_city_id_4a842f85_fk_organization_citydict_id`(`city_id`) USING BTREE,
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES (16, '重庆大学', '重庆大学（ChongqingUniversity，CQU），简称“重大”，是中华人民共和国教育部直属，由教育部、重庆市、国家国防科技工业局共建的全国重点大学，位列国家“双一流”、“211工程”、“985工程”，入选“珠峰计划”、“强基计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”、“卓越工程师教育培养计划”、“卓越法律人才教育培养计划”、国家建设高水平大学公派研究生项目、中国政府奖学金来华留学生接收院校、教育部来华留学示范基地，为卓越大学联盟、中波大学联盟、一带一路高校联盟、“长江—伏尔加河”高校联盟、CDIO工程教育联盟、中国高等戏剧教育联盟成员单位、“国优计划”首批试点高校。', 10, 0, 'org/2024/02/重庆大学.jpg', '重庆市', '2024-01-15 23:32:00.000000', 11, 'gx', 1, 2, '国内名校');
INSERT INTO `organization_courseorg` VALUES (17, '粉笔教育', '粉笔APP是北京粉笔蓝天科技有限公司旗下的教育产品，是一个推动科技创新的职业培训平台，成立于2015年，坚持科技先行，用互联网技术助力职业教育创新，为用户提供产品和服务。', 0, 0, 'org/2024/02/粉笔教育.jpg', '北京', '2024-02-22 20:51:00.000000', 13, 'pxjg', 1, 1, '粉笔');
INSERT INTO `organization_courseorg` VALUES (18, '兵慌码乱', '兵慌码乱，python开发工程师，分享优质python项目。', 2, 0, 'org/2024/02/logo.jpg', '中国重庆', '2024-02-22 20:53:00.000000', 11, 'gr', 1, 2, '兵慌码乱');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `points` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id`(`org_id`) USING BTREE,
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES (14, '高启强', 5, '重庆大学', '教师', '豪横', 9, 0, '2024-01-15 23:33:00.000000', 16, 'teacher/2024/02/高启强.jpg', 18);
INSERT INTO `organization_teacher` VALUES (15, '张小龙', 30, '粉笔教育CEO', 'CEO', 'so easy!', 1, 0, '2024-02-22 20:55:00.000000', 17, 'teacher/2024/02/张小龙.jpg', 38);
INSERT INTO `organization_teacher` VALUES (16, 'bhml', 99, '个体', '老板', '实战', 2, 0, '2024-02-22 20:57:00.000000', 18, 'teacher/2024/02/logo.jpg', 30);

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES (1, 'python编程', 'banner/2024/02/轮播图_f1qcamM.png', 'http://127.0.0.1:8000/course/detail/10/', 4, '2024-02-22 21:55:00.000000');
INSERT INTO `users_banner` VALUES (2, '高等数学', 'banner/2024/02/轮播2.png', 'http://127.0.0.1:8000/course/detail/11/', 2, '2024-02-22 22:05:00.000000');
INSERT INTO `users_banner` VALUES (3, '公务员考试', 'banner/2024/02/轮播3.png', 'http://127.0.0.1:8000/course/detail/12/', 3, '2024-02-22 22:05:00.000000');

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES (1, 'sV5hIIAT4F3XkG90', '                                    666666@qq.com ', 'register', '2024-01-26 20:08:31.079752');
INSERT INTO `users_emailverifyrecord` VALUES (4, 'fuvG4gD7rn5XQrTx', '1962850739@qq.com                    ', 'register', '2024-02-23 12:29:33.924708');
INSERT INTO `users_emailverifyrecord` VALUES (5, 'xcpF', '2463389290@qq.com', 'update_email', '2024-02-23 08:19:16.185354');
INSERT INTO `users_emailverifyrecord` VALUES (6, 'EiwxEXBZy8I1k1cb', '1962850739@qq.com', 'forget', '2024-02-23 08:21:15.230879');
INSERT INTO `users_emailverifyrecord` VALUES (7, 'rmlaK2oxh1MmxkjB', '1962850739@qq.com', 'register', '2024-02-23 15:34:52.515366');
INSERT INTO `users_emailverifyrecord` VALUES (8, 'aeMgWOQJnT5mVQ29', '1962850739@qq.com', 'forget', '2024-02-23 15:39:08.682700');
INSERT INTO `users_emailverifyrecord` VALUES (9, 'JHyc', '1962850739@qq.com', 'update_email', '2024-02-23 15:45:49.195762');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL DEFAULT NULL,
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `gender` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES (3, 'pbkdf2_sha256$100000$93vdzBM0K5VU$I5EfwvM6Uv2DnYTXexZsYYWdZFqBFzvTst9cQ//+vlk=', '2024-02-23 15:51:21.540569', 1, 'admin', '', '', '', 1, 1, '2024-01-15 23:31:14.836663', 'admin', '2024-01-22', 'female', '中国重庆', '666666', 'image/2024/01/logo.jpg');
INSERT INTO `users_userprofile` VALUES (7, 'pbkdf2_sha256$100000$dFPCpIJW70Cf$bxKBTZvqsf/oiwjsgyIUWmlLUz+pvsFpyJfgEb4n9hQ=', '2024-02-23 08:22:05.466319', 0, 'bhml        ', '', '', '666666@qq.com', 0, 1, '2024-02-23 12:29:33.820672', 'bhml', '2024-02-22', 'male', '北京', '666666', 'image/2024/02/test.jpg');
INSERT INTO `users_userprofile` VALUES (8, 'pbkdf2_sha256$100000$xAU2QSM7iX6C$wPiaATnkGNfHw2vQrSl/1u57YSMyp71bjaBhtqHz9yE=', '2024-02-23 15:39:59.947385', 0, '1962850739@qq.com', '', '', '1962850739@qq.com', 0, 1, '2024-02-23 15:34:52.291005', 'test', '2024-02-21', 'male', '中国北京', '88888888', 'image/2024/02/test1.jpg');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `users_userprofile_us_permission_id_393136b6_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookmark_content_type_id_60941679_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL DEFAULT NULL,
  `ip_addr` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES (86, '2024-01-15 23:32:51.574014', '127.0.0.1', '11', '重庆', 'create', '已添加。', 26, 3);
INSERT INTO `xadmin_log` VALUES (87, '2024-01-15 23:33:27.996070', '127.0.0.1', '16', '课程机构: 重庆大学', 'create', '已添加。', 27, 3);
INSERT INTO `xadmin_log` VALUES (88, '2024-01-15 23:34:19.273325', '127.0.0.1', '14', '[课程机构: 重庆大学]的教师: 高启强', 'create', '已添加。', 28, 3);
INSERT INTO `xadmin_log` VALUES (89, '2024-01-15 23:35:30.283403', '127.0.0.1', '10', 'python教程', 'create', '已添加。', 38, 3);
INSERT INTO `xadmin_log` VALUES (90, '2024-01-15 23:36:01.608831', '127.0.0.1', '10', 'python教程', 'change', '修改 detail', 38, 3);
INSERT INTO `xadmin_log` VALUES (91, '2024-02-22 20:47:22.640760', '127.0.0.1', '12', '成都市', 'create', '已添加。', 26, 3);
INSERT INTO `xadmin_log` VALUES (92, '2024-02-22 20:47:44.679550', '127.0.0.1', '11', '重庆市', 'change', '修改 name 和 desc', 26, 3);
INSERT INTO `xadmin_log` VALUES (93, '2024-02-22 20:48:01.042362', '127.0.0.1', '13', '北京市', 'create', '已添加。', 26, 3);
INSERT INTO `xadmin_log` VALUES (94, '2024-02-22 20:51:22.391183', '127.0.0.1', '16', '课程机构: 重庆大学', 'change', '修改 desc 和 image', 27, 3);
INSERT INTO `xadmin_log` VALUES (95, '2024-02-22 20:53:28.224513', '127.0.0.1', '17', '课程机构: 粉笔教育', 'create', '已添加。', 27, 3);
INSERT INTO `xadmin_log` VALUES (96, '2024-02-22 20:54:34.710288', '127.0.0.1', '18', '课程机构: 兵慌码乱', 'create', '已添加。', 27, 3);
INSERT INTO `xadmin_log` VALUES (97, '2024-02-22 20:57:18.424028', '127.0.0.1', '15', '[课程机构: 粉笔教育]的教师: 张小龙', 'create', '已添加。', 28, 3);
INSERT INTO `xadmin_log` VALUES (98, '2024-02-22 20:58:08.765243', '127.0.0.1', '16', '[课程机构: 兵慌码乱]的教师: bhml', 'create', '已添加。', 28, 3);
INSERT INTO `xadmin_log` VALUES (99, '2024-02-22 21:01:38.548526', '127.0.0.1', '10', 'python编程', 'change', '修改 course_org，teacher，name，desc，detail，teacher_tell 和 image', 38, 3);
INSERT INTO `xadmin_log` VALUES (100, '2024-02-22 21:04:21.199102', '127.0.0.1', '10', 'python编程', 'change', '修改 detail', 38, 3);
INSERT INTO `xadmin_log` VALUES (101, '2024-02-22 21:08:01.581931', '127.0.0.1', '11', '高等数学', 'create', '已添加。', 38, 3);
INSERT INTO `xadmin_log` VALUES (102, '2024-02-22 21:10:04.417833', '127.0.0.1', '12', '公考上岸', 'create', '已添加。', 38, 3);
INSERT INTO `xadmin_log` VALUES (103, '2024-02-22 21:14:15.544852', '127.0.0.1', '1', '《python编程》课程的章节 >> Python 基础教程', 'create', '已添加。', 40, 3);
INSERT INTO `xadmin_log` VALUES (104, '2024-02-22 21:14:38.477001', '127.0.0.1', '1', '《python编程》课程的章节 >> 1、python 基础教程', 'change', '修改 name', 40, 3);
INSERT INTO `xadmin_log` VALUES (105, '2024-02-22 21:14:50.714334', '127.0.0.1', '2', '《python编程》课程的章节 >> 2、Python 流程控制', 'create', '已添加。', 40, 3);
INSERT INTO `xadmin_log` VALUES (106, '2024-02-22 21:15:43.224528', '127.0.0.1', '3', '《高等数学》课程的章节 >> 1、高数基础', 'create', '已添加。', 40, 3);
INSERT INTO `xadmin_log` VALUES (107, '2024-02-22 21:16:05.535616', '127.0.0.1', '4', '《公考上岸》课程的章节 >> 1、常识判断', 'create', '已添加。', 40, 3);
INSERT INTO `xadmin_log` VALUES (108, '2024-02-22 21:16:16.319435', '127.0.0.1', '5', '《公考上岸》课程的章节 >> 2、数量关系', 'create', '已添加。', 40, 3);
INSERT INTO `xadmin_log` VALUES (109, '2024-02-22 21:17:47.522606', '127.0.0.1', '1', '《python编程》课程的章节 >> 1、python 基础教程章节的视频 >> 【代码在线运行系统】基于Python+Flask+SQLite3视频教程', 'create', '已添加。', 41, 3);
INSERT INTO `xadmin_log` VALUES (110, '2024-02-22 21:34:15.967476', '127.0.0.1', '1', '《python编程》课程的章节 >> 1、python 基础教程章节的视频 >> 【代码在线运行系统】基于Python+Flask+SQLite3视频教程', 'change', '修改 url', 41, 3);
INSERT INTO `xadmin_log` VALUES (111, '2024-02-22 21:39:31.417390', '127.0.0.1', '1', '《python编程》课程的章节 >> 1、python 基础教程章节的视频 >> 【代码在线运行系统】基于Python+Flask+SQLite3视频教程', 'change', '修改 url', 41, 3);
INSERT INTO `xadmin_log` VALUES (112, '2024-02-22 21:52:31.769988', '127.0.0.1', '1', '《python编程》课程的资源: python安装包', 'create', '已添加。', 42, 3);
INSERT INTO `xadmin_log` VALUES (113, '2024-02-22 22:05:29.267986', '127.0.0.1', '1', '1(位于第100位)', 'create', '已添加。', 35, 3);
INSERT INTO `xadmin_log` VALUES (114, '2024-02-22 22:05:49.244865', '127.0.0.1', '2', '2(位于第100位)', 'create', '已添加。', 35, 3);
INSERT INTO `xadmin_log` VALUES (115, '2024-02-22 22:06:04.443251', '127.0.0.1', '3', '3(位于第100位)', 'create', '已添加。', 35, 3);
INSERT INTO `xadmin_log` VALUES (116, '2024-02-22 22:07:53.537459', '127.0.0.1', '4', '4(位于第100位)', 'create', '已添加。', 35, 3);
INSERT INTO `xadmin_log` VALUES (117, '2024-02-22 22:08:20.001705', '127.0.0.1', '4', '4(位于第1位)', 'change', '修改 index', 35, 3);
INSERT INTO `xadmin_log` VALUES (118, '2024-02-22 22:14:12.521821', '127.0.0.1', '1', 'python编程(位于第1位)', 'change', '修改 title，image，url 和 index', 35, 3);
INSERT INTO `xadmin_log` VALUES (119, '2024-02-22 22:14:42.343453', '127.0.0.1', '2', '高等数学(位于第2位)', 'change', '修改 title，image，url 和 index', 35, 3);
INSERT INTO `xadmin_log` VALUES (120, '2024-02-22 22:15:12.264477', '127.0.0.1', '3', '公务员考试(位于第3位)', 'change', '修改 title，image，url 和 index', 35, 3);
INSERT INTO `xadmin_log` VALUES (121, '2024-02-22 22:15:26.342236', '127.0.0.1', '4', '4(位于第1位)', 'delete', '', 35, 3);
INSERT INTO `xadmin_log` VALUES (122, '2024-02-22 22:49:56.825759', '127.0.0.1', '1', 'organization | 教师 | 讲师操作权限', 'create', '已添加。', 37, 3);
INSERT INTO `xadmin_log` VALUES (123, '2024-02-22 22:50:12.314665', '127.0.0.1', '1', 'organization | 教师 | 讲师操作权限', 'change', '没有字段被修改。', 37, 3);
INSERT INTO `xadmin_log` VALUES (124, '2024-02-22 23:04:14.624071', '127.0.0.1', '14', '[课程机构: 重庆大学]的教师: 高启强', 'change', '修改 image', 28, 3);
INSERT INTO `xadmin_log` VALUES (125, '2024-02-23 07:02:08.132808', '127.0.0.1', '1', '《python编程》课程的章节 >> 1、python 基础教程章节的视频 >> 【代码在线运行系统】基于Python+Flask+SQLite3视频教程', 'change', '修改 url', 41, 3);
INSERT INTO `xadmin_log` VALUES (126, '2024-02-23 07:06:55.982433', '127.0.0.1', '1', '《python编程》课程的章节 >> 1、python 基础教程章节的视频 >> 【代码在线运行系统】基于Python+Flask+SQLite3视频教程', 'change', '修改 url', 41, 3);
INSERT INTO `xadmin_log` VALUES (127, '2024-02-23 07:07:36.695198', '127.0.0.1', '1', '《python编程》课程的章节 >> 1、python 基础教程章节的视频 >> 【代码在线运行系统】基于Python+Flask+SQLite3视频教程', 'change', '修改 url', 41, 3);
INSERT INTO `xadmin_log` VALUES (128, '2024-02-23 07:10:52.210859', '127.0.0.1', '1', '《python编程》课程的章节 >> 1、python 基础教程章节的视频 >> 【代码在线运行系统】基于Python+Flask+SQLite3视频教程', 'change', '修改 url', 41, 3);
INSERT INTO `xadmin_log` VALUES (129, '2024-02-23 15:52:17.538267', '127.0.0.1', '6', '《公考上岸》课程的章节 >> 3、数量关系', 'create', '已添加。', 40, 3);
INSERT INTO `xadmin_log` VALUES (130, '2024-02-23 15:52:34.785224', '127.0.0.1', '6', '《公考上岸》课程的章节 >> 3、逻辑推理', 'change', '修改 name', 40, 3);
INSERT INTO `xadmin_log` VALUES (131, '2024-02-23 15:53:59.918492', '127.0.0.1', '2', '《公考上岸》课程的章节 >> 3、逻辑推理章节的视频 >> 逻辑推理教程', 'create', '已添加。', 41, 3);
INSERT INTO `xadmin_log` VALUES (132, '2024-02-23 15:54:12.798582', '127.0.0.1', '1', '《python编程》课程的章节 >> 1、python 基础教程章节的视频 >> 【代码在线运行系统】基于Python+Flask+SQLite3视频教程', 'change', '修改 url', 41, 3);
INSERT INTO `xadmin_log` VALUES (133, '2024-02-23 15:55:44.682005', '127.0.0.1', '2', '《公考上岸》课程的资源: 逻辑推理资料', 'create', '已添加。', 42, 3);
INSERT INTO `xadmin_log` VALUES (134, '2024-02-23 16:05:51.132569', '127.0.0.1', '1', 'python编程(位于第4位)', 'change', '修改 index', 35, 3);
INSERT INTO `xadmin_log` VALUES (135, '2024-02-23 16:07:43.126177', '127.0.0.1', '1', '老师', 'create', '已添加。', 36, 3);

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (2, 'dashboard:home:pos', '', 3);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
