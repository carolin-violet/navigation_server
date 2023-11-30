/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : localhost:3306
 Source Schema         : navigation

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 30/11/2023 21:16:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `site_id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `category_id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `category_name` varchar(15) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `parent_id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `user_name` varchar(30) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `user_id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `model` varchar(10) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `params` text CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `ip` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `time` datetime(0) NOT NULL,
  `success` tinyint(0) NOT NULL,
  `result` longtext CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for navigation
-- ----------------------------
DROP TABLE IF EXISTS `navigation`;
CREATE TABLE `navigation`  (
  `id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `cat_id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `name` varchar(30) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of navigation
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `name` varchar(30) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `name` varchar(30) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `role` varchar(20) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `gender` tinyint(0) NOT NULL,
  `email` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `site_id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `open` tinyint(0) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0000000000000000000', 'admin', 'zj20001125', 'admin', 1, '2976008778@qq.com', '0000000000000000000', 0, '2023-11-30 21:14:36');

SET FOREIGN_KEY_CHECKS = 1;
