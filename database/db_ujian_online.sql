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

 Date: 24/09/2023 16:58:30
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
  `total_soal` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_abegin`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1280 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_begin
-- ----------------------------
INSERT INTO `assignment_begin` VALUES (862, 16, 28, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (863, 16, 132, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (864, 16, 78, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (865, 16, 57, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (866, 16, 4, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (867, 16, 58, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (868, 16, 5, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (869, 16, 137, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (870, 16, 108, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (871, 16, 6, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (872, 16, 7, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (873, 16, 79, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (874, 16, 30, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (875, 16, 109, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (876, 16, 8, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (877, 16, 138, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (878, 16, 59, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (879, 16, 29, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (880, 16, 9, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (881, 16, 31, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (882, 16, 135, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (883, 16, 32, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (884, 16, 110, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (885, 16, 60, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (886, 16, 139, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (887, 16, 131, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (888, 16, 111, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (889, 16, 112, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (890, 16, 113, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (891, 16, 80, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (892, 16, 61, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (893, 16, 104, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (894, 16, 10, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (895, 16, 33, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (896, 16, 114, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (897, 16, 11, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (898, 16, 62, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (899, 16, 115, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (900, 16, 34, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (901, 16, 12, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (902, 16, 35, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (903, 16, 105, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (904, 16, 13, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (905, 16, 63, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (906, 16, 116, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (907, 16, 81, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (908, 16, 64, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (909, 16, 37, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (910, 16, 40, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (911, 16, 82, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (912, 16, 65, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (913, 16, 15, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (914, 16, 83, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (915, 16, 66, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (916, 16, 67, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (917, 16, 16, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (918, 16, 84, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (919, 16, 36, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (920, 16, 117, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (921, 16, 38, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (922, 16, 17, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (923, 16, 39, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (924, 16, 118, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (925, 16, 18, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (926, 16, 85, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (927, 16, 42, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (928, 16, 41, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (929, 16, 86, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (930, 16, 14, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (931, 16, 89, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (932, 16, 19, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (933, 16, 88, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (934, 16, 87, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (935, 16, 71, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (936, 16, 119, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (937, 16, 120, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (938, 16, 106, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (939, 16, 20, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (940, 16, 121, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (941, 16, 21, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (942, 16, 68, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (943, 16, 122, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (944, 16, 69, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (945, 16, 43, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (946, 16, 70, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (947, 16, 44, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (948, 16, 90, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (949, 16, 107, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (950, 16, 96, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (951, 16, 45, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (952, 16, 72, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (953, 16, 91, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (954, 16, 124, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (955, 16, 123, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (956, 16, 97, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (957, 16, 93, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (958, 16, 92, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (959, 16, 125, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (960, 16, 46, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (961, 16, 22, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (962, 16, 23, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (963, 16, 77, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (964, 16, 73, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (965, 16, 48, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (966, 16, 47, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (967, 16, 74, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (968, 16, 94, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (969, 16, 49, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (970, 16, 50, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (971, 16, 3, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (972, 16, 133, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (973, 16, 103, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (974, 16, 129, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (975, 16, 95, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (976, 16, 24, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (977, 16, 76, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (978, 16, 25, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (979, 16, 26, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (980, 16, 128, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (981, 16, 51, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (982, 16, 126, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (983, 16, 98, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (984, 16, 52, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (985, 16, 53, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (986, 16, 130, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (987, 16, 2, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (988, 16, 134, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (989, 16, 54, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (990, 16, 1, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (991, 16, 127, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (992, 16, 75, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (993, 16, 27, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (994, 16, 99, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (995, 16, 136, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (996, 16, 55, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (997, 16, 100, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (998, 16, 101, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (999, 16, 102, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (1000, 16, 56, NULL, 0, '30', '30', 'Password');
INSERT INTO `assignment_begin` VALUES (1001, 17, 28, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1002, 17, 132, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1003, 17, 78, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1004, 17, 57, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1005, 17, 4, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1006, 17, 58, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1007, 17, 5, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1008, 17, 137, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1009, 17, 108, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1010, 17, 6, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1011, 17, 7, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1012, 17, 79, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1013, 17, 30, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1014, 17, 109, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1015, 17, 8, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1016, 17, 138, NULL, 2, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1017, 17, 59, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1018, 17, 29, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1019, 17, 9, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1020, 17, 31, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1021, 17, 135, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1022, 17, 32, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1023, 17, 110, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1024, 17, 60, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1025, 17, 139, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1026, 17, 131, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1027, 17, 111, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1028, 17, 112, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1029, 17, 113, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1030, 17, 80, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1031, 17, 61, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1032, 17, 104, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1033, 17, 10, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1034, 17, 33, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1035, 17, 114, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1036, 17, 11, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1037, 17, 62, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1038, 17, 115, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1039, 17, 34, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1040, 17, 12, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1041, 17, 35, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1042, 17, 105, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1043, 17, 13, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1044, 17, 63, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1045, 17, 116, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1046, 17, 81, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1047, 17, 64, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1048, 17, 37, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1049, 17, 40, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1050, 17, 82, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1051, 17, 65, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1052, 17, 15, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1053, 17, 83, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1054, 17, 66, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1055, 17, 67, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1056, 17, 16, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1057, 17, 84, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1058, 17, 36, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1059, 17, 117, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1060, 17, 38, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1061, 17, 17, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1062, 17, 39, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1063, 17, 118, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1064, 17, 18, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1065, 17, 85, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1066, 17, 42, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1067, 17, 41, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1068, 17, 86, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1069, 17, 14, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1070, 17, 89, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1071, 17, 19, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1072, 17, 88, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1073, 17, 87, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1074, 17, 71, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1075, 17, 119, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1076, 17, 120, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1077, 17, 106, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1078, 17, 20, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1079, 17, 121, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1080, 17, 21, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1081, 17, 68, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1082, 17, 122, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1083, 17, 69, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1084, 17, 43, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1085, 17, 70, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1086, 17, 44, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1087, 17, 90, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1088, 17, 107, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1089, 17, 96, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1090, 17, 45, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1091, 17, 72, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1092, 17, 91, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1093, 17, 124, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1094, 17, 123, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1095, 17, 97, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1096, 17, 93, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1097, 17, 92, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1098, 17, 125, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1099, 17, 46, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1100, 17, 22, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1101, 17, 23, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1102, 17, 77, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1103, 17, 73, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1104, 17, 48, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1105, 17, 47, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1106, 17, 74, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1107, 17, 94, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1108, 17, 49, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1109, 17, 50, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1110, 17, 3, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1111, 17, 133, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1112, 17, 103, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1113, 17, 129, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1114, 17, 95, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1115, 17, 24, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1116, 17, 76, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1117, 17, 25, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1118, 17, 26, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1119, 17, 128, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1120, 17, 51, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1121, 17, 126, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1122, 17, 98, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1123, 17, 52, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1124, 17, 53, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1125, 17, 130, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1126, 17, 2, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1127, 17, 134, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1128, 17, 54, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1129, 17, 1, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1130, 17, 127, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1131, 17, 75, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1132, 17, 27, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1133, 17, 99, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1134, 17, 136, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1135, 17, 55, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1136, 17, 100, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1137, 17, 101, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1138, 17, 102, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1139, 17, 56, NULL, 0, '6', '6', '12345');
INSERT INTO `assignment_begin` VALUES (1140, 18, 138, NULL, 2, '4', '4', '9090');
INSERT INTO `assignment_begin` VALUES (1141, 19, 28, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1142, 19, 132, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1143, 19, 78, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1144, 19, 57, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1145, 19, 4, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1146, 19, 58, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1147, 19, 5, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1148, 19, 137, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1149, 19, 108, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1150, 19, 6, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1151, 19, 7, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1152, 19, 79, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1153, 19, 30, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1154, 19, 109, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1155, 19, 8, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1156, 19, 138, NULL, 2, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1157, 19, 59, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1158, 19, 29, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1159, 19, 9, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1160, 19, 31, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1161, 19, 135, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1162, 19, 32, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1163, 19, 110, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1164, 19, 60, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1165, 19, 139, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1166, 19, 131, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1167, 19, 111, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1168, 19, 112, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1169, 19, 113, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1170, 19, 80, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1171, 19, 61, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1172, 19, 104, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1173, 19, 10, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1174, 19, 33, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1175, 19, 114, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1176, 19, 11, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1177, 19, 62, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1178, 19, 115, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1179, 19, 34, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1180, 19, 12, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1181, 19, 35, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1182, 19, 105, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1183, 19, 13, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1184, 19, 63, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1185, 19, 116, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1186, 19, 81, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1187, 19, 64, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1188, 19, 37, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1189, 19, 40, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1190, 19, 82, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1191, 19, 65, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1192, 19, 15, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1193, 19, 83, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1194, 19, 66, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1195, 19, 67, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1196, 19, 16, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1197, 19, 84, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1198, 19, 36, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1199, 19, 117, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1200, 19, 38, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1201, 19, 17, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1202, 19, 39, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1203, 19, 118, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1204, 19, 18, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1205, 19, 85, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1206, 19, 42, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1207, 19, 41, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1208, 19, 86, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1209, 19, 14, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1210, 19, 89, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1211, 19, 19, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1212, 19, 88, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1213, 19, 87, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1214, 19, 71, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1215, 19, 119, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1216, 19, 120, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1217, 19, 106, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1218, 19, 20, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1219, 19, 121, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1220, 19, 21, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1221, 19, 68, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1222, 19, 122, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1223, 19, 69, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1224, 19, 43, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1225, 19, 70, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1226, 19, 44, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1227, 19, 90, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1228, 19, 107, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1229, 19, 96, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1230, 19, 45, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1231, 19, 72, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1232, 19, 91, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1233, 19, 124, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1234, 19, 123, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1235, 19, 97, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1236, 19, 93, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1237, 19, 92, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1238, 19, 125, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1239, 19, 46, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1240, 19, 22, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1241, 19, 23, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1242, 19, 77, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1243, 19, 73, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1244, 19, 48, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1245, 19, 47, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1246, 19, 74, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1247, 19, 94, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1248, 19, 49, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1249, 19, 50, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1250, 19, 3, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1251, 19, 133, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1252, 19, 103, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1253, 19, 129, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1254, 19, 95, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1255, 19, 24, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1256, 19, 76, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1257, 19, 25, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1258, 19, 26, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1259, 19, 128, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1260, 19, 51, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1261, 19, 126, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1262, 19, 98, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1263, 19, 52, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1264, 19, 53, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1265, 19, 130, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1266, 19, 2, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1267, 19, 134, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1268, 19, 54, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1269, 19, 1, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1270, 19, 127, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1271, 19, 75, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1272, 19, 27, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1273, 19, 99, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1274, 19, 136, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1275, 19, 55, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1276, 19, 100, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1277, 19, 101, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1278, 19, 102, NULL, 0, '15', '9', '12345');
INSERT INTO `assignment_begin` VALUES (1279, 19, 56, NULL, 0, '15', '9', '12345');

-- ----------------------------
-- Table structure for assignment_begin_categories
-- ----------------------------
DROP TABLE IF EXISTS `assignment_begin_categories`;
CREATE TABLE `assignment_begin_categories`  (
  `id_acat` int NOT NULL AUTO_INCREMENT,
  `id_begin` int NULL DEFAULT NULL,
  `id_category` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_acat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2269 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_begin_categories
-- ----------------------------
INSERT INTO `assignment_begin_categories` VALUES (1295, 862, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1296, 862, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1297, 862, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1298, 863, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1299, 863, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1300, 863, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1301, 864, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1302, 864, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1303, 864, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1304, 865, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1305, 865, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1306, 865, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1307, 866, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1308, 866, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1309, 866, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1310, 867, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1311, 867, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1312, 867, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1313, 868, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1314, 868, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1315, 868, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1316, 869, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1317, 869, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1318, 869, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1319, 870, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1320, 870, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1321, 870, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1322, 871, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1323, 871, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1324, 871, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1325, 872, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1326, 872, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1327, 872, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1328, 873, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1329, 873, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1330, 873, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1331, 874, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1332, 874, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1333, 874, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1334, 875, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1335, 875, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1336, 875, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1337, 876, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1338, 876, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1339, 876, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1340, 877, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1341, 877, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1342, 877, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1343, 878, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1344, 878, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1345, 878, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1346, 879, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1347, 879, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1348, 879, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1349, 880, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1350, 880, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1351, 880, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1352, 881, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1353, 881, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1354, 881, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1355, 882, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1356, 882, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1357, 882, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1358, 883, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1359, 883, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1360, 883, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1361, 884, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1362, 884, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1363, 884, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1364, 885, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1365, 885, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1366, 885, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1367, 886, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1368, 886, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1369, 886, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1370, 887, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1371, 887, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1372, 887, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1373, 888, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1374, 888, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1375, 888, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1376, 889, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1377, 889, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1378, 889, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1379, 890, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1380, 890, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1381, 890, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1382, 891, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1383, 891, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1384, 891, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1385, 892, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1386, 892, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1387, 892, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1388, 893, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1389, 893, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1390, 893, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1391, 894, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1392, 894, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1393, 894, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1394, 895, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1395, 895, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1396, 895, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1397, 896, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1398, 896, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1399, 896, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1400, 897, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1401, 897, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1402, 897, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1403, 898, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1404, 898, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1405, 898, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1406, 899, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1407, 899, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1408, 899, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1409, 900, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1410, 900, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1411, 900, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1412, 901, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1413, 901, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1414, 901, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1415, 902, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1416, 902, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1417, 902, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1418, 903, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1419, 903, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1420, 903, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1421, 904, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1422, 904, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1423, 904, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1424, 905, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1425, 905, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1426, 905, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1427, 906, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1428, 906, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1429, 906, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1430, 907, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1431, 907, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1432, 907, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1433, 908, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1434, 908, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1435, 908, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1436, 909, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1437, 909, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1438, 909, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1439, 910, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1440, 910, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1441, 910, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1442, 911, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1443, 911, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1444, 911, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1445, 912, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1446, 912, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1447, 912, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1448, 913, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1449, 913, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1450, 913, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1451, 914, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1452, 914, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1453, 914, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1454, 915, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1455, 915, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1456, 915, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1457, 916, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1458, 916, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1459, 916, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1460, 917, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1461, 917, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1462, 917, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1463, 918, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1464, 918, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1465, 918, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1466, 919, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1467, 919, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1468, 919, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1469, 920, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1470, 920, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1471, 920, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1472, 921, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1473, 921, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1474, 921, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1475, 922, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1476, 922, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1477, 922, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1478, 923, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1479, 923, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1480, 923, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1481, 924, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1482, 924, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1483, 924, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1484, 925, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1485, 925, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1486, 925, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1487, 926, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1488, 926, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1489, 926, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1490, 927, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1491, 927, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1492, 927, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1493, 928, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1494, 928, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1495, 928, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1496, 929, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1497, 929, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1498, 929, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1499, 930, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1500, 930, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1501, 930, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1502, 931, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1503, 931, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1504, 931, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1505, 932, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1506, 932, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1507, 932, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1508, 933, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1509, 933, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1510, 933, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1511, 934, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1512, 934, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1513, 934, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1514, 935, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1515, 935, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1516, 935, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1517, 936, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1518, 936, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1519, 936, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1520, 937, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1521, 937, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1522, 937, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1523, 938, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1524, 938, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1525, 938, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1526, 939, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1527, 939, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1528, 939, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1529, 940, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1530, 940, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1531, 940, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1532, 941, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1533, 941, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1534, 941, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1535, 942, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1536, 942, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1537, 942, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1538, 943, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1539, 943, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1540, 943, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1541, 944, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1542, 944, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1543, 944, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1544, 945, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1545, 945, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1546, 945, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1547, 946, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1548, 946, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1549, 946, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1550, 947, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1551, 947, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1552, 947, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1553, 948, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1554, 948, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1555, 948, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1556, 949, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1557, 949, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1558, 949, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1559, 950, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1560, 950, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1561, 950, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1562, 951, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1563, 951, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1564, 951, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1565, 952, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1566, 952, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1567, 952, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1568, 953, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1569, 953, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1570, 953, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1571, 954, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1572, 954, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1573, 954, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1574, 955, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1575, 955, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1576, 955, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1577, 956, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1578, 956, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1579, 956, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1580, 957, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1581, 957, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1582, 957, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1583, 958, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1584, 958, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1585, 958, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1586, 959, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1587, 959, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1588, 959, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1589, 960, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1590, 960, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1591, 960, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1592, 961, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1593, 961, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1594, 961, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1595, 962, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1596, 962, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1597, 962, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1598, 963, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1599, 963, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1600, 963, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1601, 964, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1602, 964, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1603, 964, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1604, 965, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1605, 965, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1606, 965, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1607, 966, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1608, 966, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1609, 966, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1610, 967, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1611, 967, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1612, 967, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1613, 968, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1614, 968, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1615, 968, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1616, 969, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1617, 969, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1618, 969, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1619, 970, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1620, 970, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1621, 970, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1622, 971, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1623, 971, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1624, 971, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1625, 972, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1626, 972, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1627, 972, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1628, 973, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1629, 973, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1630, 973, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1631, 974, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1632, 974, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1633, 974, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1634, 975, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1635, 975, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1636, 975, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1637, 976, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1638, 976, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1639, 976, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1640, 977, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1641, 977, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1642, 977, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1643, 978, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1644, 978, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1645, 978, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1646, 979, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1647, 979, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1648, 979, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1649, 980, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1650, 980, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1651, 980, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1652, 981, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1653, 981, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1654, 981, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1655, 982, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1656, 982, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1657, 982, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1658, 983, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1659, 983, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1660, 983, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1661, 984, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1662, 984, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1663, 984, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1664, 985, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1665, 985, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1666, 985, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1667, 986, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1668, 986, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1669, 986, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1670, 987, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1671, 987, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1672, 987, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1673, 988, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1674, 988, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1675, 988, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1676, 989, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1677, 989, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1678, 989, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1679, 990, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1680, 990, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1681, 990, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1682, 991, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1683, 991, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1684, 991, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1685, 992, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1686, 992, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1687, 992, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1688, 993, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1689, 993, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1690, 993, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1691, 994, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1692, 994, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1693, 994, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1694, 995, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1695, 995, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1696, 995, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1697, 996, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1698, 996, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1699, 996, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1700, 997, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1701, 997, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1702, 997, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1703, 998, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1704, 998, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1705, 998, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1706, 999, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1707, 999, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1708, 999, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1709, 1000, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1710, 1000, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1711, 1000, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1712, 1001, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1713, 1001, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1714, 1002, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1715, 1002, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1716, 1003, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1717, 1003, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1718, 1004, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1719, 1004, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1720, 1005, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1721, 1005, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1722, 1006, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1723, 1006, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1724, 1007, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1725, 1007, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1726, 1008, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1727, 1008, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1728, 1009, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1729, 1009, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1730, 1010, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1731, 1010, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1732, 1011, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1733, 1011, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1734, 1012, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1735, 1012, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1736, 1013, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1737, 1013, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1738, 1014, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1739, 1014, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1740, 1015, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1741, 1015, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1742, 1016, 3, 2);
INSERT INTO `assignment_begin_categories` VALUES (1743, 1016, 2, 2);
INSERT INTO `assignment_begin_categories` VALUES (1744, 1017, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1745, 1017, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1746, 1018, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1747, 1018, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1748, 1019, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1749, 1019, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1750, 1020, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1751, 1020, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1752, 1021, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1753, 1021, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1754, 1022, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1755, 1022, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1756, 1023, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1757, 1023, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1758, 1024, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1759, 1024, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1760, 1025, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1761, 1025, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1762, 1026, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1763, 1026, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1764, 1027, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1765, 1027, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1766, 1028, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1767, 1028, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1768, 1029, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1769, 1029, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1770, 1030, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1771, 1030, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1772, 1031, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1773, 1031, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1774, 1032, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1775, 1032, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1776, 1033, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1777, 1033, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1778, 1034, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1779, 1034, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1780, 1035, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1781, 1035, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1782, 1036, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1783, 1036, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1784, 1037, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1785, 1037, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1786, 1038, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1787, 1038, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1788, 1039, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1789, 1039, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1790, 1040, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1791, 1040, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1792, 1041, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1793, 1041, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1794, 1042, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1795, 1042, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1796, 1043, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1797, 1043, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1798, 1044, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1799, 1044, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1800, 1045, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1801, 1045, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1802, 1046, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1803, 1046, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1804, 1047, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1805, 1047, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1806, 1048, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1807, 1048, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1808, 1049, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1809, 1049, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1810, 1050, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1811, 1050, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1812, 1051, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1813, 1051, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1814, 1052, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1815, 1052, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1816, 1053, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1817, 1053, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1818, 1054, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1819, 1054, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1820, 1055, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1821, 1055, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1822, 1056, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1823, 1056, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1824, 1057, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1825, 1057, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1826, 1058, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1827, 1058, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1828, 1059, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1829, 1059, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1830, 1060, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1831, 1060, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1832, 1061, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1833, 1061, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1834, 1062, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1835, 1062, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1836, 1063, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1837, 1063, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1838, 1064, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1839, 1064, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1840, 1065, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1841, 1065, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1842, 1066, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1843, 1066, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1844, 1067, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1845, 1067, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1846, 1068, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1847, 1068, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1848, 1069, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1849, 1069, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1850, 1070, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1851, 1070, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1852, 1071, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1853, 1071, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1854, 1072, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1855, 1072, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1856, 1073, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1857, 1073, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1858, 1074, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1859, 1074, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1860, 1075, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1861, 1075, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1862, 1076, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1863, 1076, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1864, 1077, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1865, 1077, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1866, 1078, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1867, 1078, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1868, 1079, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1869, 1079, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1870, 1080, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1871, 1080, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1872, 1081, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1873, 1081, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1874, 1082, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1875, 1082, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1876, 1083, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1877, 1083, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1878, 1084, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1879, 1084, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1880, 1085, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1881, 1085, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1882, 1086, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1883, 1086, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1884, 1087, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1885, 1087, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1886, 1088, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1887, 1088, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1888, 1089, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1889, 1089, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1890, 1090, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1891, 1090, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1892, 1091, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1893, 1091, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1894, 1092, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1895, 1092, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1896, 1093, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1897, 1093, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1898, 1094, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1899, 1094, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1900, 1095, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1901, 1095, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1902, 1096, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1903, 1096, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1904, 1097, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1905, 1097, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1906, 1098, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1907, 1098, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1908, 1099, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1909, 1099, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1910, 1100, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1911, 1100, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1912, 1101, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1913, 1101, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1914, 1102, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1915, 1102, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1916, 1103, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1917, 1103, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1918, 1104, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1919, 1104, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1920, 1105, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1921, 1105, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1922, 1106, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1923, 1106, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1924, 1107, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1925, 1107, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1926, 1108, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1927, 1108, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1928, 1109, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1929, 1109, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1930, 1110, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1931, 1110, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1932, 1111, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1933, 1111, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1934, 1112, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1935, 1112, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1936, 1113, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1937, 1113, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1938, 1114, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1939, 1114, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1940, 1115, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1941, 1115, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1942, 1116, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1943, 1116, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1944, 1117, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1945, 1117, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1946, 1118, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1947, 1118, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1948, 1119, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1949, 1119, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1950, 1120, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1951, 1120, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1952, 1121, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1953, 1121, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1954, 1122, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1955, 1122, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1956, 1123, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1957, 1123, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1958, 1124, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1959, 1124, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1960, 1125, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1961, 1125, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1962, 1126, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1963, 1126, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1964, 1127, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1965, 1127, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1966, 1128, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1967, 1128, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1968, 1129, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1969, 1129, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1970, 1130, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1971, 1130, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1972, 1131, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1973, 1131, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1974, 1132, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1975, 1132, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1976, 1133, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1977, 1133, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1978, 1134, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1979, 1134, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1980, 1135, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1981, 1135, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1982, 1136, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1983, 1136, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1984, 1137, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1985, 1137, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1986, 1138, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1987, 1138, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1988, 1139, 3, 0);
INSERT INTO `assignment_begin_categories` VALUES (1989, 1139, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1990, 1140, 1, 2);
INSERT INTO `assignment_begin_categories` VALUES (1991, 1141, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1992, 1141, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1993, 1142, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1994, 1142, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1995, 1143, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1996, 1143, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1997, 1144, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (1998, 1144, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (1999, 1145, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2000, 1145, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2001, 1146, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2002, 1146, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2003, 1147, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2004, 1147, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2005, 1148, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2006, 1148, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2007, 1149, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2008, 1149, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2009, 1150, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2010, 1150, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2011, 1151, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2012, 1151, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2013, 1152, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2014, 1152, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2015, 1153, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2016, 1153, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2017, 1154, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2018, 1154, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2019, 1155, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2020, 1155, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2021, 1156, 2, 2);
INSERT INTO `assignment_begin_categories` VALUES (2022, 1156, 1, 2);
INSERT INTO `assignment_begin_categories` VALUES (2023, 1157, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2024, 1157, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2025, 1158, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2026, 1158, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2027, 1159, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2028, 1159, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2029, 1160, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2030, 1160, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2031, 1161, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2032, 1161, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2033, 1162, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2034, 1162, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2035, 1163, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2036, 1163, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2037, 1164, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2038, 1164, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2039, 1165, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2040, 1165, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2041, 1166, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2042, 1166, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2043, 1167, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2044, 1167, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2045, 1168, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2046, 1168, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2047, 1169, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2048, 1169, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2049, 1170, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2050, 1170, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2051, 1171, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2052, 1171, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2053, 1172, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2054, 1172, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2055, 1173, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2056, 1173, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2057, 1174, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2058, 1174, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2059, 1175, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2060, 1175, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2061, 1176, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2062, 1176, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2063, 1177, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2064, 1177, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2065, 1178, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2066, 1178, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2067, 1179, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2068, 1179, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2069, 1180, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2070, 1180, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2071, 1181, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2072, 1181, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2073, 1182, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2074, 1182, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2075, 1183, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2076, 1183, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2077, 1184, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2078, 1184, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2079, 1185, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2080, 1185, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2081, 1186, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2082, 1186, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2083, 1187, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2084, 1187, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2085, 1188, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2086, 1188, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2087, 1189, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2088, 1189, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2089, 1190, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2090, 1190, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2091, 1191, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2092, 1191, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2093, 1192, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2094, 1192, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2095, 1193, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2096, 1193, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2097, 1194, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2098, 1194, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2099, 1195, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2100, 1195, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2101, 1196, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2102, 1196, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2103, 1197, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2104, 1197, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2105, 1198, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2106, 1198, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2107, 1199, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2108, 1199, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2109, 1200, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2110, 1200, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2111, 1201, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2112, 1201, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2113, 1202, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2114, 1202, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2115, 1203, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2116, 1203, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2117, 1204, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2118, 1204, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2119, 1205, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2120, 1205, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2121, 1206, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2122, 1206, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2123, 1207, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2124, 1207, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2125, 1208, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2126, 1208, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2127, 1209, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2128, 1209, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2129, 1210, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2130, 1210, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2131, 1211, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2132, 1211, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2133, 1212, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2134, 1212, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2135, 1213, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2136, 1213, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2137, 1214, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2138, 1214, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2139, 1215, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2140, 1215, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2141, 1216, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2142, 1216, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2143, 1217, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2144, 1217, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2145, 1218, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2146, 1218, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2147, 1219, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2148, 1219, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2149, 1220, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2150, 1220, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2151, 1221, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2152, 1221, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2153, 1222, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2154, 1222, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2155, 1223, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2156, 1223, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2157, 1224, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2158, 1224, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2159, 1225, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2160, 1225, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2161, 1226, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2162, 1226, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2163, 1227, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2164, 1227, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2165, 1228, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2166, 1228, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2167, 1229, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2168, 1229, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2169, 1230, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2170, 1230, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2171, 1231, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2172, 1231, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2173, 1232, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2174, 1232, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2175, 1233, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2176, 1233, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2177, 1234, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2178, 1234, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2179, 1235, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2180, 1235, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2181, 1236, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2182, 1236, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2183, 1237, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2184, 1237, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2185, 1238, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2186, 1238, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2187, 1239, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2188, 1239, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2189, 1240, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2190, 1240, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2191, 1241, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2192, 1241, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2193, 1242, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2194, 1242, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2195, 1243, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2196, 1243, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2197, 1244, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2198, 1244, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2199, 1245, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2200, 1245, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2201, 1246, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2202, 1246, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2203, 1247, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2204, 1247, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2205, 1248, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2206, 1248, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2207, 1249, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2208, 1249, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2209, 1250, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2210, 1250, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2211, 1251, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2212, 1251, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2213, 1252, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2214, 1252, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2215, 1253, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2216, 1253, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2217, 1254, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2218, 1254, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2219, 1255, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2220, 1255, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2221, 1256, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2222, 1256, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2223, 1257, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2224, 1257, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2225, 1258, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2226, 1258, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2227, 1259, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2228, 1259, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2229, 1260, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2230, 1260, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2231, 1261, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2232, 1261, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2233, 1262, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2234, 1262, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2235, 1263, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2236, 1263, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2237, 1264, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2238, 1264, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2239, 1265, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2240, 1265, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2241, 1266, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2242, 1266, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2243, 1267, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2244, 1267, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2245, 1268, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2246, 1268, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2247, 1269, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2248, 1269, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2249, 1270, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2250, 1270, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2251, 1271, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2252, 1271, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2253, 1272, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2254, 1272, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2255, 1273, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2256, 1273, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2257, 1274, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2258, 1274, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2259, 1275, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2260, 1275, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2261, 1276, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2262, 1276, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2263, 1277, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2264, 1277, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2265, 1278, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2266, 1278, 1, 0);
INSERT INTO `assignment_begin_categories` VALUES (2267, 1279, 2, 0);
INSERT INTO `assignment_begin_categories` VALUES (2268, 1279, 1, 0);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3388 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_begin_subtest
-- ----------------------------
INSERT INTO `assignment_begin_subtest` VALUES (1858, 862, 1295, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1859, 862, 1296, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1860, 862, 1296, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1861, 862, 1296, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1862, 862, 1297, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1863, 862, 1297, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1864, 863, 1298, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1865, 863, 1299, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1866, 863, 1299, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1867, 863, 1299, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1868, 863, 1300, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1869, 863, 1300, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1870, 864, 1301, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1871, 864, 1302, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1872, 864, 1302, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1873, 864, 1302, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1874, 864, 1303, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1875, 864, 1303, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1876, 865, 1304, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1877, 865, 1305, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1878, 865, 1305, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1879, 865, 1305, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1880, 865, 1306, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1881, 865, 1306, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1882, 866, 1307, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1883, 866, 1308, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1884, 866, 1308, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1885, 866, 1308, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1886, 866, 1309, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1887, 866, 1309, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1888, 867, 1310, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1889, 867, 1311, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1890, 867, 1311, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1891, 867, 1311, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1892, 867, 1312, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1893, 867, 1312, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1894, 868, 1313, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1895, 868, 1314, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1896, 868, 1314, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1897, 868, 1314, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1898, 868, 1315, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1899, 868, 1315, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1900, 869, 1316, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1901, 869, 1317, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1902, 869, 1317, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1903, 869, 1317, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1904, 869, 1318, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1905, 869, 1318, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1906, 870, 1319, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1907, 870, 1320, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1908, 870, 1320, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1909, 870, 1320, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1910, 870, 1321, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1911, 870, 1321, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1912, 871, 1322, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1913, 871, 1323, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1914, 871, 1323, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1915, 871, 1323, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1916, 871, 1324, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1917, 871, 1324, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1918, 872, 1325, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1919, 872, 1326, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1920, 872, 1326, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1921, 872, 1326, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1922, 872, 1327, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1923, 872, 1327, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1924, 873, 1328, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1925, 873, 1329, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1926, 873, 1329, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1927, 873, 1329, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1928, 873, 1330, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1929, 873, 1330, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1930, 874, 1331, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1931, 874, 1332, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1932, 874, 1332, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1933, 874, 1332, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1934, 874, 1333, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1935, 874, 1333, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1936, 875, 1334, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1937, 875, 1335, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1938, 875, 1335, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1939, 875, 1335, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1940, 875, 1336, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1941, 875, 1336, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1942, 876, 1337, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1943, 876, 1338, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1944, 876, 1338, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1945, 876, 1338, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1946, 876, 1339, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1947, 876, 1339, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1948, 877, 1340, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1949, 877, 1341, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1950, 877, 1341, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1951, 877, 1341, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1952, 877, 1342, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1953, 877, 1342, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1954, 878, 1343, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1955, 878, 1344, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1956, 878, 1344, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1957, 878, 1344, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1958, 878, 1345, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1959, 878, 1345, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1960, 879, 1346, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1961, 879, 1347, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1962, 879, 1347, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1963, 879, 1347, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1964, 879, 1348, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1965, 879, 1348, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1966, 880, 1349, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1967, 880, 1350, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1968, 880, 1350, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1969, 880, 1350, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1970, 880, 1351, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1971, 880, 1351, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1972, 881, 1352, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1973, 881, 1353, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1974, 881, 1353, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1975, 881, 1353, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1976, 881, 1354, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1977, 881, 1354, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1978, 882, 1355, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1979, 882, 1356, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1980, 882, 1356, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1981, 882, 1356, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1982, 882, 1357, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1983, 882, 1357, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1984, 883, 1358, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1985, 883, 1359, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1986, 883, 1359, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1987, 883, 1359, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1988, 883, 1360, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1989, 883, 1360, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1990, 884, 1361, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1991, 884, 1362, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1992, 884, 1362, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1993, 884, 1362, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1994, 884, 1363, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1995, 884, 1363, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1996, 885, 1364, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1997, 885, 1365, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1998, 885, 1365, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (1999, 885, 1365, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2000, 885, 1366, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2001, 885, 1366, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2002, 886, 1367, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2003, 886, 1368, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2004, 886, 1368, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2005, 886, 1368, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2006, 886, 1369, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2007, 886, 1369, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2008, 887, 1370, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2009, 887, 1371, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2010, 887, 1371, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2011, 887, 1371, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2012, 887, 1372, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2013, 887, 1372, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2014, 888, 1373, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2015, 888, 1374, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2016, 888, 1374, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2017, 888, 1374, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2018, 888, 1375, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2019, 888, 1375, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2020, 889, 1376, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2021, 889, 1377, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2022, 889, 1377, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2023, 889, 1377, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2024, 889, 1378, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2025, 889, 1378, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2026, 890, 1379, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2027, 890, 1380, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2028, 890, 1380, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2029, 890, 1380, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2030, 890, 1381, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2031, 890, 1381, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2032, 891, 1382, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2033, 891, 1383, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2034, 891, 1383, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2035, 891, 1383, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2036, 891, 1384, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2037, 891, 1384, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2038, 892, 1385, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2039, 892, 1386, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2040, 892, 1386, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2041, 892, 1386, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2042, 892, 1387, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2043, 892, 1387, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2044, 893, 1388, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2045, 893, 1389, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2046, 893, 1389, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2047, 893, 1389, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2048, 893, 1390, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2049, 893, 1390, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2050, 894, 1391, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2051, 894, 1392, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2052, 894, 1392, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2053, 894, 1392, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2054, 894, 1393, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2055, 894, 1393, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2056, 895, 1394, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2057, 895, 1395, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2058, 895, 1395, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2059, 895, 1395, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2060, 895, 1396, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2061, 895, 1396, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2062, 896, 1397, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2063, 896, 1398, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2064, 896, 1398, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2065, 896, 1398, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2066, 896, 1399, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2067, 896, 1399, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2068, 897, 1400, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2069, 897, 1401, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2070, 897, 1401, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2071, 897, 1401, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2072, 897, 1402, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2073, 897, 1402, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2074, 898, 1403, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2075, 898, 1404, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2076, 898, 1404, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2077, 898, 1404, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2078, 898, 1405, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2079, 898, 1405, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2080, 899, 1406, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2081, 899, 1407, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2082, 899, 1407, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2083, 899, 1407, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2084, 899, 1408, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2085, 899, 1408, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2086, 900, 1409, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2087, 900, 1410, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2088, 900, 1410, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2089, 900, 1410, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2090, 900, 1411, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2091, 900, 1411, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2092, 901, 1412, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2093, 901, 1413, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2094, 901, 1413, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2095, 901, 1413, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2096, 901, 1414, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2097, 901, 1414, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2098, 902, 1415, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2099, 902, 1416, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2100, 902, 1416, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2101, 902, 1416, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2102, 902, 1417, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2103, 902, 1417, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2104, 903, 1418, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2105, 903, 1419, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2106, 903, 1419, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2107, 903, 1419, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2108, 903, 1420, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2109, 903, 1420, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2110, 904, 1421, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2111, 904, 1422, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2112, 904, 1422, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2113, 904, 1422, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2114, 904, 1423, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2115, 904, 1423, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2116, 905, 1424, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2117, 905, 1425, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2118, 905, 1425, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2119, 905, 1425, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2120, 905, 1426, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2121, 905, 1426, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2122, 906, 1427, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2123, 906, 1428, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2124, 906, 1428, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2125, 906, 1428, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2126, 906, 1429, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2127, 906, 1429, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2128, 907, 1430, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2129, 907, 1431, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2130, 907, 1431, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2131, 907, 1431, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2132, 907, 1432, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2133, 907, 1432, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2134, 908, 1433, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2135, 908, 1434, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2136, 908, 1434, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2137, 908, 1434, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2138, 908, 1435, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2139, 908, 1435, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2140, 909, 1436, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2141, 909, 1437, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2142, 909, 1437, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2143, 909, 1437, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2144, 909, 1438, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2145, 909, 1438, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2146, 910, 1439, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2147, 910, 1440, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2148, 910, 1440, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2149, 910, 1440, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2150, 910, 1441, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2151, 910, 1441, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2152, 911, 1442, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2153, 911, 1443, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2154, 911, 1443, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2155, 911, 1443, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2156, 911, 1444, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2157, 911, 1444, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2158, 912, 1445, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2159, 912, 1446, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2160, 912, 1446, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2161, 912, 1446, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2162, 912, 1447, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2163, 912, 1447, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2164, 913, 1448, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2165, 913, 1449, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2166, 913, 1449, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2167, 913, 1449, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2168, 913, 1450, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2169, 913, 1450, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2170, 914, 1451, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2171, 914, 1452, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2172, 914, 1452, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2173, 914, 1452, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2174, 914, 1453, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2175, 914, 1453, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2176, 915, 1454, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2177, 915, 1455, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2178, 915, 1455, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2179, 915, 1455, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2180, 915, 1456, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2181, 915, 1456, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2182, 916, 1457, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2183, 916, 1458, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2184, 916, 1458, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2185, 916, 1458, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2186, 916, 1459, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2187, 916, 1459, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2188, 917, 1460, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2189, 917, 1461, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2190, 917, 1461, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2191, 917, 1461, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2192, 917, 1462, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2193, 917, 1462, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2194, 918, 1463, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2195, 918, 1464, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2196, 918, 1464, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2197, 918, 1464, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2198, 918, 1465, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2199, 918, 1465, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2200, 919, 1466, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2201, 919, 1467, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2202, 919, 1467, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2203, 919, 1467, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2204, 919, 1468, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2205, 919, 1468, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2206, 920, 1469, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2207, 920, 1470, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2208, 920, 1470, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2209, 920, 1470, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2210, 920, 1471, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2211, 920, 1471, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2212, 921, 1472, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2213, 921, 1473, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2214, 921, 1473, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2215, 921, 1473, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2216, 921, 1474, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2217, 921, 1474, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2218, 922, 1475, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2219, 922, 1476, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2220, 922, 1476, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2221, 922, 1476, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2222, 922, 1477, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2223, 922, 1477, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2224, 923, 1478, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2225, 923, 1479, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2226, 923, 1479, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2227, 923, 1479, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2228, 923, 1480, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2229, 923, 1480, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2230, 924, 1481, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2231, 924, 1482, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2232, 924, 1482, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2233, 924, 1482, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2234, 924, 1483, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2235, 924, 1483, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2236, 925, 1484, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2237, 925, 1485, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2238, 925, 1485, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2239, 925, 1485, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2240, 925, 1486, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2241, 925, 1486, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2242, 926, 1487, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2243, 926, 1488, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2244, 926, 1488, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2245, 926, 1488, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2246, 926, 1489, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2247, 926, 1489, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2248, 927, 1490, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2249, 927, 1491, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2250, 927, 1491, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2251, 927, 1491, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2252, 927, 1492, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2253, 927, 1492, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2254, 928, 1493, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2255, 928, 1494, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2256, 928, 1494, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2257, 928, 1494, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2258, 928, 1495, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2259, 928, 1495, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2260, 929, 1496, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2261, 929, 1497, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2262, 929, 1497, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2263, 929, 1497, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2264, 929, 1498, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2265, 929, 1498, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2266, 930, 1499, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2267, 930, 1500, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2268, 930, 1500, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2269, 930, 1500, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2270, 930, 1501, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2271, 930, 1501, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2272, 931, 1502, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2273, 931, 1503, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2274, 931, 1503, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2275, 931, 1503, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2276, 931, 1504, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2277, 931, 1504, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2278, 932, 1505, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2279, 932, 1506, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2280, 932, 1506, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2281, 932, 1506, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2282, 932, 1507, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2283, 932, 1507, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2284, 933, 1508, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2285, 933, 1509, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2286, 933, 1509, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2287, 933, 1509, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2288, 933, 1510, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2289, 933, 1510, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2290, 934, 1511, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2291, 934, 1512, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2292, 934, 1512, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2293, 934, 1512, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2294, 934, 1513, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2295, 934, 1513, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2296, 935, 1514, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2297, 935, 1515, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2298, 935, 1515, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2299, 935, 1515, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2300, 935, 1516, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2301, 935, 1516, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2302, 936, 1517, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2303, 936, 1518, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2304, 936, 1518, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2305, 936, 1518, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2306, 936, 1519, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2307, 936, 1519, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2308, 937, 1520, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2309, 937, 1521, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2310, 937, 1521, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2311, 937, 1521, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2312, 937, 1522, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2313, 937, 1522, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2314, 938, 1523, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2315, 938, 1524, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2316, 938, 1524, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2317, 938, 1524, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2318, 938, 1525, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2319, 938, 1525, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2320, 939, 1526, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2321, 939, 1527, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2322, 939, 1527, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2323, 939, 1527, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2324, 939, 1528, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2325, 939, 1528, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2326, 940, 1529, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2327, 940, 1530, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2328, 940, 1530, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2329, 940, 1530, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2330, 940, 1531, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2331, 940, 1531, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2332, 941, 1532, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2333, 941, 1533, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2334, 941, 1533, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2335, 941, 1533, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2336, 941, 1534, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2337, 941, 1534, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2338, 942, 1535, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2339, 942, 1536, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2340, 942, 1536, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2341, 942, 1536, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2342, 942, 1537, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2343, 942, 1537, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2344, 943, 1538, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2345, 943, 1539, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2346, 943, 1539, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2347, 943, 1539, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2348, 943, 1540, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2349, 943, 1540, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2350, 944, 1541, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2351, 944, 1542, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2352, 944, 1542, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2353, 944, 1542, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2354, 944, 1543, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2355, 944, 1543, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2356, 945, 1544, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2357, 945, 1545, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2358, 945, 1545, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2359, 945, 1545, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2360, 945, 1546, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2361, 945, 1546, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2362, 946, 1547, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2363, 946, 1548, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2364, 946, 1548, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2365, 946, 1548, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2366, 946, 1549, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2367, 946, 1549, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2368, 947, 1550, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2369, 947, 1551, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2370, 947, 1551, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2371, 947, 1551, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2372, 947, 1552, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2373, 947, 1552, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2374, 948, 1553, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2375, 948, 1554, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2376, 948, 1554, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2377, 948, 1554, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2378, 948, 1555, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2379, 948, 1555, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2380, 949, 1556, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2381, 949, 1557, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2382, 949, 1557, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2383, 949, 1557, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2384, 949, 1558, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2385, 949, 1558, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2386, 950, 1559, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2387, 950, 1560, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2388, 950, 1560, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2389, 950, 1560, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2390, 950, 1561, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2391, 950, 1561, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2392, 951, 1562, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2393, 951, 1563, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2394, 951, 1563, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2395, 951, 1563, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2396, 951, 1564, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2397, 951, 1564, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2398, 952, 1565, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2399, 952, 1566, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2400, 952, 1566, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2401, 952, 1566, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2402, 952, 1567, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2403, 952, 1567, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2404, 953, 1568, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2405, 953, 1569, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2406, 953, 1569, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2407, 953, 1569, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2408, 953, 1570, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2409, 953, 1570, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2410, 954, 1571, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2411, 954, 1572, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2412, 954, 1572, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2413, 954, 1572, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2414, 954, 1573, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2415, 954, 1573, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2416, 955, 1574, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2417, 955, 1575, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2418, 955, 1575, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2419, 955, 1575, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2420, 955, 1576, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2421, 955, 1576, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2422, 956, 1577, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2423, 956, 1578, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2424, 956, 1578, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2425, 956, 1578, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2426, 956, 1579, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2427, 956, 1579, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2428, 957, 1580, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2429, 957, 1581, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2430, 957, 1581, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2431, 957, 1581, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2432, 957, 1582, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2433, 957, 1582, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2434, 958, 1583, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2435, 958, 1584, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2436, 958, 1584, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2437, 958, 1584, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2438, 958, 1585, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2439, 958, 1585, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2440, 959, 1586, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2441, 959, 1587, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2442, 959, 1587, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2443, 959, 1587, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2444, 959, 1588, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2445, 959, 1588, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2446, 960, 1589, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2447, 960, 1590, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2448, 960, 1590, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2449, 960, 1590, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2450, 960, 1591, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2451, 960, 1591, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2452, 961, 1592, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2453, 961, 1593, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2454, 961, 1593, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2455, 961, 1593, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2456, 961, 1594, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2457, 961, 1594, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2458, 962, 1595, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2459, 962, 1596, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2460, 962, 1596, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2461, 962, 1596, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2462, 962, 1597, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2463, 962, 1597, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2464, 963, 1598, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2465, 963, 1599, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2466, 963, 1599, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2467, 963, 1599, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2468, 963, 1600, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2469, 963, 1600, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2470, 964, 1601, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2471, 964, 1602, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2472, 964, 1602, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2473, 964, 1602, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2474, 964, 1603, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2475, 964, 1603, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2476, 965, 1604, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2477, 965, 1605, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2478, 965, 1605, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2479, 965, 1605, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2480, 965, 1606, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2481, 965, 1606, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2482, 966, 1607, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2483, 966, 1608, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2484, 966, 1608, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2485, 966, 1608, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2486, 966, 1609, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2487, 966, 1609, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2488, 967, 1610, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2489, 967, 1611, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2490, 967, 1611, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2491, 967, 1611, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2492, 967, 1612, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2493, 967, 1612, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2494, 968, 1613, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2495, 968, 1614, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2496, 968, 1614, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2497, 968, 1614, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2498, 968, 1615, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2499, 968, 1615, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2500, 969, 1616, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2501, 969, 1617, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2502, 969, 1617, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2503, 969, 1617, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2504, 969, 1618, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2505, 969, 1618, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2506, 970, 1619, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2507, 970, 1620, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2508, 970, 1620, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2509, 970, 1620, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2510, 970, 1621, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2511, 970, 1621, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2512, 971, 1622, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2513, 971, 1623, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2514, 971, 1623, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2515, 971, 1623, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2516, 971, 1624, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2517, 971, 1624, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2518, 972, 1625, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2519, 972, 1626, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2520, 972, 1626, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2521, 972, 1626, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2522, 972, 1627, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2523, 972, 1627, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2524, 973, 1628, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2525, 973, 1629, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2526, 973, 1629, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2527, 973, 1629, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2528, 973, 1630, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2529, 973, 1630, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2530, 974, 1631, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2531, 974, 1632, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2532, 974, 1632, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2533, 974, 1632, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2534, 974, 1633, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2535, 974, 1633, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2536, 975, 1634, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2537, 975, 1635, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2538, 975, 1635, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2539, 975, 1635, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2540, 975, 1636, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2541, 975, 1636, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2542, 976, 1637, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2543, 976, 1638, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2544, 976, 1638, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2545, 976, 1638, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2546, 976, 1639, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2547, 976, 1639, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2548, 977, 1640, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2549, 977, 1641, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2550, 977, 1641, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2551, 977, 1641, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2552, 977, 1642, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2553, 977, 1642, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2554, 978, 1643, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2555, 978, 1644, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2556, 978, 1644, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2557, 978, 1644, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2558, 978, 1645, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2559, 978, 1645, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2560, 979, 1646, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2561, 979, 1647, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2562, 979, 1647, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2563, 979, 1647, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2564, 979, 1648, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2565, 979, 1648, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2566, 980, 1649, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2567, 980, 1650, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2568, 980, 1650, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2569, 980, 1650, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2570, 980, 1651, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2571, 980, 1651, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2572, 981, 1652, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2573, 981, 1653, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2574, 981, 1653, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2575, 981, 1653, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2576, 981, 1654, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2577, 981, 1654, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2578, 982, 1655, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2579, 982, 1656, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2580, 982, 1656, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2581, 982, 1656, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2582, 982, 1657, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2583, 982, 1657, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2584, 983, 1658, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2585, 983, 1659, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2586, 983, 1659, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2587, 983, 1659, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2588, 983, 1660, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2589, 983, 1660, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2590, 984, 1661, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2591, 984, 1662, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2592, 984, 1662, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2593, 984, 1662, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2594, 984, 1663, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2595, 984, 1663, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2596, 985, 1664, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2597, 985, 1665, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2598, 985, 1665, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2599, 985, 1665, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2600, 985, 1666, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2601, 985, 1666, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2602, 986, 1667, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2603, 986, 1668, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2604, 986, 1668, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2605, 986, 1668, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2606, 986, 1669, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2607, 986, 1669, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2608, 987, 1670, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2609, 987, 1671, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2610, 987, 1671, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2611, 987, 1671, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2612, 987, 1672, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2613, 987, 1672, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2614, 988, 1673, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2615, 988, 1674, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2616, 988, 1674, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2617, 988, 1674, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2618, 988, 1675, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2619, 988, 1675, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2620, 989, 1676, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2621, 989, 1677, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2622, 989, 1677, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2623, 989, 1677, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2624, 989, 1678, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2625, 989, 1678, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2626, 990, 1679, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2627, 990, 1680, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2628, 990, 1680, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2629, 990, 1680, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2630, 990, 1681, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2631, 990, 1681, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2632, 991, 1682, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2633, 991, 1683, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2634, 991, 1683, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2635, 991, 1683, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2636, 991, 1684, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2637, 991, 1684, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2638, 992, 1685, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2639, 992, 1686, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2640, 992, 1686, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2641, 992, 1686, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2642, 992, 1687, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2643, 992, 1687, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2644, 993, 1688, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2645, 993, 1689, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2646, 993, 1689, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2647, 993, 1689, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2648, 993, 1690, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2649, 993, 1690, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2650, 994, 1691, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2651, 994, 1692, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2652, 994, 1692, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2653, 994, 1692, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2654, 994, 1693, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2655, 994, 1693, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2656, 995, 1694, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2657, 995, 1695, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2658, 995, 1695, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2659, 995, 1695, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2660, 995, 1696, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2661, 995, 1696, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2662, 996, 1697, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2663, 996, 1698, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2664, 996, 1698, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2665, 996, 1698, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2666, 996, 1699, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2667, 996, 1699, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2668, 997, 1700, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2669, 997, 1701, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2670, 997, 1701, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2671, 997, 1701, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2672, 997, 1702, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2673, 997, 1702, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2674, 998, 1703, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2675, 998, 1704, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2676, 998, 1704, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2677, 998, 1704, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2678, 998, 1705, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2679, 998, 1705, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2680, 999, 1706, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2681, 999, 1707, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2682, 999, 1707, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2683, 999, 1707, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2684, 999, 1708, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2685, 999, 1708, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2686, 1000, 1709, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2687, 1000, 1710, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2688, 1000, 1710, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2689, 1000, 1710, 10, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2690, 1000, 1711, 9, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2691, 1000, 1711, 8, 5, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2692, 1001, 1712, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2693, 1001, 1713, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2694, 1002, 1714, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2695, 1002, 1715, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2696, 1003, 1716, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2697, 1003, 1717, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2698, 1004, 1718, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2699, 1004, 1719, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2700, 1005, 1720, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2701, 1005, 1721, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2702, 1006, 1722, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2703, 1006, 1723, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2704, 1007, 1724, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2705, 1007, 1725, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2706, 1008, 1726, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2707, 1008, 1727, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2708, 1009, 1728, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2709, 1009, 1729, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2710, 1010, 1730, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2711, 1010, 1731, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2712, 1011, 1732, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2713, 1011, 1733, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2714, 1012, 1734, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2715, 1012, 1735, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2716, 1013, 1736, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2717, 1013, 1737, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2718, 1014, 1738, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2719, 1014, 1739, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2720, 1015, 1740, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2721, 1015, 1741, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2722, 1016, 1742, 10, 3, '2.7166666666667', 2, 3);
INSERT INTO `assignment_begin_subtest` VALUES (2723, 1016, 1743, 8, 3, '2.5166666666667', 2, 3);
INSERT INTO `assignment_begin_subtest` VALUES (2724, 1017, 1744, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2725, 1017, 1745, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2726, 1018, 1746, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2727, 1018, 1747, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2728, 1019, 1748, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2729, 1019, 1749, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2730, 1020, 1750, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2731, 1020, 1751, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2732, 1021, 1752, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2733, 1021, 1753, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2734, 1022, 1754, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2735, 1022, 1755, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2736, 1023, 1756, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2737, 1023, 1757, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2738, 1024, 1758, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2739, 1024, 1759, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2740, 1025, 1760, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2741, 1025, 1761, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2742, 1026, 1762, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2743, 1026, 1763, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2744, 1027, 1764, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2745, 1027, 1765, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2746, 1028, 1766, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2747, 1028, 1767, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2748, 1029, 1768, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2749, 1029, 1769, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2750, 1030, 1770, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2751, 1030, 1771, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2752, 1031, 1772, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2753, 1031, 1773, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2754, 1032, 1774, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2755, 1032, 1775, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2756, 1033, 1776, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2757, 1033, 1777, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2758, 1034, 1778, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2759, 1034, 1779, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2760, 1035, 1780, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2761, 1035, 1781, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2762, 1036, 1782, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2763, 1036, 1783, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2764, 1037, 1784, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2765, 1037, 1785, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2766, 1038, 1786, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2767, 1038, 1787, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2768, 1039, 1788, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2769, 1039, 1789, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2770, 1040, 1790, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2771, 1040, 1791, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2772, 1041, 1792, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2773, 1041, 1793, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2774, 1042, 1794, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2775, 1042, 1795, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2776, 1043, 1796, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2777, 1043, 1797, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2778, 1044, 1798, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2779, 1044, 1799, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2780, 1045, 1800, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2781, 1045, 1801, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2782, 1046, 1802, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2783, 1046, 1803, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2784, 1047, 1804, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2785, 1047, 1805, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2786, 1048, 1806, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2787, 1048, 1807, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2788, 1049, 1808, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2789, 1049, 1809, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2790, 1050, 1810, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2791, 1050, 1811, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2792, 1051, 1812, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2793, 1051, 1813, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2794, 1052, 1814, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2795, 1052, 1815, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2796, 1053, 1816, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2797, 1053, 1817, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2798, 1054, 1818, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2799, 1054, 1819, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2800, 1055, 1820, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2801, 1055, 1821, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2802, 1056, 1822, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2803, 1056, 1823, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2804, 1057, 1824, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2805, 1057, 1825, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2806, 1058, 1826, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2807, 1058, 1827, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2808, 1059, 1828, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2809, 1059, 1829, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2810, 1060, 1830, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2811, 1060, 1831, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2812, 1061, 1832, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2813, 1061, 1833, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2814, 1062, 1834, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2815, 1062, 1835, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2816, 1063, 1836, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2817, 1063, 1837, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2818, 1064, 1838, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2819, 1064, 1839, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2820, 1065, 1840, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2821, 1065, 1841, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2822, 1066, 1842, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2823, 1066, 1843, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2824, 1067, 1844, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2825, 1067, 1845, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2826, 1068, 1846, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2827, 1068, 1847, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2828, 1069, 1848, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2829, 1069, 1849, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2830, 1070, 1850, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2831, 1070, 1851, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2832, 1071, 1852, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2833, 1071, 1853, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2834, 1072, 1854, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2835, 1072, 1855, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2836, 1073, 1856, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2837, 1073, 1857, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2838, 1074, 1858, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2839, 1074, 1859, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2840, 1075, 1860, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2841, 1075, 1861, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2842, 1076, 1862, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2843, 1076, 1863, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2844, 1077, 1864, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2845, 1077, 1865, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2846, 1078, 1866, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2847, 1078, 1867, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2848, 1079, 1868, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2849, 1079, 1869, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2850, 1080, 1870, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2851, 1080, 1871, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2852, 1081, 1872, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2853, 1081, 1873, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2854, 1082, 1874, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2855, 1082, 1875, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2856, 1083, 1876, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2857, 1083, 1877, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2858, 1084, 1878, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2859, 1084, 1879, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2860, 1085, 1880, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2861, 1085, 1881, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2862, 1086, 1882, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2863, 1086, 1883, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2864, 1087, 1884, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2865, 1087, 1885, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2866, 1088, 1886, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2867, 1088, 1887, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2868, 1089, 1888, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2869, 1089, 1889, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2870, 1090, 1890, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2871, 1090, 1891, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2872, 1091, 1892, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2873, 1091, 1893, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2874, 1092, 1894, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2875, 1092, 1895, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2876, 1093, 1896, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2877, 1093, 1897, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2878, 1094, 1898, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2879, 1094, 1899, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2880, 1095, 1900, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2881, 1095, 1901, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2882, 1096, 1902, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2883, 1096, 1903, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2884, 1097, 1904, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2885, 1097, 1905, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2886, 1098, 1906, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2887, 1098, 1907, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2888, 1099, 1908, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2889, 1099, 1909, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2890, 1100, 1910, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2891, 1100, 1911, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2892, 1101, 1912, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2893, 1101, 1913, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2894, 1102, 1914, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2895, 1102, 1915, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2896, 1103, 1916, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2897, 1103, 1917, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2898, 1104, 1918, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2899, 1104, 1919, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2900, 1105, 1920, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2901, 1105, 1921, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2902, 1106, 1922, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2903, 1106, 1923, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2904, 1107, 1924, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2905, 1107, 1925, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2906, 1108, 1926, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2907, 1108, 1927, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2908, 1109, 1928, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2909, 1109, 1929, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2910, 1110, 1930, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2911, 1110, 1931, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2912, 1111, 1932, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2913, 1111, 1933, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2914, 1112, 1934, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2915, 1112, 1935, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2916, 1113, 1936, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2917, 1113, 1937, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2918, 1114, 1938, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2919, 1114, 1939, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2920, 1115, 1940, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2921, 1115, 1941, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2922, 1116, 1942, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2923, 1116, 1943, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2924, 1117, 1944, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2925, 1117, 1945, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2926, 1118, 1946, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2927, 1118, 1947, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2928, 1119, 1948, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2929, 1119, 1949, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2930, 1120, 1950, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2931, 1120, 1951, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2932, 1121, 1952, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2933, 1121, 1953, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2934, 1122, 1954, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2935, 1122, 1955, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2936, 1123, 1956, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2937, 1123, 1957, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2938, 1124, 1958, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2939, 1124, 1959, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2940, 1125, 1960, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2941, 1125, 1961, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2942, 1126, 1962, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2943, 1126, 1963, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2944, 1127, 1964, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2945, 1127, 1965, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2946, 1128, 1966, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2947, 1128, 1967, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2948, 1129, 1968, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2949, 1129, 1969, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2950, 1130, 1970, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2951, 1130, 1971, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2952, 1131, 1972, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2953, 1131, 1973, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2954, 1132, 1974, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2955, 1132, 1975, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2956, 1133, 1976, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2957, 1133, 1977, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2958, 1134, 1978, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2959, 1134, 1979, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2960, 1135, 1980, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2961, 1135, 1981, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2962, 1136, 1982, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2963, 1136, 1983, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2964, 1137, 1984, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2965, 1137, 1985, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2966, 1138, 1986, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2967, 1138, 1987, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2968, 1139, 1988, 10, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2969, 1139, 1989, 8, 3, '3', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2970, 1140, 1990, 9, 4, '0', 2, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2971, 1141, 1991, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2972, 1141, 1991, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2973, 1141, 1992, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2974, 1142, 1993, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2975, 1142, 1993, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2976, 1142, 1994, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2977, 1143, 1995, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2978, 1143, 1995, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2979, 1143, 1996, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2980, 1144, 1997, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2981, 1144, 1997, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2982, 1144, 1998, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2983, 1145, 1999, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2984, 1145, 1999, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2985, 1145, 2000, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2986, 1146, 2001, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2987, 1146, 2001, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2988, 1146, 2002, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2989, 1147, 2003, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2990, 1147, 2003, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2991, 1147, 2004, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2992, 1148, 2005, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2993, 1148, 2005, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2994, 1148, 2006, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2995, 1149, 2007, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2996, 1149, 2007, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2997, 1149, 2008, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2998, 1150, 2009, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (2999, 1150, 2009, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3000, 1150, 2010, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3001, 1151, 2011, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3002, 1151, 2011, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3003, 1151, 2012, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3004, 1152, 2013, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3005, 1152, 2013, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3006, 1152, 2014, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3007, 1153, 2015, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3008, 1153, 2015, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3009, 1153, 2016, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3010, 1154, 2017, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3011, 1154, 2017, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3012, 1154, 2018, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3013, 1155, 2019, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3014, 1155, 2019, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3015, 1155, 2020, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3016, 1156, 2021, 9, 3, '4.8666666666667', 2, 3);
INSERT INTO `assignment_begin_subtest` VALUES (3017, 1156, 2021, 8, 3, '4.6666666666667', 2, 3);
INSERT INTO `assignment_begin_subtest` VALUES (3018, 1156, 2022, 9, 3, '4.5833333333333', 2, 3);
INSERT INTO `assignment_begin_subtest` VALUES (3019, 1157, 2023, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3020, 1157, 2023, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3021, 1157, 2024, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3022, 1158, 2025, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3023, 1158, 2025, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3024, 1158, 2026, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3025, 1159, 2027, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3026, 1159, 2027, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3027, 1159, 2028, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3028, 1160, 2029, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3029, 1160, 2029, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3030, 1160, 2030, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3031, 1161, 2031, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3032, 1161, 2031, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3033, 1161, 2032, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3034, 1162, 2033, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3035, 1162, 2033, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3036, 1162, 2034, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3037, 1163, 2035, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3038, 1163, 2035, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3039, 1163, 2036, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3040, 1164, 2037, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3041, 1164, 2037, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3042, 1164, 2038, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3043, 1165, 2039, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3044, 1165, 2039, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3045, 1165, 2040, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3046, 1166, 2041, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3047, 1166, 2041, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3048, 1166, 2042, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3049, 1167, 2043, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3050, 1167, 2043, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3051, 1167, 2044, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3052, 1168, 2045, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3053, 1168, 2045, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3054, 1168, 2046, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3055, 1169, 2047, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3056, 1169, 2047, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3057, 1169, 2048, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3058, 1170, 2049, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3059, 1170, 2049, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3060, 1170, 2050, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3061, 1171, 2051, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3062, 1171, 2051, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3063, 1171, 2052, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3064, 1172, 2053, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3065, 1172, 2053, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3066, 1172, 2054, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3067, 1173, 2055, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3068, 1173, 2055, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3069, 1173, 2056, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3070, 1174, 2057, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3071, 1174, 2057, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3072, 1174, 2058, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3073, 1175, 2059, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3074, 1175, 2059, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3075, 1175, 2060, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3076, 1176, 2061, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3077, 1176, 2061, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3078, 1176, 2062, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3079, 1177, 2063, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3080, 1177, 2063, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3081, 1177, 2064, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3082, 1178, 2065, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3083, 1178, 2065, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3084, 1178, 2066, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3085, 1179, 2067, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3086, 1179, 2067, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3087, 1179, 2068, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3088, 1180, 2069, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3089, 1180, 2069, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3090, 1180, 2070, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3091, 1181, 2071, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3092, 1181, 2071, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3093, 1181, 2072, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3094, 1182, 2073, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3095, 1182, 2073, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3096, 1182, 2074, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3097, 1183, 2075, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3098, 1183, 2075, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3099, 1183, 2076, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3100, 1184, 2077, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3101, 1184, 2077, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3102, 1184, 2078, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3103, 1185, 2079, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3104, 1185, 2079, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3105, 1185, 2080, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3106, 1186, 2081, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3107, 1186, 2081, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3108, 1186, 2082, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3109, 1187, 2083, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3110, 1187, 2083, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3111, 1187, 2084, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3112, 1188, 2085, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3113, 1188, 2085, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3114, 1188, 2086, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3115, 1189, 2087, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3116, 1189, 2087, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3117, 1189, 2088, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3118, 1190, 2089, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3119, 1190, 2089, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3120, 1190, 2090, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3121, 1191, 2091, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3122, 1191, 2091, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3123, 1191, 2092, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3124, 1192, 2093, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3125, 1192, 2093, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3126, 1192, 2094, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3127, 1193, 2095, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3128, 1193, 2095, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3129, 1193, 2096, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3130, 1194, 2097, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3131, 1194, 2097, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3132, 1194, 2098, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3133, 1195, 2099, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3134, 1195, 2099, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3135, 1195, 2100, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3136, 1196, 2101, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3137, 1196, 2101, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3138, 1196, 2102, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3139, 1197, 2103, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3140, 1197, 2103, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3141, 1197, 2104, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3142, 1198, 2105, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3143, 1198, 2105, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3144, 1198, 2106, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3145, 1199, 2107, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3146, 1199, 2107, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3147, 1199, 2108, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3148, 1200, 2109, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3149, 1200, 2109, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3150, 1200, 2110, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3151, 1201, 2111, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3152, 1201, 2111, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3153, 1201, 2112, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3154, 1202, 2113, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3155, 1202, 2113, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3156, 1202, 2114, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3157, 1203, 2115, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3158, 1203, 2115, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3159, 1203, 2116, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3160, 1204, 2117, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3161, 1204, 2117, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3162, 1204, 2118, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3163, 1205, 2119, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3164, 1205, 2119, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3165, 1205, 2120, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3166, 1206, 2121, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3167, 1206, 2121, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3168, 1206, 2122, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3169, 1207, 2123, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3170, 1207, 2123, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3171, 1207, 2124, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3172, 1208, 2125, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3173, 1208, 2125, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3174, 1208, 2126, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3175, 1209, 2127, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3176, 1209, 2127, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3177, 1209, 2128, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3178, 1210, 2129, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3179, 1210, 2129, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3180, 1210, 2130, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3181, 1211, 2131, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3182, 1211, 2131, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3183, 1211, 2132, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3184, 1212, 2133, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3185, 1212, 2133, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3186, 1212, 2134, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3187, 1213, 2135, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3188, 1213, 2135, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3189, 1213, 2136, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3190, 1214, 2137, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3191, 1214, 2137, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3192, 1214, 2138, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3193, 1215, 2139, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3194, 1215, 2139, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3195, 1215, 2140, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3196, 1216, 2141, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3197, 1216, 2141, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3198, 1216, 2142, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3199, 1217, 2143, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3200, 1217, 2143, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3201, 1217, 2144, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3202, 1218, 2145, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3203, 1218, 2145, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3204, 1218, 2146, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3205, 1219, 2147, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3206, 1219, 2147, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3207, 1219, 2148, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3208, 1220, 2149, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3209, 1220, 2149, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3210, 1220, 2150, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3211, 1221, 2151, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3212, 1221, 2151, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3213, 1221, 2152, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3214, 1222, 2153, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3215, 1222, 2153, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3216, 1222, 2154, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3217, 1223, 2155, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3218, 1223, 2155, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3219, 1223, 2156, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3220, 1224, 2157, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3221, 1224, 2157, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3222, 1224, 2158, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3223, 1225, 2159, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3224, 1225, 2159, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3225, 1225, 2160, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3226, 1226, 2161, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3227, 1226, 2161, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3228, 1226, 2162, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3229, 1227, 2163, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3230, 1227, 2163, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3231, 1227, 2164, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3232, 1228, 2165, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3233, 1228, 2165, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3234, 1228, 2166, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3235, 1229, 2167, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3236, 1229, 2167, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3237, 1229, 2168, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3238, 1230, 2169, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3239, 1230, 2169, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3240, 1230, 2170, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3241, 1231, 2171, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3242, 1231, 2171, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3243, 1231, 2172, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3244, 1232, 2173, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3245, 1232, 2173, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3246, 1232, 2174, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3247, 1233, 2175, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3248, 1233, 2175, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3249, 1233, 2176, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3250, 1234, 2177, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3251, 1234, 2177, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3252, 1234, 2178, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3253, 1235, 2179, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3254, 1235, 2179, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3255, 1235, 2180, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3256, 1236, 2181, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3257, 1236, 2181, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3258, 1236, 2182, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3259, 1237, 2183, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3260, 1237, 2183, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3261, 1237, 2184, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3262, 1238, 2185, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3263, 1238, 2185, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3264, 1238, 2186, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3265, 1239, 2187, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3266, 1239, 2187, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3267, 1239, 2188, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3268, 1240, 2189, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3269, 1240, 2189, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3270, 1240, 2190, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3271, 1241, 2191, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3272, 1241, 2191, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3273, 1241, 2192, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3274, 1242, 2193, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3275, 1242, 2193, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3276, 1242, 2194, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3277, 1243, 2195, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3278, 1243, 2195, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3279, 1243, 2196, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3280, 1244, 2197, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3281, 1244, 2197, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3282, 1244, 2198, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3283, 1245, 2199, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3284, 1245, 2199, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3285, 1245, 2200, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3286, 1246, 2201, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3287, 1246, 2201, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3288, 1246, 2202, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3289, 1247, 2203, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3290, 1247, 2203, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3291, 1247, 2204, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3292, 1248, 2205, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3293, 1248, 2205, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3294, 1248, 2206, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3295, 1249, 2207, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3296, 1249, 2207, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3297, 1249, 2208, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3298, 1250, 2209, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3299, 1250, 2209, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3300, 1250, 2210, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3301, 1251, 2211, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3302, 1251, 2211, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3303, 1251, 2212, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3304, 1252, 2213, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3305, 1252, 2213, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3306, 1252, 2214, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3307, 1253, 2215, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3308, 1253, 2215, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3309, 1253, 2216, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3310, 1254, 2217, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3311, 1254, 2217, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3312, 1254, 2218, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3313, 1255, 2219, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3314, 1255, 2219, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3315, 1255, 2220, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3316, 1256, 2221, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3317, 1256, 2221, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3318, 1256, 2222, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3319, 1257, 2223, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3320, 1257, 2223, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3321, 1257, 2224, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3322, 1258, 2225, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3323, 1258, 2225, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3324, 1258, 2226, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3325, 1259, 2227, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3326, 1259, 2227, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3327, 1259, 2228, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3328, 1260, 2229, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3329, 1260, 2229, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3330, 1260, 2230, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3331, 1261, 2231, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3332, 1261, 2231, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3333, 1261, 2232, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3334, 1262, 2233, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3335, 1262, 2233, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3336, 1262, 2234, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3337, 1263, 2235, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3338, 1263, 2235, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3339, 1263, 2236, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3340, 1264, 2237, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3341, 1264, 2237, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3342, 1264, 2238, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3343, 1265, 2239, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3344, 1265, 2239, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3345, 1265, 2240, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3346, 1266, 2241, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3347, 1266, 2241, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3348, 1266, 2242, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3349, 1267, 2243, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3350, 1267, 2243, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3351, 1267, 2244, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3352, 1268, 2245, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3353, 1268, 2245, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3354, 1268, 2246, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3355, 1269, 2247, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3356, 1269, 2247, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3357, 1269, 2248, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3358, 1270, 2249, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3359, 1270, 2249, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3360, 1270, 2250, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3361, 1271, 2251, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3362, 1271, 2251, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3363, 1271, 2252, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3364, 1272, 2253, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3365, 1272, 2253, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3366, 1272, 2254, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3367, 1273, 2255, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3368, 1273, 2255, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3369, 1273, 2256, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3370, 1274, 2257, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3371, 1274, 2257, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3372, 1274, 2258, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3373, 1275, 2259, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3374, 1275, 2259, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3375, 1275, 2260, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3376, 1276, 2261, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3377, 1276, 2261, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3378, 1276, 2262, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3379, 1277, 2263, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3380, 1277, 2263, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3381, 1277, 2264, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3382, 1278, 2265, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3383, 1278, 2265, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3384, 1278, 2266, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3385, 1279, 2267, 9, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3386, 1279, 2267, 8, 3, '5', 0, 0);
INSERT INTO `assignment_begin_subtest` VALUES (3387, 1279, 2268, 9, 3, '5', 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_categories
-- ----------------------------
INSERT INTO `assignment_categories` VALUES (53, 16, 3, 0);
INSERT INTO `assignment_categories` VALUES (54, 16, 2, 0);
INSERT INTO `assignment_categories` VALUES (55, 16, 1, 0);
INSERT INTO `assignment_categories` VALUES (56, 17, 3, 0);
INSERT INTO `assignment_categories` VALUES (57, 17, 2, 0);
INSERT INTO `assignment_categories` VALUES (58, 18, 1, 0);
INSERT INTO `assignment_categories` VALUES (59, 19, 2, 0);
INSERT INTO `assignment_categories` VALUES (60, 19, 1, 0);

-- ----------------------------
-- Table structure for assignment_class
-- ----------------------------
DROP TABLE IF EXISTS `assignment_class`;
CREATE TABLE `assignment_class`  (
  `id_aclass` int NOT NULL AUTO_INCREMENT,
  `id_assignment` int NULL DEFAULT NULL,
  `id_class` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_aclass`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_class
-- ----------------------------
INSERT INTO `assignment_class` VALUES (62, 16, 17);
INSERT INTO `assignment_class` VALUES (63, 16, 13);
INSERT INTO `assignment_class` VALUES (64, 16, 15);
INSERT INTO `assignment_class` VALUES (65, 16, 14);
INSERT INTO `assignment_class` VALUES (66, 16, 12);
INSERT INTO `assignment_class` VALUES (67, 16, 18);
INSERT INTO `assignment_class` VALUES (68, 16, 11);
INSERT INTO `assignment_class` VALUES (69, 16, 2);
INSERT INTO `assignment_class` VALUES (70, 16, 3);
INSERT INTO `assignment_class` VALUES (71, 16, 1);
INSERT INTO `assignment_class` VALUES (72, 16, 4);
INSERT INTO `assignment_class` VALUES (73, 17, 17);
INSERT INTO `assignment_class` VALUES (74, 17, 13);
INSERT INTO `assignment_class` VALUES (75, 17, 15);
INSERT INTO `assignment_class` VALUES (76, 17, 14);
INSERT INTO `assignment_class` VALUES (77, 17, 12);
INSERT INTO `assignment_class` VALUES (78, 17, 18);
INSERT INTO `assignment_class` VALUES (79, 17, 11);
INSERT INTO `assignment_class` VALUES (80, 17, 2);
INSERT INTO `assignment_class` VALUES (81, 17, 3);
INSERT INTO `assignment_class` VALUES (82, 17, 1);
INSERT INTO `assignment_class` VALUES (83, 17, 4);
INSERT INTO `assignment_class` VALUES (84, 18, NULL);
INSERT INTO `assignment_class` VALUES (85, 19, 17);
INSERT INTO `assignment_class` VALUES (86, 19, 13);
INSERT INTO `assignment_class` VALUES (87, 19, 15);
INSERT INTO `assignment_class` VALUES (88, 19, 14);
INSERT INTO `assignment_class` VALUES (89, 19, 12);
INSERT INTO `assignment_class` VALUES (90, 19, 18);
INSERT INTO `assignment_class` VALUES (91, 19, 11);
INSERT INTO `assignment_class` VALUES (92, 19, 2);
INSERT INTO `assignment_class` VALUES (93, 19, 3);
INSERT INTO `assignment_class` VALUES (94, 19, 1);
INSERT INTO `assignment_class` VALUES (95, 19, 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_detail_subtest
-- ----------------------------
INSERT INTO `assignment_detail_subtest` VALUES (66, 16, 53, 10, 5, '5', 0);
INSERT INTO `assignment_detail_subtest` VALUES (67, 16, 54, 9, 5, '5', 0);
INSERT INTO `assignment_detail_subtest` VALUES (68, 16, 54, 8, 5, '5', 0);
INSERT INTO `assignment_detail_subtest` VALUES (69, 16, 54, 10, 5, '5', 0);
INSERT INTO `assignment_detail_subtest` VALUES (70, 16, 55, 9, 5, '5', 0);
INSERT INTO `assignment_detail_subtest` VALUES (71, 16, 55, 8, 5, '5', 0);
INSERT INTO `assignment_detail_subtest` VALUES (72, 17, 56, 10, 3, '3', 0);
INSERT INTO `assignment_detail_subtest` VALUES (73, 17, 57, 8, 3, '3', 0);
INSERT INTO `assignment_detail_subtest` VALUES (74, 18, 58, 9, 4, '4', 0);
INSERT INTO `assignment_detail_subtest` VALUES (75, 19, 59, 9, 3, '5', 0);
INSERT INTO `assignment_detail_subtest` VALUES (76, 19, 59, 8, 3, '5', 0);
INSERT INTO `assignment_detail_subtest` VALUES (77, 19, 60, 9, 3, '5', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 512 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of assignment_question_answers
-- ----------------------------
INSERT INTO `assignment_question_answers` VALUES (497, 1016, 1742, 2722, 87, 0, NULL, '2023-09-23 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (498, 1016, 1742, 2722, 71, 0, NULL, '2023-09-23 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (499, 1016, 1742, 2722, 75, 0, NULL, '2023-09-23 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (500, 1016, 1743, 2723, 61, 1, NULL, '2023-09-23 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (501, 1016, 1743, 2723, 42, 1, NULL, '2023-09-23 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (502, 1016, 1743, 2723, 72, 0, NULL, '2023-09-23 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (503, 1156, 2021, 3016, 77, 0, NULL, '2023-09-24 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (504, 1156, 2021, 3016, 86, 0, NULL, '2023-09-24 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (505, 1156, 2021, 3016, 39, 1, NULL, '2023-09-24 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (506, 1156, 2021, 3017, 91, 0, NULL, '2023-09-24 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (507, 1156, 2021, 3017, 61, 1, NULL, '2023-09-24 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (508, 1156, 2021, 3017, 91, 0, NULL, '2023-09-24 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (509, 1156, 2022, 3018, 58, 0, NULL, '2023-09-24 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (510, 1156, 2022, 3018, 65, 0, NULL, '2023-09-24 00:00:00', 138);
INSERT INTO `assignment_question_answers` VALUES (511, 1156, 2022, 3018, 55, 1, NULL, '2023-09-24 00:00:00', 138);

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category_subtests
-- ----------------------------
INSERT INTO `category_subtests` VALUES (2, 2, 9, NULL);
INSERT INTO `category_subtests` VALUES (3, 1, 9, NULL);
INSERT INTO `category_subtests` VALUES (4, 2, 8, NULL);
INSERT INTO `category_subtests` VALUES (5, 1, 8, NULL);
INSERT INTO `category_subtests` VALUES (6, 3, 10, NULL);
INSERT INTO `category_subtests` VALUES (7, 2, 10, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_assignment
-- ----------------------------
INSERT INTO `ms_assignment` VALUES (16, 1, 'admin', NULL, 'UTS', NULL, 'Tri Joko', NULL, 0, '31-192b791-1', 0, 0, 0, 0, NULL, '2023-09-21 09:40:31', '2023-09-21 09:40:31', 'Tes Semua Murid');
INSERT INTO `ms_assignment` VALUES (17, 1, 'admin', NULL, 'Dian', NULL, 'UTS', NULL, 0, '18-192b791-1', 0, 0, 0, 0, NULL, '2023-09-22 23:18:18', '2023-09-22 23:18:18', 'Nama semua');
INSERT INTO `ms_assignment` VALUES (18, 1, 'admin', NULL, 'UAN', NULL, 'Ojan', NULL, 0, '23-192b791-1', 0, 0, 0, 0, NULL, '2023-09-23 10:50:23', '2023-09-23 10:50:23', 'Test DB Duration');
INSERT INTO `ms_assignment` VALUES (19, 1, 'admin', NULL, 'UTS', NULL, 'Tri Joko', NULL, 0, '19-192b791-1', 0, 0, 0, 0, NULL, '2023-09-24 16:39:19', '2023-09-24 16:39:19', 'Test Meeting');

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
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_question
-- ----------------------------
INSERT INTO `ms_question` VALUES (38, 1, 'Ini Benar Salah 1', NULL, NULL, '2023-09-02 00:00:00', '2023-09-09 21:51:32', 0, 3, 1, 8, 60);
INSERT INTO `ms_question` VALUES (39, 15, 'Ini Benar Salah 2', NULL, NULL, '2023-09-02 00:00:00', '2023-09-10 01:18:33', 0, 1, 1, 9, 60);
INSERT INTO `ms_question` VALUES (40, 16, 'Ini Benar Salah 3', NULL, NULL, '2023-09-02 00:00:00', '2023-09-09 22:05:01', 0, 3, 1, 8, 60);
INSERT INTO `ms_question` VALUES (41, 17, 'Ini Benar Salah 4', NULL, NULL, '2023-09-02 00:00:00', '2023-09-09 21:52:07', 0, 4, 1, 9, 60);
INSERT INTO `ms_question` VALUES (42, 15, 'Ini Benar Salah 5', NULL, NULL, '2023-09-02 00:00:00', '2023-09-10 01:20:02', 0, 2, 1, 8, 60);
INSERT INTO `ms_question` VALUES (43, 1, 'Ini soal berganda 1', NULL, NULL, '2023-09-02 00:00:00', '2023-09-10 01:20:04', 0, 2, 2, 9, 60);
INSERT INTO `ms_question` VALUES (44, 16, 'Ini soal berganda 2', NULL, NULL, '2023-09-02 00:00:00', '2023-09-10 01:20:58', 0, 5, 4, 8, 60);
INSERT INTO `ms_question` VALUES (45, 15, 'Ini soal berganda 3', NULL, NULL, '2023-09-02 00:00:00', '2023-09-10 01:20:30', 0, 5, 2, 9, 60);
INSERT INTO `ms_question` VALUES (46, 1, 'Ini soal berganda 4', NULL, NULL, '2023-09-02 00:00:00', '2023-09-09 21:52:14', 0, 2, 2, 8, 60);
INSERT INTO `ms_question` VALUES (47, 17, 'Ini soal berganda 5', NULL, NULL, '2023-09-02 00:00:00', '2023-09-10 01:18:42', 0, 1, 2, 9, 60);
INSERT INTO `ms_question` VALUES (49, 16, 'Ini soal menjodohkan', NULL, NULL, '2023-09-02 00:00:00', '2023-09-13 23:09:48', 0, 3, 5, 9, 60);
INSERT INTO `ms_question` VALUES (50, 17, 'Ini soal isian singkat', NULL, NULL, '2023-09-02 00:00:00', '2023-09-10 01:07:50', 1, 1, 3, 9, 60);
INSERT INTO `ms_question` VALUES (51, 17, '<p>adsasda</p>', NULL, NULL, '2023-09-02 22:55:06', '2023-09-09 21:52:22', 0, 1, 3, 8, 60);
INSERT INTO `ms_question` VALUES (52, 17, 'Ini soal isian singkat', NULL, NULL, '2023-09-02 00:00:00', '2023-09-10 01:13:05', 1, 1, 3, 9, 60);
INSERT INTO `ms_question` VALUES (53, 0, 'Contoh Soal', NULL, NULL, '2023-09-02 00:00:00', '2023-09-09 21:52:26', 0, 4, 3, 8, 60);
INSERT INTO `ms_question` VALUES (54, 15, 'Isi jodohkan', NULL, NULL, '2023-09-03 00:00:00', '2023-09-13 23:05:19', 0, 3, 5, 8, 60);
INSERT INTO `ms_question` VALUES (55, 15, 'Isian singkat level 1 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0, 1, 1, 9, 60);
INSERT INTO `ms_question` VALUES (56, 15, 'Isian singkat level 2 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0, 1, 1, 9, 60);
INSERT INTO `ms_question` VALUES (57, 15, 'Isian singkat level 3 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0, 1, 1, 9, 60);
INSERT INTO `ms_question` VALUES (58, 15, 'Isian singkat level 4 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0, 1, 1, 9, 60);
INSERT INTO `ms_question` VALUES (59, 15, 'Isian singkat level 5 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0, 1, 1, 9, 60);
INSERT INTO `ms_question` VALUES (60, 15, 'Isian singkat level 1 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0, 1, 1, 8, 60);
INSERT INTO `ms_question` VALUES (61, 15, 'Isian singkat level 2 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0, 1, 1, 8, 60);
INSERT INTO `ms_question` VALUES (62, 15, 'Isian singkat level 3 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0, 1, 1, 8, 60);
INSERT INTO `ms_question` VALUES (63, 15, 'Isian singkat level 4 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0, 1, 1, 8, 60);
INSERT INTO `ms_question` VALUES (64, 15, 'Isian singkat level 5 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0, 1, 1, 8, 60);
INSERT INTO `ms_question` VALUES (65, 16, 'Ini Soal berganda level 1 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0, 1, 2, 9, 60);
INSERT INTO `ms_question` VALUES (66, 16, 'Ini Soal berganda level 2 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0, 2, 2, 9, 60);
INSERT INTO `ms_question` VALUES (67, 16, 'Ini Soal berganda level 3 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0, 3, 2, 9, 60);
INSERT INTO `ms_question` VALUES (68, 16, 'Ini Soal berganda level 4 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0, 4, 2, 9, 60);
INSERT INTO `ms_question` VALUES (69, 16, 'Ini Soal berganda level 5 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0, 5, 2, 9, 60);
INSERT INTO `ms_question` VALUES (70, 16, 'Ini Soal berganda level 1 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-21 15:29:47', 0, 1, 2, 10, 60);
INSERT INTO `ms_question` VALUES (71, 16, 'Ini Soal berganda level 2 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-21 15:29:51', 0, 2, 2, 10, 60);
INSERT INTO `ms_question` VALUES (72, 16, 'Ini Soal berganda level 3 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0, 3, 2, 8, 60);
INSERT INTO `ms_question` VALUES (73, 16, 'Ini Soal berganda level 4 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0, 4, 2, 8, 60);
INSERT INTO `ms_question` VALUES (74, 16, 'Ini Soal berganda level 5 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0, 5, 2, 8, 60);
INSERT INTO `ms_question` VALUES (75, 15, 'Soal level 1 Tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-21 15:29:56', 0, 1, 3, 10, 60);
INSERT INTO `ms_question` VALUES (76, 15, 'Soal level 2 Tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-21 15:29:59', 0, 2, 3, 10, 60);
INSERT INTO `ms_question` VALUES (77, 15, 'Soal level 3 Tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0, 3, 3, 9, 60);
INSERT INTO `ms_question` VALUES (78, 15, 'Soal level 4 Tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0, 4, 3, 9, 60);
INSERT INTO `ms_question` VALUES (79, 15, 'Soal level 5 Tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0, 5, 3, 9, 60);
INSERT INTO `ms_question` VALUES (80, 15, 'Soal level 1 Coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0, 1, 3, 8, 60);
INSERT INTO `ms_question` VALUES (81, 15, 'Soal level 2 Coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0, 2, 3, 8, 60);
INSERT INTO `ms_question` VALUES (82, 15, 'Soal level 3 Coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-21 15:30:02', 0, 3, 3, 10, 60);
INSERT INTO `ms_question` VALUES (83, 15, 'Soal level 4 Coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-21 15:30:06', 0, 4, 3, 10, 60);
INSERT INTO `ms_question` VALUES (84, 15, 'Soal level 5 Coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0, 5, 3, 8, 60);
INSERT INTO `ms_question` VALUES (85, 17, 'Contoh soal majemuk level 1 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0, 1, 4, 9, 60);
INSERT INTO `ms_question` VALUES (86, 17, 'Contoh soal majemuk level 2 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0, 2, 4, 9, 60);
INSERT INTO `ms_question` VALUES (87, 17, 'Contoh soal majemuk level 3 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-21 15:30:09', 0, 3, 4, 10, 60);
INSERT INTO `ms_question` VALUES (88, 17, 'Contoh soal majemuk level 4 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0, 4, 4, 9, 60);
INSERT INTO `ms_question` VALUES (89, 17, 'Contoh soal majemuk level 5 tatang', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0, 5, 4, 9, 60);
INSERT INTO `ms_question` VALUES (90, 17, 'Contoh soal majemuk level 1 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0, 1, 4, 8, 60);
INSERT INTO `ms_question` VALUES (91, 17, 'Contoh soal majemuk level 2 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0, 2, 4, 8, 60);
INSERT INTO `ms_question` VALUES (92, 17, 'Contoh soal majemuk level 3 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0, 3, 4, 8, 60);
INSERT INTO `ms_question` VALUES (93, 17, 'Contoh soal majemuk level 4 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-21 15:30:14', 0, 4, 4, 10, 60);
INSERT INTO `ms_question` VALUES (94, 17, 'Contoh soal majemuk level 5 coba', NULL, NULL, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0, 5, 4, 8, 60);
INSERT INTO `ms_question` VALUES (95, 17, '<p>Pertanyaan Satu</p>', NULL, NULL, '2023-09-17 20:20:34', '2023-09-17 20:20:34', 0, 5, 1, 10, 20);
INSERT INTO `ms_question` VALUES (96, 16, 'Ini  Soal Ketiga', NULL, NULL, '2023-09-17 00:00:00', '2023-09-17 20:21:30', 0, 3, 1, 3, 60);
INSERT INTO `ms_question` VALUES (97, 15, '<p>Ini adalah contoh soal benar dan salah</p>', NULL, NULL, '2023-09-17 20:25:25', '2023-09-17 20:25:25', 0, 5, 1, 4, 20);
INSERT INTO `ms_question` VALUES (98, 15, 'Ini Adalah Contoh Soal Import Excel Benar dan Salah', NULL, NULL, '2023-09-17 00:00:00', '2023-09-17 20:26:32', 0, 3, 1, 4, 60);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

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
INSERT INTO `ms_question_subtest` VALUES (10, NULL, 'Nama Subtes 1', 0, '2023-09-17');

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
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

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
INSERT INTO `ms_student` VALUES (139, 17, 1, NULL, 'Baswedan', '$1$cjsxOpqe$glJ.GZMhXyfs8Npbk9ms0.', 'baswedan@gmail.com', '081102', NULL, '2023-09-17', NULL, NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ms_subtest_categories
-- ----------------------------
INSERT INTO `ms_subtest_categories` VALUES (1, 'Tes Potensi Skolastik', 0, NULL);
INSERT INTO `ms_subtest_categories` VALUES (2, 'Tes Kompetensi Akademik', 0, NULL);
INSERT INTO `ms_subtest_categories` VALUES (3, 'Kategori 1', 0, '2023-09-17');

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
) ENGINE = InnoDB AUTO_INCREMENT = 187 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of question_answer
-- ----------------------------
INSERT INTO `question_answer` VALUES (30, 51, 'asdasdasdasd', NULL, '2023-09-02 22:55:06', '2023-09-02 22:55:06', 0);
INSERT INTO `question_answer` VALUES (31, 53, 'Ini adalah jawaban', NULL, '2023-09-02 00:00:00', '2023-09-02 23:01:12', 0);
INSERT INTO `question_answer` VALUES (32, 75, 'Kucing', NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0);
INSERT INTO `question_answer` VALUES (33, 76, 'Anjing', NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0);
INSERT INTO `question_answer` VALUES (34, 77, 'Singa', NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0);
INSERT INTO `question_answer` VALUES (35, 78, 'harimau', NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0);
INSERT INTO `question_answer` VALUES (36, 79, 'Tikus', NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0);
INSERT INTO `question_answer` VALUES (37, 80, 'Kucing', NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0);
INSERT INTO `question_answer` VALUES (38, 81, 'Anjing', NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0);
INSERT INTO `question_answer` VALUES (39, 82, 'Singa', NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0);
INSERT INTO `question_answer` VALUES (40, 83, 'harimau', NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0);
INSERT INTO `question_answer` VALUES (41, 84, 'Tikus', NULL, '2023-09-10 00:00:00', '2023-09-10 01:39:14', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

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
INSERT INTO `question_option` VALUES (65, 55, 'Apakah Benar ?', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0);
INSERT INTO `question_option` VALUES (66, 56, 'Apakah Benar ?', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0);
INSERT INTO `question_option` VALUES (67, 57, 'Apakah Benar ?', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0);
INSERT INTO `question_option` VALUES (68, 58, 'Apakah Benar ?', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0);
INSERT INTO `question_option` VALUES (69, 59, 'Apakah Benar ?', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0);
INSERT INTO `question_option` VALUES (70, 60, 'Apakah Benar ?', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0);
INSERT INTO `question_option` VALUES (71, 61, 'Apakah Benar ?', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0);
INSERT INTO `question_option` VALUES (72, 62, 'Apakah Benar ?', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0);
INSERT INTO `question_option` VALUES (73, 63, 'Apakah Benar ?', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0);
INSERT INTO `question_option` VALUES (74, 64, 'Apakah Benar ?', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:31:08', 0);
INSERT INTO `question_option` VALUES (75, 65, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (76, 65, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (77, 65, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (78, 65, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (79, 65, 'Charlie Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (80, 65, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (81, 66, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (82, 66, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (83, 66, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (84, 66, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (85, 66, 'Charlie Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (86, 66, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (87, 67, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (88, 67, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (89, 67, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (90, 67, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (91, 67, 'Charlie Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (92, 67, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (93, 68, 'Alpha Correct', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (94, 68, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (95, 68, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (96, 68, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (97, 68, 'Charlie Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (98, 68, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (99, 69, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (100, 69, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (101, 69, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (102, 69, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (103, 69, 'Charlie Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (104, 69, 'Delta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (105, 70, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (106, 70, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (107, 70, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (108, 70, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (109, 70, 'Charlie Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (110, 70, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (111, 71, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (112, 71, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (113, 71, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (114, 71, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (115, 71, 'Charlie Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (116, 71, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (117, 72, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (118, 72, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (119, 72, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (120, 72, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (121, 72, 'Charlie Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (122, 72, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (123, 73, 'Alpha Correct', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (124, 73, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (125, 73, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (126, 73, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (127, 73, 'Charlie Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (128, 73, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (129, 74, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (130, 74, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (131, 74, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (132, 74, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (133, 74, 'Charlie Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (134, 74, 'Delta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:35:11', 0);
INSERT INTO `question_option` VALUES (135, 85, 'Alpha Correct', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (136, 85, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (137, 85, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (138, 85, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (139, 85, 'Charlie Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (140, 85, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (141, 86, 'Alpha Correct', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (142, 86, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (143, 86, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (144, 86, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (145, 86, 'Charlie Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (146, 86, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (147, 87, 'Alpha Correct', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (148, 87, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (149, 87, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (150, 87, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (151, 87, 'Charlie Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (152, 87, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (153, 88, 'Alpha Correct', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (154, 88, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (155, 88, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (156, 88, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (157, 88, 'Charlie Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (158, 88, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (159, 89, 'Alpha Correct', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (160, 89, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (161, 89, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (162, 89, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (163, 89, 'Charlie Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (164, 89, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (165, 90, 'Alpha Correct', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (166, 90, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (167, 90, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (168, 90, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (169, 90, 'Charlie Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (170, 90, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (171, 91, 'Alpha Correct', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (172, 91, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (173, 91, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (174, 91, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (175, 91, 'Charlie Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (176, 91, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (177, 92, 'Alpha Correct', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (178, 92, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (179, 92, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (180, 92, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (181, 92, 'Charlie Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (182, 92, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (183, 93, 'Alpha Correct', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (184, 93, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (185, 93, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (186, 93, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (187, 93, 'Charlie Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (188, 93, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (189, 94, 'Alpha Correct', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (190, 94, 'Beta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (191, 94, 'Alpha Correct', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (192, 94, 'Beta Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (193, 94, 'Charlie Uncorrect', NULL, 1, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (194, 94, 'Delta Uncorrect', NULL, 0, '2023-09-10 00:00:00', '2023-09-10 01:45:42', 0);
INSERT INTO `question_option` VALUES (195, 95, 'Salah', NULL, 0, '2023-09-17 20:20:34', '2023-09-17 20:20:34', 0);
INSERT INTO `question_option` VALUES (196, 96, 'Apakah Benar ?', NULL, 1, '2023-09-17 00:00:00', '2023-09-17 20:21:30', 0);
INSERT INTO `question_option` VALUES (197, 97, 'Salah', NULL, 0, '2023-09-17 20:25:25', '2023-09-17 20:25:25', 0);
INSERT INTO `question_option` VALUES (198, 98, 'Apakah Benar ?', NULL, 1, '2023-09-17 00:00:00', '2023-09-17 20:26:32', 0);

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
