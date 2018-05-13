/*
Navicat MySQL Data Transfer

Source Server         : shxt
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : newsapp

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-05-13 14:29:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '超级管理员');
INSERT INTO `authority` VALUES ('2', '管理员');
INSERT INTO `authority` VALUES ('3', '普通员工');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_n_id` int(11) DEFAULT NULL,
  `fk_u_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('10', '39', '33', '2018-05-12 16:41:21', '测试评论-1');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(255) DEFAULT NULL,
  `e_sex` int(255) DEFAULT NULL,
  `e_age` int(255) DEFAULT NULL,
  `e_address` varchar(255) DEFAULT NULL,
  `fk_p_id` int(11) DEFAULT NULL,
  `e_tel` varchar(255) DEFAULT NULL,
  `e_email` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `e_dr` tinyint(1) DEFAULT NULL,
  `e_creat_time` datetime DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '超级管理员', '1', '24', '济南', null, '1234567889', '12345677@1233.com', 'admin', '1234', '1', null);
INSERT INTO `employee` VALUES ('7', '阴艳芹', '1', '24', '济南', '3', '17812345678', '14@163.con', 'yinyq', '1234', '1', '2018-05-12 14:25:49');
INSERT INTO `employee` VALUES ('8', '阴艳芹-2', '1', '25', '济南', '2', '17812345678', '12@163.com', 'yinyq2', '1234', '0', '2018-05-12 14:28:12');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(5000) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `fk_nt_id` varchar(255) DEFAULT NULL,
  `creat_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `auth` int(255) DEFAULT NULL,
  `sign` int(11) DEFAULT NULL COMMENT '公司级用户级，0公司，1用户',
  `dr` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('33', '<p>测试-1</p>', '7d41c9bc98ff42dfa94113aeaf6ad1d0.png', '3', '2018-05-12 14:17:34', '2018-05-12 14:18:05', '测试-1-update', '1', '0', '1');
INSERT INTO `news` VALUES ('34', '<p>测试-2</p>', 'b1fdae6a77f14729b692c54e2cc99576.png', '1', '2018-05-12 14:18:47', '2018-05-12 14:18:47', '测试-2', '1', '0', '1');
INSERT INTO `news` VALUES ('35', '<p>测试-3</p>', 'c330a491610049abbe4666daee6871a1.png', '2', '2018-05-12 14:19:16', '2018-05-12 14:19:16', '测试-3', '1', '0', '1');
INSERT INTO `news` VALUES ('36', '<p>测试-4</p>', '3c48117b68d74cf4b68826d9f83cce96.png', '4', '2018-05-12 14:19:42', '2018-05-12 14:19:42', '测试-4', '1', '0', '1');
INSERT INTO `news` VALUES ('37', '<p>测试-5</p>', '5b226ecbe1ba4e58a6f936da3b6a3998.png', '5', '2018-05-12 14:20:10', '2018-05-12 14:20:10', '测试-5', '1', '0', '1');
INSERT INTO `news` VALUES ('38', '<p>测试-6-delete</p>', 'f348bb48475d4226a4d9add73a750302.png', '1', '2018-05-12 14:23:56', '2018-05-12 14:23:56', '测试-6-delete', '1', '0', '0');
INSERT INTO `news` VALUES ('39', '前端测试-1', '92ea235790754644955802519092de81.png', '1', '2018-05-12 15:47:47', '2018-05-12 15:47:48', '前端测试-1', '33', '1', '1');

-- ----------------------------
-- Table structure for news_type
-- ----------------------------
DROP TABLE IF EXISTS `news_type`;
CREATE TABLE `news_type` (
  `nt_id` int(11) NOT NULL AUTO_INCREMENT,
  `nt_name` varchar(255) DEFAULT NULL,
  `nt_dr` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`nt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_type
-- ----------------------------
INSERT INTO `news_type` VALUES ('1', '国际', '1');
INSERT INTO `news_type` VALUES ('2', '政治', '1');
INSERT INTO `news_type` VALUES ('3', '经济', '1');
INSERT INTO `news_type` VALUES ('4', '军事', '1');
INSERT INTO `news_type` VALUES ('5', '娱乐', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) DEFAULT NULL,
  `u_sex` int(255) DEFAULT NULL,
  `u_age` int(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `u_address` varchar(255) DEFAULT NULL,
  `u_tel` varchar(255) DEFAULT NULL,
  `u_email` varchar(255) DEFAULT NULL,
  `u_dr` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('33', '傻子1', null, null, 'yyq1', '1234', null, null, null, '1');
INSERT INTO `user` VALUES ('34', '傻子2', null, null, 'yyq2', '1234', null, null, null, '1');
INSERT INTO `user` VALUES ('35', '傻子3', null, null, 'yy', '1234', null, null, null, '1');
