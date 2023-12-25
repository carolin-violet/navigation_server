/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : navigation

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 25/12/2023 14:15:26
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
INSERT INTO `category` VALUES ('512257991635013', '0000000000000000000', 'ai', '-1', '2023-12-18 19:43:06');
INSERT INTO `category` VALUES ('512258162483269', '0000000000000000000', '后端', '-1', '2023-12-18 19:43:47');
INSERT INTO `category` VALUES ('512258367729733', '0000000000000000000', '工具', '512258162483269', '2023-12-18 19:44:38');

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
INSERT INTO `log` VALUES ('512257991671877', 'admin', '0000000000000000000', '分类模块', '添加分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{\"category_name\":\"ai\",\"parent_id\":-1}}', '127.0.0.1', '2023-12-18 19:43:06', 1, '{\"code\":20000,\"message\":\"添加成功\",\"success\":true}');
INSERT INTO `log` VALUES ('512258134949957', 'admin', '0000000000000000000', '分类模块', '添加分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{\"category_name\":\"ai\",\"parent_id\":-1}}', '127.0.0.1', '2023-12-18 19:43:41', 0, '{\"code\":20001,\"message\":\"该分类名称已存在\",\"success\":false}');
INSERT INTO `log` VALUES ('512258162503749', 'admin', '0000000000000000000', '分类模块', '添加分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{\"category_name\":\"后端\",\"parent_id\":-1}}', '127.0.0.1', '2023-12-18 19:43:47', 1, '{\"code\":20000,\"message\":\"添加成功\",\"success\":true,\"data\":{\"id\":\"512258162483269\",\"user_id\":\"0000000000000000000\",\"category_name\":\"后端\",\"parent_id\":-1,\"create_time\":\"2023-12-18T11:43:47.950Z\"}}');
INSERT INTO `log` VALUES ('512258367742021', 'admin', '0000000000000000000', '分类模块', '添加分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{\"category_name\":\"工具\",\"parent_id\":\"512258162483269\"}}', '127.0.0.1', '2023-12-18 19:44:38', 1, '{\"code\":20000,\"message\":\"添加成功\",\"success\":true,\"data\":{\"id\":\"512258367729733\",\"user_id\":\"0000000000000000000\",\"category_name\":\"工具\",\"parent_id\":\"512258162483269\",\"create_time\":\"2023-12-18T11:44:38.059Z\"}}');
INSERT INTO `log` VALUES ('512258374692933', 'admin', '0000000000000000000', '分类模块', '添加分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{\"category_name\":\"工具\",\"parent_id\":\"512258162483269\"}}', '127.0.0.1', '2023-12-18 19:44:39', 0, '{\"code\":20001,\"message\":\"该分类名称已存在\",\"success\":false}');
INSERT INTO `log` VALUES ('512259346640965', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-18 19:48:37', 0, '{\"code\":20001,\"message\":\"导入失败\",\"success\":false}');
INSERT INTO `log` VALUES ('512259467567173', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-18 19:49:06', 1, '{\"code\":20000,\"message\":\"导入成功\",\"success\":true}');
INSERT INTO `log` VALUES ('512259530289221', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-18 19:49:21', 1, '{\"code\":20000,\"message\":\"导入成功\",\"success\":true}');
INSERT INTO `log` VALUES ('512264387199045', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"GET\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-18 20:09:07', 1, '{\"code\":20000,\"message\":\"导出成功\",\"success\":true,\"data\":[{\"id\":\"512257991635013\",\"user_id\":\"0000000000000000000\",\"category_name\":\"ai\",\"parent_id\":\"-1\",\"create_time\":\"2023-12-18T11:43:06.000Z\",\"children\":[]},{\"id\":\"512258162483269\",\"user_id\":\"0000000000000000000\",\"category_name\":\"后端\",\"parent_id\":\"-1\",\"create_time\":\"2023-12-18T11:43:47.000Z\",\"children\":[{\"id\":\"512258367729733\",\"user_id\":\"0000000000000000000\",\"category_name\":\"工具\",\"parent_id\":\"512258162483269\",\"create_time\":\"2023-12-18T11:44:38.000Z\",\"navigation\":[]}]}]}');
INSERT INTO `log` VALUES ('512264478408773', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"GET\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-18 20:09:29', 1, '{\"code\":20000,\"message\":\"导出成功\",\"success\":true}');
INSERT INTO `log` VALUES ('512266952900677', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"GET\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-18 20:19:34', 0, '{\"_readableState\":{\"objectMode\":false,\"highWaterMark\":16384,\"buffer\":{\"head\":{\"data\":{\"type\":\"Buffer\",\"data\":[123,10,32,32,34,100,97,116,97,34,58,32,91,10,32,32,32,32,123,10,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,53,55,57,57,49,54,51,53,48,49,51,34,44,10,32,32,32,32,32,32,34,117,115,101,114,95,105,100,34,58,32,34,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,34,44,10,32,32,32,32,32,32,34,99,97,116,101,103,111,114,121,95,110,97,109,101,34,58,32,34,97,105,34,44,10,32,32,32,32,32,32,34,112,97,114,101,110,116,95,105,100,34,58,32,34,45,49,34,44,10,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,49,58,52,51,58,48,54,46,48,48,48,90,34,44,10,32,32,32,32,32,32,34,99,104,105,108,100,114,101,110,34,58,32,91,93,10,32,32,32,32,125,44,10,32,32,32,32,123,10,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,53,56,49,54,50,52,56,51,50,54,57,34,44,10,32,32,32,32,32,32,34,117,115,101,114,95,105,100,34,58,32,34,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,34,44,10,32,32,32,32,32,32,34,99,97,116,101,103,111,114,121,95,110,97,109,101,34,58,32,34,229,144,142,231,171,175,34,44,10,32,32,32,32,32,32,34,112,97,114,101,110,116,95,105,100,34,58,32,34,45,49,34,44,10,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,49,58,52,51,58,52,55,46,48,48,48,90,34,44,10,32,32,32,32,32,32,34,99,104,105,108,100,114,101,110,34,58,32,91,10,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,53,56,51,54,55,55,50,57,55,51,51,34,44,10,32,32,32,32,32,32,32,32,32,32,34,117,115,101,114,95,105,100,34,58,32,34,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,34,44,10,32,32,32,32,32,32,32,32,32,32,34,99,97,116,101,103,111,114,121,95,110,97,109,101,34,58,32,34,229,183,165,229,133,183,34,44,10,32,32,32,32,32,32,32,32,32,32,34,112,97,114,101,110,116,95,105,100,34,58,32,34,53,49,50,50,53,56,49,54,50,52,56,51,50,54,57,34,44,10,32,32,32,32,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,49,58,52,52,58,51,56,46,48,48,48,90,34,44,10,32,32,32,32,32,32,32,32,32,32,34,110,97,118,105,103,97,116,105,111,110,34,58,32,91,93,10,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,93,10,32,32,32,32,125,10,32,32,93,10,125]},\"next\":null},\"tail\":{\"data\":{\"type\":\"Buffer\",\"data\":[123,10,32,32,34,100,97,116,97,34,58,32,91,10,32,32,32,32,123,10,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,53,55,57,57,49,54,51,53,48,49,51,34,44,10,32,32,32,32,32,32,34,117,115,101,114,95,105,100,34,58,32,34,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,34,44,10,32,32,32,32,32,32,34,99,97,116,101,103,111,114,121,95,110,97,109,101,34,58,32,34,97,105,34,44,10,32,32,32,32,32,32,34,112,97,114,101,110,116,95,105,100,34,58,32,34,45,49,34,44,10,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,49,58,52,51,58,48,54,46,48,48,48,90,34,44,10,32,32,32,32,32,32,34,99,104,105,108,100,114,101,110,34,58,32,91,93,10,32,32,32,32,125,44,10,32,32,32,32,123,10,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,53,56,49,54,50,52,56,51,50,54,57,34,44,10,32,32,32,32,32,32,34,117,115,101,114,95,105,100,34,58,32,34,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,34,44,10,32,32,32,32,32,32,34,99,97,116,101,103,111,114,121,95,110,97,109,101,34,58,32,34,229,144,142,231,171,175,34,44,10,32,32,32,32,32,32,34,112,97,114,101,110,116,95,105,100,34,58,32,34,45,49,34,44,10,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,49,58,52,51,58,52,55,46,48,48,48,90,34,44,10,32,32,32,32,32,32,34,99,104,105,108,100,114,101,110,34,58,32,91,10,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,53,56,51,54,55,55,50,57,55,51,51,34,44,10,32,32,32,32,32,32,32,32,32,32,34,117,115,101,114,95,105,100,34,58,32,34,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,34,44,10,32,32,32,32,32,32,32,32,32,32,34,99,97,116,101,103,111,114,121,95,110,97,109,101,34,58,32,34,229,183,165,229,133,183,34,44,10,32,32,32,32,32,32,32,32,32,32,34,112,97,114,101,110,116,95,105,100,34,58,32,34,53,49,50,50,53,56,49,54,50,52,56,51,50,54,57,34,44,10,32,32,32,32,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,49,58,52,52,58,51,56,46,48,48,48,90,34,44,10,32,32,32,32,32,32,32,32,32,32,34,110,97,118,105,103,97,116,105,111,110,34,58,32,91,93,10,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,93,10,32,32,32,32,125,10,32,32,93,10,125]},\"next\":null},\"length\":1},\"length\":703,\"pipes\":[],\"flowing\":null,\"ended\":true,\"endEmitted\":false,\"reading\":false,\"constructed\":true,\"sync\":true,\"needReadable\":false,\"emittedReadable\":true,\"readableListening\":false,\"resumeScheduled\":false,\"errorEmitted\":false,\"emitClose\":true,\"autoDestroy\":true,\"destroyed\":false,\"errored\":null,\"closed\":false,\"closeEmitted\":false,\"defaultEncoding\":\"utf8\",\"awaitDrainWriters\":null,\"multiAwaitDrain\":false,\"readingMore\":true,\"dataEmitted\":false,\"decoder\":null,\"encoding\":null},\"_events\":{},\"_eventsCount\":1}');
INSERT INTO `log` VALUES ('512268438171717', 'admin', '0000000000000000000', '导航模块', '添加导航', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{\"cat_id\":\"512258367729733\",\"name\":\"百度\",\"url\":\"baidu.com\",\"ladder\":0}}', '127.0.0.1', '2023-12-18 20:25:36', 1, '{\"code\":20000,\"message\":\"添加成功\",\"success\":true}');
INSERT INTO `log` VALUES ('512268446380101', 'admin', '0000000000000000000', '导航模块', '添加导航', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{\"cat_id\":\"512258367729733\",\"name\":\"百度\",\"url\":\"baidu.com\",\"ladder\":0}}', '127.0.0.1', '2023-12-18 20:25:38', 0, '{\"code\":20001,\"message\":\"该导航名称已存在\",\"success\":false}');
INSERT INTO `log` VALUES ('512268504809541', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"GET\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-18 20:25:52', 0, '{\"_readableState\":{\"objectMode\":false,\"highWaterMark\":16384,\"buffer\":{\"head\":{\"data\":{\"type\":\"Buffer\",\"data\":[123,10,32,32,34,100,97,116,97,34,58,32,91,10,32,32,32,32,123,10,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,53,55,57,57,49,54,51,53,48,49,51,34,44,10,32,32,32,32,32,32,34,117,115,101,114,95,105,100,34,58,32,34,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,34,44,10,32,32,32,32,32,32,34,99,97,116,101,103,111,114,121,95,110,97,109,101,34,58,32,34,97,105,34,44,10,32,32,32,32,32,32,34,112,97,114,101,110,116,95,105,100,34,58,32,34,45,49,34,44,10,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,49,58,52,51,58,48,54,46,48,48,48,90,34,44,10,32,32,32,32,32,32,34,99,104,105,108,100,114,101,110,34,58,32,91,93,10,32,32,32,32,125,44,10,32,32,32,32,123,10,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,53,56,49,54,50,52,56,51,50,54,57,34,44,10,32,32,32,32,32,32,34,117,115,101,114,95,105,100,34,58,32,34,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,34,44,10,32,32,32,32,32,32,34,99,97,116,101,103,111,114,121,95,110,97,109,101,34,58,32,34,229,144,142,231,171,175,34,44,10,32,32,32,32,32,32,34,112,97,114,101,110,116,95,105,100,34,58,32,34,45,49,34,44,10,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,49,58,52,51,58,52,55,46,48,48,48,90,34,44,10,32,32,32,32,32,32,34,99,104,105,108,100,114,101,110,34,58,32,91,10,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,53,56,51,54,55,55,50,57,55,51,51,34,44,10,32,32,32,32,32,32,32,32,32,32,34,117,115,101,114,95,105,100,34,58,32,34,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,34,44,10,32,32,32,32,32,32,32,32,32,32,34,99,97,116,101,103,111,114,121,95,110,97,109,101,34,58,32,34,229,183,165,229,133,183,34,44,10,32,32,32,32,32,32,32,32,32,32,34,112,97,114,101,110,116,95,105,100,34,58,32,34,53,49,50,50,53,56,49,54,50,52,56,51,50,54,57,34,44,10,32,32,32,32,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,49,58,52,52,58,51,56,46,48,48,48,90,34,44,10,32,32,32,32,32,32,32,32,32,32,34,110,97,118,105,103,97,116,105,111,110,34,58,32,91,10,32,32,32,32,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,54,56,52,51,56,49,51,56,57,52,57,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,99,97,116,95,105,100,34,58,32,34,53,49,50,50,53,56,51,54,55,55,50,57,55,51,51,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,110,97,109,101,34,58,32,34,231,153,190,229,186,166,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,100,101,115,99,114,105,112,116,105,111,110,34,58,32,110,117,108,108,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,117,114,108,34,58,32,34,98,97,105,100,117,46,99,111,109,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,108,97,100,100,101,114,34,58,32,48,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,50,58,50,53,58,51,54,46,48,48,48,90,34,10,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,93,10,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,93,10,32,32,32,32,125,10,32,32,93,10,125]},\"next\":null},\"tail\":{\"data\":{\"type\":\"Buffer\",\"data\":[123,10,32,32,34,100,97,116,97,34,58,32,91,10,32,32,32,32,123,10,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,53,55,57,57,49,54,51,53,48,49,51,34,44,10,32,32,32,32,32,32,34,117,115,101,114,95,105,100,34,58,32,34,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,34,44,10,32,32,32,32,32,32,34,99,97,116,101,103,111,114,121,95,110,97,109,101,34,58,32,34,97,105,34,44,10,32,32,32,32,32,32,34,112,97,114,101,110,116,95,105,100,34,58,32,34,45,49,34,44,10,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,49,58,52,51,58,48,54,46,48,48,48,90,34,44,10,32,32,32,32,32,32,34,99,104,105,108,100,114,101,110,34,58,32,91,93,10,32,32,32,32,125,44,10,32,32,32,32,123,10,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,53,56,49,54,50,52,56,51,50,54,57,34,44,10,32,32,32,32,32,32,34,117,115,101,114,95,105,100,34,58,32,34,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,34,44,10,32,32,32,32,32,32,34,99,97,116,101,103,111,114,121,95,110,97,109,101,34,58,32,34,229,144,142,231,171,175,34,44,10,32,32,32,32,32,32,34,112,97,114,101,110,116,95,105,100,34,58,32,34,45,49,34,44,10,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,49,58,52,51,58,52,55,46,48,48,48,90,34,44,10,32,32,32,32,32,32,34,99,104,105,108,100,114,101,110,34,58,32,91,10,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,53,56,51,54,55,55,50,57,55,51,51,34,44,10,32,32,32,32,32,32,32,32,32,32,34,117,115,101,114,95,105,100,34,58,32,34,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,34,44,10,32,32,32,32,32,32,32,32,32,32,34,99,97,116,101,103,111,114,121,95,110,97,109,101,34,58,32,34,229,183,165,229,133,183,34,44,10,32,32,32,32,32,32,32,32,32,32,34,112,97,114,101,110,116,95,105,100,34,58,32,34,53,49,50,50,53,56,49,54,50,52,56,51,50,54,57,34,44,10,32,32,32,32,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,49,58,52,52,58,51,56,46,48,48,48,90,34,44,10,32,32,32,32,32,32,32,32,32,32,34,110,97,118,105,103,97,116,105,111,110,34,58,32,91,10,32,32,32,32,32,32,32,32,32,32,32,32,123,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,105,100,34,58,32,34,53,49,50,50,54,56,52,51,56,49,51,56,57,52,57,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,99,97,116,95,105,100,34,58,32,34,53,49,50,50,53,56,51,54,55,55,50,57,55,51,51,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,110,97,109,101,34,58,32,34,231,153,190,229,186,166,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,100,101,115,99,114,105,112,116,105,111,110,34,58,32,110,117,108,108,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,117,114,108,34,58,32,34,98,97,105,100,117,46,99,111,109,34,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,108,97,100,100,101,114,34,58,32,48,44,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,34,99,114,101,97,116,101,95,116,105,109,101,34,58,32,34,50,48,50,51,45,49,50,45,49,56,84,49,50,58,50,53,58,51,54,46,48,48,48,90,34,10,32,32,32,32,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,32,32,32,32,93,10,32,32,32,32,32,32,32,32,125,10,32,32,32,32,32,32,93,10,32,32,32,32,125,10,32,32,93,10,125]},\"next\":null},\"length\":1},\"length\":1008,\"pipes\":[],\"flowing\":null,\"ended\":true,\"endEmitted\":false,\"reading\":false,\"constructed\":true,\"sync\":true,\"needReadable\":false,\"emittedReadable\":true,\"readableListening\":false,\"resumeScheduled\":false,\"errorEmitted\":false,\"emitClose\":true,\"autoDestroy\":true,\"destroyed\":false,\"errored\":null,\"closed\":false,\"closeEmitted\":false,\"defaultEncoding\":\"utf8\",\"awaitDrainWriters\":null,\"multiAwaitDrain\":false,\"readingMore\":true,\"dataEmitted\":false,\"decoder\":null,\"encoding\":null},\"_events\":{},\"_eventsCount\":1}');
INSERT INTO `log` VALUES ('512270371024965', 'admin', '0000000000000000000', '分类模块', '导出分类', '{\"method\":\"POST\",\"params\":{},\"query\":{},\"body\":{}}', '127.0.0.1', '2023-12-18 20:33:28', 1, '{\"code\":20000,\"message\":\"导入成功\",\"success\":true}');
INSERT INTO `log` VALUES ('512272508579909', 'admin', '0000000000000000000', '分类模块', '查询每一级分类', '{\"method\":\"GET\",\"params\":{},\"query\":{\"parent_id\":\"-1\"},\"body\":{}}', '127.0.0.1', '2023-12-18 20:42:10', 1, '{\"code\":20000,\"message\":\"查询成功\",\"success\":true,\"data\":[{\"id\":\"512257991635013\",\"user_id\":\"0000000000000000000\",\"category_name\":\"ai\",\"parent_id\":\"-1\",\"create_time\":\"2023-12-18T11:43:06.000Z\"},{\"id\":\"512258162483269\",\"user_id\":\"0000000000000000000\",\"category_name\":\"后端\",\"parent_id\":\"-1\",\"create_time\":\"2023-12-18T11:43:47.000Z\"}]}');

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
INSERT INTO `navigation` VALUES ('512268438138949', '512258367729733', '百度', NULL, 'baidu.com', '2023-12-18 20:25:36', 0);

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
  `username` varchar(30) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
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
