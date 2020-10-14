/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2020-10-14 10:37:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `nickName` varchar(25) DEFAULT NULL COMMENT '昵称',
  `phoneNum` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '张三', '小三', '1388888888', 'zhangsan@QQ.com');
INSERT INTO `member` VALUES ('2', '李四', '小四', '1288888888', 'lisi@qq.com');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` timestamp NULL DEFAULT NULL,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `memberId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_o_p` (`productId`) USING BTREE,
  KEY `fk_o_m` (`memberId`) USING BTREE,
  CONSTRAINT `fk_o_m` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`),
  CONSTRAINT `fk_o_p` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '12345', '2019-05-17 00:00:00', '2', '233', '0', '1', '1', '1');
INSERT INTO `orders` VALUES ('2', '12346', '2019-05-17 11:15:17', '4', '233', '0', '1', '2', '2');
INSERT INTO `orders` VALUES ('3', '12347', '2019-05-17 00:00:00', '5', '233', '0', '1', '3', '2');
INSERT INTO `orders` VALUES ('4', '12348', '2020-10-01 11:14:11', '8', '233', '0', '1', '4', '1');
INSERT INTO `orders` VALUES ('5', '12349', '2020-10-01 11:14:44', '4', '233', '0', '1', '5', '1');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller` (
  `orderId` varchar(32) DEFAULT NULL,
  `travellerId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('1', '1');
INSERT INTO `order_traveller` VALUES ('2', '2');
INSERT INTO `order_traveller` VALUES ('3', '1');
INSERT INTO `order_traveller` VALUES ('4', '1');
INSERT INTO `order_traveller` VALUES ('5', '2');
INSERT INTO `order_traveller` VALUES ('7', '2');
INSERT INTO `order_traveller` VALUES ('8', '1');
INSERT INTO `order_traveller` VALUES ('9', '2');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '角色管理权限', '/role/findAll.do');
INSERT INTO `permission` VALUES ('2', '资源权限管理', '/permission/findAll.do');
INSERT INTO `permission` VALUES ('3', '用户管理权限', '/user/findAll.do');
INSERT INTO `permission` VALUES ('4', '商品管理权限', '/product/findAll.do');
INSERT INTO `permission` VALUES ('5', '日志管理权限', '/sysLog/findAll.do');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` date DEFAULT NULL,
  `productPrice` double(11,0) DEFAULT NULL,
  `productDesc` varchar(250) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '001', '云南一日游', '云南', '2019-09-01', '2100', '云南欢迎你', '1');
INSERT INTO `product` VALUES ('2', '002', '昆明三日游', '昆明', '2020-05-01', '1800', '昆明欢迎你', '1');
INSERT INTO `product` VALUES ('3', '003', '上海一日游', '上海', '2020-05-13', '3800', '魔都欢迎你', '1');
INSERT INTO `product` VALUES ('4', '004', '北京三日游', '北京', '2020-05-29', '5800', '北京我来了', '1');
INSERT INTO `product` VALUES ('5', '005', '深圳七日游', '昆明', '2020-05-01', '18000', '深圳欢迎你', '1');
INSERT INTO `product` VALUES ('6', '006', '昭通一日游', '昭通', '2020-05-30', '1200', '昭通大山包', '0');
INSERT INTO `product` VALUES ('7', '007', '丽江一日游', '昆明', '2020-06-04', '1500', '丽江古镇', '0');
INSERT INTO `product` VALUES ('8', '111', '女儿国一日游', '大唐', '2020-10-10', '1314', '免费游玩', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  `roleDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ADMIN', '系统管理员');
INSERT INTO `role` VALUES ('2', 'USER', '用户');
INSERT INTO `role` VALUES ('3', 'King', '最高权限');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`) USING BTREE,
  KEY `r_id` (`roleId`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('2', '1');
INSERT INTO `role_permission` VALUES ('3', '1');
INSERT INTO `role_permission` VALUES ('4', '1');
INSERT INTO `role_permission` VALUES ('4', '2');
INSERT INTO `role_permission` VALUES ('1', '3');
INSERT INTO `role_permission` VALUES ('2', '3');
INSERT INTO `role_permission` VALUES ('3', '3');
INSERT INTO `role_permission` VALUES ('4', '3');
INSERT INTO `role_permission` VALUES ('5', '3');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(70) NOT NULL AUTO_INCREMENT,
  `visitTime` datetime DEFAULT NULL COMMENT '访问时间',
  `username` varchar(50) DEFAULT NULL COMMENT '操作者用户名',
  `ip` varchar(40) DEFAULT NULL COMMENT '访问ip',
  `url` varchar(40) DEFAULT NULL COMMENT '访问资源url',
  `executionTime` int(11) DEFAULT NULL COMMENT '执行时长',
  `method` varchar(255) DEFAULT NULL COMMENT '访问方法',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('260', '2020-10-09 22:10:47', 'root', '0:0:0:0:0:0:0:1', '/orders/deleteSysLog.do', '12', '[类名] com.orchid.ssm.controller.OrderController[方法名] deleteSysLog');
INSERT INTO `syslog` VALUES ('261', '2020-10-09 22:10:49', 'root', '0:0:0:0:0:0:0:1', '/user/deleteSysLog.do', '12', '[类名] com.orchid.ssm.controller.UserController[方法名] deleteSysLog');
INSERT INTO `syslog` VALUES ('262', '2020-10-09 22:11:05', 'root', '0:0:0:0:0:0:0:1', '/user/deleteSysLog.do', '81', '[类名] com.orchid.ssm.controller.UserController[方法名] deleteSysLog');
INSERT INTO `syslog` VALUES ('263', '2020-10-09 22:11:05', 'root', '0:0:0:0:0:0:0:1', '/user/deleteSysLog.do', '6', '[类名] com.orchid.ssm.controller.UserController[方法名] deleteSysLog');
INSERT INTO `syslog` VALUES ('264', '2020-10-09 22:26:49', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '8', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('265', '2020-10-09 22:26:55', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '9', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('266', '2020-10-09 22:26:58', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '9', '[类名] com.orchid.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('267', '2020-10-09 22:27:01', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '4', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('268', '2020-10-09 22:27:03', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '3', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('269', '2020-10-09 22:27:08', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '2', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('270', '2020-10-09 22:27:11', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '23', '[类名] com.orchid.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('271', '2020-10-10 08:05:22', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '10', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('272', '2020-10-10 08:05:25', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '7', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('273', '2020-10-10 08:05:40', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名] com.orchid.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('274', '2020-10-10 08:25:29', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '13', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('275', '2020-10-10 08:25:31', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '8', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('276', '2020-10-10 09:37:21', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '9', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('277', '2020-10-10 09:45:50', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '13', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('278', '2020-10-10 09:47:10', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '6', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('279', '2020-10-10 09:47:12', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '11', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('280', '2020-10-10 10:14:43', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '7', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('281', '2020-10-10 10:14:44', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '9', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('282', '2020-10-10 10:14:48', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('283', '2020-10-10 10:14:51', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('284', '2020-10-10 10:14:55', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '5', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('285', '2020-10-10 10:15:05', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('286', '2020-10-10 11:01:34', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '3', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('287', '2020-10-10 11:01:36', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '10', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('288', '2020-10-10 11:04:48', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '9', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('289', '2020-10-10 11:08:55', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '5', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('290', '2020-10-10 11:30:39', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '6', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('291', '2020-10-10 13:07:15', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '6', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('292', '2020-10-10 13:07:20', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '7', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('293', '2020-10-10 13:07:30', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '5', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('294', '2020-10-10 13:07:32', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '8', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('295', '2020-10-10 13:07:43', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '2', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('296', '2020-10-10 13:08:01', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '9', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('297', '2020-10-10 13:08:12', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '3', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('298', '2020-10-10 13:08:18', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '6', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('299', '2020-10-10 13:08:18', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '2', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('300', '2020-10-10 13:08:20', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '6', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('301', '2020-10-10 13:08:20', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '4', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('302', '2020-10-10 13:09:32', 'root', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] com.orchid.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('303', '2020-10-10 13:09:38', 'root', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] com.orchid.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('304', '2020-10-10 13:09:42', 'root', '0:0:0:0:0:0:0:1', '/role/findAll.do', '6', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('305', '2020-10-10 13:09:44', 'root', '0:0:0:0:0:0:0:1', '/product/findAll.do', '4', '[类名] com.orchid.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('306', '2020-10-10 13:09:49', 'root', '0:0:0:0:0:0:0:1', '/product/findAll.do', '4', '[类名] com.orchid.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('307', '2020-10-10 13:09:52', 'root', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '9', '[类名] com.orchid.ssm.controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('308', '2020-10-10 13:09:55', 'root', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('309', '2020-10-11 13:30:34', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '20', '[类名] com.orchid.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('310', '2020-10-11 13:30:35', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '27', '[类名] com.orchid.ssm.controller.PermissionController[方法名] findAll');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `sex` varchar(8) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL COMMENT '证件类型 0身份证 1护照 2军官证',
  `credentialsNum` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `travellerType` int(11) DEFAULT NULL COMMENT '旅客类型(人群) 0 成人 1 儿童',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('1', '小明', '男', '19999999999', '0', '131341234134132412', '0');
INSERT INTO `traveller` VALUES ('2', '小丽', '女', '12222222222', '0', '145320954823481134', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态0 未开启 1 开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '123@qq.com', 'admin', '$2a$10$z9XGFNYBS13Ex28Hdte6kuRCevPlSCROIENnsyeb0AAPvGXvkgUKW', '13888888888', '1');
INSERT INTO `users` VALUES ('2', '123@qq.com', 'user', '$2a$10$z9XGFNYBS13Ex28Hdte6kuRCevPlSCROIENnsyeb0AAPvGXvkgUKW', '14888888888', '1');
INSERT INTO `users` VALUES ('3', '123@qq.com', 'root', '$2a$10$z9XGFNYBS13Ex28Hdte6kuRCevPlSCROIENnsyeb0AAPvGXvkgUKW', '15888888888', '1');

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`) USING BTREE,
  KEY `roleId` (`roleId`) USING BTREE,
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('1', '1');
INSERT INTO `users_role` VALUES ('2', '2');
INSERT INTO `users_role` VALUES ('3', '3');
