/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80017
Source Host           : 127.0.0.1:3306
Source Database       : onlineshop

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2021-06-10 22:08:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `aacount_unique` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` varchar(20) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '蝴蝶刀（★） | 多普勒 (崭新出厂)', '匕首', '3', '55555.00', '    蝴蝶刀（★） | 多普勒 (崭新出厂)', '/images/item/1-1.jpg');
INSERT INTO `item` VALUES ('2', '爪子刀（★） | 伽玛多普勒 (崭新出厂)', '匕首', '3', '27000.00', ' 爪子刀（★） | 伽玛多普勒 (崭新出厂)', '/images/item/1-2.jpg');
INSERT INTO `item` VALUES ('3', 'AK-47 | 野荷 (崭新出厂)', '枪皮', '6', '20000.00', 'AK-47 | 野荷 (崭新出厂)', '/images/item/1-3.jpg');
INSERT INTO `item` VALUES ('4', '爱娃特工 | 联邦调查局（FBI）', '探员', '1', '5559.00', '爱娃特工 | 联邦调查局（FBI）', '/images/item/1-4.jpg');
INSERT INTO `item` VALUES ('5', 'AWP | 巨龙传说 (崭新出厂)', '枪皮', '8', '2000000.00', 'AWP | 巨龙传说 (崭新出厂) ', '/images/item/1-5.jpg');
INSERT INTO `item` VALUES ('6', 'M4A4|喧嚣杀戮（略有磨损）', '枪皮', '5', '20000.00', 'M4A4|喧嚣杀戮（略有磨损）', '/images/item/1-6.jpg');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_total` decimal(10,2) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_user_auth_1` (`user_id`),
  CONSTRAINT `fk_order_user_auth_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('4', '1', '1299.00', '2021-06-10 18:35:29.033000');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`order_id`,`item_id`),
  KEY `fk_order_detail_item_1` (`item_id`),
  CONSTRAINT `fk_order_detail_item_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_detail_order_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('4', '2', '1');
INSERT INTO `order_detail` VALUES ('4', '3', '1');

-- ----------------------------
-- Table structure for shoppingcart_item
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart_item`;
CREATE TABLE `shoppingcart_item` (
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`item_id`),
  KEY `fk_shoppingcart_item_1` (`item_id`),
  CONSTRAINT `fk_shoppingcart_item_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_shoppingcart_user_auth_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcart_item
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `account_unique` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'joker', 'joker123456', '18108620225', '704853783@qq.com');
INSERT INTO `user` VALUES ('2', 'abcabc', 'abc123456', '18108820325', '372789833@qq.com');
