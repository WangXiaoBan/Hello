/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : oa1116

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-11-22 11:57:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `oa_auth_group`;
CREATE TABLE `oa_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(2000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_auth_group
-- ----------------------------
INSERT INTO `oa_auth_group` VALUES ('1', '超级管理员', '1', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16');
INSERT INTO `oa_auth_group` VALUES ('2', '新手', '1', '1');
INSERT INTO `oa_auth_group` VALUES ('3', '部门查看', '1', '1,2');

-- ----------------------------
-- Table structure for oa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `oa_auth_group_access`;
CREATE TABLE `oa_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_auth_group_access
-- ----------------------------
INSERT INTO `oa_auth_group_access` VALUES ('1', '3');

-- ----------------------------
-- Table structure for oa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `oa_auth_rule`;
CREATE TABLE `oa_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_auth_rule
-- ----------------------------
INSERT INTO `oa_auth_rule` VALUES ('1', 'Home/Index/index', '默认', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('2', 'Home/Department/index', '部门列表', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('3', 'Home/Department/details', '部门详情', '1', '1', '{sex}=1');
INSERT INTO `oa_auth_rule` VALUES ('4', 'Home/Department/add', '部门添加', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('5', 'Home/Department/edit', '部门修改', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('6', 'Home/Department/del', '部门删除', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('7', 'Home/Job/index', '岗位列表', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('8', 'Home/Job/details', '岗位详情', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('9', 'Home/Job/add', '岗位添加', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('10', 'Home/Job/edit', '岗位修改', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('11', 'Home/Job/del', '岗位删除', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('12', 'Home/UserInfo/index', '员工列表', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('13', 'Home/UserInfo/details', '员工详情', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('14', 'Home/UserInfo/add', '员工添加', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('15', 'Home/UserInfo/edit', '员工修改', '1', '1', '');
INSERT INTO `oa_auth_rule` VALUES ('16', 'Home/UserInfo/del', '员工删除', '1', '1', '');

-- ----------------------------
-- Table structure for oa_class_change
-- ----------------------------
DROP TABLE IF EXISTS `oa_class_change`;
CREATE TABLE `oa_class_change` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `stu_id` smallint(255) DEFAULT NULL COMMENT '学员ID',
  `classy_id` smallint(255) DEFAULT NULL COMMENT '原来的班级ID',
  `classx_id` smallint(255) DEFAULT NULL COMMENT '现在得班级ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(20) DEFAULT NULL COMMENT '创建时间',
  `del` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_class_change
-- ----------------------------
INSERT INTO `oa_class_change` VALUES ('1', '4', '1', '2', '', null, '1');
INSERT INTO `oa_class_change` VALUES ('2', '4', '2', '1', '', null, '1');
INSERT INTO `oa_class_change` VALUES ('3', '4', '1', '2', 'zai此', null, '1');
INSERT INTO `oa_class_change` VALUES ('4', '4', '2', '1', '13124', '1478083723', '1');
INSERT INTO `oa_class_change` VALUES ('5', '13', '1', '2', '测试一下', '1478165850', '1');

-- ----------------------------
-- Table structure for oa_class_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_class_info`;
CREATE TABLE `oa_class_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_code` varchar(255) DEFAULT NULL COMMENT '班级编号',
  `class_type` varchar(50) DEFAULT NULL COMMENT '类型：如，php',
  `usert_id` smallint(11) DEFAULT NULL COMMENT '任课教师',
  `userc_id` smallint(11) DEFAULT NULL COMMENT '班主任',
  `status` smallint(11) DEFAULT NULL COMMENT '状态:1段、2段。。。',
  `comments` varchar(255) DEFAULT NULL COMMENT '班级描述',
  `create_time` int(30) DEFAULT NULL COMMENT '创建时间',
  `del` int(30) DEFAULT '1',
  `class_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_class_info
-- ----------------------------
INSERT INTO `oa_class_info` VALUES ('1', 'P1011', 'PHP', '21', '31', '1', '测试', '1477979351', '1', '1479916800');
INSERT INTO `oa_class_info` VALUES ('2', 'P1112', 'PHP', '2', '32', '8', '测试', '1477979351', '1', '1479916800');
INSERT INTO `oa_class_info` VALUES ('3', 'J1211', 'Java', '2', '1', '3', '测试', '1477979351', '1', '1479916800');
INSERT INTO `oa_class_info` VALUES ('4', 'J1156', 'Java', '20', '21', '5', '测试', '1477979351', '1', '1479916800');
INSERT INTO `oa_class_info` VALUES ('5', 'J1023', 'Java', '23', '24', '2', '测试', '1477979351', '2', '1479916800');
INSERT INTO `oa_class_info` VALUES ('6', 'P1606', 'PHP', '2', '31', '2', '无人区GV发送到', '1477993524', '1', '1479916800');
INSERT INTO `oa_class_info` VALUES ('7', 'J1212', 'Java', '23', '32', '3', 'q&amp;nbsp; &amp;nbsp; 咕~~(╯﹏╰)b21412', '1477993611', '1', '1479916800');
INSERT INTO `oa_class_info` VALUES ('8', 'A1212', 'Android', '15', '31', '1', '2421412', '1477993644', '1', '1479916800');
INSERT INTO `oa_class_info` VALUES ('9', '\r\nJ测试', 'Java', '16', '31', '6', '测试', '1477993729', '1', '1479916800');
INSERT INTO `oa_class_info` VALUES ('11', 'A1607', 'Android', '2', '32', '2', '4141', '1478056494', '1', '1479916800');
INSERT INTO `oa_class_info` VALUES ('12', 'J1607', 'Java', '2', '32', '1', '124214', '1478153046', '1', '1480003200');
INSERT INTO `oa_class_info` VALUES ('13', 'P1607', 'PHP', '1', '32', '1', '201607', '1479084793', '1', '1479052800');

-- ----------------------------
-- Table structure for oa_class_style
-- ----------------------------
DROP TABLE IF EXISTS `oa_class_style`;
CREATE TABLE `oa_class_style` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `class_id` int(10) DEFAULT NULL,
  `photo_thumb` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `create_time` int(30) DEFAULT NULL,
  `del` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_class_style
-- ----------------------------
INSERT INTO `oa_class_style` VALUES ('10', '9', 'Uploads/20161103/581aa8fc63262_thumb.png', 'Uploads/20161103/581aa8fc63262.png', '1478142204', '1');
INSERT INTO `oa_class_style` VALUES ('11', '9', 'Uploads/20161103/581aa8fc9477e_thumb.png', 'Uploads/20161103/581aa8fc9477e.png', '1478142204', '1');
INSERT INTO `oa_class_style` VALUES ('12', '9', 'Uploads/20161103/581aa8fca35ca_thumb.png', 'Uploads/20161103/581aa8fca35ca.png', '1478142204', '1');
INSERT INTO `oa_class_style` VALUES ('13', '9', 'Uploads/20161103/581aa8fd626e4_thumb.png', 'Uploads/20161103/581aa8fd626e4.png', '1478142205', '1');
INSERT INTO `oa_class_style` VALUES ('14', '9', 'Uploads/20161103/581aa8fd98250_thumb.png', 'Uploads/20161103/581aa8fd98250.png', '1478142205', '1');
INSERT INTO `oa_class_style` VALUES ('15', '11', 'Uploads/20161103/581aa9521adc0_thumb.jpg', 'Uploads/20161103/581aa9521adc0.jpg', '1478142290', '1');
INSERT INTO `oa_class_style` VALUES ('16', '11', 'Uploads/20161103/581aa96e048b5_thumb.jpg', 'Uploads/20161103/581aa96e048b5.jpg', '1478142318', '2');
INSERT INTO `oa_class_style` VALUES ('17', '11', 'Uploads/20161103/581aa96e0e8df_thumb.png', 'Uploads/20161103/581aa96e0e8df.png', '1478142318', '2');
INSERT INTO `oa_class_style` VALUES ('18', '11', 'Uploads/20161103/581aa96e169c9_thumb.jpg', 'Uploads/20161103/581aa96e169c9.jpg', '1478142318', '2');
INSERT INTO `oa_class_style` VALUES ('19', '11', 'Uploads/20161103/581aa96f08387_thumb.jpg', 'Uploads/20161103/581aa96f08387.jpg', '1478142319', '1');
INSERT INTO `oa_class_style` VALUES ('20', '11', 'Uploads/20161103/581ad96884d85_thumb.jpg', 'Uploads/20161103/581ad96884d85.jpg', '1478154600', '1');
INSERT INTO `oa_class_style` VALUES ('21', '11', 'Uploads/20161103/581ad96929ca1_thumb.jpg', 'Uploads/20161103/581ad96929ca1.jpg', '1478154601', '2');
INSERT INTO `oa_class_style` VALUES ('22', '11', 'Uploads/20161103/581ad9698e618_thumb.jpg', 'Uploads/20161103/581ad9698e618.jpg', '1478154601', '1');
INSERT INTO `oa_class_style` VALUES ('23', '11', 'Uploads/20161103/581ad969e4cfd_thumb.jpg', 'Uploads/20161103/581ad969e4cfd.jpg', '1478154601', '1');
INSERT INTO `oa_class_style` VALUES ('24', '11', 'Uploads/20161104/581be66914fdd_thumb.png', 'Uploads/20161104/581be66914fdd.png', '1478223465', '1');
INSERT INTO `oa_class_style` VALUES ('25', '13', 'Uploads/20161118/582e7d8aa80e3_thumb.jpg', 'Uploads/20161118/582e7d8aa80e3.jpg', '1479441802', '1');
INSERT INTO `oa_class_style` VALUES ('26', '13', 'Uploads/20161118/582e7d8abeec1_thumb.jpg', 'Uploads/20161118/582e7d8abeec1.jpg', '1479441802', '1');

-- ----------------------------
-- Table structure for oa_department
-- ----------------------------
DROP TABLE IF EXISTS `oa_department`;
CREATE TABLE `oa_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `dept_duty` varchar(255) DEFAULT NULL COMMENT '部门描述',
  `leader` varchar(255) DEFAULT NULL COMMENT '领导',
  `create_time` int(30) DEFAULT NULL COMMENT '创建时间',
  `del` int(30) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_department
-- ----------------------------
INSERT INTO `oa_department` VALUES ('1', '教学部', '基础教学', '张岩', '1477375093', '1');
INSERT INTO `oa_department` VALUES ('2', '人资', '人资管理', '张岩2', '1477375093', '1');
INSERT INTO `oa_department` VALUES ('3', '销售', '销售管理', '张岩3', '1477375093', '1');
INSERT INTO `oa_department` VALUES ('4', '研发', '研发项目', '张岩4', '1477375093', '1');
INSERT INTO `oa_department` VALUES ('5', 'php教学部3', 'php教学3', '张岩5', '1477375093', '1');
INSERT INTO `oa_department` VALUES ('6', 'php教学部4', 'php教学4', '张岩6', '1477375093', '1');
INSERT INTO `oa_department` VALUES ('7', 'php教学部1', 'php教学1', '张岩7', '1477375093', '1');
INSERT INTO `oa_department` VALUES ('8', 'php教学部2', 'php教学2', '张岩8', '1477375093', '1');
INSERT INTO `oa_department` VALUES ('9', 'php教学部3', 'php教学3', '张岩9', '1477375093', '1');
INSERT INTO `oa_department` VALUES ('10', 'php教学部44', 'php教学4', '张岩10', '1477841374', '1');
INSERT INTO `oa_department` VALUES ('13', '5', '5', '5', '1477841386', '0');
INSERT INTO `oa_department` VALUES ('14', '社区部', '班主任，班级管理', '王丹', '1477991955', '1');
INSERT INTO `oa_department` VALUES ('15', '创新创业', '创新创业', '创新创业', '1477992044', '1');
INSERT INTO `oa_department` VALUES ('16', '44', '44', '44', '1478576207', '0');

-- ----------------------------
-- Table structure for oa_job
-- ----------------------------
DROP TABLE IF EXISTS `oa_job`;
CREATE TABLE `oa_job` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `dept_id` int(255) DEFAULT NULL COMMENT '部门id',
  `job_name` varchar(255) DEFAULT NULL COMMENT '职位名称',
  `job_requriments` varchar(255) DEFAULT NULL COMMENT '职位描述',
  `create_time` int(30) DEFAULT NULL COMMENT '创建时间',
  `del` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_job
-- ----------------------------
INSERT INTO `oa_job` VALUES ('1', '1', 'php讲师', 'php授课', '1477375093', '1');
INSERT INTO `oa_job` VALUES ('2', '1', 'java讲师', 'php授课', '1477375093', '1');
INSERT INTO `oa_job` VALUES ('3', '1', 'UI讲师', 'php授课', '1477375093', '1');
INSERT INTO `oa_job` VALUES ('4', '1', '前端讲师', 'php授课', '1477375093', '1');
INSERT INTO `oa_job` VALUES ('5', '1', 'Android讲师', 'php授课', '1477886830', '1');
INSERT INTO `oa_job` VALUES ('6', '2', '人资主管', 'php授课', '1477375093', '1');
INSERT INTO `oa_job` VALUES ('7', '2', '培训经理', 'php授课', '1477375093', '1');
INSERT INTO `oa_job` VALUES ('8', '2', '招聘经理', 'php授课', '1477375093', '1');
INSERT INTO `oa_job` VALUES ('9', '2', '招聘主管', 'php授课', '1477375093', '1');
INSERT INTO `oa_job` VALUES ('10', '2', '培训主管', 'php授课', '1477886740', '1');
INSERT INTO `oa_job` VALUES ('11', '2', '人资总监', 'php授课', '1477375093', '1');
INSERT INTO `oa_job` VALUES ('12', '2', '人资助理', 'php授课', '1477375093', '1');
INSERT INTO `oa_job` VALUES ('13', '2', '咨询师', 'php授课', '1477375093', '1');
INSERT INTO `oa_job` VALUES ('17', '3', '销售总监', '哈哈', '1477887110', '1');
INSERT INTO `oa_job` VALUES ('18', '3', '销售经理', '讲解', '1477887110', '1');
INSERT INTO `oa_job` VALUES ('19', '3', '电销', '兰兰', '1477887110', '1');
INSERT INTO `oa_job` VALUES ('20', '4', '研发总监', '看看', '1477887110', '1');
INSERT INTO `oa_job` VALUES ('21', '4', '研发经理', 'uu', '1477887110', '1');
INSERT INTO `oa_job` VALUES ('22', '4', 'php开发工程师', '55', '1477887110', '1');
INSERT INTO `oa_job` VALUES ('23', '4', 'Java开发', '66', '1477887110', '1');
INSERT INTO `oa_job` VALUES ('24', '4', 'Android开发', '55', '1477887110', '1');
INSERT INTO `oa_job` VALUES ('25', '4', 'UI开发', '44', '1477887110', '1');
INSERT INTO `oa_job` VALUES ('26', '4', '前端开发', '33', '1477887110', '1');
INSERT INTO `oa_job` VALUES ('27', '1', 'php助教', '辅助教学', '1477890841', '1');
INSERT INTO `oa_job` VALUES ('28', '14', '班主任', '管理班级', '1477992120', '1');
INSERT INTO `oa_job` VALUES ('29', '14', '社区部总监', '社区部总监', '1477992138', '1');
INSERT INTO `oa_job` VALUES ('30', '1', '测试1', '测试1', '1478656305', '1');
INSERT INTO `oa_job` VALUES ('31', '1', '12', '12', '1479178863', '1');

-- ----------------------------
-- Table structure for oa_student_communicate
-- ----------------------------
DROP TABLE IF EXISTS `oa_student_communicate`;
CREATE TABLE `oa_student_communicate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL COMMENT '学员ID',
  `user_id` int(11) DEFAULT NULL COMMENT '咨询师ID',
  `communicate_time` int(11) DEFAULT NULL COMMENT '沟通时间',
  `communicate_evaluate` int(11) DEFAULT NULL COMMENT '沟通评价:1好，2一般，3差',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `del` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_student_communicate
-- ----------------------------
INSERT INTO `oa_student_communicate` VALUES ('1', '13', '16', '1478241327', '2', '是否来校接受培训', '1478241327', '1');
INSERT INTO `oa_student_communicate` VALUES ('2', '13', '18', '1478071085', '1', '恩恩', '1478243069', '1');
INSERT INTO `oa_student_communicate` VALUES ('3', '13', '16', '1478071085', '1', '方法', '1478243542', '1');
INSERT INTO `oa_student_communicate` VALUES ('4', '14', '1', '1478071085', '1', '3', '1478243750', '1');
INSERT INTO `oa_student_communicate` VALUES ('6', '14', '16', '1477985619', '2', '是否愿意上课', '1478244835', '1');
INSERT INTO `oa_student_communicate` VALUES ('7', '14', '2', '1478417641', '3', '迟到愿意接受处罚么？', '1478244866', '1');
INSERT INTO `oa_student_communicate` VALUES ('8', '14', '18', '1970', '1', '5555人人s', '1478661448', '1');
INSERT INTO `oa_student_communicate` VALUES ('9', '59', '2', '1479196972', '2', '44444', '1479196981', '1');
INSERT INTO `oa_student_communicate` VALUES ('10', '59', '17', '1479196987', '1', '55555', '1479196993', '1');
INSERT INTO `oa_student_communicate` VALUES ('11', '59', '22', '1479198335', '1', 'hhhhh', '1479198326', '1');
INSERT INTO `oa_student_communicate` VALUES ('12', '58', '22', '1479198510', '2', 'hhhhh', '1479198488', '1');
INSERT INTO `oa_student_communicate` VALUES ('13', '58', '16', '1479198550', '1', 'AAAAAAAAA', '1479198528', '1');

-- ----------------------------
-- Table structure for oa_student_contact
-- ----------------------------
DROP TABLE IF EXISTS `oa_student_contact`;
CREATE TABLE `oa_student_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` smallint(11) DEFAULT NULL COMMENT '学员ID',
  `name` varchar(255) DEFAULT NULL COMMENT '联系人姓名',
  `relationship` varchar(255) DEFAULT NULL COMMENT '关系',
  `tel` char(21) DEFAULT NULL COMMENT '电话',
  `comments` varchar(255) DEFAULT NULL COMMENT '简介',
  `create_time` int(30) DEFAULT NULL COMMENT '创建时间',
  `del` int(20) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_student_contact
-- ----------------------------
INSERT INTO `oa_student_contact` VALUES ('1', '1', '马大哈', '父子', '13567896789', '无', '1478016000', '1');
INSERT INTO `oa_student_contact` VALUES ('2', '1', '马哥', '兄弟', '13577788899', '无', '1478016000', '1');
INSERT INTO `oa_student_contact` VALUES ('3', '5', '雷神', '父子', '13366644455', '无', '1478016000', '1');
INSERT INTO `oa_student_contact` VALUES ('4', '12', '马马', '父子', '15566666666', '没有', '1478076458', '1');
INSERT INTO `oa_student_contact` VALUES ('5', '12', '马虎', '兄弟', '18233333333', '没了', '1478077169', '1');
INSERT INTO `oa_student_contact` VALUES ('6', '13', '张无忌', '祖宗', '11111111111', '就这么样吧', '1478077267', '1');
INSERT INTO `oa_student_contact` VALUES ('7', '11', '44', '44', '44', '44', '1478077730', '1');
INSERT INTO `oa_student_contact` VALUES ('11', '8', '3344', '3344', '3344', '3344', '1478079912', '1');
INSERT INTO `oa_student_contact` VALUES ('12', '16', '都懂我', '都懂3', '的3', '的3', '1478662450', '1');
INSERT INTO `oa_student_contact` VALUES ('13', '58', '隔壁老王', '父子', '16666666666', 'lllllll', '1479197082', '1');
INSERT INTO `oa_student_contact` VALUES ('14', '59', ' 语四', '父子', '177777777', 'AAAAAAAAA', '1479198248', '1');
INSERT INTO `oa_student_contact` VALUES ('15', '58', '小蓉', '母子', '6666666661', 'hhhhh', '1479198575', '1');
INSERT INTO `oa_student_contact` VALUES ('16', '57', '姚子', '母子', '16666444666', 'AAAAAAAAA', '1479199223', '1');
INSERT INTO `oa_student_contact` VALUES ('17', '56', '沈阳', '父子', '16dd44666', 'AAAddAAAA', '1479199320', '1');
INSERT INTO `oa_student_contact` VALUES ('18', '55', '文蚊', '父子', '111444444', '叮2222', '1479199378', '1');
INSERT INTO `oa_student_contact` VALUES ('19', '54', '伊利', '父子', '1323334666', 'vvhh', '1479199424', '1');
INSERT INTO `oa_student_contact` VALUES ('20', '51', '	殷商', '父子', '6666666661', 'AAAAAAAAA', '1479199474', '1');
INSERT INTO `oa_student_contact` VALUES ('21', '50', '骆驼', '母子', '6666666661', 'AAAAAAAAA', '1479199506', '1');
INSERT INTO `oa_student_contact` VALUES ('22', '47', '韩红', '母子', '16666444666', 'hhhhh', '1479199538', '1');
INSERT INTO `oa_student_contact` VALUES ('23', '46', '韩憨', '父子', '16666444666', 'AAAddAAAA', '1479199580', '1');
INSERT INTO `oa_student_contact` VALUES ('24', '44', '樱子', '母子', '16666444666', 'vvhh', '1479199604', '1');
INSERT INTO `oa_student_contact` VALUES ('25', '43', '伊能静', '母子', '16dd44666', 'AAAddAAAA', '1479199635', '1');
INSERT INTO `oa_student_contact` VALUES ('26', '41', '韦小宝', '父子', '6666666661', 'AAAddAAAA', '1479199674', '1');
INSERT INTO `oa_student_contact` VALUES ('27', '40', '韦小宝', '父子', '16666444666', 'AAAAAAAAA', '1479199724', '1');
INSERT INTO `oa_student_contact` VALUES ('28', '37', '韦小宝', '父子', '16666666666', 'AAAAAAAAA', '1479199748', '1');
INSERT INTO `oa_student_contact` VALUES ('29', '36', '韦小宝', '父子', '6666666661', 'hhhhh', '1479199771', '1');
INSERT INTO `oa_student_contact` VALUES ('30', '34', '韦小宝', '父子', '16dd44666', 'AAAddAAAA', '1479199788', '1');

-- ----------------------------
-- Table structure for oa_student_discipline
-- ----------------------------
DROP TABLE IF EXISTS `oa_student_discipline`;
CREATE TABLE `oa_student_discipline` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `stu_id` smallint(11) DEFAULT NULL COMMENT '学员ID',
  `type` smallint(11) DEFAULT NULL COMMENT '类型：1旷课、2迟到、3休学、4未就业原因',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(30) DEFAULT NULL COMMENT '创建时间',
  `del` int(20) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_student_discipline
-- ----------------------------
INSERT INTO `oa_student_discipline` VALUES ('1', '1', '1', '222', '1477999380', '1');
INSERT INTO `oa_student_discipline` VALUES ('2', '2', '2', '333', '1477999380', '1');
INSERT INTO `oa_student_discipline` VALUES ('3', '3', '3', '444', '1477999380', '1');
INSERT INTO `oa_student_discipline` VALUES ('4', '11', '2', '我问问', '1478254479', '1');
INSERT INTO `oa_student_discipline` VALUES ('6', '13', '1', '试试都懂', '1478669414', '1');

-- ----------------------------
-- Table structure for oa_student_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_student_info`;
CREATE TABLE `oa_student_info` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `class_id` smallint(11) DEFAULT NULL COMMENT '班级ID',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` smallint(11) DEFAULT NULL COMMENT '性别',
  `birth_date` int(11) DEFAULT NULL COMMENT '出生日期',
  `age` smallint(255) DEFAULT NULL COMMENT '年龄',
  `edu` varchar(255) DEFAULT '4' COMMENT '学历',
  `school` varchar(255) DEFAULT NULL COMMENT '毕业院校',
  `profession` varchar(255) DEFAULT NULL COMMENT '专业',
  `address` varchar(255) DEFAULT NULL COMMENT '住址',
  `id_card` char(20) DEFAULT NULL COMMENT '身份证号',
  `id_card_path` varchar(255) DEFAULT NULL COMMENT '身份证扫描件',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `wechat` varchar(255) DEFAULT NULL COMMENT '微信',
  `qq` int(11) DEFAULT NULL COMMENT 'QQ',
  `has_pay` varchar(255) DEFAULT NULL COMMENT '学费是否交齐',
  `userg_id` smallint(11) DEFAULT NULL COMMENT '归属人',
  `userz_id` smallint(11) DEFAULT NULL COMMENT '咨询师',
  `stu_type` varchar(255) DEFAULT NULL COMMENT '学员状态:1段、2段…就业。。',
  `dataSource` varchar(255) DEFAULT NULL COMMENT '学生数据来源（1社会、2网络。。）',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT '1' COMMENT '2学员、1意向学员',
  `status_c` int(11) DEFAULT '1' COMMENT '就业测评状态:1未测评，2未保存，3已保存',
  `del` int(20) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_student_info
-- ----------------------------
INSERT INTO `oa_student_info` VALUES ('1', '1', '马云', '1', '1477999380', '1', '4', '1', '1', '1', '1', 'Public/data/20161102/58199246cf4c3.jpg', '1', '1', '1', '1', '24', '19', '1', '2', '1477999245', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('2', '1', '马化腾', '2', '1477999380', '2', '3', '2', '2', '2', '2', 'Public/data/20161102/58199246cf4c3.jpg', '2', '2', '2', '2', '18', '3', '1', '2', '1477999413', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('3', '1', '马赛克', '2', '1478047838', '3', '4', '3', '3', '3', '3', 'Public/data/20161102/58199246cf4c3.jpg', '3', '3', '3', '2', '30', '23', '1', '3', '1478047866', '2', '2', '1');
INSERT INTO `oa_student_info` VALUES ('4', '3', '李彦宏', '2', '1478047873', '7', '5', '7', '7', '7', '7', 'Public/data/20161102/58199246cf4c3.jpg', '7', '7', '7', '1', '16', '2', '1', '2', '1478047901', '2', '3', '1');
INSERT INTO `oa_student_info` VALUES ('5', '1', '雷军', '1', '1477788707', '9', '4', '9', '9', '9', '9', 'Public/data/20161102/58199246cf4c3.jpg', '9', '9', '9', '1', '22', '16', '1', '2', '1478047935', '2', '2', '1');
INSERT INTO `oa_student_info` VALUES ('6', '5', '张小龙', '1', '1478049102', '23', '4', '23', '23', '23', '23', 'Public/data/20161102/58199246cf4c3.jpg', '23', '23', '23', '2', '21', '21', '1', '2', '1478049130', '2', '3', '1');
INSERT INTO `oa_student_info` VALUES ('8', '1', '马赛克', '1', '1478016000', '34', '5', '34', '34', '34', '333334444', 'Public/data/20161102/58199246cf4c3.jpg', '34', '34', '34', '2', '30', '23', '1', '1', '1478056026', '2', '3', '1');
INSERT INTO `oa_student_info` VALUES ('10', '1', '马赛克', '2', '1478016000', '34', '4', '34', '34', '34', '333334444', 'Public/data/20161102/58199246cf4c3.jpg', '34', '34', '34', '2', '30', '23', '1', '1', '1478059337', '1', '3', '1');
INSERT INTO `oa_student_info` VALUES ('11', '1', '马化腾', '1', '1477929600', '2', '3', '2', '2', '2', '2', 'Public/data/20161102/58199246cf4c3.jpg', '2', '2', '2', '2', '18', '3', '1', '1', '1478064760', '1', '2', '1');
INSERT INTO `oa_student_info` VALUES ('12', '1', '马赛克', '1', '1478016000', '34', '2', '34', '34', '34', '333334444', 'Public/data/20161102/58199246cf4c3.jpg', '345', '34', '34', '2', '30', '23', '1', '1', '1478064807', '1', '3', '1');
INSERT INTO `oa_student_info` VALUES ('13', '2', '张三丰1', '2', '-1014278400', '111', '4', '武当', '太极', '武当山', '2147483647', 'Public/data/20161102/58199246cf4c3.jpg', '13333333333', '13333333331', '111111111', '2', '1', '24', '4', '1', '1478070855', '2', '3', '1');
INSERT INTO `oa_student_info` VALUES ('14', '1', '天天', '2', '1477984428', '2', '1', '222', '222', '2', '222222222222', null, '2', '2', '2', '2', '1', '1', '1', '2', '1478243680', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('15', '1', '1', '2', '1257131068', '1', '1', '1', '1', '1', '122222222222222', null, '1', '1', '1', '2', '1', '2', '1', '2', '1478487914', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('16', '13', '何大壮', '1', '816310545', '22', '2', '33', '33', '13333333336', '222323232323232323', null, '13333333333', '13333333334', '2147483647', '2', '2', '2', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('17', '13', '李伟', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('18', '13', '李新', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('19', '13', '刘丽', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('20', '13', '高天', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('21', '13', '牟尼', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('22', '13', '释迦', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('23', '13', '石晓杰', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('24', '13', '李天二', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('25', '13', '邱重阳', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('26', '13', '赵国庆', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('27', '13', '钱谦益', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('28', '13', '孙颖', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('29', '13', '周周', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('30', '13', '韦泯', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('31', '13', '韦红兰', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('32', '13', '韦荼', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '2', '3', '1');
INSERT INTO `oa_student_info` VALUES ('33', '13', '韦琛', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('34', '13', '韦天玺', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('35', '13', '韦宇帅', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('36', '13', '韦栩卉', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('37', '13', '韦和平', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('38', '13', '韦诗嘉', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('39', '13', '韦长隆', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('40', '13', '韦诩恩', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('41', '13', '韦开亮', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('42', '12', '晓献', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('43', '12', '伊索萦', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('44', '12', '樱芷月', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('45', '12', '燕栩栩', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('46', '12', '韩紫与', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('47', '12', '韩紫语', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('48', '12', '梦临韵', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('49', '12', '燕如生', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '3', '1');
INSERT INTO `oa_student_info` VALUES ('50', '12', '骆紫洛', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('51', '12', '殷千习', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('52', '12', '黎乐', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('53', '12', '沐连鱼', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('54', '11', '伊青寻', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('55', '11', '文恋双', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('56', '11', '沈傲秋', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('57', '11', '姚洛恹', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('58', '11', '徐颖洛', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '1', '1', '1');
INSERT INTO `oa_student_info` VALUES ('59', '11', '语川雅', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('60', '11', '安佑吟', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('61', '11', '夏沁雨', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('62', '11', '玉临嫣', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '1', '1');
INSERT INTO `oa_student_info` VALUES ('63', '11', '许桐娅', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '2', '20', '21', '1', '2', '1479085053', '2', '2', '1');
INSERT INTO `oa_student_info` VALUES ('64', '11', '欧月', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '3', '1');
INSERT INTO `oa_student_info` VALUES ('65', '11', '楚羡冰', '1', '816310545', '22', '2', '哈职院', '汽修', '哈市', '232323232323232323', null, '13745645645', '13745645645', '256745', '1', '20', '21', '1', '2', '1479085053', '2', '3', '1');

-- ----------------------------
-- Table structure for oa_teacher_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `oa_teacher_evaluate`;
CREATE TABLE `oa_teacher_evaluate` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `class_id` smallint(11) DEFAULT NULL COMMENT '班级ID',
  `usert_id` smallint(11) DEFAULT NULL COMMENT '任课教师',
  `quota_message_a` varchar(2000) DEFAULT NULL COMMENT '主观题1',
  `quota_message_b` varchar(2000) DEFAULT NULL COMMENT '主观题2',
  `quota_message_c` varchar(2000) DEFAULT NULL COMMENT '主观题3',
  `quota_code` varchar(255) DEFAULT NULL COMMENT '主观题（选项用逗号连接）',
  `create_time` char(50) DEFAULT NULL COMMENT '创建时间',
  `class_status` int(11) DEFAULT NULL,
  `del` varchar(30) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_teacher_evaluate
-- ----------------------------
INSERT INTO `oa_teacher_evaluate` VALUES ('8', '2', '2', '235325', '23532', '2335223', '3,1,1,1,3,1,1,1,1,1', '1477963617', '4', '1');
INSERT INTO `oa_teacher_evaluate` VALUES ('9', '1', '1', '24124', '214214', '412', '0,8,10,10,8,10,10,10,10,10', '1477964216', '1', '1');
INSERT INTO `oa_teacher_evaluate` VALUES ('10', '1', '1', '12312', '31243', '1421', '6,10,0,10,10,10,10,10,10,10', '1477979339', '1', '1');
INSERT INTO `oa_teacher_evaluate` VALUES ('11', '3', '2', '412', '高的', '无人区围绕', '8,10,0,10,10,10,10,10,10,10', '1477979351', '3', '1');
INSERT INTO `oa_teacher_evaluate` VALUES ('12', '6', '2', '12124', '4214', '1214', '8,10,6,10,10,10,10,10,10,10', '1477994716', '2', '1');
INSERT INTO `oa_teacher_evaluate` VALUES ('13', '3', '2', '131124214', '1241', '12412', '8,10,10,8,0,10,10,10,10,10', '1478057428', '3', '1');
INSERT INTO `oa_teacher_evaluate` VALUES ('14', '2', '2', '24124', '12421', '124124', '8,10,10,0,10,8,0,10,10,10', '1478057452', '4', '1');
INSERT INTO `oa_teacher_evaluate` VALUES ('15', '2', '2', '3535', '35345', '234242', '6,10,6,10,10,10,10,10,10,10', '1478057597', '4', '1');
INSERT INTO `oa_teacher_evaluate` VALUES ('16', '9', '16', '14212421', '12421412', '41124124', '8,10,10,10,10,6,10,10,8,10', '1478058094', '6', '1');
INSERT INTO `oa_teacher_evaluate` VALUES ('17', '7', '23', '124124', '124124', '124124', '6,10,10,6,10,10,10,10,10,10', '1478058107', '3', '1');
INSERT INTO `oa_teacher_evaluate` VALUES ('18', '7', '23', '玩玩', '玩玩', '玩玩', '8,10,8,10,8,10,10,10,10,10', '1478587039', '3', '1');

-- ----------------------------
-- Table structure for oa_user_info
-- ----------------------------
DROP TABLE IF EXISTS `oa_user_info`;
CREATE TABLE `oa_user_info` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '员工姓名',
  `accounts` varchar(255) DEFAULT NULL COMMENT '登录账号',
  `pwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `sex` smallint(10) DEFAULT NULL COMMENT '性别',
  `birthday` int(255) DEFAULT NULL COMMENT '出生日期',
  `id_card` char(255) DEFAULT NULL COMMENT '身份证号',
  `id_card_path` varchar(255) DEFAULT NULL COMMENT '身份证照片',
  `user_photo` varchar(255) DEFAULT NULL COMMENT '员工一寸照',
  `education` varchar(255) DEFAULT NULL COMMENT '学历',
  `graduate_photo` varchar(255) DEFAULT NULL COMMENT '学历证书扫描件',
  `resume` varchar(255) DEFAULT NULL COMMENT '简历',
  `address` varchar(255) DEFAULT NULL COMMENT '住址',
  `tel` char(255) DEFAULT NULL COMMENT '电话',
  `status` smallint(10) DEFAULT NULL COMMENT '状态(0:在职，1:离职);',
  `job_id` smallint(10) DEFAULT NULL COMMENT '职位id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(20) DEFAULT NULL COMMENT '创建时间',
  `del` char(20) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_user_info
-- ----------------------------
INSERT INTO `oa_user_info` VALUES ('1', '张三1', 'zhangsan', '202cb962ac59075b964b07152d234b70', '1', '1477375093', '222222222222222222', null, null, '本科', null, null, '哈尔滨市', '13567890123', '1', '1', null, '1477375093', '1');
INSERT INTO `oa_user_info` VALUES ('2', '张三2', 'zhangsan2', '202cb962ac59075b964b07152d234b70', '2', '1477375093', '322222222222222222', null, null, '本科', null, null, '哈尔滨市', '13567890123', '2', '2', null, '1477375093', '1');
INSERT INTO `oa_user_info` VALUES ('3', '张三3', 'zhangsan3', '202cb962ac59075b964b07152d234b70', '1', '1477375093', '422222222222222222', null, null, '本科', null, null, '哈尔滨市', '13567890123', '1', '4', null, '1477375093', '1');
INSERT INTO `oa_user_info` VALUES ('16', '张三4', 'zhangsan4', '202cb962ac59075b964b07152d234b70', '2', '1477375093', '522222222222222222', null, null, '本科', null, null, '哈尔滨市', '13567890123', '1', '5', null, '1477375093', '1');
INSERT INTO `oa_user_info` VALUES ('17', '张三5', 'zhangsan5', '202cb962ac59075b964b07152d234b70', '1', '1477375093', '622222222222222222', null, null, '本科', null, null, '哈尔滨市', '13567890123', '2', '6', null, '1477375093', '1');
INSERT INTO `oa_user_info` VALUES ('18', '张三6', 'zhangsan6', '202cb962ac59075b964b07152d234b70', '2', '1477375093', '722222222222222222', null, null, '本科', null, null, '哈尔滨市', '13567890123', '2', '7', null, '1477375093', '1');
INSERT INTO `oa_user_info` VALUES ('19', '张三7', 'zhangsan7', '202cb962ac59075b964b07152d234b70', '2', '1477375093', '822222222222222222', null, null, '本科', null, null, '哈尔滨市', '13567890123', '1', '8', null, '1477375093', '1');
INSERT INTO `oa_user_info` VALUES ('20', '张三8', 'zhangsan8', '202cb962ac59075b964b07152d234b70', '1', '1477375093', '922222222222222222', null, null, '本科', null, null, '哈尔滨市', '13567890123', '2', '9', null, '1477375093', '1');
INSERT INTO `oa_user_info` VALUES ('21', '张三9', 'zhangsan9', '202cb962ac59075b964b07152d234b70', '2', '1477375093', '222222232222222222', null, null, '本科', null, null, '哈尔滨市', '13567890123', '1', '1', null, '1477375093', '1');
INSERT INTO `oa_user_info` VALUES ('22', '张三10', 'zhangsan10', '202cb962ac59075b964b07152d234b70', '1', '1477375093', '222222222322222222', null, null, '本科', null, null, '哈尔滨市', '13567890123', '2', '2', null, '1477375093', '1');
INSERT INTO `oa_user_info` VALUES ('23', '张三11', 'zhangsan11', '202cb962ac59075b964b07152d234b70', '2', '1477375093', '222222222222232222', null, null, '本科', null, null, '哈尔滨市', '13567890123', '2', '3', null, '1477375093', '1');
INSERT INTO `oa_user_info` VALUES ('24', '张三12', 'zhangsan12', '202cb962ac59075b964b07152d234b70', '1', '1477375093', '222222222222222322', null, null, '本科', null, null, '哈尔滨市', '13567890123', '1', '1', null, '1477375093', '1');
INSERT INTO `oa_user_info` VALUES ('25', '1', '1', '202cb962ac59075b964b07152d234b70', '2', '1', '1', 'Public/data/20161031/581721b12bff6.png', 'Public/data/20161031/581721b11a6b2.jpg', '1', 'Public/data/20161031/581721b12e31f.jpg', 'Public/data/20161031/58172808d3ef4.jpg', '1', '1', '1', '17', '1', '1477910961', '1');
INSERT INTO `oa_user_info` VALUES ('26', '2', '2', '202cb962ac59075b964b07152d234b70', '2', '2', '2', 'Public/data/20161031/5817239167703.png', 'Public/data/20161031/5817239156d5f.jpg', '2', 'Public/data/20161031/5817239168e73.jpg', 'Public/data/20161031/5817239178c5f.jpg', '2', '2', '1', '20', '2', '1477911441', '1');
INSERT INTO `oa_user_info` VALUES ('27', '3', '3', '202cb962ac59075b964b07152d234b70', '1', '4', '4', 'Public/data/20161031/581723d688a15.png', 'Public/data/20161031/581723d679fb2.jpg', '4', 'Public/data/20161031/581723d68a56e.jpg', 'Public/data/20161031/581723d698801.jpg', '4', '4', '1', '21', '4', '1477911510', '1');
INSERT INTO `oa_user_info` VALUES ('30', '733', '733', '202cb962ac59075b964b07152d234b70', '2', '1477914258', '733', 'Public/data/20161031/581730b7b3fc9.jpg', '', '733', '', '', '733', '733', '2', '12', '733', '1477914807', '1');
INSERT INTO `oa_user_info` VALUES ('31', '3', '3', '202cb962ac59075b964b07152d234b70', '1', '1478678451', '3', '', '', '3', 'Public/data/20161101/5817eafd5da10.jpg', '', '', '3', '1', '28', '', '1478165822', '1');
INSERT INTO `oa_user_info` VALUES ('32', '张三134', '张三13', '202cb962ac59075b964b07152d234b70', '2', '1478583638', '6', '', '', '6', '', 'Public/data/20161103/581ab13d9ad0b.doc', '6', '6', '1', '28', '', '1478165801', '1');

-- ----------------------------
-- Table structure for oa_work_ability_test
-- ----------------------------
DROP TABLE IF EXISTS `oa_work_ability_test`;
CREATE TABLE `oa_work_ability_test` (
  `id` smallint(255) NOT NULL AUTO_INCREMENT,
  `stu_id` smallint(255) DEFAULT NULL COMMENT '学员ID',
  `entrance_work_aptitude` varchar(255) DEFAULT NULL COMMENT '入学就业资质',
  `professional_aptitude` varchar(255) DEFAULT NULL COMMENT '专业技能资质',
  `job_quality` varchar(255) DEFAULT NULL COMMENT '职业素质总评',
  `diploma` smallint(255) DEFAULT NULL COMMENT '发毕业证:1核准，2不准',
  `test_status` varchar(255) DEFAULT NULL COMMENT '状态：1可更改，2不可更改',
  `create_time` int(30) DEFAULT NULL COMMENT '创建时间',
  `del` int(20) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_work_ability_test
-- ----------------------------
INSERT INTO `oa_work_ability_test` VALUES ('1', '11', '1', '3', '3', '1', '1', '1478486378', '1');
INSERT INTO `oa_work_ability_test` VALUES ('3', '10', '1', '1', '1', '1', '2', '1478482578', '1');
INSERT INTO `oa_work_ability_test` VALUES ('10', '6', '1', '2', '2', '1', '2', '1478482626', '1');
INSERT INTO `oa_work_ability_test` VALUES ('11', '8', '1', '1', '1', '1', '2', '1478482773', '1');
INSERT INTO `oa_work_ability_test` VALUES ('12', '5', '1', '3', '2', '1', '1', '1478482886', '1');
INSERT INTO `oa_work_ability_test` VALUES ('13', '4', '1', '3', '1', '2', '2', '1478486400', '1');
INSERT INTO `oa_work_ability_test` VALUES ('15', '13', '1', '1', '1', '1', '2', '1478672165', '1');
INSERT INTO `oa_work_ability_test` VALUES ('24', '12', '2', '2', '3', '2', '2', '1478675967', '1');
INSERT INTO `oa_work_ability_test` VALUES ('25', '65', '2', '4', '2', '2', '2', '1479095409', '1');
INSERT INTO `oa_work_ability_test` VALUES ('26', '63', '2', '4', '2', '2', '1', '1479095404', '1');
INSERT INTO `oa_work_ability_test` VALUES ('27', '64', '2', '2', '2', '2', '2', '1479118355', '1');
INSERT INTO `oa_work_ability_test` VALUES ('28', '32', '2', '4', '4', '2', '2', '1479117982', '1');
INSERT INTO `oa_work_ability_test` VALUES ('29', '49', '2', '4', '4', '2', '2', '1479117993', '1');
INSERT INTO `oa_work_ability_test` VALUES ('30', '3', '2', '4', '4', '2', '1', '1479118367', '1');

-- ----------------------------
-- Table structure for oa_work_experience
-- ----------------------------
DROP TABLE IF EXISTS `oa_work_experience`;
CREATE TABLE `oa_work_experience` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `stu_id` smallint(11) DEFAULT NULL COMMENT '学员ID',
  `area` varchar(255) DEFAULT NULL COMMENT '工作所在城市',
  `work_start_date` int(11) DEFAULT NULL COMMENT '工作开始时间',
  `job` varchar(255) DEFAULT NULL COMMENT '职位',
  `c_type` varchar(255) DEFAULT NULL COMMENT '单位类型',
  `pay` int(11) DEFAULT NULL COMMENT '薪酬',
  `company` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `comments` varchar(255) DEFAULT NULL COMMENT '单位简介',
  `offer` varchar(255) DEFAULT NULL COMMENT 'offer',
  `welfare` varchar(255) DEFAULT NULL COMMENT '福利',
  `create_time` int(30) DEFAULT NULL COMMENT '创建时间',
  `del` int(20) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_work_experience
-- ----------------------------
INSERT INTO `oa_work_experience` VALUES ('6', '12', '哈尔滨1', '1479571200', 'PHP开发工程师1', '私企1', '2111113', '联之通科技1', '哈尔滨联之通科技有限公司简介111', 'Uploads/20161105/581d5400007ee.doc', '3,4,5', '1478251011', '1');
INSERT INTO `oa_work_experience` VALUES ('7', '5', '北京', '1478306872', 'PHP软件工程师', '国企', '9000', '123企业', '124214', null, '1,3,5,6,8,9', '1478306872', '1');
INSERT INTO `oa_work_experience` VALUES ('8', '11', '上海', '1478315382', '12321', '12321', '1312', '12321', '12312312', null, '1,2,3,12', '1478307884', '1');
INSERT INTO `oa_work_experience` VALUES ('9', '10', '广州', '1478308208', '12312', '12312', '12321', '12312', '2121421', 'Uploads/20161105/581d316fe309d.doc', '3,4,8,11', '1478308208', '1');
INSERT INTO `oa_work_experience` VALUES ('10', '8', '深圳', '1478308346', '14', '12312', '12214', '124', '12421', null, '2,6,10', '1478308346', '1');
INSERT INTO `oa_work_experience` VALUES ('11', '3', '124', '1478308362', '124', '124', '14124', '124', '', null, '7,10', '1478308362', '1');
