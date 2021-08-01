/*
 Navicat Premium Data Transfer

 Source Server         : whh
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 02/08/2021 00:03:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `empId` int(0) NOT NULL AUTO_INCREMENT,
  `empName` varchar(2295) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(2295) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dId` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`empId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '白曜溥', 'F', 'yaopu@163.com', 1);
INSERT INTO `employee` VALUES (2, '柴高岩', 'M', 'gaoyan@163.com', 1);
INSERT INTO `employee` VALUES (3, '陈露', 'M', 'chenlu@163.com', 2);
INSERT INTO `employee` VALUES (4, '褚宸皓', 'M', 'chenhao@163.com', 1);
INSERT INTO `employee` VALUES (5, '冯金平', 'M', 'jinpin@163.com', 2);
INSERT INTO `employee` VALUES (6, '高奇泽', 'M', 'qize@163.com', 3);
INSERT INTO `employee` VALUES (7, '宫敏', 'M', 'gongmin@163.com', 4);
INSERT INTO `employee` VALUES (8, '郭旭', 'M', 'guoxu@163.com', 1);
INSERT INTO `employee` VALUES (9, '郝思远', 'M', 'siyuan@163.com', 2);
INSERT INTO `employee` VALUES (10, '呼晓辉', 'M', 'xiaohui@163.com', 3);
INSERT INTO `employee` VALUES (11, '家彦明', 'M', 'yanming@163.com', 4);
INSERT INTO `employee` VALUES (12, '焦晨帆', 'F', 'chenfan@163.com', 1);
INSERT INTO `employee` VALUES (16, '刘丹', 'F', 'liudan@163.com', 1);
INSERT INTO `employee` VALUES (17, '牛旭东', 'M', 'xudong@163.com', 2);
INSERT INTO `employee` VALUES (18, '牛泽鹏', 'M', 'zepeng@163.com', 3);
INSERT INTO `employee` VALUES (19, '裴怡博', 'M', 'yibo@163.com', 4);
INSERT INTO `employee` VALUES (20, '秦新宇', 'M', 'xinyu@163.com', 1);
INSERT INTO `employee` VALUES (21, '师伟', 'M', 'shiwei@163.com', 2);
INSERT INTO `employee` VALUES (22, '石宇飞', 'M', 'yufei@163.com', 3);
INSERT INTO `employee` VALUES (23, '孙亚龙', 'M', 'yalong@163.com', 4);
INSERT INTO `employee` VALUES (24, '王攀榕', 'F', 'panrong@163.com', 1);
INSERT INTO `employee` VALUES (25, '王洋', 'M', 'wangyang@163.com', 1);
INSERT INTO `employee` VALUES (26, '王振龙', 'M', 'zhenlong@163.com', 3);
INSERT INTO `employee` VALUES (27, '魏超群', 'M', 'chaoqun@163.com', 4);
INSERT INTO `employee` VALUES (28, '闫青', 'F', 'yanqing@163.com', 1);
INSERT INTO `employee` VALUES (29, '杨华', 'F', 'yanghua@163.com', 2);
INSERT INTO `employee` VALUES (30, '杨欢', 'F', 'yanghuan@163.com', 3);
INSERT INTO `employee` VALUES (33, '由国婧', 'F', 'guojing@163.com', 2);
INSERT INTO `employee` VALUES (43, '武柒', 'M', 'wuqi@163.com', 1);
INSERT INTO `employee` VALUES (59, '李八嘎', 'M', 'dhajk@163.com', 2);
INSERT INTO `employee` VALUES (60, '李七嘎', 'M', 'liqiga@163.com', 2);
INSERT INTO `employee` VALUES (61, '李六嘎', 'F', 'liliuga@163.com', 2);
INSERT INTO `employee` VALUES (62, '李五嘎', 'M', 'liwuga@163.com', 2);
INSERT INTO `employee` VALUES (63, '李四嘎', 'M', 'yaopu@163.com', 1);
INSERT INTO `employee` VALUES (64, '李三嘎', 'M', 'ahbda@qq.com', 2);
INSERT INTO `employee` VALUES (65, '张七嘎', 'M', 'zhangqiga@163.com', 1);
INSERT INTO `employee` VALUES (66, '张六嘎', 'F', 'zhanguga@163.com', 2);
INSERT INTO `employee` VALUES (67, '张五嘎', 'M', 'zhangwuga@163.com', 3);
INSERT INTO `employee` VALUES (68, '张四嘎', 'M', 'zhangsiga@163.com', 4);
INSERT INTO `employee` VALUES (69, '屁三嘎', 'M', 'pisanga@163.com', 1);
INSERT INTO `employee` VALUES (70, '李觉', 'F', 'lijiao@163.com', 2);

SET FOREIGN_KEY_CHECKS = 1;
