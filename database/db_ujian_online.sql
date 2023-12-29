/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : db_ujian_online

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 29/12/2023 08:33:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assignment_analytics
-- ----------------------------
DROP TABLE IF EXISTS `assignment_analytics`;
CREATE TABLE `assignment_analytics`  (
  `id_aanalytics` int NOT NULL AUTO_INCREMENT,
  `id_assignment` int NULL DEFAULT NULL,
  `id_student` int NULL DEFAULT NULL,
  `id_question` int NULL DEFAULT NULL,
  `id_option` int NULL DEFAULT NULL,
  `option_char` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `analytics_status` enum('true','false','empty') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `analytics_created` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_aanalytics`) USING BTREE,
  INDEX `id_assignment`(`id_assignment`) USING BTREE,
  CONSTRAINT `assignment_analytics_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_analytics
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_answer_match
-- ----------------------------
DROP TABLE IF EXISTS `assignment_answer_match`;
CREATE TABLE `assignment_answer_match`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `assignment_question_id` int NOT NULL,
  `answer_match_id` int NOT NULL,
  `answer_match_option_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assignment_answer_match
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_answer_singles
-- ----------------------------
DROP TABLE IF EXISTS `assignment_answer_singles`;
CREATE TABLE `assignment_answer_singles`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `assignment_question_id` int NOT NULL,
  `answer_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assignment_answer_singles
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_answer_text
-- ----------------------------
DROP TABLE IF EXISTS `assignment_answer_text`;
CREATE TABLE `assignment_answer_text`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `assignment_question_id` int NOT NULL,
  `answer_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assignment_answer_text
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_begin
-- ----------------------------
DROP TABLE IF EXISTS `assignment_begin`;
CREATE TABLE `assignment_begin`  (
  `id_abegin` int NOT NULL AUTO_INCREMENT,
  `id_assignment` int NULL DEFAULT NULL,
  `id_student` int NULL DEFAULT NULL,
  `time_begin` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `duration` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `total_soal` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_abegin`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2715 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_begin
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_begin_categories
-- ----------------------------
DROP TABLE IF EXISTS `assignment_begin_categories`;
CREATE TABLE `assignment_begin_categories`  (
  `id_acat` int NOT NULL AUTO_INCREMENT,
  `id_begin` int NULL DEFAULT NULL,
  `id_category` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_acat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4839 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_begin_categories
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_begin_subtest
-- ----------------------------
DROP TABLE IF EXISTS `assignment_begin_subtest`;
CREATE TABLE `assignment_begin_subtest`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_begin` int NULL DEFAULT NULL,
  `id_begin_cat` int NULL DEFAULT NULL,
  `id_subtest` int NULL DEFAULT NULL,
  `qty_soal` int NULL DEFAULT NULL,
  `timer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `total_soal` int NULL DEFAULT NULL,
  `order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6958 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_begin_subtest
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_categories
-- ----------------------------
DROP TABLE IF EXISTS `assignment_categories`;
CREATE TABLE `assignment_categories`  (
  `id_acat` int NOT NULL AUTO_INCREMENT,
  `id_assignment` int NULL DEFAULT NULL,
  `id_category` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_acat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_categories
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_class
-- ----------------------------
DROP TABLE IF EXISTS `assignment_class`;
CREATE TABLE `assignment_class`  (
  `id_aclass` int NOT NULL AUTO_INCREMENT,
  `id_assignment` int NULL DEFAULT NULL,
  `id_class` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_aclass`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_class
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_detail_subtest
-- ----------------------------
DROP TABLE IF EXISTS `assignment_detail_subtest`;
CREATE TABLE `assignment_detail_subtest`  (
  `id_detail` int NOT NULL AUTO_INCREMENT,
  `id_assignment` int NULL DEFAULT NULL,
  `id_category` int NULL DEFAULT NULL,
  `id_subtest` int NULL DEFAULT NULL,
  `qty_soal` int NULL DEFAULT NULL,
  `timer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_detail_subtest
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_question
-- ----------------------------
DROP TABLE IF EXISTS `assignment_question`;
CREATE TABLE `assignment_question`  (
  `id_aquestion` int NOT NULL AUTO_INCREMENT,
  `id_assignment` int NULL DEFAULT NULL,
  `id_question` int NULL DEFAULT NULL,
  `val_hide` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_aquestion`) USING BTREE,
  INDEX `id_assignment`(`id_assignment`) USING BTREE,
  INDEX `id_question`(`id_question`) USING BTREE,
  CONSTRAINT `assignment_question_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `assignment_question_ibfk_2` FOREIGN KEY (`id_question`) REFERENCES `ms_question` (`id_question`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_question
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_question_answers
-- ----------------------------
DROP TABLE IF EXISTS `assignment_question_answers`;
CREATE TABLE `assignment_question_answers`  (
  `id_assign_question` int NOT NULL AUTO_INCREMENT,
  `id_assign_begin` int NOT NULL,
  `id_assign_begin_category` int NOT NULL,
  `id_assign_begin_subtest` int NOT NULL,
  `id_question` int NOT NULL,
  `is_true` int NULL DEFAULT NULL,
  `is_mark` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `id_student` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_assign_question`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 656 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_question_answers
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_result
-- ----------------------------
DROP TABLE IF EXISTS `assignment_result`;
CREATE TABLE `assignment_result`  (
  `id_aresult` int NOT NULL AUTO_INCREMENT,
  `id_assignment` int NULL DEFAULT NULL,
  `id_student` int NULL DEFAULT NULL,
  `result_true` int NULL DEFAULT NULL,
  `result_false` int NULL DEFAULT NULL,
  `result_score` float NULL DEFAULT NULL,
  `result_status` enum('lulus','gagal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `result_created` datetime NULL DEFAULT NULL,
  `result_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_aresult`) USING BTREE,
  INDEX `id_assignment`(`id_assignment`) USING BTREE,
  CONSTRAINT `assignment_result_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_result
-- ----------------------------

-- ----------------------------
-- Table structure for category_subtests
-- ----------------------------
DROP TABLE IF EXISTS `category_subtests`;
CREATE TABLE `category_subtests`  (
  `id_asub` int NOT NULL AUTO_INCREMENT,
  `id_cat` int NULL DEFAULT NULL,
  `id_sub` int NULL DEFAULT NULL,
  `val_hide` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_asub`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category_subtests
-- ----------------------------

-- ----------------------------
-- Table structure for ms_admin
-- ----------------------------
DROP TABLE IF EXISTS `ms_admin`;
CREATE TABLE `ms_admin`  (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `full_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `level` enum('admin','guru','staff') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `admin_hide` tinyint(1) NULL DEFAULT 0,
  `admin_created` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_admin`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_admin
-- ----------------------------
INSERT INTO `ms_admin` VALUES (1, 'admin', '$1$Ju3.ei3.$ABHHxCLVKvQhAS1hdA3pU/', 'Administrator', 'admin', 0, '2018-12-07');
INSERT INTO `ms_admin` VALUES (2, 'ganyu', '$1$FFnrGunX$2ySHHn3u/a9e4ap3c7UdA1', 'Ganyu', 'staff', 1, '2021-05-04');
INSERT INTO `ms_admin` VALUES (3, 'agus', '$1$T93.gg4.$blWaGKhT6lgoQiK9E76AB/', 'agus', 'staff', 0, '2023-07-30');
INSERT INTO `ms_admin` VALUES (4, 'aku', '$1$dZo4r84I$/VzY1KjEY8jjP/bNk.4gF1', 'Aku adalah aku', 'staff', 0, '2023-09-05');
INSERT INTO `ms_admin` VALUES (5, 'admin1', '$1$UqjVZbTq$e8mJVhI3BvtErVagsw8W20', 'Admin', 'admin', 0, '2023-10-10');

-- ----------------------------
-- Table structure for ms_assignment
-- ----------------------------
DROP TABLE IF EXISTS `ms_assignment`;
CREATE TABLE `ms_assignment`  (
  `id_assignment` int NOT NULL AUTO_INCREMENT,
  `id_` int NULL DEFAULT NULL,
  `author_` enum('admin','guru','staff') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_lesson` int NULL DEFAULT NULL,
  `assignment_type` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `assignment_order` enum('asc','desc','random') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `assignment_author` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `assignment_kkm` int NULL DEFAULT NULL,
  `question_used` int NULL DEFAULT 0,
  `assignment_path` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `show_report` tinyint(1) NULL DEFAULT 0,
  `show_analytic` tinyint(1) NULL DEFAULT 0,
  `assignment_active` tinyint(1) NULL DEFAULT 0,
  `assignment_hide` tinyint(1) NULL DEFAULT 0,
  `assignment_duration` int NULL DEFAULT NULL,
  `assignment_created` datetime NULL DEFAULT NULL,
  `assignment_updated` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `assignment_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_assignment`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_assignment
-- ----------------------------

-- ----------------------------
-- Table structure for ms_class
-- ----------------------------
DROP TABLE IF EXISTS `ms_class`;
CREATE TABLE `ms_class`  (
  `id_class` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `class_hide` tinyint(1) NULL DEFAULT 0,
  `class_created` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_class`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_class
-- ----------------------------

-- ----------------------------
-- Table structure for ms_lesson
-- ----------------------------
DROP TABLE IF EXISTS `ms_lesson`;
CREATE TABLE `ms_lesson`  (
  `id_lesson` int NOT NULL AUTO_INCREMENT,
  `lesson_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lesson_hide` tinyint(1) NULL DEFAULT 0,
  `lesson_created` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_lesson`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_lesson
-- ----------------------------

-- ----------------------------
-- Table structure for ms_log
-- ----------------------------
DROP TABLE IF EXISTS `ms_log`;
CREATE TABLE `ms_log`  (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `log_author` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `log_desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `log_created` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_log`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_log
-- ----------------------------
INSERT INTO `ms_log` VALUES (1, 'Admin - Administrator', 'Menambahkan user baru', '2018-06-13 08:23:17');
INSERT INTO `ms_log` VALUES (2, 'Admin - Sandi Ramadhan', 'Menghapus data user bernama - shincan', '2018-06-14 14:26:29');
INSERT INTO `ms_log` VALUES (3, 'Guru - Kakashi Hatake', 'Membuat ujian UTS untuk pelajaran Matematika', '2018-06-14 09:23:41');
INSERT INTO `ms_log` VALUES (4, 'admin - Administrator', 'User menambahkan siswa baru', '2021-05-04 02:56:24');
INSERT INTO `ms_log` VALUES (5, 'admin - Administrator', 'User menambahkan siswa baru', '2023-07-30 22:01:02');
INSERT INTO `ms_log` VALUES (6, 'admin - Administrator', 'User menambahkan siswa baru', '2023-09-05 21:33:56');
INSERT INTO `ms_log` VALUES (7, 'admin - Administrator', 'User menambahkan siswa baru', '2023-10-10 08:55:37');

-- ----------------------------
-- Table structure for ms_question
-- ----------------------------
DROP TABLE IF EXISTS `ms_question`;
CREATE TABLE `ms_question`  (
  `id_question` int NOT NULL AUTO_INCREMENT,
  `id_lesson` int NOT NULL,
  `question_` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `question_image` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `question_sound` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `question_created` datetime NULL DEFAULT NULL,
  `question_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `question_hide` tinyint(1) NULL DEFAULT 0,
  `question_level` int NULL DEFAULT NULL,
  `id_type` int NOT NULL,
  `id_sub` int NOT NULL,
  `timer` int NOT NULL COMMENT 'detik',
  PRIMARY KEY (`id_question`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_question
-- ----------------------------

-- ----------------------------
-- Table structure for ms_question_level
-- ----------------------------
DROP TABLE IF EXISTS `ms_question_level`;
CREATE TABLE `ms_question_level`  (
  `id_level` int NOT NULL AUTO_INCREMENT,
  `level_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `level_hide` tinyint(1) NULL DEFAULT 0,
  `level_created` date NULL DEFAULT NULL,
  `level_value` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_level`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_question_level
-- ----------------------------
INSERT INTO `ms_question_level` VALUES (1, '1', 0, NULL, 1);
INSERT INTO `ms_question_level` VALUES (2, '2', 0, NULL, 2);
INSERT INTO `ms_question_level` VALUES (3, '3', 0, NULL, 3);
INSERT INTO `ms_question_level` VALUES (4, '4', 0, NULL, 4);
INSERT INTO `ms_question_level` VALUES (5, '5', 0, NULL, 5);

-- ----------------------------
-- Table structure for ms_question_subtest
-- ----------------------------
DROP TABLE IF EXISTS `ms_question_subtest`;
CREATE TABLE `ms_question_subtest`  (
  `id_sub` int NOT NULL AUTO_INCREMENT,
  `id_cat` int NULL DEFAULT NULL,
  `sub_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sub_hide` tinyint(1) NULL DEFAULT 0,
  `sub_created` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_sub`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_question_subtest
-- ----------------------------

-- ----------------------------
-- Table structure for ms_question_type
-- ----------------------------
DROP TABLE IF EXISTS `ms_question_type`;
CREATE TABLE `ms_question_type`  (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `type_hide` tinyint(1) NULL DEFAULT 0,
  `type_created` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_question_type
-- ----------------------------
INSERT INTO `ms_question_type` VALUES (1, 'Benar Salah', 0, NULL);
INSERT INTO `ms_question_type` VALUES (2, 'Pilihan Berganda', 0, NULL);
INSERT INTO `ms_question_type` VALUES (3, 'Isian Singkat', 0, NULL);
INSERT INTO `ms_question_type` VALUES (4, 'Pilihan Majemuk', 0, NULL);
INSERT INTO `ms_question_type` VALUES (5, 'Menjodohkan', 0, NULL);
INSERT INTO `ms_question_type` VALUES (6, 'Benar Salah Majemuk', 0, NULL);

-- ----------------------------
-- Table structure for ms_student
-- ----------------------------
DROP TABLE IF EXISTS `ms_student`;
CREATE TABLE `ms_student`  (
  `id_student` int NOT NULL AUTO_INCREMENT,
  `id_class` int NULL DEFAULT NULL,
  `student_nis` int NULL DEFAULT NULL,
  `student_nisn` int NULL DEFAULT NULL,
  `student_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `student_password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `student_email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `student_phone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `student_photo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `student_created` date NULL DEFAULT NULL,
  `parent_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parent_phone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parent_password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `student_hide` tinyint(1) NULL DEFAULT 0,
  `student_address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_student`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_student
-- ----------------------------
INSERT INTO `ms_student` VALUES (138, 11, 1234, NULL, 'Anies Ayu Wida', '$1$zOkRPT5k$ZUWlcNYSaPi5L0nRhmprq0', 'user1@gmail.com', '018293839', 'f20907543f8f9d08fd0777b947d96263.jpg', '2023-09-05', NULL, NULL, NULL, 0, 'Jl Asrama Kipal No.5a');

-- ----------------------------
-- Table structure for ms_subtest_categories
-- ----------------------------
DROP TABLE IF EXISTS `ms_subtest_categories`;
CREATE TABLE `ms_subtest_categories`  (
  `id_cat` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cat_hide` tinyint(1) NULL DEFAULT 0,
  `cat_created` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_cat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_subtest_categories
-- ----------------------------

-- ----------------------------
-- Table structure for ms_teacher
-- ----------------------------
DROP TABLE IF EXISTS `ms_teacher`;
CREATE TABLE `ms_teacher`  (
  `id_teacher` int NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `teacher_username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `teacher_password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `teacher_phone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `teacher_email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `teacher_address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `teacher_photo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `teacher_created` date NULL DEFAULT NULL,
  `teacher_hide` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_teacher`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_teacher
-- ----------------------------
INSERT INTO `ms_teacher` VALUES (1, 'Zhongli', 'zhongli', '$1$bRJlXSfi$qCvgjv0U5J8/9kvGNPI.m1', '081231231222', 'zhongli@genshin.com', 'Liyue', '794dfe0f5cfd98d49ca7db4dd1c3aec8.png', '2021-05-04', 0);

-- ----------------------------
-- Table structure for ms_token
-- ----------------------------
DROP TABLE IF EXISTS `ms_token`;
CREATE TABLE `ms_token`  (
  `id_token` int NOT NULL AUTO_INCREMENT,
  `access_token` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 231 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_token
-- ----------------------------
INSERT INTO `ms_token` VALUES (1, '$1$SwwKz6Mu$iNb8fofJ8bUmTshLtcnvH0');
INSERT INTO `ms_token` VALUES (5, '$1$i.qfAVxT$3.kp.sYx.EM5HM.AFnosG1');
INSERT INTO `ms_token` VALUES (7, '$1$VSr09zLg$3TNNdYNfHn8fiu2TrUcAB.');
INSERT INTO `ms_token` VALUES (10, '$1$cm2FcP9V$MGEXCLH6awDvls5aSQJjz0');
INSERT INTO `ms_token` VALUES (20, '$1$C4UeWibu$g5qvUEycqMDTyxqKN9vM9.');
INSERT INTO `ms_token` VALUES (25, '$1$r3ne7.q2$hCszQmqi8a6yoffRE6.IZ0');
INSERT INTO `ms_token` VALUES (30, '$1$EacMwNnj$4lzY1ibWcHJUZ0L2cvcmA0');
INSERT INTO `ms_token` VALUES (32, '$1$IayTUPz4$uFvx19uzqxFqexQux5fne/');
INSERT INTO `ms_token` VALUES (33, '$1$YYG8uYIS$7AAJ5EkiXFUDL9pHeVE6T.');
INSERT INTO `ms_token` VALUES (37, '$1$zFLdl/yU$GLYcGB2OazTB0X4FpazTX0');
INSERT INTO `ms_token` VALUES (39, '$1$0COnhdXN$fvUBq1vohWgtDFgcwMjB2/');
INSERT INTO `ms_token` VALUES (48, '$1$V.fMCb10$8VY2wqSsAZRghwCr56Sf/.');
INSERT INTO `ms_token` VALUES (55, '$1$LI.9VGO5$APdTJ.Fmqxyfu7fQYHuE9/');
INSERT INTO `ms_token` VALUES (62, '$1$VhKcPAyK$KPB4oeeuBbhDYvhRrnDN20');
INSERT INTO `ms_token` VALUES (65, '$1$uBT23WTY$D/ZRt4xAgzn1ErerVuEf41');
INSERT INTO `ms_token` VALUES (66, '$1$RSTMKHjn$zB0Ur0UiTTAETMFJBkRY7/');
INSERT INTO `ms_token` VALUES (67, '$1$FsxGJRLB$XAnwsH1yrUQOdrWLS5f6b.');
INSERT INTO `ms_token` VALUES (72, '$1$TuZ2VZK9$iHTcLykRI61rGVrRANP2i/');
INSERT INTO `ms_token` VALUES (74, '$1$rK3fQELz$EBe4HUTR.c/PQqnDsUqCH.');
INSERT INTO `ms_token` VALUES (75, '$1$wLIPYCeg$2Bmd11Qvgu63n8feNSekW.');
INSERT INTO `ms_token` VALUES (76, '$1$9xNBtB1O$mpT8bP/VcTGoN2VsR1MAw.');
INSERT INTO `ms_token` VALUES (78, '$1$u36ckSwQ$h45sXR/X9OwUpia6BlP0F0');
INSERT INTO `ms_token` VALUES (81, '$1$y7GiMkVr$OzzdVRp3zJxEkMiOdzpAt/');
INSERT INTO `ms_token` VALUES (84, '$1$2fxYNuDT$UDVYatCuyLxwYCjR3E4CC1');
INSERT INTO `ms_token` VALUES (88, '$1$gm0SaiTk$X7suv9QUEfO0NS164zhZ1.');
INSERT INTO `ms_token` VALUES (89, '$1$4zKLQV.h$xjh/LvW6JeZ36LGoVsrV91');
INSERT INTO `ms_token` VALUES (90, '$1$Fpw0Zxoc$5zDZIabn9Dq9wb3EVxLG5/');
INSERT INTO `ms_token` VALUES (91, '$1$BLOUCLzq$6Z2pTmXoCgjMl5M9z9uc70');
INSERT INTO `ms_token` VALUES (92, '$1$4RmOm83D$OYfXiQ9fyW5EB4tY4TmgW/');
INSERT INTO `ms_token` VALUES (93, '$1$uqm85cYK$s.XUvkCbWF8y5zN0BJaic.');
INSERT INTO `ms_token` VALUES (94, '$1$MwRSS/YH$zTXpBrdsqFhSLcP6cce4z0');
INSERT INTO `ms_token` VALUES (98, '$1$YluLmUdf$TdkQYYqShxGOC9Vs69x1j1');
INSERT INTO `ms_token` VALUES (100, '$1$aqOclbnf$oDvLdH8lf4/uw0FzjWghI1');
INSERT INTO `ms_token` VALUES (103, '$1$4qu2e1BE$BjnWCtjReOLBkJIBdHBGN0');
INSERT INTO `ms_token` VALUES (104, '$1$uv2.fm5.$xkzd0oaVPjhmhgxFm9pcu1');
INSERT INTO `ms_token` VALUES (106, '$1$l/0.Kt4.$XEKFPi3A9ASRHuyKAqKh2.');
INSERT INTO `ms_token` VALUES (107, '$1$A23.Jd3.$XgFaDpKnIrjAdW0EzUaHd/');
INSERT INTO `ms_token` VALUES (115, '$1$h5LcjTo5$Kpz5azm1KHSGtbIngBCOK/');
INSERT INTO `ms_token` VALUES (120, '$1$vr1.Ms..$xc4UmVf3tgC669gRkb8hB1');
INSERT INTO `ms_token` VALUES (122, '$1$WY1.ny3.$AUZAs14/Dk6hHMA5.SlTu1');
INSERT INTO `ms_token` VALUES (123, '$1$dK4.iQ5.$G2KaifB.DGBK8oNHWW0WA1');
INSERT INTO `ms_token` VALUES (124, '$1$TF5.gu0.$M9poXXTlKjYgky66C4Zhk/');
INSERT INTO `ms_token` VALUES (125, '$1$bW1.I31.$k1SL7sNBhyUDDKcj4O6ds.');
INSERT INTO `ms_token` VALUES (126, '$1$xX2.mb3.$307mZqYBCou6qcmwyucXQ1');
INSERT INTO `ms_token` VALUES (127, '$1$zL5.Az/.$Wn1DjYgh.CLc8YaUJDxjo.');
INSERT INTO `ms_token` VALUES (128, '$1$k51.dB/.$OCLqCb129IU8hVe3zU4Ni1');
INSERT INTO `ms_token` VALUES (129, '$1$pp0.821.$s30641BCtDf6feaJCz3x6.');
INSERT INTO `ms_token` VALUES (130, '$1$MU0.l7/.$NtQAgxRUT8gcTJ1/ZDMG40');
INSERT INTO `ms_token` VALUES (131, '$1$hZ..Wa4.$7T2JZhGwHVgml1zD69kNh/');
INSERT INTO `ms_token` VALUES (132, '$1$DG2.QA5.$vbDY0bUMCheQpo/LLj91E0');
INSERT INTO `ms_token` VALUES (133, '$1$pz4.84..$fUiB4CZMpKZmAYYsKM37G.');
INSERT INTO `ms_token` VALUES (134, '$1$on5.Rk1.$Yr/yxVdh9GWlaSi2K8n8q.');
INSERT INTO `ms_token` VALUES (135, '$1$lG/.Kq4.$54KJvYuSK1kVMnzrXR5WP/');
INSERT INTO `ms_token` VALUES (136, '$1$PL1.sV3.$oB0ELOI2t7LRnUAVoj/bc.');
INSERT INTO `ms_token` VALUES (137, '$1$Fj5.qM/.$B.Bi2AWV5yadm7xDE2Amz1');
INSERT INTO `ms_token` VALUES (138, '$1$jH1.wj..$s90C9uoKNSEIxUkZ6ujjL1');
INSERT INTO `ms_token` VALUES (139, '$1$am..bP0.$y2jEi0QoQ82BYeN4sc.0u0');
INSERT INTO `ms_token` VALUES (140, '$1$Jj1.ez..$TPF4rQc.65jse16JBPJUV.');
INSERT INTO `ms_token` VALUES (141, '$1$P92.s34.$fQ3/hJ4kIJKOe4QNHwTM60');
INSERT INTO `ms_token` VALUES (142, '$1$26xg0t3U$OodYafhNNEuCa6VJH0T0z1');
INSERT INTO `ms_token` VALUES (143, '$1$kMNohfRU$W8XdY6YjWWZRVWmzC9jlC.');
INSERT INTO `ms_token` VALUES (144, '$1$UfMZ7PbV$GfUCeX2ttKS31O.lxIp0v.');
INSERT INTO `ms_token` VALUES (145, '$1$lylUrXEv$k.kudZwINoGZm7kdsx22Z0');
INSERT INTO `ms_token` VALUES (146, '$1$XDc4wrUz$ei/cY6c3zB4NLC6e7dxCl.');
INSERT INTO `ms_token` VALUES (147, '$1$kc80aqQM$EdHTmgjRY/H6SDOwMSZA.1');
INSERT INTO `ms_token` VALUES (148, '$1$zyM4kDB/$dzwYFRZV89KtApQRoHWaX1');
INSERT INTO `ms_token` VALUES (149, '$1$HR3EmZjD$OLXQnFRtDUmK1NvErZYWV0');
INSERT INTO `ms_token` VALUES (150, '$1$P.TjzJi6$RLkVrzK91HrSyD5ztZ2dP/');
INSERT INTO `ms_token` VALUES (151, '$1$eAG.HzVW$0WvYMIszvb5Cf0MaxtH221');
INSERT INTO `ms_token` VALUES (152, '$1$uBE3cYrp$x69oIqWQ84Bp25Yrmqueb/');
INSERT INTO `ms_token` VALUES (153, '$1$e3SpBeGP$8u7/ekSkL7NnWVkmvXbGL/');
INSERT INTO `ms_token` VALUES (154, '$1$CNx3J7.X$OSpa7M3Cu1QcoeMoLCXA70');
INSERT INTO `ms_token` VALUES (155, '$1$MEBB.xTM$FmISTEyE.EoC7Gj/7x1Ro/');
INSERT INTO `ms_token` VALUES (156, '$1$dCFBrPdz$eQhzQmla0vvH14KQiniU//');
INSERT INTO `ms_token` VALUES (157, '$1$CoVL1mwG$RmIywC2kQkiJ6yISXLkhO.');
INSERT INTO `ms_token` VALUES (158, '$1$bLXoFcxy$hac8xn.VIkoyPjnzJj04H.');
INSERT INTO `ms_token` VALUES (159, '$1$XH9umPed$0SlPt7euEQjE8MIKEC.xW.');
INSERT INTO `ms_token` VALUES (160, '$1$QO0Tqqo7$cVC9WpB5gBnqGAYfCUqdV/');
INSERT INTO `ms_token` VALUES (161, '$1$OcnNfmmv$r8UNTfBQatSdUba1eugrn0');
INSERT INTO `ms_token` VALUES (162, '$1$Ev7so2e1$REZxuD2T2MijzbyXSOVzQ/');
INSERT INTO `ms_token` VALUES (163, '$1$teA2aGvE$lt1eggZdKtU6itRN4Jpxq0');
INSERT INTO `ms_token` VALUES (168, '$1$nKGsp/Bt$5/weNBvp4ae8qIbWSbUk2/');
INSERT INTO `ms_token` VALUES (169, '$1$7i4haNe0$nx0xZngkBF0R0YqQy/hoZ.');
INSERT INTO `ms_token` VALUES (171, '$1$UMpii.F7$lGTwfKY/OuIkHf99z9kSD1');
INSERT INTO `ms_token` VALUES (174, '$1$b4DBSdjw$bbB2XW57aSFC05NQcn0Hc.');
INSERT INTO `ms_token` VALUES (175, '$1$dd43l0T6$CHfvjbT/hSRg4MwWoRh/80');
INSERT INTO `ms_token` VALUES (176, '$1$NnLTDSwQ$8e/f/f9lElkXK5A6vy1z0/');
INSERT INTO `ms_token` VALUES (177, '$1$NJ4uktTq$EFayDFwhfDvNyqqnr7VAk1');
INSERT INTO `ms_token` VALUES (178, '$1$6N4Dvs45$tLA/dyGF7GWVaqOQKWMlb/');
INSERT INTO `ms_token` VALUES (179, '$1$0HCGw9TL$kZnvvCQy6lZ8IuwF8LA58.');
INSERT INTO `ms_token` VALUES (180, '$1$G9A9R2K8$f/1qutbQAAt.539hp72w00');
INSERT INTO `ms_token` VALUES (181, '$1$2mJuFUAG$O/wVQa2EhQWTeBD2CHBtO0');
INSERT INTO `ms_token` VALUES (182, '$1$jp4g1MNu$E9ploDC0Nmhsh7yV02wtG/');
INSERT INTO `ms_token` VALUES (183, '$1$uevjWMmY$iDYhUIIQ2eka.rOXay0hD.');
INSERT INTO `ms_token` VALUES (184, '$1$OvmDX6dJ$9LI4GyLJx69dhgNv11cH7/');
INSERT INTO `ms_token` VALUES (185, '$1$SI.lo3wI$Ccvi04LyQxSKGiBRRVgiT1');
INSERT INTO `ms_token` VALUES (186, '$1$7bX2Rl5R$9EBawwPPn2M0tTyuU.hMG1');
INSERT INTO `ms_token` VALUES (187, '$1$U71Q.bAh$RPq6GNgJfQHe.LK7QaTbb/');
INSERT INTO `ms_token` VALUES (188, '$1$MohJ2eQb$yFddc.KfWpA/IJls3/pMq/');
INSERT INTO `ms_token` VALUES (190, '$1$bhBdX99d$s9G/w2oejZ/tBXO7yJSin1');
INSERT INTO `ms_token` VALUES (191, '$1$4/5CGEJh$O1u6y1VIdcEMq8xk4DzgN0');
INSERT INTO `ms_token` VALUES (192, '$1$V1cvkuxk$hMUYuDSzxENGkpd97TjLy0');
INSERT INTO `ms_token` VALUES (193, '$1$v086TQG5$RVivc/tYXUqt6.V13INAQ0');
INSERT INTO `ms_token` VALUES (198, '$1$WC3KA3JE$N79XcesehnWblUF1FSEmV0');
INSERT INTO `ms_token` VALUES (199, '$1$WuxVxD4x$n6IrbhyIRZZeUoLxBsHQa1');
INSERT INTO `ms_token` VALUES (200, '$1$6cd0aK.q$zXe0CXFj9r4bUS5MhFhnS.');
INSERT INTO `ms_token` VALUES (201, '$1$VH7MJ92F$jROBfskicSoe3avyFUMJ/1');
INSERT INTO `ms_token` VALUES (205, '$1$KE3NDQKm$sOZv/6sQbCyj4uBSMF5Nn/');
INSERT INTO `ms_token` VALUES (206, '$1$IwwCoK2U$KwchgLjU98vkru7gspIOQ.');
INSERT INTO `ms_token` VALUES (207, '$1$dFK3fZvT$8HshP2Ouo5O.aMjUic.7W1');
INSERT INTO `ms_token` VALUES (208, '$1$v42ILCY6$TgNzUTqacSCfWCYM9uaqN0');
INSERT INTO `ms_token` VALUES (209, '$1$punnhhVq$JKRICN9NxENAud9eF3LzY.');
INSERT INTO `ms_token` VALUES (211, '$1$N/WZTdBz$ojcZ8L6Ao/rjd.NzcArCB.');
INSERT INTO `ms_token` VALUES (212, '$1$1ZOg7Q/V$E2AzGJbH9Ootx4UU5ZSeq1');
INSERT INTO `ms_token` VALUES (213, '$1$Ut2dre9q$arnECrlLS6AVUsisK7xBo1');
INSERT INTO `ms_token` VALUES (214, '$1$ozq3RSG7$bh7iZb98WHjnQ3Zw088qT/');
INSERT INTO `ms_token` VALUES (215, '$1$BH.04EwH$SlMe.4Y3oCtNdr2YzwBD./');
INSERT INTO `ms_token` VALUES (216, '$1$xasB1RJC$zpl/H621xMqUg9cvjEMqu/');
INSERT INTO `ms_token` VALUES (217, '$1$LE6CQblL$nxNmbTqI.9HrZgJhDFg4f/');
INSERT INTO `ms_token` VALUES (218, '$1$J0UMBvcg$Fep8dcHPpNNlVfjDhoS4s1');
INSERT INTO `ms_token` VALUES (219, '$1$OWWlZh7O$njs4kaJCB2YVpEjT0o1741');
INSERT INTO `ms_token` VALUES (220, '$1$qzEmGbKu$446TrLcIxN36d9X/nPiRu.');
INSERT INTO `ms_token` VALUES (221, '$1$z81eo5SU$nX4GDq3SZ1cJUbCJT.K2t/');
INSERT INTO `ms_token` VALUES (222, '$1$PGHiapmG$motqLspkVsUjiuA4sKo9Z1');
INSERT INTO `ms_token` VALUES (223, '$1$jqo3JE6P$upBlPMb07xWWZGjwMultl/');
INSERT INTO `ms_token` VALUES (224, '$1$4iG4/m66$uB50i5hYiJGwtRpSnVwgZ/');
INSERT INTO `ms_token` VALUES (225, '$1$R/LRWVRk$xHoxyGo8ceNmHLdFgyot70');
INSERT INTO `ms_token` VALUES (226, '$1$WDPD59GU$RHJBLg32pVSOmaT9u/Soq1');
INSERT INTO `ms_token` VALUES (227, '$1$xB7ueu4d$wPzaZNuoAXimUOCqqQqdP/');
INSERT INTO `ms_token` VALUES (228, '$1$/MML85dt$LZfiY3uKoOetB4b0EhMnR1');
INSERT INTO `ms_token` VALUES (229, '$1$M.d4inCO$l0tC7oL.WUpcKYRnz24EK1');
INSERT INTO `ms_token` VALUES (230, '$1$5BGHBRol$.yUVvEsePHqzL6cU1FMlc0');

-- ----------------------------
-- Table structure for question_answer
-- ----------------------------
DROP TABLE IF EXISTS `question_answer`;
CREATE TABLE `question_answer`  (
  `id_option` int NOT NULL AUTO_INCREMENT,
  `id_question` int NULL DEFAULT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `option_image` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `option_created` datetime NULL DEFAULT NULL,
  `option_updated` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `option_hide` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_option`) USING BTREE,
  INDEX `id_question`(`id_question`) USING BTREE,
  CONSTRAINT `question_answer_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `ms_question` (`id_question`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of question_answer
-- ----------------------------

-- ----------------------------
-- Table structure for question_match
-- ----------------------------
DROP TABLE IF EXISTS `question_match`;
CREATE TABLE `question_match`  (
  `id_option` int NOT NULL AUTO_INCREMENT,
  `id_question` int NULL DEFAULT NULL,
  `option_` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `option_image` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `option_created` datetime NULL DEFAULT NULL,
  `option_updated` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `option_hide` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_option`) USING BTREE,
  INDEX `id_question`(`id_question`) USING BTREE,
  CONSTRAINT `question_match_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `ms_question` (`id_question`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of question_match
-- ----------------------------

-- ----------------------------
-- Table structure for question_match_answer
-- ----------------------------
DROP TABLE IF EXISTS `question_match_answer`;
CREATE TABLE `question_match_answer`  (
  `id_option` int NOT NULL AUTO_INCREMENT,
  `id_match` int NULL DEFAULT NULL,
  `answer_` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `option_image` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `option_true` tinyint(1) NULL DEFAULT 0,
  `option_created` datetime NULL DEFAULT NULL,
  `option_updated` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `option_hide` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_option`) USING BTREE,
  INDEX `id_question`(`id_match`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of question_match_answer
-- ----------------------------

-- ----------------------------
-- Table structure for question_option
-- ----------------------------
DROP TABLE IF EXISTS `question_option`;
CREATE TABLE `question_option`  (
  `id_option` int NOT NULL AUTO_INCREMENT,
  `id_question` int NULL DEFAULT NULL,
  `option_` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `option_image` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `option_true` tinyint(1) NULL DEFAULT 0,
  `option_created` datetime NULL DEFAULT NULL,
  `option_updated` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `option_hide` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_option`) USING BTREE,
  INDEX `id_question`(`id_question`) USING BTREE,
  CONSTRAINT `question_option_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `ms_question` (`id_question`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 242 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of question_option
-- ----------------------------

-- ----------------------------
-- Table structure for st_presence
-- ----------------------------
DROP TABLE IF EXISTS `st_presence`;
CREATE TABLE `st_presence`  (
  `idpresence` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `presence_log` timestamp NULL DEFAULT NULL,
  `nis` int NULL DEFAULT NULL,
  `presence_type` enum('alpha','leave','attend','out','sick') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'attend',
  `presence_out` timestamp NULL DEFAULT NULL,
  `presence_res` enum('finger','mobile','website') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'finger',
  `presence_time` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `notif_sent` int NOT NULL DEFAULT 0,
  `notif_read` timestamp NULL DEFAULT NULL,
  `leave_approve` tinyint NOT NULL DEFAULT 0,
  `leave_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `leave_image` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`idpresence`) USING BTREE,
  INDEX `nis`(`nis`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of st_presence
-- ----------------------------
INSERT INTO `st_presence` VALUES (1, '2018-02-19 09:48:48', 13, 'attend', NULL, 'website', '2018-02-19 10:48:48', 0, NULL, 0, '', '');
INSERT INTO `st_presence` VALUES (2, '2018-02-19 09:48:50', 12, 'attend', NULL, 'website', '2018-02-19 10:48:50', 0, NULL, 0, '', '');
INSERT INTO `st_presence` VALUES (3, '2018-03-03 12:43:50', 2013310016, 'attend', NULL, 'website', '2018-03-03 13:44:01', 0, NULL, 0, '', '');
INSERT INTO `st_presence` VALUES (4, '2018-02-01 13:06:11', 13, 'attend', NULL, 'website', '2018-03-03 14:06:11', 0, NULL, 0, '', '');
INSERT INTO `st_presence` VALUES (5, '2018-02-01 13:06:14', 12, 'sick', NULL, 'website', '2018-03-03 14:06:14', 0, NULL, 0, '', '');
INSERT INTO `st_presence` VALUES (6, '2018-02-04 13:06:27', 13, 'leave', NULL, 'website', '2018-03-03 14:06:27', 0, NULL, 0, '', '');
INSERT INTO `st_presence` VALUES (7, '2018-02-04 13:06:28', 12, 'alpha', NULL, 'website', '2018-03-03 14:06:28', 0, NULL, 0, '', '');
INSERT INTO `st_presence` VALUES (8, '2018-02-05 13:07:02', 13, 'sick', NULL, 'website', '2018-03-03 14:07:02', 0, NULL, 0, '', '');
INSERT INTO `st_presence` VALUES (9, '2018-02-05 13:07:04', 12, 'attend', NULL, 'website', '2018-03-03 14:07:04', 0, NULL, 0, '', '');

-- ----------------------------
-- Table structure for teacher_class
-- ----------------------------
DROP TABLE IF EXISTS `teacher_class`;
CREATE TABLE `teacher_class`  (
  `id_teacher_class` int NOT NULL AUTO_INCREMENT,
  `id_teacher` int NULL DEFAULT NULL,
  `id_class` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_teacher_class`) USING BTREE,
  INDEX `id_teacher`(`id_teacher`) USING BTREE,
  INDEX `id_class`(`id_class`) USING BTREE,
  CONSTRAINT `teacher_class_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `ms_teacher` (`id_teacher`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `teacher_class_ibfk_2` FOREIGN KEY (`id_class`) REFERENCES `ms_class` (`id_class`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of teacher_class
-- ----------------------------

-- ----------------------------
-- Table structure for teacher_lesson
-- ----------------------------
DROP TABLE IF EXISTS `teacher_lesson`;
CREATE TABLE `teacher_lesson`  (
  `id_teacher_lesson` int NOT NULL AUTO_INCREMENT,
  `id_teacher` int NULL DEFAULT NULL,
  `id_lesson` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_teacher_lesson`) USING BTREE,
  INDEX `id_teacher`(`id_teacher`) USING BTREE,
  INDEX `id_lesson`(`id_lesson`) USING BTREE,
  CONSTRAINT `teacher_lesson_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `ms_teacher` (`id_teacher`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `teacher_lesson_ibfk_2` FOREIGN KEY (`id_lesson`) REFERENCES `ms_lesson` (`id_lesson`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of teacher_lesson
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
