/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : bidding

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 22/02/2021 09:58:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for netbian
-- ----------------------------
DROP TABLE IF EXISTS `netbian`;
CREATE TABLE `netbian`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `md5_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` int NOT NULL,
  PRIMARY KEY (`id`, `md5_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10583 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
