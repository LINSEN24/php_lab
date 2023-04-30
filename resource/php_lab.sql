/*
 Navicat Premium Data Transfer

 Source Server         : LINSEN
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : php_lab

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 30/04/2023 22:29:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lab
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实验室名称',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '实验室状态,0为未启用,1为启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES (1, '一实A201', 1);
INSERT INTO `lab` VALUES (2, '一实A202', 1);
INSERT INTO `lab` VALUES (3, '一实A203', 0);

-- ----------------------------
-- Table structure for publish_sign
-- ----------------------------
DROP TABLE IF EXISTS `publish_sign`;
CREATE TABLE `publish_sign`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_appointment_id` bigint(20) NOT NULL,
  `publish_time` datetime NULL DEFAULT NULL,
  `duration` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of publish_sign
-- ----------------------------
INSERT INTO `publish_sign` VALUES (1, 1, '2023-05-01 08:20:00', 5, 0);

-- ----------------------------
-- Table structure for student_appointment
-- ----------------------------
DROP TABLE IF EXISTS `student_appointment`;
CREATE TABLE `student_appointment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `teacher_appointment_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `sign_time` datetime NULL DEFAULT NULL,
  `sign_status` tinyint(255) NULL DEFAULT -1 COMMENT '-1未发布签到任务,\r\n0未签到,\r\n1已签到,\r\n2迟到,\r\n3请假\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_appointment
-- ----------------------------
INSERT INTO `student_appointment` VALUES (1, 3, 1, 1, NULL, -1);
INSERT INTO `student_appointment` VALUES (2, 4, 1, 1, NULL, -1);
INSERT INTO `student_appointment` VALUES (3, 5, 1, 1, NULL, -1);

-- ----------------------------
-- Table structure for teacher_appointment
-- ----------------------------
DROP TABLE IF EXISTS `teacher_appointment`;
CREATE TABLE `teacher_appointment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `lab_id` bigint(20) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_appointment
-- ----------------------------
INSERT INTO `teacher_appointment` VALUES (1, 2, 1, '2023-05-01', 48, 1);

-- ----------------------------
-- Table structure for time_slot
-- ----------------------------
DROP TABLE IF EXISTS `time_slot`;
CREATE TABLE `time_slot`  (
  `id` int(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of time_slot
-- ----------------------------
INSERT INTO `time_slot` VALUES (1, '08:20:00', '09:50:00');
INSERT INTO `time_slot` VALUES (2, '10:05:00', '11:35:00');
INSERT INTO `time_slot` VALUES (4, '12:20:00', '13:50:00');
INSERT INTO `time_slot` VALUES (8, '14:00:00', '15:30:00');
INSERT INTO `time_slot` VALUES (16, '15:45:00', '17:15:00');
INSERT INTO `time_slot` VALUES (32, '19:00:00', '20:30:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` int(11) NOT NULL COMMENT '0=admin;1=teacher;2=student',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '0001', '123456', 'admin', '13145678901', 0);
INSERT INTO `user` VALUES (2, '1001', '1234567', 'teacher', '13145678902', 1);
INSERT INTO `user` VALUES (3, '2001', '12345678', 'student', '13145678903', 2);
INSERT INTO `user` VALUES (4, '2002', '12345678', '小明', '13145678904', 2);
INSERT INTO `user` VALUES (5, '2003', '12345678', '小红', '13145678905', 2);

SET FOREIGN_KEY_CHECKS = 1;
