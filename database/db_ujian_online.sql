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

 Date: 06/09/2023 16:02:49
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
  PRIMARY KEY (`id_abegin`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_begin
-- ----------------------------
INSERT INTO `assignment_begin` VALUES (26, 7, 138, NULL, 0, '62');
INSERT INTO `assignment_begin` VALUES (27, 8, 138, NULL, 0, '42');

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
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_categories
-- ----------------------------
INSERT INTO `assignment_categories` VALUES (37, 7, 2, 0);
INSERT INTO `assignment_categories` VALUES (38, 7, 1, 0);
INSERT INTO `assignment_categories` VALUES (39, 8, 2, 0);

-- ----------------------------
-- Table structure for assignment_class
-- ----------------------------
DROP TABLE IF EXISTS `assignment_class`;
CREATE TABLE `assignment_class`  (
  `id_aclass` int NOT NULL AUTO_INCREMENT,
  `id_assignment` int NULL DEFAULT NULL,
  `id_class` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_aclass`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_class
-- ----------------------------
INSERT INTO `assignment_class` VALUES (37, 7, 11);
INSERT INTO `assignment_class` VALUES (38, 8, 11);

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
  `total_soal` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_detail_subtest
-- ----------------------------
INSERT INTO `assignment_detail_subtest` VALUES (40, 7, 37, 9, 10, '15', 0, 0);
INSERT INTO `assignment_detail_subtest` VALUES (41, 7, 37, 8, 15, '15', 0, 0);
INSERT INTO `assignment_detail_subtest` VALUES (42, 7, 38, 9, 10, '12', 0, 0);
INSERT INTO `assignment_detail_subtest` VALUES (43, 7, 38, 8, 25, '20', 0, 0);
INSERT INTO `assignment_detail_subtest` VALUES (44, 8, 39, 9, 12, '17', 0, 0);
INSERT INTO `assignment_detail_subtest` VALUES (45, 8, 39, 8, 22, '25', 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category_subtests
-- ----------------------------
INSERT INTO `category_subtests` VALUES (2, 2, 9, NULL);
INSERT INTO `category_subtests` VALUES (3, 1, 9, NULL);
INSERT INTO `category_subtests` VALUES (4, 2, 8, NULL);
INSERT INTO `category_subtests` VALUES (5, 1, 8, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_admin
-- ----------------------------
INSERT INTO `ms_admin` VALUES (1, 'admin', '$1$Ju3.ei3.$ABHHxCLVKvQhAS1hdA3pU/', 'Administrator', 'admin', 0, '2018-12-07');
INSERT INTO `ms_admin` VALUES (2, 'ganyu', '$1$FFnrGunX$2ySHHn3u/a9e4ap3c7UdA1', 'Ganyu', 'staff', 1, '2021-05-04');
INSERT INTO `ms_admin` VALUES (3, 'agus', '$1$T93.gg4.$blWaGKhT6lgoQiK9E76AB/', 'agus', 'staff', 0, '2023-07-30');
INSERT INTO `ms_admin` VALUES (4, 'aku', '$1$dZo4r84I$/VzY1KjEY8jjP/bNk.4gF1', 'Aku adalah aku', 'staff', 0, '2023-09-05');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_assignment
-- ----------------------------
INSERT INTO `ms_assignment` VALUES (5, 1, 'admin', NULL, 'UAS', NULL, 'Pak Dadang', NULL, 0, '10-192b791-1', 0, 0, 0, 0, NULL, '2023-09-04 21:44:10', '2023-09-04 21:44:10', NULL);
INSERT INTO `ms_assignment` VALUES (6, 1, 'admin', NULL, 'UAS', NULL, 'Penulis', NULL, 0, '27-192b791-1', 0, 0, 0, 0, NULL, '2023-09-04 21:49:27', '2023-09-04 21:49:27', NULL);
INSERT INTO `ms_assignment` VALUES (7, 1, 'admin', NULL, 'UAS', NULL, 'Ojan', NULL, 0, '36-192b791-1', 0, 0, 0, 0, NULL, '2023-09-05 22:30:36', '2023-09-05 23:20:03', 'Tes Ini');
INSERT INTO `ms_assignment` VALUES (8, 1, 'admin', NULL, 'A+UTS', NULL, 'Yayan', NULL, 0, '35-192b791-1', 0, 0, 0, 0, NULL, '2023-09-05 22:48:35', '2023-09-05 23:20:06', 'Tes Itu');

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
INSERT INTO `ms_class` VALUES (1, 'Penalaran Kuantitatif\n', 0, '2018-01-30');
INSERT INTO `ms_class` VALUES (2, 'Kemampuan Literasi\n', 0, '2018-01-30');
INSERT INTO `ms_class` VALUES (3, 'Kemampuan Verbal\n', 0, '2018-01-30');
INSERT INTO `ms_class` VALUES (4, 'Pengetahuan Alam dan  Sosial', 0, '2018-01-30');
INSERT INTO `ms_class` VALUES (11, 'Ilmu Langlang', 0, '2023-08-25');
INSERT INTO `ms_class` VALUES (12, 'ilmu Hal', 0, '2023-08-25');
INSERT INTO `ms_class` VALUES (13, 'Dadang', 0, '2023-08-25');
INSERT INTO `ms_class` VALUES (14, 'Hantu', 0, '2023-08-25');
INSERT INTO `ms_class` VALUES (15, 'Dadang Nunggala Lala', 0, '2023-08-26');
INSERT INTO `ms_class` VALUES (17, 'Akhlaqul Karimah', 0, '2023-08-22');
INSERT INTO `ms_class` VALUES (18, 'Ilmu Kocak', 0, '2023-08-25');

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_lesson
-- ----------------------------
INSERT INTO `ms_lesson` VALUES (1, 'Ipa', 0, '2018-01-30');
INSERT INTO `ms_lesson` VALUES (15, 'Matematika', 0, '2023-08-25');
INSERT INTO `ms_lesson` VALUES (16, 'Psikologi', 0, '2023-08-22');
INSERT INTO `ms_lesson` VALUES (17, 'Seni Budaya', 0, '2023-08-25');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_log
-- ----------------------------
INSERT INTO `ms_log` VALUES (1, 'Admin - Administrator', 'Menambahkan user baru', '2018-06-13 08:23:17');
INSERT INTO `ms_log` VALUES (2, 'Admin - Sandi Ramadhan', 'Menghapus data user bernama - shincan', '2018-06-14 14:26:29');
INSERT INTO `ms_log` VALUES (3, 'Guru - Kakashi Hatake', 'Membuat ujian UTS untuk pelajaran Matematika', '2018-06-14 09:23:41');
INSERT INTO `ms_log` VALUES (4, 'admin - Administrator', 'User menambahkan siswa baru', '2021-05-04 02:56:24');
INSERT INTO `ms_log` VALUES (5, 'admin - Administrator', 'User menambahkan siswa baru', '2023-07-30 22:01:02');
INSERT INTO `ms_log` VALUES (6, 'admin - Administrator', 'User menambahkan siswa baru', '2023-09-05 21:33:56');

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
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_question
-- ----------------------------
INSERT INTO `ms_question` VALUES (38, 1, 'Ini Benar Salah 1', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:38:59', 0, 3, 1, 2, 60);
INSERT INTO `ms_question` VALUES (39, 15, 'Ini Benar Salah 2', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:38:59', 0, 3, 1, 1, 60);
INSERT INTO `ms_question` VALUES (40, 16, 'Ini Benar Salah 3', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:38:59', 0, 3, 1, 3, 60);
INSERT INTO `ms_question` VALUES (41, 17, 'Ini Benar Salah 4', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:38:59', 0, 3, 1, 6, 60);
INSERT INTO `ms_question` VALUES (42, 15, 'Ini Benar Salah 5', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:38:59', 0, 3, 1, 4, 60);
INSERT INTO `ms_question` VALUES (43, 1, 'Ini soal berganda 1', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0, 3, 2, 3, 60);
INSERT INTO `ms_question` VALUES (44, 16, 'Ini soal berganda 2', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0, 3, 2, 7, 60);
INSERT INTO `ms_question` VALUES (45, 15, 'Ini soal berganda 3', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0, 3, 2, 2, 60);
INSERT INTO `ms_question` VALUES (46, 1, 'Ini soal berganda 4', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0, 3, 2, 4, 60);
INSERT INTO `ms_question` VALUES (47, 17, 'Ini soal berganda 5', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0, 3, 2, 8, 60);
INSERT INTO `ms_question` VALUES (49, 16, 'Ini soal menjodohkan', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:51:24', 0, 3, 5, 3, 60);
INSERT INTO `ms_question` VALUES (50, 17, 'Ini soal isian singkat', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:53:41', 0, 3, 3, 2, 60);
INSERT INTO `ms_question` VALUES (51, 17, '<p>adsasda</p>', NULL, NULL, '2023-09-02 22:55:06', '2023-09-02 22:55:06', 0, 5, 3, 9, 60);
INSERT INTO `ms_question` VALUES (52, 17, 'Ini soal isian singkat', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 22:56:40', 0, 3, 3, 2, 60);
INSERT INTO `ms_question` VALUES (53, 0, 'Contoh Soal', NULL, NULL, '2023-09-02 00:00:00', '2023-09-02 23:01:12', 0, 3, 3, 2, 60);
INSERT INTO `ms_question` VALUES (54, 15, 'Isi jodohkan', NULL, NULL, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0, 3, 5, 3, 60);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_question_subtest
-- ----------------------------
INSERT INTO `ms_question_subtest` VALUES (1, 1, 'Penalaran Kuantitatif', 0, NULL);
INSERT INTO `ms_question_subtest` VALUES (2, 1, 'Kemampuan Literasi', 0, NULL);
INSERT INTO `ms_question_subtest` VALUES (3, 1, 'Kemampuan Verbal', 0, NULL);
INSERT INTO `ms_question_subtest` VALUES (4, 2, 'Pengetahuan Alam dan Sosial', 0, NULL);
INSERT INTO `ms_question_subtest` VALUES (5, NULL, 'Kemampuan Literasi', 1, '2023-08-27');
INSERT INTO `ms_question_subtest` VALUES (6, NULL, 'Ilmu Bagus', 0, '2023-08-27');
INSERT INTO `ms_question_subtest` VALUES (7, NULL, 'Ilmu Laduni', 0, '2023-08-27');
INSERT INTO `ms_question_subtest` VALUES (8, NULL, 'Coba', 0, '2023-08-27');
INSERT INTO `ms_question_subtest` VALUES (9, NULL, 'Tatang', 0, '2023-08-28');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_question_type
-- ----------------------------
INSERT INTO `ms_question_type` VALUES (1, 'Benar Salah', 0, NULL);
INSERT INTO `ms_question_type` VALUES (2, 'Pilihan Berganda', 0, NULL);
INSERT INTO `ms_question_type` VALUES (3, 'Isian Singkat', 0, NULL);
INSERT INTO `ms_question_type` VALUES (4, 'Pilihan Majemuk', 0, NULL);
INSERT INTO `ms_question_type` VALUES (5, 'Menjodohkan', 0, NULL);

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
  PRIMARY KEY (`id_student`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_student
-- ----------------------------
INSERT INTO `ms_student` VALUES (1, 1, 13, NULL, 'Uzumaki Naruto', '$1$Oj.za4JJ$HcNGXRtmtufqADnPdejOD0', 'ssss@gmail.com', '081317097079', NULL, '2018-02-03', '', '', '', 0);
INSERT INTO `ms_student` VALUES (2, 1, 12, NULL, 'Uchiha Hitachi', '$1$Pz.v/aX4$em0/BYcXvHCX6wz9WF8tR1', 'henkur88@gmail.com', '081317545004', '37686cdc646db9f7ec6bc34640ff3f5b.jpg', '2018-02-05', 'Fulan', '081318009525', '', 0);
INSERT INTO `ms_student` VALUES (3, 6, 2013310016, NULL, 'Sandi Ramadhan', '$1$/AaWtU6g$lGlYVOmAKeJS9Z9N2o6ny.', 'sandi@gmail.com', '123123123', '7819f999980c2c4b066700590827c5d3.jpg', '2018-02-07', 'Naruto', '123123123', '$1$DJBcKA2r$Ez4ipe2ys2waSZURjRxY3/', 1);
INSERT INTO `ms_student` VALUES (4, 8, 9076, NULL, 'Aditya Wiryawan', '$1$erlm5SBK$NVVGYTZ7warfZ7sc4nuz8.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (5, 8, 9077, NULL, 'Afrialia Winda Nabila', '$1$YkfgImRC$N8fixQG0qUT9v.OGSBHtm/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (6, 8, 9078, NULL, 'Ajeng Setiawati', '$1$FXhFTT9z$Xtrj62OTA/CVnwy3w87W80', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (7, 8, 9079, NULL, 'Akmal Triputra', '$1$UabDdfhB$Q5PUk7IKILPhBzbx0ydMS/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (8, 8, 9080, NULL, 'Amberly Anadya P', '$1$95/76VGF$HxNGpOuq5Cd5klpAAtrk8.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (9, 18, 9081, NULL, 'Arief Budiman', '$1$oSQbd4dL$6lr01vnEo6RfzoiytNyay.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (10, 18, 9082, NULL, 'Diandrani Alegra F', '$1$MjMPlu3D$S/kRUayEAWJOzMCPgtc8Z/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (11, 18, 9083, NULL, 'Dyah Kinanti', '$1$Fhq8ROmD$Cbq59sLQQ7uqWqv2oP932.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (12, 18, 9084, NULL, 'Fera Cesilia', '$1$0j7hodSJ$GpbRQAVwARz3ObZhgRnq6/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (13, 18, 9085, NULL, 'Fina Aulia W', '$1$K/vC71ly$o94VycCCAfHlkPXmLY5280', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (14, 18, 9086, NULL, 'M. Haykal', '$1$euz0qEj6$TWSdO.tDGObfo6.REqEoH1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (15, 18, 9087, NULL, 'Irma Julia', '$1$KCgJE3pX$PWfzKZZdOF3s1mgnC51db0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (16, 18, 9088, NULL, 'Kayla Mahira', '$1$9AjrxzKd$tUrBa8wxPlM6WCOMi0Lua/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (17, 18, 9089, NULL, 'Komang Ayu', '$1$KHM0b11g$xydaFCJx/HhSmp9SBIFot/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (18, 18, 9090, NULL, 'Lidya Caterine', '$1$nIQQYmSZ$w7Glpggjr8nyNfGBdo750/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (19, 18, 9091, NULL, 'M. Noufal Afif', '$1$UWJgawKp$f7sBLD.0CnMmYZWiXdFho0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (20, 18, 9092, NULL, 'Muti\'ah Yasmin', '$1$GhQPkTsi$mlH3PuEkIsqGSgm6Ymvpf/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (21, 18, 9093, NULL, 'Najwa Tjalib', '$1$AWDBEYQ8$PZ0Dk22eT5hx5asF6qpFG1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (22, 18, 9094, NULL, 'Rico Kurniawan A.', '$1$F7XYCuYg$lxDJf9.tuR31VkKok4RAg.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (23, 18, 9095, NULL, 'Ridwan Syah P', '$1$HQ7usDUk$9XRX/HGzYCCJwnGWp1Ea5.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (24, 18, 9096, NULL, 'Shahna Aulia G', '$1$wjRsIL1C$aBvqpMTF9HvvvgM1rHpOa1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (25, 18, 9097, NULL, 'Suci Mahadewi', '$1$1eonVFnk$bYTqyisYfn430H2CcROJu0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (26, 18, 9098, NULL, 'Syafira Tasha H', '$1$8tpJWoqz$Fz/ihTynaIZmSq6/B7GWh1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (27, 18, 9099, NULL, 'Wahyu Satrio W', '$1$P3FTFCEg$7fsFBpeCBIriE9u56bBuC1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (28, 18, 9100, NULL, 'Adela Nurma Yasya', '$1$NslmQex4$VwKLE2MCgJ.QoWjXkElMV1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (29, 14, 9101, NULL, 'Annisa Salsabila', '$1$NRjXderV$8ea8GBIcc5RT/lDRle3Ub1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (30, 14, 9102, NULL, 'Alvito Rahmadhani', '$1$2LKl8hDt$l.btgFXa2W2mteaZ.NNkv1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (31, 14, 9103, NULL, 'Arya Adi Putra', '$1$JfiZS7Wf$JrIrAsz7Bf2wnV38Q3oZR0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (32, 14, 9104, NULL, 'Ataya Ifada Z', '$1$ruXkX/4T$u.Y1fwvtvu3pZSVr6EXIA0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (33, 14, 9105, NULL, 'Dianita Alvina', '$1$t3rOckvT$2N1HUKUgeonlFW3wpeFig.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (34, 14, 9106, NULL, 'Fajar Ezra', '$1$3zLrH0jE$v71ey7qmV.f6fPFBXLWag0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (35, 14, 9107, NULL, 'Ferdian Aditya', '$1$70GRZR8j$A67dB8OOFF54.nyIczZPK1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (36, 14, 9108, NULL, 'Kevin Deniswara', '$1$1XsvRkMq$Jl.X9Ae69H2I5u/1AQ.9O1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (37, 14, 9109, NULL, 'Hesti Amaliyah', '$1$4OSXKiLR$OXJIfOYKFhv61udf.mHE20', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (38, 14, 9110, NULL, 'Khansa Alifah', '$1$S9ab1io3$c7vetBzQodnr.me2dehA61', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (39, 14, 9111, NULL, 'Laila Farhatul J', '$1$lus2Edox$2rWBIQI3IKwPdMQp96o4..', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (40, 14, 9112, NULL, 'Ikhwan Bayu', '$1$on3d76x.$k0kGtHef.MsF/hpgtcGjS/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (41, 14, 9113, NULL, 'M. Darmansyah', '$1$LlIcLLp2$KynMs76Ife28VL6GiA9I7/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (42, 14, 9114, NULL, 'M Faris. R', '$1$9ppqvZYd$Zw5ehvSwzImFCNxbgMpzY0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (43, 14, 9115, NULL, 'Naufal Rafiandy', '$1$c/GD92Xy$0ROFwzcWEBP2vJj9T6NxW1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (44, 14, 9116, NULL, 'Nurul Al-Insani', '$1$uxM1L9rD$UfGhu59n.42YUtC/HuMSv0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (45, 14, 9117, NULL, 'Rachel Putrindoyo', '$1$yrJDYVJX$Rxk3znNWedzEu8C1evidz/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (46, 14, 9118, NULL, 'Reza Pradipta A', '$1$76T4BYxK$ZxtIDr2F18ADr4N1yik2B0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (47, 14, 9119, NULL, 'Rizky Alif', '$1$SoeNhsNh$jA8x0OitYxyFWob8XDYb./', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (48, 14, 9120, NULL, 'Risyafiqa N', '$1$HgvLejJF$qt8w9jIsrbC8BDWIi0PDX.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (49, 17, 9121, NULL, 'Sahla Amrina', '$1$Rus/k61T$pV9CXh7K.u8rNPcmmf7Sh/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (50, 17, 9122, NULL, 'Salsabila Salma', '$1$9RTQINH6$MAlcdbmvU.Pa/Hyc6XqvX0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (51, 17, 9123, NULL, 'Syifa Ibtikal', '$1$iJTUK53j$aFAQ2twekYC1wjGfwzNl81', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (52, 17, 9124, NULL, 'Tiara Sastya V', '$1$EBF/0JoA$SCVA/LuUx..IGtFxfi5wl1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (53, 17, 9125, NULL, 'Titto Nugraha', '$1$d7HLDrBn$tYyGTXPqnU0pdwWjGLm59/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (54, 17, 9126, NULL, 'Utari', '$1$YbiSc70k$d25qjazEvXGaMDAf3P71D1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (55, 17, 9127, NULL, 'Yasmin Darin', '$1$t9GsvCEz$8tocpsECk23fCqvpjGLxM.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (56, 17, 9128, NULL, 'Zahra Hauni', '$1$TwkPdyLc$6QCsrZ07Fqtu.DC9QAk0T/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (57, 12, 9001, NULL, 'Adinda Ghina', '$1$Q6trXAnJ$hDGtf6HowCZRCDN/ONBTP.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (58, 12, 9002, NULL, 'Afifah Najmi', '$1$Gx63A0TH$ARJP7OBKbalUBajiwh/NW1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (59, 12, 9003, NULL, 'Annisa Fath', '$1$vr9D20vs$kgfBN3IF0QikwpH71i4at.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (60, 12, 9004, NULL, 'Audira Julyza', '$1$QpDCy5Cf$dzdgwl2r62caGRLk/zBXo/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (61, 12, 9005, NULL, 'Daniel Vido', '$1$v5OJsfRa$d3bFu3mPcplluX6Bhop40/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (62, 12, 9006, NULL, 'Ester Mauren', '$1$qwImjW0L$xmp7IZLyBFziIVJNhNQR90', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (63, 12, 9007, NULL, 'Gladis Septa', '$1$cxJ3HRyI$NbxSSjr6yv4GH97dtB6xQ/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (64, 12, 9008, NULL, 'Herlina Regina', '$1$1shkJ2gG$SO.JX0HcaK118hcLK7qzv0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (65, 12, 9009, NULL, 'Indy Alifia', '$1$zsNdqAKS$4mppFbnLlo6Njbr5Zgz./.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (66, 12, 9010, NULL, 'Jesica Eunike', '$1$aEehEmUI$vJt7IHaaiDC54doUXVdOb/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (67, 12, 9011, NULL, 'Jesika Natalia', '$1$chjIt6WK$ha3aSz.RgAYlZxWdnUoQw.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (68, 12, 9012, NULL, 'Nanda Sari H', '$1$6CVxdneK$aaj096NsbNFAYuHBSCJXJ.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (69, 12, 9013, NULL, 'Natasya Veryana', '$1$lJ9mcNRE$7J2n.qu0Tr/KKGqqDoC/I.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (70, 12, 9014, NULL, 'Naura Najwandari', '$1$eCPB2B9a$2eKgVcCOTbxcKl3ECRvwi1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (71, 12, 9015, NULL, 'Maryl Abrary', '$1$NoQAoadi$UHr4eKY/HRD.JMJboVgbq/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (72, 12, 9016, NULL, 'Rafif Bani', '$1$RjTwHIw4$Qxlv8ev7qWOXunTICsxgT.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (73, 12, 9017, NULL, 'Rifa Saidiyah', '$1$uk1C4pS1$/gN5bYyvAqT8gno8xp56d1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (74, 12, 9018, NULL, 'Sabian Azarya', '$1$M75TEYAK$p44gn3pdhaLSw/o5.jGP4.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (75, 12, 9019, NULL, 'Vera Seftia', '$1$s75Asl1r$RHKrCuBjDp4FclxDeqB8Z.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (76, 12, 9020, NULL, 'Sonia Edwina', '$1$cZ54VykE$nxM3RiFJiClbyuv1elxi3.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (77, 13, 9021, NULL, 'Rifa Nabila P.D', '$1$LLxG698J$qzN4.TEtNy2g.wFP06vZf.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (78, 13, 9022, NULL, 'Adillah Vatanci', '$1$yk/vnorx$47MvHGIPt2DIvOBPfmC3F/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (79, 13, 9023, NULL, 'Alifarsya Ihsan', '$1$HqCixanB$wPzoB29S0TkG7M.7qnWSA0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (80, 13, 9024, NULL, 'Daniel Victorio', '$1$hGe4Gbbz$S646QYZy4goka7zBr/0qV0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (81, 13, 9025, NULL, 'Harla Syntia', '$1$NUU.9ybA$htUtXCSCFlnG99RnaftsD0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (82, 13, 9026, NULL, 'Iman Wirayudha', '$1$ggaZZmKg$F7VHjKsVsns0/0rapWs1u0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (83, 13, 9027, NULL, 'Jeffrey Edbert', '$1$FyJd7qJV$0RGDqzcThpLvOoQVJwlc21', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (84, 13, 9028, NULL, 'Kefee Alim', '$1$9gBpf5/4$B2wVAlps8IG3Q723kpL7Y1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (85, 13, 9029, NULL, 'Lutfiyah Azahara', '$1$D4JwCCtm$Nrz/0jirCIWTyeAR1eth3/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (86, 13, 9030, NULL, 'M. Farhan Ramadhan', '$1$golVRcN4$tPBKHN.0QosiEyVHPrSUH/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (87, 13, 9031, NULL, 'M. Satria Ramadhan', '$1$gqZ9/Bjx$rPgkE2NJZIMBInbKsDOJo1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (88, 13, 9032, NULL, 'M. Rafi Adiwibowo', '$1$0KirVxFp$pS3ehu19rt0niRKC0EubH0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (89, 13, 9033, NULL, 'M. Naufal Daffa', '$1$nzfUAJrf$1Y.9uqchvXHHSr.VwFfMn1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (90, 13, 9034, NULL, 'Paramitha Prastyawati', '$1$kskVW1pA$eRyeqoLibouGI1z2eQTMI.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (91, 13, 9035, NULL, 'Raihan Fakhri', '$1$yqPHIN0f$.Lqgg0xJ/HRxLp2Km..S//', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (92, 13, 9036, NULL, 'Rany Bida Rosalia', '$1$ntEZJm45$3clQoP/iSRcGDdMHu00E3/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (93, 13, 9037, NULL, 'Rangga Wahyu R', '$1$p66JsLSG$iHMDH5h/ZiOe41kfZfU0m.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (94, 13, 9038, NULL, 'Safa Nuria', '$1$GkdO0Xu/$o0CxEWXZoSBZvyw54.X9E/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (95, 13, 9039, NULL, 'Shafadyna Putri', '$1$jkKIowrL$aVaLz6V9dCyhliR5K/2440', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (96, 13, 9040, NULL, 'Rachel Florencia', '$1$dHbPYU53$zEPYvGMnTy1sv6JcWNUDo/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (97, 15, 9041, NULL, 'Rakha Abyan', '$1$RawGfkvv$MUvtFT5YcBRXax4O5smcz1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (98, 15, 9042, NULL, 'Talitha Alya', '$1$4SzXui2b$G9vDSNnzamXyJ2lpnUk.80', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (99, 15, 9043, NULL, 'Wina Fakhiro', '$1$UyudO6o3$TMhOSITwCgjKhkZtr8VQC.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (100, 15, 9044, NULL, 'Yohana Bella', '$1$KYilPah5$FIP3jfKR.NPjo2jmLmqYL.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (101, 15, 9045, NULL, 'Yovan Fajar', '$1$Zkelxpts$KsEhSVxAVy.MAWH.fjyQL.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (102, 15, 9046, NULL, 'Yudhistira', '$1$SeqvA4oh$P64xp6kX33zABSBg32QZV.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (103, 15, 9047, NULL, 'Sebastian Bintang', '$1$NY5QO9MV$fymdCm7t6Zjam/1pdkhoC1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (104, 15, 9048, NULL, 'Dantyo', '$1$Ox9do.Ff$8eA5nBqtwghdXAAx8PH/f0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (105, 15, 9049, NULL, 'Fikri Mumtaz', '$1$/lbRap7i$T14vgWUjKT7m5N3TsJIU2.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (106, 15, 9050, NULL, 'Muhammad Najmi', '$1$cvdSaAj3$oFf2d/Ytkor1Dt2RIv6kP.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (107, 15, 9051, NULL, 'Putri Rania', '$1$nPWcT07E$5uat3DvhGsNAz.sYhwEyb/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (108, 15, 9052, NULL, 'Ahmad Dzaki M', '$1$3QQKRYYz$lHCtB7/KAxzbzW4I86DtV/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (109, 15, 9053, NULL, 'Amanda Salsabila', '$1$C210MjiL$1UN8Ig5LeQFz.Elu9tsT20', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (110, 15, 9054, NULL, 'Athaya Rahma ', '$1$dkbaLsUN$BcfYaeko01xWwo2zk.Uw6.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (111, 15, 9055, NULL, 'Calvin Henry', '$1$79wZp6hF$zbFDaeWkUXI.LXHXB5ifE0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (112, 15, 9056, NULL, 'Chantika Alena', '$1$tPRE/p6v$HsrJ1RywC0Ydh7nod.aLs0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (113, 15, 9057, NULL, 'Daffa Dary', '$1$4531sqVd$DzIKQw0ZPjyf8UAjp8lPU0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (114, 15, 9058, NULL, 'Dikson Immanuel', '$1$Ssg0Jbrf$UxYgDi5KF3TnMF0LXKrs81', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (115, 15, 9059, NULL, 'Fadil Daffa', '$1$o.NqJQmO$UxjC8MIdBo17MuNF9bn/r.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (116, 15, 9060, NULL, 'Gloria Estefania', '$1$KwZx.Ea7$1tA45COsSdaUREq0U06Dk.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (117, 8, 9061, NULL, 'Keyza Rizkia', '$1$FDrH41wK$l/iTsReFVeV7HMLYn94Gq/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (118, 8, 9062, NULL, 'Laura Devi', '$1$a1x5mrKx$mnopDfQaFEf/I5nQjc9eC.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (119, 8, 9063, NULL, 'Mayla Rahma', '$1$YvTqA3iG$PRJYdT0cXbc1NcmyoMe7x1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (120, 8, 9064, NULL, 'Mikhala J', '$1$giPksT4u$XqngwO3Xoo9di5spY1SsC/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (121, 8, 9065, NULL, 'Mutiara Fadhilah', '$1$0.kDn4Dk$STTk0msZ2yHtir9GPCuMD.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (122, 8, 9066, NULL, 'Natasya Febriana', '$1$d2AZcluH$sZFVqU62ew3ujGFDFWsM/1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (123, 8, 9067, NULL, 'Raisya Alivia', '$1$4qzIyIfd$FMj4JmYABDUqStXjp88ZD/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (124, 8, 9068, NULL, 'Raisa Kendria', '$1$/vQD0MGp$6uelIbas1LoGHE4nvwt2q1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (125, 8, 9069, NULL, 'Reyna Henin', '$1$7MoWLtgm$/Ag8WDeyupUY7zKNstFi.1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (126, 8, 9070, NULL, 'Synthia Putri', '$1$05lxRShI$OKQZEoGLEz7IcHmh4SExC1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (127, 8, 9071, NULL, 'Vania Sekarayodya', '$1$frmHfE8J$rhU0f9eDy/7fyYqTVg5br0', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (128, 8, 9072, NULL, 'Syifa Fauzia', '$1$AYtGnuvr$.wyjvTrrfF8y./dYurZ7l/', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (129, 8, 9073, NULL, 'Shabrina Daneasti', '$1$Afh3fEGx$vIAeWJBKq1i67XSY0sixO1', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (130, 8, 9075, NULL, 'Ucca Anggana', '$1$MHYyX2ty$9gZnAjolWrVTW9A/WRLjv.', '', '', NULL, '2018-03-01', '', '', NULL, 0);
INSERT INTO `ms_student` VALUES (131, 6, 102030, NULL, 'budi', '$1$zzWK.vdv$tV/ObN4LYJO45WS0wUa85.', 'hahaha@gmail.com', '1212121212120', NULL, '2018-03-03', 'he', '8909898980', '$1$E7PtlUlV$0tQ1MyOw2w8cvXapfwVyL1', 1);
INSERT INTO `ms_student` VALUES (132, 16, 9200, NULL, 'adi permadi', '$1$GKWeXoeZ$hpGpZoyxbmGQ6AkAHPgzk0', '', '', NULL, '2018-03-07', '', '', NULL, 1);
INSERT INTO `ms_student` VALUES (133, 1, 2013310016, NULL, 'Sandi Ramadhan', '$1$vY/.MV4.$u19Vz3yNjuOTFGcRVirAW.', 'sandi@gmail.com', '21312312', 'cdc0961d3184b30669000d858ecdc3cf.jpg', '2018-03-08', '', '', '', 0);
INSERT INTO `ms_student` VALUES (134, 1, 2013310017, NULL, 'Uchiha Sasuke', '$1$0f4.H12.$YFcWZuS/maWxwjnd00Izl0', 'sasuke@gmail.com', '21321312', 'e97a85ce9a7984c19bcba10572424d1a.jpg', '2018-09-07', NULL, NULL, NULL, 0);
INSERT INTO `ms_student` VALUES (135, 1, 213123, NULL, 'asd', '$1$99/.ce..$DZXyDx9dv.FLs6Za1c1oU/', 'sandi@gmail.com', '213', '77f528afdbf622504d977a40fdfed000.jpg', '2018-09-07', NULL, NULL, NULL, 1);
INSERT INTO `ms_student` VALUES (136, 1, 12831028, NULL, 'Xinqiu', '$1$mrazlYMU$sOvHoyOuGVSX/CbOcN6TJ0', 'xinqiu@gmail.com', '081231253615', '3efbad6d27d47c608284481678ff9800.png', '2021-05-04', NULL, NULL, NULL, 0);
INSERT INTO `ms_student` VALUES (137, 2, 1122, NULL, 'Agus', '$1$79/.Cr4.$YQWDXxKpvr9MX4iQZIoQJ0', '', '', NULL, '2023-08-22', NULL, NULL, NULL, 0);
INSERT INTO `ms_student` VALUES (138, 11, 1234, NULL, 'Anies', '$1$9M3SdQO6$yyk2EtimuBwIcwy.WBE2D.', 'user@gmail.com', '018293839', NULL, '2023-09-05', NULL, NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_subtest_categories
-- ----------------------------
INSERT INTO `ms_subtest_categories` VALUES (1, 'Tes Potensi Skolastik', 0, NULL);
INSERT INTO `ms_subtest_categories` VALUES (2, 'Tes Kompetensi Akademik', 0, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of question_answer
-- ----------------------------
INSERT INTO `question_answer` VALUES (30, 51, 'asdasdasdasd', NULL, '2023-09-02 22:55:06', '2023-09-02 22:55:06', 0);
INSERT INTO `question_answer` VALUES (31, 53, 'Ini adalah jawaban', NULL, '2023-09-02 00:00:00', '2023-09-02 23:01:12', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of question_match
-- ----------------------------
INSERT INTO `question_match` VALUES (39, 49, 'Bahasa inggrisnya biru', NULL, '2023-09-02 00:00:00', '2023-09-02 22:51:24', 0);
INSERT INTO `question_match` VALUES (40, 49, 'Bahasa inggrisnya kuning', NULL, '2023-09-02 00:00:00', '2023-09-02 22:51:24', 0);
INSERT INTO `question_match` VALUES (41, 49, 'Bahasa inggrisnya hijau', NULL, '2023-09-02 00:00:00', '2023-09-02 22:51:24', 0);
INSERT INTO `question_match` VALUES (42, 49, 'Bahasa inggrisnya putih', NULL, '2023-09-02 00:00:00', '2023-09-02 22:51:24', 0);
INSERT INTO `question_match` VALUES (43, 54, 'Bahasa inggrisnya biru', NULL, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0);
INSERT INTO `question_match` VALUES (44, 54, 'Bahasa inggrisnya kuning', NULL, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0);
INSERT INTO `question_match` VALUES (45, 54, 'Bahasa inggrisnya hijau', NULL, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0);
INSERT INTO `question_match` VALUES (46, 54, 'Bahasa inggrisnya putih', NULL, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0);
INSERT INTO `question_match` VALUES (47, 54, 'ini satu', NULL, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0);
INSERT INTO `question_match` VALUES (48, 54, 'tiga', NULL, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of question_match_answer
-- ----------------------------
INSERT INTO `question_match_answer` VALUES (33, 39, 'Biru', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:51:24', 0);
INSERT INTO `question_match_answer` VALUES (34, 40, 'Yellow', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:51:24', 0);
INSERT INTO `question_match_answer` VALUES (35, 41, 'Green', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:51:24', 0);
INSERT INTO `question_match_answer` VALUES (36, 42, 'White', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:51:24', 0);
INSERT INTO `question_match_answer` VALUES (37, 43, 'Biru', NULL, 0, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0);
INSERT INTO `question_match_answer` VALUES (38, 44, 'Yellow', NULL, 0, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0);
INSERT INTO `question_match_answer` VALUES (39, 45, 'Green', NULL, 0, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0);
INSERT INTO `question_match_answer` VALUES (40, 46, 'White', NULL, 0, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0);
INSERT INTO `question_match_answer` VALUES (41, 47, 'sdusa', NULL, 0, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0);
INSERT INTO `question_match_answer` VALUES (42, 48, 'empat', NULL, 0, '2023-09-03 00:00:00', '2023-09-03 07:39:44', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of question_option
-- ----------------------------
INSERT INTO `question_option` VALUES (30, 38, 'Jawaban 1', NULL, 1, '2023-09-02 00:00:00', '2023-09-02 22:38:59', 0);
INSERT INTO `question_option` VALUES (31, 39, 'Jawaban 2', NULL, 1, '2023-09-02 00:00:00', '2023-09-02 22:38:59', 0);
INSERT INTO `question_option` VALUES (32, 40, 'Jawaban 3', NULL, 1, '2023-09-02 00:00:00', '2023-09-02 22:38:59', 0);
INSERT INTO `question_option` VALUES (33, 41, 'Jawaban 4', NULL, 1, '2023-09-02 00:00:00', '2023-09-02 22:38:59', 0);
INSERT INTO `question_option` VALUES (34, 42, 'Jawaban 5', NULL, 1, '2023-09-02 00:00:00', '2023-09-02 22:38:59', 0);
INSERT INTO `question_option` VALUES (35, 43, 'Alpha Correct 1', NULL, 1, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (36, 43, 'Beta Uncorrect 1', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (37, 43, 'Charlie Correct 1', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (38, 43, 'Delta Uncorrect 1', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (39, 43, 'Echo Uncorrect 1', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (40, 43, 'Feron Uncorrect 1', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (41, 44, 'Alpha Correct 2', NULL, 1, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (42, 44, 'Beta Uncorrect 2', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (43, 44, 'Charlie Correct 2', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (44, 44, 'Delta Uncorrect 2', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (45, 44, 'Echo Uncorrect 2', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (46, 44, 'Feron Uncorrect 2', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (47, 45, 'Alpha Correct 3', NULL, 1, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (48, 45, 'Beta Uncorrect 3', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (49, 45, 'Charlie Correct 3', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (50, 45, 'Delta Uncorrect 3', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (51, 45, 'Echo Uncorrect 3', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (52, 45, 'Feron Uncorrect 3', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (53, 46, 'Alpha Correct 4', NULL, 1, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (54, 46, 'Beta Uncorrect 4', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (55, 46, 'Charlie Correct 4', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (56, 46, 'Delta Uncorrect 4', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (57, 46, 'Echo Uncorrect 4', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (58, 46, 'Feron Uncorrect 4', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (59, 47, 'Alpha Correct 5', NULL, 1, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (60, 47, 'Beta Uncorrect 5', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (61, 47, 'Charlie Correct 5', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (62, 47, 'Delta Uncorrect 5', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (63, 47, 'Echo Uncorrect 5', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);
INSERT INTO `question_option` VALUES (64, 47, 'Feron Uncorrect 5', NULL, 0, '2023-09-02 00:00:00', '2023-09-02 22:47:19', 0);

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
INSERT INTO `teacher_class` VALUES (1, 1, 1);

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
