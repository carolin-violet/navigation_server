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

 Date: 17/12/2023 22:33:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `user_id` varchar(19) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
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
INSERT INTO `log` VALUES ('511938873147461', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:04:36', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511938983632965', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:05:03', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511941021192261', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:13:20', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511941189951557', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:14:02', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511941241704517', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:14:14', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511941299089477', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:14:28', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511941336236101', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:14:37', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511941906649157', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:16:57', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511942535229509', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:19:30', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511942674030661', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:20:04', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511942764343365', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:20:26', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511943694766149', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:24:13', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511943834062917', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:24:47', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511943962394693', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:25:18', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":{}}');
INSERT INTO `log` VALUES ('511944949567557', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:29:19', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":\"{\\r\\n  \\\"code\\\": 0,\\r\\n  \\\"msg\\\": \\\"请求成功\\\",\\r\\n  \\\"data\\\": [\\r\\n      {\\r\\n          \\\"name\\\": \\\"zhangsan\\\",\\r\\n          \\\"age\\\": 50\\r\\n      },\\r\\n      {\\r\\n          \\\"name\\\": \\\"lisi\\\",\\r\\n          \\\"age\\\": 32\\r\\n      },\\r\\n      {\\r\\n          \\\"name\\\": \\\"wangwu\\\",\\r\\n          \\\"age\\\": 17\\r\\n      }\\r\\n  ]\\r\\n}\\r\\n\"}');
INSERT INTO `log` VALUES ('511945474322501', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:31:28', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":\"{\\r\\n  \\\"name\\\": \\\"server\\\",\\r\\n  \\\"version\\\": \\\"1.0.0\\\",\\r\\n  \\\"description\\\": \\\"导航站点后端\\\",\\r\\n  \\\"main\\\": \\\"app.js\\\",\\r\\n  \\\"scripts\\\": {\\r\\n    \\\"test\\\": \\\"test\\\",\\r\\n    \\\"dev\\\": \\\"nodemon app.js\\\"\\r\\n  },\\r\\n  \\\"repository\\\": {\\r\\n    \\\"type\\\": \\\"git\\\",\\r\\n    \\\"url\\\": \\\"\\\"\\r\\n  },\\r\\n  \\\"keywords\\\": [\\r\\n    \\\"zjyyds\\\"\\r\\n  ],\\r\\n  \\\"author\\\": \\\"carolin-violet\\\",\\r\\n  \\\"license\\\": \\\"ISC\\\",\\r\\n  \\\"devDependencies\\\": {\\r\\n    \\\"nodemon\\\": \\\"^2.0.20\\\"\\r\\n  },\\r\\n  \\\"dependencies\\\": {\\r\\n    \\\"consola\\\": \\\"^2.15.3\\\",\\r\\n    \\\"jsonwebtoken\\\": \\\"^8.5.1\\\",\\r\\n    \\\"koa\\\": \\\"^2.13.4\\\",\\r\\n    \\\"koa-body\\\": \\\"^5.0.0\\\",\\r\\n    \\\"koa-bodyparser\\\": \\\"^4.3.0\\\",\\r\\n    \\\"koa-helmet\\\": \\\"^6.1.0\\\",\\r\\n    \\\"koa-json-error\\\": \\\"^3.1.2\\\",\\r\\n    \\\"koa-router\\\": \\\"^12.0.0\\\",\\r\\n    \\\"koa-static\\\": \\\"^5.0.0\\\",\\r\\n    \\\"koa2-cors\\\": \\\"^2.0.6\\\",\\r\\n    \\\"moment\\\": \\\"^2.29.4\\\",\\r\\n    \\\"mysql2\\\": \\\"^2.3.3\\\",\\r\\n    \\\"node-rsa\\\": \\\"^1.1.1\\\",\\r\\n    \\\"sequelize\\\": \\\"^6.25.3\\\",\\r\\n    \\\"uuid\\\": \\\"^9.0.0\\\"\\r\\n  }\\r\\n}\\r\\n\"}');
INSERT INTO `log` VALUES ('511945623015493', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-17 22:32:04', 1, '{\"code\":20000,\"message\":\"导入成功\",\"success\":true}');

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
  `ladder` tinyint(0) NOT NULL,
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
  `open` tinyint(0) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0000000000000000000', 'admin', 'zj20001125', 'admin', 1, '2976008778@qq.com', 0, '2023-11-30 21:14:36');

SET FOREIGN_KEY_CHECKS = 1;
