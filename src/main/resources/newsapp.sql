/*
Navicat MySQL Data Transfer

Source Server         : shxt
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : newsapp

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-04-30 21:47:57
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '超级管理员', '0', '24', '济南', null, '1234567889', '12345677@1233.com', 'admin', '1234', '1', null);
INSERT INTO `employee` VALUES ('2', 'wewe', '1', '33', '454', '3', '123', '45', '234', '1234', '1', null);
INSERT INTO `employee` VALUES ('3', '阴艳芹', '1', '34', '烟台', '3', '2354545645', '344@123.com', 'nhk', '1234', '1', null);
INSERT INTO `employee` VALUES ('4', '最忠实的粉丝', '1', '445', '32342', '3', '3435345', '2342', '323', '1234', '0', null);
INSERT INTO `employee` VALUES ('5', '黄金时代不回家', '0', '34', '234', '3', '234234234', '34', '34', '1234', '1', null);
INSERT INTO `employee` VALUES ('6', '现在', '0', '34', '324', '3', '32342', '2342', '1123', '1234', '1', null);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(5000) DEFAULT NULL,
  `auth` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `fk_nt_id` varchar(255) DEFAULT NULL,
  `creat_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dr` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '我对阴艳芹那么好！！她居然骗我，她是个坏蛋，不想要它了。她是骗子，还不让说，脾气那么差！', '阴艳芹', 'a82d58c2b10b46e3a7b971406d20f568.PNG', '1', null, '2018-04-29 21:40:02', '阴艳芹是坏蛋', '1');
INSERT INTO `news` VALUES ('2', '我对阴艳芹那么好！！她居然骗我，她是个坏蛋，不想要它了。她是骗子，还不让说，脾气那么差！', '郭宾杰', 'a82d58c2b10b46e3a7b971406d20f568.PNG', '1', null, null, '阴艳芹是坏蛋', '1');
INSERT INTO `news` VALUES ('3', '郭宾杰', null, 'a82d58c2b10b46e3a7b971406d20f568.PNG', '1', null, null, '阴艳芹是坏蛋', '1');
INSERT INTO `news` VALUES ('4', null, null, 'a82d58c2b10b46e3a7b971406d20f568.PNG', '1', null, null, '阴艳芹是坏蛋', '1');
INSERT INTO `news` VALUES ('5', null, null, 'a82d58c2b10b46e3a7b971406d20f568.PNG', '1', null, null, '阴艳芹是坏蛋', '1');
INSERT INTO `news` VALUES ('6', null, null, 'a82d58c2b10b46e3a7b971406d20f568.PNG', '1', null, null, '阴艳芹是坏蛋', '1');
INSERT INTO `news` VALUES ('7', null, '234', 'a82d58c2b10b46e3a7b971406d20f568.PNG', '34', null, null, '234324', '1');
INSERT INTO `news` VALUES ('8', null, '二', 'a82d58c2b10b46e3a7b971406d20f568.PNG', 'e', null, null, '额', '1');
INSERT INTO `news` VALUES ('9', null, '二', 'a82d58c2b10b46e3a7b971406d20f568.PNG', 'e', null, null, '额', '1');
INSERT INTO `news` VALUES ('10', null, '问', 'a82d58c2b10b46e3a7b971406d20f568.PNG', '1', null, null, '我', '1');
INSERT INTO `news` VALUES ('11', null, '我', 'a82d58c2b10b46e3a7b971406d20f568.PNG', '1', '2018-04-19 20:54:16', '2018-04-19 20:54:16', 'u', '0');
INSERT INTO `news` VALUES ('12', '我对阴艳芹那么好！！她居然骗我，她是个坏蛋，不想要它了。她是骗子，还不让说，脾气那么差！我对阴艳芹那么好！！她居然骗我，她是个坏蛋，不想要它了。她是骗子，还不让说，脾气那么差！我对阴艳芹那么好！！她居然骗我，她是个坏蛋，不想要它了。她是骗子，还不让说，脾气那么差！我对阴艳芹那么好！！她居然骗我，她是个坏蛋，不想要它了。她是骗子，还不让说，脾气那么差！我对阴艳芹那么好！！她居然骗我，她是个坏蛋，不想要它了。她是骗子，还不让说，脾气那么差！我对阴艳芹那么好！！她居然骗我，她是个坏蛋，不想要它了。她是骗子，还不让说，脾气那么差！我对阴艳芹那么好！！她居然骗我，她是个坏蛋，不想要它了。她是骗子，还不让说，脾气那么差！我对阴艳芹那么好！！她居然骗我，她是个坏蛋，不想要它了。她是骗子，还不让说，脾气那么差！我对阴艳芹那么好！！她居然骗我，她是个坏蛋，不想要它了。她是骗子，还不让说，脾气那么差！', '343', 'a82d58c2b10b46e3a7b971406d20f568.PNG', '1', '2018-04-26 15:37:11', '2018-04-26 15:37:11', '343434', '1');
INSERT INTO `news` VALUES ('13', '飒飒大苏打的', '232', '2cf6dd16279345e299129e2004966c8e.jpg', '1', '2018-04-26 15:44:00', '2018-04-26 15:44:00', '2323', '1');
INSERT INTO `news` VALUES ('14', '<p>微软微软</p>', '为', '3428d38461c244cb815c7590348c9dec.PNG', '1', '2018-04-26 15:58:07', '2018-04-26 15:58:07', '微软', '1');

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
INSERT INTO `news_type` VALUES ('6', null, '0');
INSERT INTO `news_type` VALUES ('7', null, '0');
INSERT INTO `news_type` VALUES ('8', null, '0');
INSERT INTO `news_type` VALUES ('9', null, '0');
INSERT INTO `news_type` VALUES ('10', null, '0');
INSERT INTO `news_type` VALUES ('11', null, '0');
INSERT INTO `news_type` VALUES ('12', null, '0');
INSERT INTO `news_type` VALUES ('13', null, '0');
INSERT INTO `news_type` VALUES ('14', null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '阴艳芹', '0', '25', 'forward', '1234', '我去', 'y6y8', '324', '1');
