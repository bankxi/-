/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : prodb

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 31/10/2019 14:54:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (20, '分类管理组');
INSERT INTO `auth_group` VALUES (19, '图书管理组');
INSERT INTO `auth_group` VALUES (21, '用户管理组');
INSERT INTO `auth_group` VALUES (22, '订单管理组');

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES (8, 19, 61);
INSERT INTO `auth_group_permissions` VALUES (10, 19, 62);
INSERT INTO `auth_group_permissions` VALUES (7, 19, 63);
INSERT INTO `auth_group_permissions` VALUES (9, 19, 64);
INSERT INTO `auth_group_permissions` VALUES (13, 20, 53);
INSERT INTO `auth_group_permissions` VALUES (11, 20, 54);
INSERT INTO `auth_group_permissions` VALUES (12, 20, 55);
INSERT INTO `auth_group_permissions` VALUES (16, 21, 57);
INSERT INTO `auth_group_permissions` VALUES (14, 21, 58);
INSERT INTO `auth_group_permissions` VALUES (15, 21, 60);
INSERT INTO `auth_group_permissions` VALUES (17, 22, 65);
INSERT INTO `auth_group_permissions` VALUES (19, 22, 66);
INSERT INTO `auth_group_permissions` VALUES (18, 22, 68);

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
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add booktype', 7, 'add_booktype');
INSERT INTO `auth_permission` VALUES (26, 'Can change booktype', 7, 'change_booktype');
INSERT INTO `auth_permission` VALUES (27, 'Can delete booktype', 7, 'delete_booktype');
INSERT INTO `auth_permission` VALUES (28, 'Can view booktype', 7, 'view_booktype');
INSERT INTO `auth_permission` VALUES (29, 'Can add users', 8, 'add_users');
INSERT INTO `auth_permission` VALUES (30, 'Can change users', 8, 'change_users');
INSERT INTO `auth_permission` VALUES (31, 'Can delete users', 8, 'delete_users');
INSERT INTO `auth_permission` VALUES (32, 'Can view users', 8, 'view_users');
INSERT INTO `auth_permission` VALUES (33, 'Can add books', 9, 'add_books');
INSERT INTO `auth_permission` VALUES (34, 'Can change books', 9, 'change_books');
INSERT INTO `auth_permission` VALUES (35, 'Can delete books', 9, 'delete_books');
INSERT INTO `auth_permission` VALUES (36, 'Can view books', 9, 'view_books');
INSERT INTO `auth_permission` VALUES (37, 'Can add book imgs', 10, 'add_bookimgs');
INSERT INTO `auth_permission` VALUES (38, 'Can change book imgs', 10, 'change_bookimgs');
INSERT INTO `auth_permission` VALUES (39, 'Can delete book imgs', 10, 'delete_bookimgs');
INSERT INTO `auth_permission` VALUES (40, 'Can view book imgs', 10, 'view_bookimgs');
INSERT INTO `auth_permission` VALUES (41, 'Can add cart', 11, 'add_cart');
INSERT INTO `auth_permission` VALUES (42, 'Can change cart', 11, 'change_cart');
INSERT INTO `auth_permission` VALUES (43, 'Can delete cart', 11, 'delete_cart');
INSERT INTO `auth_permission` VALUES (44, 'Can view cart', 11, 'view_cart');
INSERT INTO `auth_permission` VALUES (45, 'Can add order', 12, 'add_order');
INSERT INTO `auth_permission` VALUES (46, 'Can change order', 12, 'change_order');
INSERT INTO `auth_permission` VALUES (47, 'Can delete order', 12, 'delete_order');
INSERT INTO `auth_permission` VALUES (48, 'Can view order', 12, 'view_order');
INSERT INTO `auth_permission` VALUES (49, 'Can add order detail', 13, 'add_orderdetail');
INSERT INTO `auth_permission` VALUES (50, 'Can change order detail', 13, 'change_orderdetail');
INSERT INTO `auth_permission` VALUES (51, 'Can delete order detail', 13, 'delete_orderdetail');
INSERT INTO `auth_permission` VALUES (52, 'Can view order detail', 13, 'view_orderdetail');
INSERT INTO `auth_permission` VALUES (53, '查看图书类别列表权限', 7, 'show_Booktype');
INSERT INTO `auth_permission` VALUES (54, '添加图书类别信息权限', 7, 'create_Booktype');
INSERT INTO `auth_permission` VALUES (55, '修改图书类别信息权限', 7, 'edit_Booktype');
INSERT INTO `auth_permission` VALUES (56, '删除图书类别信息权限', 7, 'remove_Booktype');
INSERT INTO `auth_permission` VALUES (57, '查看用户列表权限', 8, 'show_Users');
INSERT INTO `auth_permission` VALUES (58, '添加用户信息权限', 8, 'create_Users');
INSERT INTO `auth_permission` VALUES (59, '删除用户信息权限', 8, 'remove_Users');
INSERT INTO `auth_permission` VALUES (60, '修改用户信息权限', 8, 'edit_Users');
INSERT INTO `auth_permission` VALUES (61, '删除图书信息权限', 9, 'remove_Books');
INSERT INTO `auth_permission` VALUES (62, '修改图书信息权限', 9, 'edit_Books');
INSERT INTO `auth_permission` VALUES (63, '添加图书信息权限', 9, 'create_Books');
INSERT INTO `auth_permission` VALUES (64, '查看图书列表权限', 9, 'show_Books');
INSERT INTO `auth_permission` VALUES (65, '修改订单信息权限', 12, 'edit_Order');
INSERT INTO `auth_permission` VALUES (66, '添加订单信息权限', 12, 'create_Order');
INSERT INTO `auth_permission` VALUES (67, '删除订单信息权限', 12, 'remove_Order');
INSERT INTO `auth_permission` VALUES (68, '查看订单列表权限', 12, 'show_Order');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
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
  `date_joined` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$150000$kl1jYIsXafYr$9wRdqJEqvG1itmrXlKu0vuQBilwX4HXKSXvEMSLe9ig=', '2019-10-31 14:21:27.175281', 1, 'yk', '', '', '1259564569@qq.com', 1, 1, '2019-10-30 08:53:04.838435');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$150000$w9EZHOzcQ6Mi$1wm+05y9ho9RzX9al8q+dzqbBqnQlTPFlWJ352ar9eM=', '2019-10-30 10:17:48.821875', 0, 'book', '', '', 'book123@qq.com', 0, 1, '2019-10-30 08:53:31.977210');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$150000$deXbXUXaZw4x$C0SKh/wEHrUvg6W+TmogVxxqbmRHaIGC4u+rNAUleQc=', NULL, 0, 'user', '', '', 'user123@qq.com', 0, 1, '2019-10-30 08:53:56.122289');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$150000$t3DI6TKT24k4$8TWO/Wq7zf9pxLIddRZZlG9a/lb+qJ5W7o6Xb2InIvw=', '2019-10-30 10:20:35.319130', 0, 'type', '', '', 'type123@qq.com', 0, 1, '2019-10-30 08:54:19.506883');
INSERT INTO `auth_user` VALUES (5, 'pbkdf2_sha256$150000$x1c5LWJ7cua0$EV+4rpk9JslC5ovg3px7HS5XuTvuw/FtMrau5ol1zh8=', NULL, 0, 'order', '', '', 'order123@qq.com', 0, 1, '2019-10-30 08:54:41.642709');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
INSERT INTO `auth_user_groups` VALUES (23, 2, 19);
INSERT INTO `auth_user_groups` VALUES (24, 3, 21);
INSERT INTO `auth_user_groups` VALUES (25, 4, 20);
INSERT INTO `auth_user_groups` VALUES (26, 5, 22);

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (10, 'myadmin', 'bookimgs');
INSERT INTO `django_content_type` VALUES (9, 'myadmin', 'books');
INSERT INTO `django_content_type` VALUES (7, 'myadmin', 'booktype');
INSERT INTO `django_content_type` VALUES (11, 'myadmin', 'cart');
INSERT INTO `django_content_type` VALUES (12, 'myadmin', 'order');
INSERT INTO `django_content_type` VALUES (13, 'myadmin', 'orderdetail');
INSERT INTO `django_content_type` VALUES (8, 'myadmin', 'users');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-10-19 17:10:07.823898');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-10-19 17:10:08.101574');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-10-19 17:10:08.732207');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-10-19 17:10:08.845382');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-10-19 17:10:08.857194');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-10-19 17:10:08.958892');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-10-19 17:10:09.035451');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-10-19 17:10:09.090736');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-10-19 17:10:09.103766');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-10-19 17:10:09.204941');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-10-19 17:10:09.209001');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-10-19 17:10:09.220399');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-10-19 17:10:09.275291');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-10-19 17:10:09.347980');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2019-10-19 17:10:09.418004');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2019-10-19 17:10:09.430618');
INSERT INTO `django_migrations` VALUES (17, 'myadmin', '0001_initial', '2019-10-19 17:10:09.525107');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2019-10-19 17:10:09.553951');
INSERT INTO `django_migrations` VALUES (19, 'myadmin', '0002_auto_20191019_2024', '2019-10-19 20:24:30.304861');
INSERT INTO `django_migrations` VALUES (20, 'myadmin', '0003_auto_20191019_2027', '2019-10-19 20:27:52.596654');
INSERT INTO `django_migrations` VALUES (21, 'myadmin', '0004_bookimgs_books', '2019-10-21 20:25:12.677087');
INSERT INTO `django_migrations` VALUES (22, 'myadmin', '0005_cart_order_orderdetail', '2019-10-27 16:37:06.995402');
INSERT INTO `django_migrations` VALUES (23, 'myadmin', '0006_auto_20191029_1148', '2019-10-29 11:48:10.666762');
INSERT INTO `django_migrations` VALUES (24, 'myadmin', '0007_auto_20191029_1610', '2019-10-29 16:10:43.006689');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1uz4z93c4q058ir7zpqxk34df0y98g48', 'NjgwNmMyM2M5MTUyNDA4NmY0M2M0MjMxMmE5MTYxMDI1NWJmNjA3ZDp7InZlcmlmeWNvZGUiOiJGWjVMIiwiX2F1dGhfdXNlcl9pZCI6IjE2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2E2YzdlZmRkODI3YWI3ODQ0NTc2YzA3ZDc1YTVjMDIyMjliYTZlIiwiQWRtaW5Vc2VyIjp7InVzZXJuYW1lIjoieWFzdW8iLCJ1aWQiOjE2fSwiYWRtaW51c2VyIjp7InVzZXJuYW1lIjoieWFzdW8iLCJ1aWQiOjE2fX0=', '2019-10-29 23:45:37.646762');
INSERT INTO `django_session` VALUES ('3ecboshfiaz1kpry0tyarprjivv1cfyj', 'OWIwMTFhYmIzZmFjNDE0N2IzOWQ5NGUwYmJmZjc5MTdjODhlZjMxODp7InZjb2RlIjp7InBob25lIjoiMTMyNDU2Nzk4NzUiLCJ2Y29kZSI6NjYxODN9fQ==', '2019-10-24 00:16:03.627518');
INSERT INTO `django_session` VALUES ('4791zygw7jgvn9oymwl4g6pwyuiufit6', 'NGRmMTgyNDZmZmQ1Yzk5YjgzMTlkZjQ1NTkzZGFkMzg3OWFjZjljMjp7IlZpcFVzZXIiOnsiaWQiOjIwNDMsInBob25lIjoiMTU3OTc2NzA3MzUifX0=', '2019-10-27 18:19:29.949042');
INSERT INTO `django_session` VALUES ('4vs2wa88y6scysp0wsdk87fm1fx2z0y1', 'NWExY2E0OTI4MjIxYTQwMDZhOGVlN2QyMWFhMzI3MTFkOTY5MGU4NDp7InZlcmlmeWNvZGUiOiJYR1lFIn0=', '2019-10-28 23:18:51.747871');
INSERT INTO `django_session` VALUES ('4z3o8qo4dj1mbtfvnfj7qfw1yh4g21z4', 'NGNmMjJhZWRkNDk2NjRjOGE2MjY2ODA5NmQ3ZDQ5NmUxODU1NTcwNTp7IlZpcFVzZXIiOnsiaWQiOjIsInBob25lIjoiMTU3OTc2NzA3MzYifSwidmVyaWZ5Y29kZSI6Ilg3VEoiLCJhZG1pbnVzZXIiOnsiaWQiOjEsIm5hbWUiOiJST09UIiwicGhvbmUiOiIxNTc5NzY3MDczNSJ9fQ==', '2019-10-29 12:21:29.576270');
INSERT INTO `django_session` VALUES ('5tuqslgrm34v4dkeyb3kjmvsw2ykebcf', 'YjUyM2I3ZWRjNzFhYzE2NGQ0MmZlMTQ1MzU5ZDQ4MDcwNTk2OWUyMzp7InZlcmlmeWNvZGUiOiIySVFWIn0=', '2019-10-22 17:31:48.132645');
INSERT INTO `django_session` VALUES ('6wy8ejon29y430fn29kt7d2htc4pzjko', 'NDFlNjYxNGExOGNmOGM1ZWU3ZjZhYzc0NDgxOWU4MmU3YThlODMwMDp7InZlcmlmeWNvZGUiOiJUVFhOIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRkM2Y3NTc0MzI3MWUwNTAyMmIyOWQ1NmYyZTI2ZmUzZGNiMDRmY2YiLCJhZG1pbnVzZXIiOnsidXNlcm5hbWUiOiJ5ayIsInVpZCI6MX19', '2019-10-30 10:02:56.608522');
INSERT INTO `django_session` VALUES ('8rsgzgdmurfodtdpmfcq1dla3s2s1mjx', 'YjJiMzA0YzM3NWZiNzcxMDJiMWJlN2YwMzY0NjEzOTY3N2M4Y2U2OTp7InZlcmlmeWNvZGUiOiJUUjNFIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRkM2Y3NTc0MzI3MWUwNTAyMmIyOWQ1NmYyZTI2ZmUzZGNiMDRmY2YiLCJhZG1pbnVzZXIiOnsidXNlcm5hbWUiOiJ5ayIsInVpZCI6MX0sIlZpcFVzZXIiOnsiaWQiOjEsInBob25lIjoiMTU3OTc2NzA3MzUifX0=', '2019-10-30 14:40:14.425084');
INSERT INTO `django_session` VALUES ('a7ua8qjnyp459tosi6f74girqjng34ta', 'YTliZDM5YjM3OWM1YWZmNDY2MGExNDY3Y2I1NGRjYzYyNzZiOWNlZDp7InZlcmlmeWNvZGUiOiIwQ0o1IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRkM2Y3NTc0MzI3MWUwNTAyMmIyOWQ1NmYyZTI2ZmUzZGNiMDRmY2YiLCJhZG1pbnVzZXIiOnsidXNlcm5hbWUiOiJ5ayIsInVpZCI6MX19', '2019-10-31 15:03:09.845348');
INSERT INTO `django_session` VALUES ('bamej3m8we5lcdq5qx6z5b7f8ifh67rx', 'ZjNmZWQ1ZmU3NGU5MTg2Zjk5ZWI0NTY3MDI2ZjhiM2E3ODdhNTJmODp7InZlcmlmeWNvZGUiOiJST1NRIiwiYWRtaW51c2VyIjp7ImlkIjoxLCJuYW1lIjoiUk9PVCIsInBob25lIjoiMTU3OTc2NzA3MzUifX0=', '2019-10-29 19:53:41.823280');
INSERT INTO `django_session` VALUES ('bmzks8ch8hevcawldfijv8nv6d45ky8j', 'ODUxNGViZjM1MTUzZGNjMjNjODJlYTllZWM1N2MyMzVkMDQwZDFiMjp7InZlcmlmeWNvZGUiOiIwWDNHIiwiYWRtaW51c2VyIjp7ImlkIjoyMDQzLCJwaG9uZSI6IjE1Nzk3NjcwNzM1In0sIlZpcFVzZXIiOnsiaWQiOjIwNDMsInBob25lIjoiMTU3OTc2NzA3MzUifX0=', '2019-10-24 22:50:54.447806');
INSERT INTO `django_session` VALUES ('c6wnhx6mjrjt88gle3b542wfadkxco00', 'NWRiMGQ3M2NhZTA4YTg4NTJjNDNjZDE3M2VkZGViNzQwYWJhM2QxMDp7InZlcmlmeWNvZGUiOiJOU1BOIiwiYWRtaW51c2VyIjp7ImlkIjoyMDQzLCJwaG9uZSI6IjE1Nzk3NjcwNzM1In19', '2019-10-22 23:51:50.924198');
INSERT INTO `django_session` VALUES ('fqxdmnqpfy2kg778lbo3joxg0rh2jy3e', 'ZWUyODY4ZTkxZTgyOWRlOWYzNzQ2YWI0ZDc2NjNkMzEyYTBlZjE5Nzp7InZlcmlmeWNvZGUiOiIzMVdHIiwiYWRtaW51c2VyIjp7ImlkIjoyMDQzLCJwaG9uZSI6IjE1Nzk3NjcwNzM1In19', '2019-10-23 16:05:20.473835');
INSERT INTO `django_session` VALUES ('gbhy1trg9jmel98vetlgtrumivk6eim4', 'YmZmNDIwNjE2OWI4MTRlZTUyNDBiNDZiODJjZjhhNjNiMjc2OGQyOTp7InZlcmlmeWNvZGUiOiJNVzFNIiwiYWRtaW51c2VyIjp7ImlkIjoyMDQzLCJwaG9uZSI6IjE1Nzk3NjcwNzM1In19', '2019-10-23 21:53:32.690898');
INSERT INTO `django_session` VALUES ('jyk44j64n7gs0bdkfukipdbieo0c8xpi', 'YTQ1OGFjMDI5MDBkZDFiY2YwOGNlNDM1Mjc2OWNmYzRiYzA3NzYyZTp7InZlcmlmeWNvZGUiOiJSTEw2IiwiYWRtaW51c2VyIjp7ImlkIjoxLCJuYW1lIjoiUk9PVCIsInBob25lIjoiMTU3OTc2NzA3MzUifX0=', '2019-10-29 17:28:13.664545');
INSERT INTO `django_session` VALUES ('l466svfvzqapet3182vcdi1rnx7b5xdi', 'ZmEyNTNkM2YxNzk0YTlmNGQ0MzMwNGEwNzA4MjQ2N2Q5MjkwNWQ0MTp7InZlcmlmeWNvZGUiOiI3TVFLIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRkM2Y3NTc0MzI3MWUwNTAyMmIyOWQ1NmYyZTI2ZmUzZGNiMDRmY2YiLCJhZG1pbnVzZXIiOnsidXNlcm5hbWUiOiJ5ayIsInVpZCI6MX19', '2019-10-30 12:27:58.964643');
INSERT INTO `django_session` VALUES ('md0whkxxh6sxfarlq2rco2biijkvbv1c', 'YTVkMjQ2OTY4ZGI1NTg2OTc5M2FhZThmMzIzMDAxNTMyYzdmMTk1Yjp7InZlcmlmeWNvZGUiOiI2TUNDIiwiYWRtaW51c2VyIjp7ImlkIjoyMDQzLCJwaG9uZSI6IjE1Nzk3NjcwNzM1In19', '2019-11-05 16:34:51.379010');
INSERT INTO `django_session` VALUES ('nty6ojo9zgcn5h7x1tzyuclnqjc1sxhx', 'MDNhMzg0OGQ5OTg0NmVhYTljYmQ0YmZlOTJjNTdlNGQxNmNkYzg3ZDp7InZlcmlmeWNvZGUiOiJHM0NFIiwiYWRtaW51c2VyIjp7ImlkIjoxLCJuYW1lIjoiUk9PVCIsInBob25lIjoiMTU3OTc2NzA3MzUifX0=', '2019-10-29 21:59:52.523504');
INSERT INTO `django_session` VALUES ('q7st7sf89bdhewmcz9w2ofk0gmq139uc', 'YjMwY2I5ODI4ZjdiNjBhNDkwODM0MzY0NWRmNWFkMGM0MTA0NjkwZTp7InZlcmlmeWNvZGUiOiJTRkMxIiwiYWRtaW51c2VyIjp7ImlkIjoyMDQzLCJwaG9uZSI6IjE1Nzk3NjcwNzM1In19', '2019-10-23 17:43:14.443284');
INSERT INTO `django_session` VALUES ('rgxdrlbhetutw2blzmx6av386zf8btmy', 'ODNhMWRkMmJlMjZjZTBlZDkwY2I3OTk3NGM1OTNlMjAyMTljMDE5OTp7InZlcmlmeWNvZGUiOiIxUlBWIn0=', '2019-10-28 19:28:31.145650');
INSERT INTO `django_session` VALUES ('srwpo9uauh70sj82bpzxp0jdlqevzo96', 'NGRmMTgyNDZmZmQ1Yzk5YjgzMTlkZjQ1NTkzZGFkMzg3OWFjZjljMjp7IlZpcFVzZXIiOnsiaWQiOjIwNDMsInBob25lIjoiMTU3OTc2NzA3MzUifX0=', '2019-10-28 23:08:10.628822');
INSERT INTO `django_session` VALUES ('tiqo08twlpjcr1mdclwqkapqkykwsiwa', 'NGZmNDI5OWY4ZTkzNTQ0YWEwMDRiNTI2Y2Q1YzVkNDBlZjFmNzFjMTp7InZjb2RlIjp7InBob25lIjoiMTU3OTc2NzA3MzciLCJ2Y29kZSI6NTcyMjV9LCJWaXBVc2VyIjp7ImlkIjo0LCJwaG9uZSI6IjE1Nzk3NjcwNzM3In0sInZlcmlmeWNvZGUiOiI4M0NVIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRkM2Y3NTc0MzI3MWUwNTAyMmIyOWQ1NmYyZTI2ZmUzZGNiMDRmY2YiLCJhZG1pbnVzZXIiOnsidXNlcm5hbWUiOiJ5ayIsInVpZCI6MX19', '2019-10-30 23:40:55.760826');
INSERT INTO `django_session` VALUES ('unwg9o4ljdnsshmrr0oh7dwq1qszprni', 'YTJhMGFlYTFjMzA1MGRjMTlhYTUzMmU2YTc5ZTZjMzBhMWI4YTg4Njp7InZlcmlmeWNvZGUiOiJQTERIIiwiYWRtaW51c2VyIjp7ImlkIjoyMDQzLCJwaG9uZSI6IjE1Nzk3NjcwNzM1In19', '2019-10-28 23:20:02.805309');
INSERT INTO `django_session` VALUES ('v9zd933fjdee0cfbqtz1ld328mj9yem1', 'YWZlZTFhZTcwNmY4ZWVlN2YzYmZiNTZmNGJmYzQ3MmQ2OGFjMWNlYTp7InZlcmlmeWNvZGUiOiI4MExEIiwiYWRtaW51c2VyIjp7ImlkIjoyMDQzLCJwaG9uZSI6IjE1Nzk3NjcwNzM1In19', '2019-10-28 17:48:11.744932');
INSERT INTO `django_session` VALUES ('wqiu7upd62j6j96mnkcnehrr6py4gkfw', 'NGRmMTgyNDZmZmQ1Yzk5YjgzMTlkZjQ1NTkzZGFkMzg3OWFjZjljMjp7IlZpcFVzZXIiOnsiaWQiOjIwNDMsInBob25lIjoiMTU3OTc2NzA3MzUifX0=', '2019-10-28 11:52:26.715637');
INSERT INTO `django_session` VALUES ('y6t1a2chvqrukm295mrreogn3191rl58', 'NGRmMTgyNDZmZmQ1Yzk5YjgzMTlkZjQ1NTkzZGFkMzg3OWFjZjljMjp7IlZpcFVzZXIiOnsiaWQiOjIwNDMsInBob25lIjoiMTU3OTc2NzA3MzUifX0=', '2019-10-28 23:28:15.533943');
INSERT INTO `django_session` VALUES ('z15twb4dkyifwxv14l8l6lqjpxtj13tg', 'OTJkOWQyYTBmYzIzMmFiM2IxZTcyYmEyZGEyMTZjYTFmMDZlODg1NTp7IlZpcFVzZXIiOnsiaWQiOjIwNDMsInBob25lIjoiMTU3OTc2NzA3MzUifSwidmVyaWZ5Y29kZSI6IjEwSlkiLCJhZG1pbnVzZXIiOnsiaWQiOjIwNDMsInBob25lIjoiMTU3OTc2NzA3MzUifX0=', '2019-10-27 23:53:36.198342');
INSERT INTO `django_session` VALUES ('zpl4l88mt250o20s7cyq8to90sd3sdwf', 'YjBmYzJkZDJhOTBmYTZmZTM4M2NiYTViMzUxOWNjMDIyYmMyOThmNjp7InZlcmlmeWNvZGUiOiI0RkNWIiwiYWRtaW51c2VyIjp7ImlkIjoyMDQzLCJwaG9uZSI6IjE1Nzk3NjcwNzM1In19', '2019-10-22 16:46:42.642047');

-- ----------------------------
-- Table structure for myadmin_bookimgs
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_bookimgs`;
CREATE TABLE `myadmin_bookimgs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `myadmin_bookimgs_bookid_id_b1db4d79_fk_myadmin_books_id`(`bookid_id`) USING BTREE,
  CONSTRAINT `myadmin_bookimgs_bookid_id_b1db4d79_fk_myadmin_books_id` FOREIGN KEY (`bookid_id`) REFERENCES `myadmin_books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myadmin_bookimgs
-- ----------------------------
INSERT INTO `myadmin_bookimgs` VALUES (1, '/static/uploads/1572349962.328150525259168-1_u_3.jpg', 1);
INSERT INTO `myadmin_bookimgs` VALUES (2, '/static/uploads/1572394611.33415425259168-3_u_3.jpg', 1);
INSERT INTO `myadmin_bookimgs` VALUES (3, '/static/uploads/1572350480.362223425259168-4_u_3.jpg', 1);
INSERT INTO `myadmin_bookimgs` VALUES (7, '/static/uploads/1572353415.29608923992017-1_u_9.jpg', 3);
INSERT INTO `myadmin_bookimgs` VALUES (8, '/static/uploads/1572395754.328584223992017-2_u_16.jpg', 3);
INSERT INTO `myadmin_bookimgs` VALUES (9, '/static/uploads/1572389696.356584323992017-3_u_6.jpg', 3);
INSERT INTO `myadmin_bookimgs` VALUES (10, '/static/uploads/1572383497.336095824101994-4_u_6.jpg', 4);
INSERT INTO `myadmin_bookimgs` VALUES (11, '/static/uploads/1572378875.342789424101994-2_u_6.jpg', 4);
INSERT INTO `myadmin_bookimgs` VALUES (12, '/static/uploads/1572386050.348794224101994-3_u_6.jpg', 4);
INSERT INTO `myadmin_bookimgs` VALUES (13, '/static/uploads/1572335914.04414061201849199_0_1_800x800.jpg', 5);
INSERT INTO `myadmin_bookimgs` VALUES (14, '/static/uploads/1572490645.108267524041704-1_u_6.jpg', 6);
INSERT INTO `myadmin_bookimgs` VALUES (15, '/static/uploads/1572467201.153302424041704-2_u_5.jpg', 6);
INSERT INTO `myadmin_bookimgs` VALUES (16, '/static/uploads/1572446085.1783224041704-3_u_5.jpg', 6);
INSERT INTO `myadmin_bookimgs` VALUES (17, '/static/uploads/1572490799.526470223050483-1_u_1.jpg', 7);
INSERT INTO `myadmin_bookimgs` VALUES (18, '/static/uploads/1572512215.603098923050483-2_u_1.jpg', 7);
INSERT INTO `myadmin_bookimgs` VALUES (19, '/static/uploads/1572485052.511411723414990-1_u_4.jpg', 8);
INSERT INTO `myadmin_bookimgs` VALUES (20, '/static/uploads/1572457833.57393721411890759-1_u_1.jpg', 9);
INSERT INTO `myadmin_bookimgs` VALUES (21, '/static/uploads/1572494905.540690425279755-2_u_2.jpg', 10);
INSERT INTO `myadmin_bookimgs` VALUES (22, '/static/uploads/1572447924.54869725279755-3_u_1.jpg', 10);
INSERT INTO `myadmin_bookimgs` VALUES (23, '/static/uploads/1572457150.571713225279755-4_u_2 (1).jpg', 10);
INSERT INTO `myadmin_bookimgs` VALUES (24, '/static/uploads/1572534366.578718725279755-4_u_2.jpg', 10);
INSERT INTO `myadmin_bookimgs` VALUES (25, '/static/uploads/1572480177.1003925172978-1_u_5.jpg', 11);
INSERT INTO `myadmin_bookimgs` VALUES (26, '/static/uploads/1572455744.105363425172978-2_u_5.jpg', 11);
INSERT INTO `myadmin_bookimgs` VALUES (27, '/static/uploads/1572465153.112366425172978-3_u_3.jpg', 11);
INSERT INTO `myadmin_bookimgs` VALUES (28, '/static/uploads/1572478804.161234625160767-1_u_3.jpg', 12);
INSERT INTO `myadmin_bookimgs` VALUES (29, '/static/uploads/1572531892.232439525102973-1_u_4.jpg', 13);
INSERT INTO `myadmin_bookimgs` VALUES (30, '/static/uploads/1572523087.246449725102973-2_u_3.jpg', 13);
INSERT INTO `myadmin_bookimgs` VALUES (31, '/static/uploads/1572472340.29126528470463-1_u_9.jpg', 14);
INSERT INTO `myadmin_bookimgs` VALUES (32, '/static/uploads/1572501574.035047828470463-2_u_11.jpg', 14);
INSERT INTO `myadmin_bookimgs` VALUES (33, '/static/uploads/1572489699.898766827939257-1_u_6.jpg', 15);
INSERT INTO `myadmin_bookimgs` VALUES (34, '/static/uploads/1572527306.902779327939257-2_u_6.jpg', 15);
INSERT INTO `myadmin_bookimgs` VALUES (35, '/static/uploads/1572466505.555326527941985-2_u_3.jpg', 16);
INSERT INTO `myadmin_bookimgs` VALUES (36, '/static/uploads/1572523922.174026327941678-1_u_2.jpg', 17);
INSERT INTO `myadmin_bookimgs` VALUES (37, '/static/uploads/1572507952.814139627933122-1_u_3.jpg', 18);
INSERT INTO `myadmin_bookimgs` VALUES (38, '/static/uploads/1572474404.193891327941575-1_u_3.jpg', 19);
INSERT INTO `myadmin_bookimgs` VALUES (39, '/static/uploads/1572464858.213062827928834-1_u_2.jpg', 20);

-- ----------------------------
-- Table structure for myadmin_books
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_books`;
CREATE TABLE `myadmin_books`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tuijian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publisher` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pub_date` date NOT NULL,
  `price` double NOT NULL,
  `num` int(11) NOT NULL,
  `ISBN` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myadmin_books
-- ----------------------------
INSERT INTO `myadmin_books` VALUES (1, ' 东野圭吾四大推理套装（共4册）', '东野圭吾的书很多，有些是推理小说，有些不是。他的哪些推理小说值得优先阅读？', '(日) 东野圭吾', '南海出版公司', '2018-05-10', 159, 5000, '25259168124', '东野圭吾四大推理套装，是日本作家东野圭吾的4部经典推理小说精装典藏合集，含《嫌疑人X的献身》《恶意》《新参者》《放学后》。这4本推理小说不仅摘得多项大奖如直木奖、江户川乱步奖、本格推理小说大奖、领衔日本三大推理小说榜年度排行，更获得中国、日本、美国等多国读者高口碑评价，中文简体版销量合计超500万册。\r\n《嫌疑人X的献身》出版后一举包揽5项大奖：134届直木奖、第6届本格推理小说大奖、领衔日本三大推理小说榜年度排行，被美国图书馆协会选为年度图书，中文版销量超300万册，东野圭吾说：“这是我所能想到的至为纯粹的爱情，绝好的诡计。”——数学天才石神，每天都去固定的便当店买午餐，只为看一眼在那里做事的邻居靖子。与女儿相依为命的靖子，失手杀了上门纠缠勒索的前夫。为救靖子，石神挺身料理善后，以数学家缜密的逻辑思考设了一个匪夷所思的局，为靖子提供了天衣无缝的不在场证据，以令人惊骇莫名的诡计诠释了一份无比真挚纯粹的爱情……\r\n                               ');
INSERT INTO `myadmin_books` VALUES (3, '三国演义', '通过对经典的价值阅读，树立学生正确的价值观，培养一生有用的品质 读三国演义培养进取、忠诚、承担的品种', '罗贯中', '商务印书馆', '2016-04-06', 30.6, 5000, '9787100119658', '历史演义扛鼎之作《三国演义》\r\n　　马瑞芳\r\n　　中国古代长篇小说分四种类型：历史演义、英雄传奇、神魔小说、人情小说。《三国演义》是历史演义的开山之作，也是扛鼎之作。\r\n　　古代长篇小说唯一的艺术形式是章回小说。其特点是分回标目、段落整齐、故事连接。这种艺术形式由《三国演义》奠定。《三国演义》原名《三国志通俗演义》，作者罗贯中生活在元末明初。清代毛宗岗父子增删后改称《三国演义》，成为流行本。开头“滚滚长江东逝水”借用明代作家杨慎的词。《三国演义》结构宏伟、人物众多、人物活动地域舞台广大，是最具民族特色的中国故事。\r\n　　历史上三国时代，近百年内，各政治集团的斗争一直没有停息，涌现出一批英雄人物如曹操、诸葛亮、刘备、孙权等。他们以独有的政治抱负、卓越的军事才能，逐鹿中原，留下许多著名的、充满智慧的、对后人有启迪的历史事件。三国故事之所以能长久在民众中流传，首先归功于英雄时代本身。\r\n                               ');
INSERT INTO `myadmin_books` VALUES (4, ' 希区柯克悬念故事全集', '告别平庸的生活，让尖叫、刺激与惊悚震撼死寂的心灵！希区柯克是世界电影大导演七个宗师之一！每一个讲故事的人以及控制故事场景节奏的人都值得收藏和学习。', '[美]希区柯克', '江苏人民出版社', '2016-11-01', 80, 5000, '9787214191502', '《希区柯克悬念故事全集》收录了“悬念大师”希区柯克的《人类的天性》、《倒计时》、《第三种可能》等多部作品，每部都悬念丛生，引人入胜，既为读者提供了想象和思想的空间，也使大家的阅读成为享受。希区柯克的作品并非只靠悬念吸引人，更让人为之震撼的是深刻的内涵。他对人类的心理世界有着深刻的体悟，对人性的看法是相当冷静的，甚至可以说是非常冷酷的——他毫不留情地指出了现代社会的荒谬。于是，人们在他的作品中看到一个个受到诱惑的灵魂，逐步地脱去人性的外衣，滑向罪恶的深渊，越陷越深，难以自拔，最终是害人害已。\r\n                               ');
INSERT INTO `myadmin_books` VALUES (5, '暴走漫画53', '定价：为出版社全国统一定价；', '《暴走漫画》创作部', '宁波出版社', '2019-10-12', 9.2, 200, '9787552634587', '《暴走漫画53》延续暴走团队一贯的幽默风格，全书分为暴走校园、暴走家庭、暴走故事、暴走番外四个板块。有个天兵老婆是一种什么样的体验？泰国风情餐厅的服务生都会说什么？本期暴走动漫资讯带来 “万人票选热血的动漫角色T/O/P10”！《龙珠》《灌篮高手》都榜上有名！暴走脑回路栏目和有趣的灵魂探讨“如果现在有一个能忘掉过去的按钮，你会按吗？”。本期暴走真人秀真人表情包演绎你想不到的“迟到”理由！\r\n                               ');
INSERT INTO `myadmin_books` VALUES (6, '恶意', '与《白夜行》《嫌疑人X的献身》《解忧杂货店》并称东野圭吾四大杰作。无边的恶意深不见底，有如万丈深渊。读完《恶意》，才算真正认识东野圭吾！', '[日]东野圭吾', '南海出版公司', '2016-11-24', 39.5, 5000, '98756452354', '《恶意》是东野圭吾挑战写作极限的长篇杰作，与《白夜行》《嫌疑人X的献身》《解忧杂货店》并称东野圭吾四大杰作。《恶意》深刻揭示人性，故事中无边的恶意深不见底，有如万丈深渊，让人不寒而栗。读完《恶意》，才算真正认识东野圭吾。《纽约时报》称“《恶意》再次展现了东野圭吾对小说的掌控，比起黄金周期间东京的高速公路，《恶意》有更多的纠结、变道和反转。”知名学者止庵认为“《恶意》作为一部推理小说，极尽曲折复杂周密；同时又深刻揭示了人性，达到很多纯文学作品未能达到的深度”。\r\n\r\n畅销作家在出国前一晚被杀，警方很快锁定了凶手。此人供认自己是一时冲动犯下了罪行。案子到此已经可以了结。可办案的加贺警官并不这么认为，因为他找不到凶手作案的动机，凶手也一直对动机避而不谈。加贺不愿草草结案，大量走访。渐渐显露的真相让他感到冰冷的寒意——\r\n\r\n“你心里藏着对他的恶意，这仇恨深不见底，深得连你自己都无法解释。正是它导致了这起案件。这股恶意到底从何而起呢？我非常仔细地调查过，却实在找不出任何合乎逻辑的理由。这是怎样的一种心态啊！就算被捕也不怕，即使赌上自己的人生，也要达成目的。这真是惊人的想法，简直前所未闻。”\r\n                               ');
INSERT INTO `myadmin_books` VALUES (7, '龙族3:黑月之潮(上)', '世界上有一种生命，它的每一次死亡，都是为了归来。\r\n　　【冰川神秘遗骸】【龙王血脉归属】【蛇岐八家阴谋】\r\n　　战与火、罪与罚、自由与荣耀……卡塞尔少年深海挑战龙族之怒！\r\n　《知音漫客》周刊、《漫客小说绘》漫画&小说火热连载中，千万读者热烈追捧！\r\n　　所有人都在追看《龙族》——*经典的热血幻想小说，十年一遇，没有之一！', '江南', '长江出版社', '2012-02-08', 29.8, 5000, '9787549216468', '　　谁也不知道，在人类主宰的这个世界里，有一种叫做龙族的存在，同时也有一种神秘的混血种存在，混血种天生的使命就是——屠龙。\r\n　　1991年冬，军人邦达列夫到达西伯利亚无名港口，他在那里看到了龙族骨骸与基因试验。但是谁也不曾料到，他的到来为这个绝密的基地带来了毁灭。港口爆炸后，他携带神秘物品离开，从此龙族世界的命运发生了改变。与此同时，一个神秘男孩带着女孩儿雷娜塔也悄悄离开了西伯利亚。\r\n　　20年后，日本海域发现龙类心跳信号，校长昂热亲自制定SS计划，混血种少年恺撒、楚子航、路明非接受特别任务空降日本。一到东京，他们就受到了日本分部的盛情接待，执行员源稚生成为他们的导游。三个性格各异的少年带着任务压力来到东京，见分部领袖、交日本朋友、同时也流连街头夜生活、商场购物街，玩得不亦乐乎。随后，三人正式开始水下任务，深潜器将恺撒小组送至八千米深的海域，他们见到了令人惊叹的龙族城市。就在此时，龙类胚胎开始孵化，深潜器突然出现问题，日本分部失去联系，情况变得万分危急，三个少年将面临有史以来*严峻的考验。他们究竟如何摆脱困境？海底龙城有着怎样的历史？蛇岐八家的阴谋是什么？一切的谜底，就在本卷一一揭晓。\r\n　　全新的龙族文化，全新的阅读体验，请细细品读*好看的热血幻想小说——《龙族Ⅲ黑月之潮》上卷！\r\n                               ');
INSERT INTO `myadmin_books` VALUES (8, '龙族3黑月之潮·下', '我们都是小怪兽，都将被正义的奥特曼，杀死！\r\n【逆命之主】【天谴之矛】【龙舞东京】【狂樱震怒】\r\n樱花与怒火、旧事与幽灵、黑日与圣剑……王与王的战斗！不死不休！', '江南', '长江出版社', '2013-12-13', 31.9, 5000, '9787549223220', '逆命者，将被灼热的矛，贯穿在地狱的*深处！\r\n\r\n\r\n\r\n卡塞尔三人组从源氏重工撤出后，再次陷入东京暗流。路明非与绘梨衣为躲避蛇岐八家的追捕，躲进了情人旅馆。绘梨衣是开启白王宝藏的钥匙之一，恺撒与楚子航希望路明非能将绘梨衣带离日本。与此同时，酒德麻衣和薯片妞执行老板的“东京爱情故事”计划，要促成路明非与绘梨衣之间的世纪婚礼，然而路明非却背叛了计划，将绘梨衣送回了蛇岐八家。\r\n\r\n在源稚生的带领下，蛇岐八家挖掘出了藏骸之井。猛鬼众首领王将和政宗在东京塔展开谈判，源稚生却突然到来，战斗陡生，政宗葬生火海，王将却死而复生。\r\n                               ');
INSERT INTO `myadmin_books` VALUES (9, '悟空传 完美纪念版', '《悟空传》，著名作家今何在代表作，畅销十五年白金典藏，影响千万人的网络文学经典。', '今何在', '湖南文艺出版社', '2011-07-15', 94, 5000, '9787540449438', '　一段早已注定的宿命，一段注定悲伤的爱情，一部掀开大陆文学创作高潮的经典作品。\r\n　　面对无法改变的命运，所有人都想逃，所有人都在恨！你呢？\r\n　　唐僧师徒四人面对早已注定的命运踏上了西游的道路。\r\n　　孙悟空、猪八戒虽然神通广大，在命运面前不过是软弱无力的小人物；为求真义灵魂坠入凡尘的金蝉子，永远无法走出被划定的界限；打碎一个琉璃盏被罚下天庭的沙悟净，寻找五百年不过是一个骗局。\r\n　　当梦想注定被毁灭，你是否还有勇气选择彻底地反抗。\r\n                               ');
INSERT INTO `myadmin_books` VALUES (10, '杀死一只知更鸟（纪念版）', '★影响全球5000万家庭的“教养宝典”，出版界销售奇迹，世界上译本☆多的书之一 \r\n★关于勇气与正义的成长教科书，奥巴马、贝克汉姆、奥普拉鼎力推荐\r\n★全世界爸爸的楷模，家庭教育的典范\r\n★良知启蒙，关于如何养成一个好人的品质：正义，宽容，谦逊，风度，勇敢，隐忍以及如何在不公正与充满丑陋的世界上体面地生活……', '哈珀.李 ', '译林出版社', '2018-03-02', 26.5, 5000, '9787544772976', '成长总是个让人烦恼的命题。成长有时会很缓慢，如小溪般唱着叮咚的歌曲趟过，有时却如此突如其来，如暴雨般劈头盖脸……三个孩子因为小镇上的几桩冤案经历了猝不及防的成长——痛苦与迷惑，悲伤与愤怒，也有温情与感动。这是爱与真知的成长经典。\r\n      20世纪30年代，大萧条时期美国南方静谧的小镇，几桩离奇的疑案彻底打破了几个孩子平静的生活：事件的真凶，怪人的谜底，传言背后的真相…… 在父亲的指引下，他们在迷雾中寻找真知，在磨难中历练风度，在不公平中积累正气，经历了暴风骤雨般的成长，也感受了人间的温暖与真情。\r\n                               ');
INSERT INTO `myadmin_books` VALUES (11, '牧羊少年奇幻之旅', '★这本百年一遇的书，能改变一个人的一生\r\n\r\n★语种超过《圣经》，畅销170个国家，销量6500万册\r\n\r\n★被译成70种语言，位居《纽约时报》畅销榜长达427周\r\n\r\n★生活永远是，也仅仅是我们现在经历的这一刻。当你想要某种东西时，整个宇宙会合力助你实现愿望\r\n\r\n★金庸、曹文轩、大江健三郎、茱莉亚·罗伯茨、威尔·史密斯、麦当娜推荐', '（巴西）保罗·柯艾略 ', '北京十月文艺出版社', '2018-01-02', 35, 5000, '9787530217054', '《牧羊少年奇幻之旅》是一部少年追求梦想的寓言故事，更是百年一遇的能改变一个人一生的书，每个人都能在其中找到自己追寻梦想的方式。\r\n\r\n西班牙牧羊少年圣地亚哥接连做了同一个梦，梦见埃及金字塔附近藏有一批宝藏。少年卖掉羊群，历尽千辛万苦一路向南，跨海来到非洲，穿越撒哈拉大沙漠，其间奇遇不断。\r\n\r\n在一位炼金术士的指引下，他终于到达金字塔前，却刚刚悟出宝藏的真正所在……\r\n                               ');
INSERT INTO `myadmin_books` VALUES (12, '在细雨中呼喊', '余华的每一部长篇小说，都震撼着一批又一批的读者。他的长篇小说是中国当代文学中的经典之作。', '余华', '作家出版社', '2017-09-18', 27.8, 5000, '9787506365604', '余华的*部长篇力作。小说描述了一位江南少年的成长经历和心灵历程。作品的结构来自于对时间的感受，确切地说是对记忆中的时间的感受，叙述者天马行空地在过去、现在和将来这三个时间维度里自由穿行，将忆记的碎片穿插、结集、拼嵌完整。作者因本书荣获法国文学和艺术骑士勋章等奖。 \r\n                               ');
INSERT INTO `myadmin_books` VALUES (13, '明朝那些事儿', '全本明朝白话史，当年明月全新修订，明史专家毛佩琦教授审订并作序推荐，全程演绎明朝三百年兴衰风云。 \r\n      全景立体式图文阅读体验，原文一字不少，新增四大板块全新内容——延伸内容、插图、图表、地图。涉及关键词解析、历史背景及相关插图、作战图、形势图、人物关系图等。图解历史，小细节、大事件一目了然，通俗易懂。 自出版后，迅速荣登“新浪图书风云榜”*佳图书、**网“终身五星级*佳图书”，多次斩获“卓越***畅销书大奖”，全国中小学生**十本好书之一，**9届全国书博会金口碑好书榜。 \"  ', '当年明月', '磨铁图书', '2017-03-09', 257.3, 5000, '9787559602152', '序 言 竿头添彩，后出转精——图文版《明朝那些事儿》赘语/毛佩琦\r\n引 言 引子\r\n第一章 童年 \r\n第二章 灾难 \r\n第三章 踏上征途 \r\n第四章 就从这里起步 \r\n第五章 储蓄资本 \r\n第六章 霸业的开始 \r\n第七章 可怕的对手 \r\n第八章 可怕的陈友谅 \r\n第九章 决战不可避免 \r\n第十章 等待最好的时机 \r\n第十一章 洪都的奇迹 \r\n第十二章 鄱阳湖！决死战！\r\n                               ');
INSERT INTO `myadmin_books` VALUES (14, '乖，摸摸头', '★ 他是野生作家，说书人\r\n这么多年来亲生读者皆知，大冰不过是个走江湖的说书人，野生作家而已。\r\n他只想讲故事只会讲故事只是讲故事，文学或文艺，精英或红毯，皆与他无关。\r\n他的本分是写故事。\r\n他所理解的写故事——说人话、析人性、述人间。', '大冰', '北京联合出版有限公司', '2019-10-23', 37.6, 4000, '9787559637406', '于无常处知有情，于有情处知众生。\r\n《乖，摸摸头2.0》——现象级畅销书作家大冰热销450万册作品、新增10余万字升级版！\r\n原书内容全部重新梳理改写，新增100000余字硬核内容：关于杂草敏与弟弟小壕仔；关于独自追梦摄影师阿让；关于毛毛和木头相依为命的后来；关于椰子姑娘和稻子先生千金散尽的后来；关于豆儿和成子炽热情感的后来……五年后的大冰，五年后的TA们，都在发生着新的改变。\r\n\r\n他们是我们此生都很难遇见和结交的人；他们的生活也是我们此生都很难体会到的生活。\r\n他们是大冰身边的江湖，是他江湖里真实存在着的发出微微光亮的逐梦人。\r\n他们让我们相信，我们没有那么孤单，这个世界上真的有人在过着我们想要的生活。\r\n                               ');
INSERT INTO `myadmin_books` VALUES (15, '往事不曾离去', '1、《往事不曾离去》是全球现象级作家、《唐顿庄园》编剧朱利安·费罗斯长篇小说代表作，入选英国理查与朱蒂读书俱乐部夏季书目，畅销书作家、著名主持人蔡康永倾情推荐！\r\n2、《往事不曾离去》出版后，即横扫欧、美、亚各大畅销榜单，畅销全球20国。《星期日泰晤士报》《纽约时报书评》《每日邮报》《出版人周刊》《波士顿环球报》《华尔街日报》等数十家媒体一致推荐！', '（英）朱利安·费罗斯 ', '中国友谊出版公司', '2019-08-27', 30, 5000, '9787505748064', '“我”的老友兼宿敌达米安快要死了。\r\n四十年前，“我”将平民出身的剑桥大学生达米安带入上流社会的社交圈，他却背叛了“我”。“我”和他大吵一架，从此再未见面。四十年后，弥留之际的达米安却委托“我”我帮忙查找他的一个私生子，作为他巨额遗产的继承人。他同时给出了一封神秘的来信，和由六个女人名字组成的名单。\r\n“我”本以为包括自己在内的那个圈子的人都恨透了达米安，可当“我”重拾过往时，却发现了一个迥然不同的达米安，和一段隐秘的爱情……\r\n四十年前*后一场舞会结束了，而“我”却仿佛从未离开那里。\r\n                               ');
INSERT INTO `myadmin_books` VALUES (16, '暗涌', '北美新锐作家二湘长篇新作《暗涌》——宽广视野下，一部关于心灵和爱的小说\r\n\r\n从喀布尔、硅谷，到上海、深圳，再到亚的斯亚贝巴\r\n\r\n职场和创业 战争和创伤 城市和欲望 故乡和童年\r\n\r\n经历心事暗涌，方知何为归属、何处安稳', '二湘', '北京十月文艺出版社', '2019-09-11', 41.4, 5000, '9787530219607', '《暗涌》是北美新锐作家二湘继《狂流》之后的长篇新作，是其“命运交响曲”系列的第二部，依然将海外留学、工作和生活的背景融入写作。因为是切身经历，所以细节逼真、观感真实。\r\n\r\n小说以辗转于国外的主人公吴贵林的人生际遇为书写主线，阿富汗喀布尔，美国硅谷，中国上海、深圳，埃塞俄比亚亚的斯亚贝巴都有他驻留的痕迹，求学、邂逅爱情、职场（外企软件行业）竞争，痛失所爱、自我放逐、故人重逢，他以及小说中的其他人物经历着大多数读者可能一辈子也难有的奇异动荡，不论好坏。吴贵林被赋予了较强烈的悲剧色彩，尖锐的戏剧冲突是围绕他而展开的，作者关注了个人遭遇与战争、经济环境等大议题的碰撞，失误之痛、爱之欢喜，人生的起伏在变幻莫测的环境下更显得扑朔迷离，下一刻命运不知将人挟向何处，故事在平静的表象下暗流涌动。\r\n\r\n每个人经历了心事暗涌，方知何为归属、何处安稳。\r\n                               ');
INSERT INTO `myadmin_books` VALUES (17, '罗生门', '◎日本文坛令人惊叹的“鬼才”芥川龙之介，“在人性阴暗的地方，发掘出摄人心魄的美” 。 \r\n\r\n他为创作而生，也“把创作视为生命”。他聪慧敏感异常，能体悟到人们极其细微的心理变化，为小说注入丝丝“伶俐的鬼气”。作品文字流丽洗练、思想锋利如刀。', '(日)芥川龙之介', '时代文艺出版社', '2019-02-05', 37.4, 5000, '9787538760743', '“我有时会想，二十年后，五十年后，甚或一百年后的事。那时节，已不会知道曾经有过我这样一个人。我的作品集，想必积满灰尘，摆在神田一带的旧书店的角落里，徒然等着读者的光顾吧？……可是，我依然要想。寂寞百年身，哪怕只有一位读者能手捧我的书，在他心扉前，尽管依稀微茫，呈现出一片海市蜃楼……”\r\n天才的芥川何须这样悲观！他对人性的深刻剖析，对艺术的极致追求，已使他成为闻名世界的短篇小说奇才。\r\n    本书按创作时间顺序，收录芥川龙之介代表小说、散文共26篇，从多角度展现“日本短篇小说巨擘”的光辉艺术成就：\r\n    “是当强盗？还是饿死？”（《罗生门》）\r\n    “老僧在除去讨厌的长鼻后，竟然有了新的不安与苦恼！”（《鼻子》）\r\n    “凶杀案涉及的当事人，为什么会抢着当凶手？”（《竹林中》） \r\n    “项羽是不是真正的英雄？”（《英雄之器》）\r\n                               ');
INSERT INTO `myadmin_books` VALUES (18, ' 青春万岁', '新中国70年70部长篇小说典藏', '王蒙', '人民文学出版社', '2019-09-12', 39, 5000, '9787020154395', '歌颂新中国成立七十周年,这是我们一代人的青春\r\n                               ');
INSERT INTO `myadmin_books` VALUES (19, '西北雨', '☆  童伟格是台湾七零后小说家中具代表性的一位，曾获台湾文学金典奖、联合报文学大奖等认可。我们能从其书写中看见魔幻写实、现代主义、内向世代等诸多风格，却无法用单一特定的词概括他，骆以军便曾言：“童伟格的可怕，在于他可以解释其他全部人，而竟无人能解释他。”', '童伟格 后浪', '四川人民出版社', '2019-09-11', 40.8, 5000, '9787220114632', ' 一个家族的命运难测不可解，四代人逃离流散，死亡却始终存在。这部长篇小说被倾诉出口，却只见童伟格使用诗意轻盈的语言与多重变换的人称，让所有人回忆、想象、造梦、书写。在种种近似呓语的碎片化叙事中，亡灵复活行走，地景流转于山村、孤岛，静谧的时光迂回周折，字里行间弥漫着恍惚停滞的气息。全书仿佛一幅卷轴，或是一个莫比乌斯环，故事永不止息；所有的记忆、伤害，甚至连命运与死亡，都在小说中无尽循环。                            ');
INSERT INTO `myadmin_books` VALUES (20, '定长安', '椴公依旧以他犀利精到的视角，为我们展现了一场关于文明建构的历史画卷。', '小椴', '中华书局', '2019-10-02', 24.8, 5000, '9787101138986', '自苻坚在王猛的辅佐下发动政变，占据长安后，整个前秦处于风雨飘摇之势。长安城中，各股势力都变得有如脱缰的野马：有氐族豪强寻衅生事，有先帝苻生与强太后一系死而不僵，更有晋、代、凉、燕等外部势力虎视眈眈。而王猛为苻坚所规划的混六合于一炉的帝王大业，就在这乱局之中缓慢而艰难地展开着……\r\n                               ');

-- ----------------------------
-- Table structure for myadmin_books_typeid
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_books_typeid`;
CREATE TABLE `myadmin_books_typeid`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `books_id` int(11) NOT NULL,
  `booktype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `myadmin_books_typeid_books_id_booktype_id_60f6451f_uniq`(`books_id`, `booktype_id`) USING BTREE,
  INDEX `myadmin_books_typeid_booktype_id_a8e4e7c5_fk_myadmin_booktype_id`(`booktype_id`) USING BTREE,
  CONSTRAINT `myadmin_books_typeid_books_id_9564ca90_fk_myadmin_books_id` FOREIGN KEY (`books_id`) REFERENCES `myadmin_books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `myadmin_books_typeid_booktype_id_a8e4e7c5_fk_myadmin_booktype_id` FOREIGN KEY (`booktype_id`) REFERENCES `myadmin_booktype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myadmin_books_typeid
-- ----------------------------
INSERT INTO `myadmin_books_typeid` VALUES (10, 1, 12);
INSERT INTO `myadmin_books_typeid` VALUES (3, 3, 4);
INSERT INTO `myadmin_books_typeid` VALUES (4, 3, 6);
INSERT INTO `myadmin_books_typeid` VALUES (6, 4, 5);
INSERT INTO `myadmin_books_typeid` VALUES (11, 4, 12);
INSERT INTO `myadmin_books_typeid` VALUES (7, 5, 11);
INSERT INTO `myadmin_books_typeid` VALUES (9, 6, 5);
INSERT INTO `myadmin_books_typeid` VALUES (12, 6, 12);
INSERT INTO `myadmin_books_typeid` VALUES (14, 7, 4);
INSERT INTO `myadmin_books_typeid` VALUES (15, 7, 6);
INSERT INTO `myadmin_books_typeid` VALUES (13, 7, 11);
INSERT INTO `myadmin_books_typeid` VALUES (17, 8, 4);
INSERT INTO `myadmin_books_typeid` VALUES (18, 8, 6);
INSERT INTO `myadmin_books_typeid` VALUES (16, 8, 11);
INSERT INTO `myadmin_books_typeid` VALUES (19, 9, 14);
INSERT INTO `myadmin_books_typeid` VALUES (20, 10, 5);
INSERT INTO `myadmin_books_typeid` VALUES (21, 10, 14);
INSERT INTO `myadmin_books_typeid` VALUES (22, 11, 5);
INSERT INTO `myadmin_books_typeid` VALUES (23, 11, 14);
INSERT INTO `myadmin_books_typeid` VALUES (24, 12, 4);
INSERT INTO `myadmin_books_typeid` VALUES (25, 13, 4);
INSERT INTO `myadmin_books_typeid` VALUES (26, 13, 6);
INSERT INTO `myadmin_books_typeid` VALUES (27, 14, 14);
INSERT INTO `myadmin_books_typeid` VALUES (28, 15, 5);
INSERT INTO `myadmin_books_typeid` VALUES (29, 16, 14);
INSERT INTO `myadmin_books_typeid` VALUES (31, 17, 5);
INSERT INTO `myadmin_books_typeid` VALUES (30, 17, 12);
INSERT INTO `myadmin_books_typeid` VALUES (32, 18, 4);
INSERT INTO `myadmin_books_typeid` VALUES (33, 19, 14);
INSERT INTO `myadmin_books_typeid` VALUES (34, 20, 6);

-- ----------------------------
-- Table structure for myadmin_booktype
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_booktype`;
CREATE TABLE `myadmin_booktype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` int(11) NOT NULL,
  `path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myadmin_booktype
-- ----------------------------
INSERT INTO `myadmin_booktype` VALUES (1, '小说', 0, '0,');
INSERT INTO `myadmin_booktype` VALUES (3, '文学', 0, '0,');
INSERT INTO `myadmin_booktype` VALUES (4, '国内名著', 3, '0,3,');
INSERT INTO `myadmin_booktype` VALUES (5, '国外名著', 3, '0,3,');
INSERT INTO `myadmin_booktype` VALUES (6, '历史小说', 1, '0,1,');
INSERT INTO `myadmin_booktype` VALUES (7, '艺术', 0, '0,');
INSERT INTO `myadmin_booktype` VALUES (8, '经济', 0, '0,');
INSERT INTO `myadmin_booktype` VALUES (10, '漫画', 0, '0,');
INSERT INTO `myadmin_booktype` VALUES (11, '国漫', 10, '0,10,');
INSERT INTO `myadmin_booktype` VALUES (12, '推理小说', 1, '0,1,');
INSERT INTO `myadmin_booktype` VALUES (14, '青春文学', 1, '0,1,');

-- ----------------------------
-- Table structure for myadmin_cart
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_cart`;
CREATE TABLE `myadmin_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `select` int(11) NOT NULL,
  `bid_id` int(11) NOT NULL,
  `uid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `myadmin_cart_bid_id_f7d4ed93_fk_myadmin_books_id`(`bid_id`) USING BTREE,
  INDEX `myadmin_cart_uid_id_26f2428c_fk_myadmin_users_id`(`uid_id`) USING BTREE,
  CONSTRAINT `myadmin_cart_bid_id_f7d4ed93_fk_myadmin_books_id` FOREIGN KEY (`bid_id`) REFERENCES `myadmin_books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `myadmin_cart_uid_id_26f2428c_fk_myadmin_users_id` FOREIGN KEY (`uid_id`) REFERENCES `myadmin_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myadmin_cart
-- ----------------------------
INSERT INTO `myadmin_cart` VALUES (1, 3, 0, 3, 1);
INSERT INTO `myadmin_cart` VALUES (2, 1, 0, 4, 1);
INSERT INTO `myadmin_cart` VALUES (3, 1, 0, 1, 1);

-- ----------------------------
-- Table structure for myadmin_order
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_order`;
CREATE TABLE `myadmin_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `totalprice` double NOT NULL,
  `status` int(11) NOT NULL,
  `ordertime` datetime(6) NULL,
  `paytime` datetime(6) NULL DEFAULT NULL,
  `uid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `myadmin_order_uid_id_bcf75806_fk_myadmin_users_id`(`uid_id`) USING BTREE,
  CONSTRAINT `myadmin_order_uid_id_bcf75806_fk_myadmin_users_id` FOREIGN KEY (`uid_id`) REFERENCES `myadmin_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for myadmin_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_orderdetail`;
CREATE TABLE `myadmin_orderdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `price` double NOT NULL,
  `bid_id` int(11) NOT NULL,
  `orderid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `myadmin_orderdetail_bid_id_34275ede_fk_myadmin_books_id`(`bid_id`) USING BTREE,
  INDEX `myadmin_orderdetail_orderid_id_70abd0b1_fk_myadmin_order_id`(`orderid_id`) USING BTREE,
  CONSTRAINT `myadmin_orderdetail_bid_id_34275ede_fk_myadmin_books_id` FOREIGN KEY (`bid_id`) REFERENCES `myadmin_books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `myadmin_orderdetail_orderid_id_70abd0b1_fk_myadmin_order_id` FOREIGN KEY (`orderid_id`) REFERENCES `myadmin_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for myadmin_users
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_users`;
CREATE TABLE `myadmin_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `face` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nikename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `homeaddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usertype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registerdate` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myadmin_users
-- ----------------------------
INSERT INTO `myadmin_users` VALUES (1, '15797670735', 'pbkdf2_sha256$150000$ZfaKolGcoyxw$dvYGtGn7ZHmtgxIF6e+PHUiLtEismfPo8113Q47UUU0=', '/static/uploads/1572396614.389207jpg', 'ROOT', '风车乡', '男', 'SVIP', '2019-10-29 09:34:41.417216');
INSERT INTO `myadmin_users` VALUES (4, '15797670737', 'pbkdf2_sha256$150000$skepasI5EEgT$KR47z+u+INd2w+mf/c/cVBeaNFV3h6OlEcN9IVQkmo0=', '/static/myadmin/assets/img/timg.jpg', NULL, NULL, NULL, NULL, '2019-10-30 22:41:04.504758');

SET FOREIGN_KEY_CHECKS = 1;
