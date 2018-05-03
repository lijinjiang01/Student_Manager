/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : student_manager

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-03 16:26:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for a
-- ----------------------------
DROP TABLE IF EXISTS `a`;
CREATE TABLE `a` (
  `ID` varchar(8) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a
-- ----------------------------
INSERT INTO `a` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for c
-- ----------------------------
DROP TABLE IF EXISTS `c`;
CREATE TABLE `c` (
  `cNo` varchar(8) NOT NULL,
  `cName` varchar(20) NOT NULL,
  `rate` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `deptNo` varchar(4) NOT NULL,
  PRIMARY KEY (`cNo`),
  KEY `cNo_idx` (`deptNo`),
  CONSTRAINT `c_ibfk_1` FOREIGN KEY (`deptNo`) REFERENCES `d` (`deptNo`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c
-- ----------------------------
INSERT INTO `c` VALUES ('00864088', '程序设计(C语言)', '60', '4', '1001');
INSERT INTO `c` VALUES ('08305009', '数据结构(1)', '60', '4', '1001');
INSERT INTO `c` VALUES ('08305010', '数据结构(2)', '60', '4', '1001');
INSERT INTO `c` VALUES ('08305014', '数据库原理(1)', '60', '4', '1001');
INSERT INTO `c` VALUES ('08305073', '计算机组成原理A(1)', '70', '3', '1001');
INSERT INTO `c` VALUES ('08305121', '面向对象程序设计', '60', '4', '1001');
INSERT INTO `c` VALUES ('08306110', '职业定位与就业导向', '50', '2', '1001');

-- ----------------------------
-- Table structure for d
-- ----------------------------
DROP TABLE IF EXISTS `d`;
CREATE TABLE `d` (
  `deptNo` varchar(4) NOT NULL,
  `deptName` varchar(20) NOT NULL,
  `addr` varchar(45) NOT NULL,
  PRIMARY KEY (`deptNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d
-- ----------------------------
INSERT INTO `d` VALUES ('1001', '计算机工程与科学学院', '上海市宝山区南陈路333号计算机大楼');
INSERT INTO `d` VALUES ('1002', '机电工程与自动化学院', '上海市宝山区南陈路333号自动化大楼');
INSERT INTO `d` VALUES ('1003', '通信与信息工程学院', '上海市宝山区南陈路333号通信大楼');
INSERT INTO `d` VALUES ('1004', '环境与化学工程学院', '上海市宝山区南陈路333号化学工程大楼');
INSERT INTO `d` VALUES ('1005', '材料科学与工程学院', '上海市宝山区南陈路333号材料科学大楼');

-- ----------------------------
-- Table structure for g
-- ----------------------------
DROP TABLE IF EXISTS `g`;
CREATE TABLE `g` (
  `cNo` varchar(8) NOT NULL,
  `stuNo` varchar(8) NOT NULL,
  `tNo` varchar(4) NOT NULL,
  `psGrade` int(11) DEFAULT NULL,
  `ksGrade` int(11) DEFAULT NULL,
  `totalScore` int(11) DEFAULT NULL,
  PRIMARY KEY (`cNo`,`stuNo`,`tNo`),
  KEY `g_ibfk_2` (`stuNo`),
  KEY `g_ibfk_3` (`tNo`),
  CONSTRAINT `g_ibfk_1` FOREIGN KEY (`cNo`) REFERENCES `c` (`cNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `g_ibfk_2` FOREIGN KEY (`stuNo`) REFERENCES `s` (`stuNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `g_ibfk_3` FOREIGN KEY (`tNo`) REFERENCES `t` (`tNo`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of g
-- ----------------------------
INSERT INTO `g` VALUES ('08305010', '14120002', '1005', null, null, null);
INSERT INTO `g` VALUES ('08305010', '14122472', '1005', null, null, null);
INSERT INTO `g` VALUES ('08305014', '14120001', '1006', '76', '32', '49');
INSERT INTO `g` VALUES ('08305014', '14120002', '1006', '90', '100', '96');
INSERT INTO `g` VALUES ('08305014', '14121902', '1006', '75', null, null);
INSERT INTO `g` VALUES ('08305014', '14122472', '1006', '72', '66', '68');
INSERT INTO `g` VALUES ('08305121', '14120001', '1003', null, null, null);
INSERT INTO `g` VALUES ('08305121', '14121902', '1003', '80', '32', '51');
INSERT INTO `g` VALUES ('08305121', '14122472', '1003', null, null, null);
INSERT INTO `g` VALUES ('08306110', '14120001', '1006', null, null, null);
INSERT INTO `g` VALUES ('08306110', '14121902', '1006', '80', '86', '83');
INSERT INTO `g` VALUES ('08306110', '14122472', '1006', '70', '34', '52');

-- ----------------------------
-- Table structure for o
-- ----------------------------
DROP TABLE IF EXISTS `o`;
CREATE TABLE `o` (
  `cNo` varchar(8) NOT NULL,
  `tNo` varchar(4) NOT NULL,
  `time` varchar(45) NOT NULL,
  `addr` varchar(45) NOT NULL,
  PRIMARY KEY (`cNo`,`tNo`),
  KEY `o_ibfk_2` (`tNo`),
  CONSTRAINT `o_ibfk_1` FOREIGN KEY (`cNo`) REFERENCES `c` (`cNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `o_ibfk_2` FOREIGN KEY (`tNo`) REFERENCES `t` (`tNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o
-- ----------------------------
INSERT INTO `o` VALUES ('00864088', '1022', '一7-8 三7-8 五7-8', 'DJ203（上机：D415）');
INSERT INTO `o` VALUES ('08305009', '1004', '一5-8 三7-8', 'D309（上机：D406）');
INSERT INTO `o` VALUES ('08305010', '1005', '二3-6 四7-8', 'DJ104');
INSERT INTO `o` VALUES ('08305014', '1006', '三5-8 五3-4', 'DJ304（上机：东区608）');
INSERT INTO `o` VALUES ('08305073', '1002', '三3-4 五3-4', 'GJ104（上机：东区606）');
INSERT INTO `o` VALUES ('08305121', '1003', '一1-3 三1-4', 'BJ203');
INSERT INTO `o` VALUES ('08306110', '1006', '五7-8', 'C123');

-- ----------------------------
-- Table structure for s
-- ----------------------------
DROP TABLE IF EXISTS `s`;
CREATE TABLE `s` (
  `stuNo` varchar(8) NOT NULL,
  `password` varchar(12) NOT NULL,
  `sName` varchar(12) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birth` date NOT NULL,
  `deptNo` varchar(4) NOT NULL,
  `photo` varchar(45) NOT NULL,
  PRIMARY KEY (`stuNo`),
  KEY `s_ibfk_1` (`deptNo`),
  CONSTRAINT `s_ibfk_1` FOREIGN KEY (`deptNo`) REFERENCES `d` (`deptNo`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s
-- ----------------------------
INSERT INTO `s` VALUES ('14120001', '123456', '张三', '0', '2018-05-07', '1002', 'img/student/张三.jpg');
INSERT INTO `s` VALUES ('14120002', '123456', '翠花', '0', '1996-05-07', '1001', 'img/student/翠花.jpg');
INSERT INTO `s` VALUES ('14121902', '123456', '王小二', '0', '1996-05-08', '1001', 'img/student/王小二.jpg');
INSERT INTO `s` VALUES ('14122472', '123456', '李晋江', '0', '1995-07-04', '1001', 'img/student/default.jpg');

-- ----------------------------
-- Table structure for t
-- ----------------------------
DROP TABLE IF EXISTS `t`;
CREATE TABLE `t` (
  `tNo` varchar(4) NOT NULL,
  `password` varchar(12) NOT NULL,
  `tName` varchar(12) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `career` varchar(12) NOT NULL,
  `deptNo` varchar(4) NOT NULL,
  `photo` varchar(45) NOT NULL,
  PRIMARY KEY (`tNo`),
  KEY `deptNo` (`deptNo`),
  CONSTRAINT `t_ibfk_1` FOREIGN KEY (`deptNo`) REFERENCES `d` (`deptNo`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t
-- ----------------------------
INSERT INTO `t` VALUES ('1002', '123456', '刘方方', '0', '副教授', '1001', 'img/teacher/default.jpg');
INSERT INTO `t` VALUES ('1003', '123456', '陈迅雷', '0', '讲师', '1001', 'img/teacher/default.jpg');
INSERT INTO `t` VALUES ('1004', '123456', '张景峤', '0', '副教授', '1001', 'img/teacher/default.jpg');
INSERT INTO `t` VALUES ('1005', '123456', '滕中梅', '0', '讲师', '1001', 'img/teacher/default.jpg');
INSERT INTO `t` VALUES ('1006', '123456', '李晓强', '0', '其他', '1001', 'img/teacher/default.jpg');
INSERT INTO `t` VALUES ('1022', '123456', '张军英', '0', '讲师', '1001', 'img/teacher/default.jpg');

-- ----------------------------
-- Table structure for x
-- ----------------------------
DROP TABLE IF EXISTS `x`;
CREATE TABLE `x` (
  `cNo` varchar(8) NOT NULL,
  `tNo` varchar(4) NOT NULL,
  `stuNo` varchar(8) NOT NULL,
  PRIMARY KEY (`cNo`,`tNo`,`stuNo`),
  KEY `x_ibfk_2` (`tNo`),
  KEY `x_ibfk_3` (`stuNo`),
  CONSTRAINT `x_ibfk_1` FOREIGN KEY (`cNo`) REFERENCES `c` (`cNo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `x_ibfk_2` FOREIGN KEY (`tNo`) REFERENCES `t` (`tNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `x_ibfk_3` FOREIGN KEY (`stuNo`) REFERENCES `s` (`stuNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x
-- ----------------------------
INSERT INTO `x` VALUES ('08305121', '1003', '14120001');
INSERT INTO `x` VALUES ('08305121', '1003', '14121902');
INSERT INTO `x` VALUES ('08305121', '1003', '14122472');
INSERT INTO `x` VALUES ('08305010', '1005', '14120002');
INSERT INTO `x` VALUES ('08305010', '1005', '14122472');
INSERT INTO `x` VALUES ('08305014', '1006', '14120001');
INSERT INTO `x` VALUES ('08305014', '1006', '14120002');
INSERT INTO `x` VALUES ('08305014', '1006', '14121902');
INSERT INTO `x` VALUES ('08305014', '1006', '14122472');
INSERT INTO `x` VALUES ('08306110', '1006', '14120001');
INSERT INTO `x` VALUES ('08306110', '1006', '14121902');
INSERT INTO `x` VALUES ('08306110', '1006', '14122472');
