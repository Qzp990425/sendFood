/*
Navicat MySQL Data Transfer

Source Server         : Qzp
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : sendfood

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2020-10-15 22:29:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `aid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('6', '1', '测测测实地址1');
INSERT INTO `address` VALUES ('7', '1', '地址2');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('2', 'admin', 'admin');
INSERT INTO `admin` VALUES ('5', '123', '123');

-- ----------------------------
-- Table structure for `food`
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `fid` int(11) NOT NULL auto_increment,
  `uuid` varchar(60) default NULL,
  `name` varchar(60) default NULL,
  `price` int(11) default NULL,
  `type` int(11) default NULL,
  `status` int(11) default '0',
  `number` int(11) default NULL,
  `nowprice` int(11) default NULL,
  `introduction` varchar(200) default NULL,
  PRIMARY KEY  (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('1', 'p1', '汉堡', '10', '1', '0', '199', '8', '这是汉堡');
INSERT INTO `food` VALUES ('2', 'p2', '三明治', '6', '1', '0', '20', '5', '这是三明治');
INSERT INTO `food` VALUES ('3', 'p4', '沙拉', '8', '1', '0', '5', '6', '这是沙拉');
INSERT INTO `food` VALUES ('4', 'p6', '冰激淋', '2', '1', '0', '2', '1', '这是巧克力味冰激淋');
INSERT INTO `food` VALUES ('5', 'm1', '西红柿鸡蛋面', '10', '2', '0', '20', '8', '这是西红柿鸡蛋面');
INSERT INTO `food` VALUES ('6', 'm2', '炸酱面', '6', '2', '0', '5', '5', '这是炸酱面');
INSERT INTO `food` VALUES ('7', 'm3', '油泼面', '7', '2', '0', '7', '6', '西安美食');
INSERT INTO `food` VALUES ('8', 'm4', '砂锅面', '8', '2', '0', '6', '6', '砂锅面');
INSERT INTO `food` VALUES ('9', 'm5', '刀削面', '9', '2', '0', '9', '9', '刀削面');

-- ----------------------------
-- Table structure for `orderrecord`
-- ----------------------------
DROP TABLE IF EXISTS `orderrecord`;
CREATE TABLE `orderrecord` (
  `oid` int(11) NOT NULL auto_increment,
  `uuid` varchar(60) default NULL,
  `status` int(11) default NULL,
  `fid` int(11) default NULL,
  `number` int(11) default NULL,
  `createTime` varchar(50) default NULL,
  `sendTime` varchar(50) default NULL,
  `doneTime` varchar(50) default NULL,
  `buyId` int(11) default NULL,
  `name` varchar(11) default NULL,
  PRIMARY KEY  (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderrecord
-- ----------------------------
INSERT INTO `orderrecord` VALUES ('1', 'f50b346d9ed04d69a1717d8ee7ab5cb1', '1', '1', '2', '2020-10-05 19:10', '2020-10-06 11:40', null, '1', '地址2');
INSERT INTO `orderrecord` VALUES ('2', '9b853c9d7d48409aa4fc39b9f305d949', '0', '1', '1', '2020-10-05 19:11', null, null, '1', '地址2');
INSERT INTO `orderrecord` VALUES ('3', '62246af07e264641b194828ebabc63c3', '0', '7', '2', '2020-10-05 19:13', null, null, '1', '测试地址1');
INSERT INTO `orderrecord` VALUES ('4', 'cc1ba7d084254c329f498ba1f9d55325', '1', '1', '1', '2020-10-05 19:14', '2020-10-06 11:40', null, '1', '测试地址1');
INSERT INTO `orderrecord` VALUES ('5', 'd085f0b62ff64ae4abc906255c7f2594', '0', '7', '1', '2020-10-05 21:30', null, null, '1', '地址2');
INSERT INTO `orderrecord` VALUES ('6', '403fcf5f93a14eb5b7bbf310fc6e63a4', '2', '2', '1', '2020-10-05 21:30', '2020-10-06 11:40', '2020-10-06 11:42', '1', '地址2');

-- ----------------------------
-- Table structure for `shopcar`
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `sid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `fid` int(11) default NULL,
  `number` int(11) default '1',
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcar
-- ----------------------------
INSERT INTO `shopcar` VALUES ('3', '1', '7', '1');
INSERT INTO `shopcar` VALUES ('4', '1', '2', '1');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `tid` int(11) NOT NULL auto_increment,
  `tname` varchar(255) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '小吃');
INSERT INTO `type` VALUES ('2', '面食');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL auto_increment,
  `tel` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  `name` varchar(20) default NULL,
  `createTime` varchar(50) default NULL,
  `sno` varchar(20) default NULL,
  `account` int(11) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123', '123', '测试', '2020-10-05 15:24', '123', '319');
