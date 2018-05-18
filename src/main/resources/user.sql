/*
Navicat MySQL Data Transfer

Source Server         : shxt
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : newsapp

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-05-18 12:18:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `u_address` varchar(255) DEFAULT NULL,
  `u_tel` varchar(255) DEFAULT NULL,
  `u_realname` varchar(255) DEFAULT NULL,
  `u_email` varchar(255) DEFAULT NULL,
  `u_dr` tinyint(1) DEFAULT NULL,
  `u_blog` varchar(255) DEFAULT NULL,
  `u_create_time` datetime DEFAULT NULL,
  `u_profession` varchar(255) DEFAULT NULL,
  `u_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
