/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : renren_security

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-04-24 14:08:05
*/
USE unload;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000169B5BA05487874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'SkyzcWorkstation1556084040258', '1556086082392', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1556087400000', '1556085600000', '5', 'WAITING', 'CRON', '1553532175000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000169B5BA05487874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'renren', '0 0/30 * * * ?', '0', '参数测试', '2019-03-26 00:41:01');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'renren', '0', null, '2', '2019-03-26 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'renren', '0', null, '0', '2019-03-26 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'renren', '0', null, '0', '2019-03-26 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('26', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('28', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'testTask', 'renren', '0', null, '2', '2019-03-26 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('30', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'testTask', 'renren', '0', null, '2', '2019-03-26 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('32', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('33', '1', 'testTask', 'renren', '0', null, '2', '2019-03-26 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('34', '1', 'testTask', 'renren', '0', null, '2', '2019-03-26 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('35', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('36', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('38', '1', 'testTask', 'renren', '0', null, '0', '2019-03-26 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('40', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('42', '1', 'testTask', 'renren', '0', null, '1', '2019-03-26 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('43', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('44', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('45', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('47', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('49', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('51', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'testTask', 'renren', '0', null, '0', '2019-03-27 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('53', '1', 'testTask', 'renren', '0', null, '2', '2019-03-27 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('54', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('55', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('56', '1', 'testTask', 'renren', '0', null, '0', '2019-03-27 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('57', '1', 'testTask', 'renren', '0', null, '0', '2019-03-27 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'testTask', 'renren', '0', null, '0', '2019-03-27 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('59', '1', 'testTask', 'renren', '0', null, '0', '2019-03-27 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('61', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('63', '1', 'testTask', 'renren', '0', null, '0', '2019-03-27 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'testTask', 'renren', '0', null, '0', '2019-03-27 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('65', '1', 'testTask', 'renren', '0', null, '1', '2019-03-27 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('66', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('67', '1', 'testTask', 'renren', '0', null, '0', '2019-03-29 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('68', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('70', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('71', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('72', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('73', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('74', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('75', '1', 'testTask', 'renren', '0', null, '0', '2019-03-29 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('76', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('77', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('78', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('79', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('80', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('81', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('82', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('83', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('84', '1', 'testTask', 'renren', '0', null, '0', '2019-03-29 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('85', '1', 'testTask', 'renren', '0', null, '2', '2019-03-29 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('86', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('87', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('88', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('89', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('90', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('91', '1', 'testTask', 'renren', '0', null, '2', '2019-03-29 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('92', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('93', '1', 'testTask', 'renren', '0', null, '2', '2019-03-29 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('94', '1', 'testTask', 'renren', '0', null, '1', '2019-03-29 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('95', '1', 'testTask', 'renren', '0', null, '1', '2019-03-30 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('96', '1', 'testTask', 'renren', '0', null, '2', '2019-03-30 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('97', '1', 'testTask', 'renren', '0', null, '1', '2019-03-30 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('98', '1', 'testTask', 'renren', '0', null, '1', '2019-03-30 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('99', '1', 'testTask', 'renren', '0', null, '1', '2019-03-30 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('100', '1', 'testTask', 'renren', '0', null, '1', '2019-03-30 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('101', '1', 'testTask', 'renren', '0', null, '1', '2019-03-30 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('102', '1', 'testTask', 'renren', '0', null, '1', '2019-03-30 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('103', '1', 'testTask', 'renren', '0', null, '1', '2019-03-30 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('104', '1', 'testTask', 'renren', '0', null, '1', '2019-03-30 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('105', '1', 'testTask', 'renren', '0', null, '1', '2019-03-30 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('106', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('107', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('108', '1', 'testTask', 'renren', '0', null, '0', '2019-03-31 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('109', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('110', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('111', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('112', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('113', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('114', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('115', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('116', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('117', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('118', '1', 'testTask', 'renren', '0', null, '2', '2019-03-31 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('119', '1', 'testTask', 'renren', '0', null, '0', '2019-03-31 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('120', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('121', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('122', '1', 'testTask', 'renren', '0', null, '0', '2019-03-31 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('123', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('124', '1', 'testTask', 'renren', '0', null, '1', '2019-03-31 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('125', '1', 'testTask', 'renren', '0', null, '1', '2019-04-03 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('126', '1', 'testTask', 'renren', '0', null, '1', '2019-04-03 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('127', '1', 'testTask', 'renren', '0', null, '1', '2019-04-03 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('128', '1', 'testTask', 'renren', '0', null, '1', '2019-04-03 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('129', '1', 'testTask', 'renren', '0', null, '1', '2019-04-03 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('130', '1', 'testTask', 'renren', '0', null, '1', '2019-04-03 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('131', '1', 'testTask', 'renren', '0', null, '1', '2019-04-03 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('132', '1', 'testTask', 'renren', '0', null, '1', '2019-04-03 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('133', '1', 'testTask', 'renren', '0', null, '2', '2019-04-03 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('134', '1', 'testTask', 'renren', '0', null, '1', '2019-04-03 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('135', '1', 'testTask', 'renren', '0', null, '1', '2019-04-03 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('136', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('137', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('138', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('139', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('140', '1', 'testTask', 'renren', '0', null, '2', '2019-04-04 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('141', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('142', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('143', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('144', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('145', '1', 'testTask', 'renren', '0', null, '2', '2019-04-04 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('146', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('147', '1', 'testTask', 'renren', '0', null, '2', '2019-04-04 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('148', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('149', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('150', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('151', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('152', '1', 'testTask', 'renren', '0', null, '1', '2019-04-04 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('153', '1', 'testTask', 'renren', '0', null, '0', '2019-04-10 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('154', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('155', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('156', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('157', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('158', '1', 'testTask', 'renren', '0', null, '0', '2019-04-10 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('159', '1', 'testTask', 'renren', '0', null, '2', '2019-04-10 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('160', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('161', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('162', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('163', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('164', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('165', '1', 'testTask', 'renren', '0', null, '0', '2019-04-10 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('166', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('167', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('168', '1', 'testTask', 'renren', '0', null, '2', '2019-04-10 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('169', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('170', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('171', '1', 'testTask', 'renren', '0', null, '1', '2019-04-10 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('172', '1', 'testTask', 'renren', '0', null, '0', '2019-04-10 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('173', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('174', '1', 'testTask', 'renren', '0', null, '2', '2019-04-15 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('175', '1', 'testTask', 'renren', '0', null, '2', '2019-04-15 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('176', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('177', '1', 'testTask', 'renren', '0', null, '0', '2019-04-15 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('178', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('179', '1', 'testTask', 'renren', '0', null, '2', '2019-04-15 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('180', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('181', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('182', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('183', '1', 'testTask', 'renren', '0', null, '2', '2019-04-15 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('184', '1', 'testTask', 'renren', '0', null, '3', '2019-04-15 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('185', '1', 'testTask', 'renren', '0', null, '2', '2019-04-15 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('186', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('187', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('188', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('189', '1', 'testTask', 'renren', '0', null, '0', '2019-04-15 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('190', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('191', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('192', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('193', '1', 'testTask', 'renren', '0', null, '2', '2019-04-15 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('194', '1', 'testTask', 'renren', '0', null, '2', '2019-04-15 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('195', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('196', '1', 'testTask', 'renren', '0', null, '2', '2019-04-15 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('197', '1', 'testTask', 'renren', '0', null, '2', '2019-04-15 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('198', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('199', '1', 'testTask', 'renren', '0', null, '2', '2019-04-15 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('200', '1', 'testTask', 'renren', '0', null, '1', '2019-04-15 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('201', '1', 'testTask', 'renren', '0', null, '12', '2019-04-16 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('202', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('203', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('204', '1', 'testTask', 'renren', '0', null, '0', '2019-04-16 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('205', '1', 'testTask', 'renren', '0', null, '2', '2019-04-16 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('206', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('207', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('208', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('209', '1', 'testTask', 'renren', '0', null, '2', '2019-04-16 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('210', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('211', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('212', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('213', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('214', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('215', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('216', '1', 'testTask', 'renren', '0', null, '2', '2019-04-16 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('217', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('218', '1', 'testTask', 'renren', '0', null, '0', '2019-04-16 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('219', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('220', '1', 'testTask', 'renren', '0', null, '0', '2019-04-16 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('221', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('222', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('223', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('224', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('225', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('226', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('227', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('228', '1', 'testTask', 'renren', '0', null, '2', '2019-04-16 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('229', '1', 'testTask', 'renren', '0', null, '2', '2019-04-16 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('230', '1', 'testTask', 'renren', '0', null, '0', '2019-04-16 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('231', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('232', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('233', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('234', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('235', '1', 'testTask', 'renren', '0', null, '2', '2019-04-16 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('236', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('237', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('238', '1', 'testTask', 'renren', '0', null, '0', '2019-04-16 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('239', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('240', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('241', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('242', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('243', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('244', '1', 'testTask', 'renren', '0', null, '2', '2019-04-16 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('245', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('246', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('247', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('248', '1', 'testTask', 'renren', '0', null, '1', '2019-04-16 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('249', '1', 'testTask', 'renren', '0', null, '7', '2019-04-17 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('250', '1', 'testTask', 'renren', '0', null, '2', '2019-04-17 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('251', '1', 'testTask', 'renren', '0', null, '2', '2019-04-17 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('252', '1', 'testTask', 'renren', '0', null, '0', '2019-04-17 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('253', '1', 'testTask', 'renren', '0', null, '0', '2019-04-17 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('254', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('255', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('256', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('257', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('258', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('259', '1', 'testTask', 'renren', '0', null, '2', '2019-04-18 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('260', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('261', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('262', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('263', '1', 'testTask', 'renren', '0', null, '0', '2019-04-18 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('264', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('265', '1', 'testTask', 'renren', '0', null, '4', '2019-04-18 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('266', '1', 'testTask', 'renren', '0', null, '0', '2019-04-18 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('267', '1', 'testTask', 'renren', '0', null, '0', '2019-04-18 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('268', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('269', '1', 'testTask', 'renren', '0', null, '2', '2019-04-18 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('270', '1', 'testTask', 'renren', '0', null, '0', '2019-04-18 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('271', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('272', '1', 'testTask', 'renren', '0', null, '2', '2019-04-18 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('273', '1', 'testTask', 'renren', '0', null, '2', '2019-04-18 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('274', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('275', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('276', '1', 'testTask', 'renren', '0', null, '1', '2019-04-18 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('277', '1', 'testTask', 'renren', '0', null, '2', '2019-04-18 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('278', '1', 'testTask', 'renren', '0', null, '3', '2019-04-18 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('279', '1', 'testTask', 'renren', '0', null, '2', '2019-04-18 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('280', '1', 'testTask', 'renren', '0', null, '51', '2019-04-19 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('281', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('282', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('283', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('284', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('285', '1', 'testTask', 'renren', '0', null, '2', '2019-04-19 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('286', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('287', '1', 'testTask', 'renren', '0', null, '0', '2019-04-19 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('288', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('289', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('290', '1', 'testTask', 'renren', '0', null, '0', '2019-04-19 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('291', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('292', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('293', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('294', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('295', '1', 'testTask', 'renren', '0', null, '0', '2019-04-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('296', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('297', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('298', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('299', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('300', '1', 'testTask', 'renren', '0', null, '0', '2019-04-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('301', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('302', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('303', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('304', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('305', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('306', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('307', '1', 'testTask', 'renren', '0', null, '2', '2019-04-19 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('308', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('309', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('310', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('311', '1', 'testTask', 'renren', '0', null, '1', '2019-04-19 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('312', '1', 'testTask', 'renren', '0', null, '0', '2019-04-19 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('313', '1', 'testTask', 'renren', '0', null, '29', '2019-04-20 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('314', '1', 'testTask', 'renren', '0', null, '2', '2019-04-20 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('315', '1', 'testTask', 'renren', '0', null, '3', '2019-04-20 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('316', '1', 'testTask', 'renren', '0', null, '1', '2019-04-20 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('317', '1', 'testTask', 'renren', '0', null, '1', '2019-04-20 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('318', '1', 'testTask', 'renren', '0', null, '1', '2019-04-20 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('319', '1', 'testTask', 'renren', '0', null, '1', '2019-04-20 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('320', '1', 'testTask', 'renren', '0', null, '0', '2019-04-21 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('321', '1', 'testTask', 'renren', '0', null, '2', '2019-04-21 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('322', '1', 'testTask', 'renren', '0', null, '1', '2019-04-21 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('323', '1', 'testTask', 'renren', '0', null, '1', '2019-04-21 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('324', '1', 'testTask', 'renren', '0', null, '1', '2019-04-21 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('325', '1', 'testTask', 'renren', '0', null, '1', '2019-04-21 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('326', '1', 'testTask', 'renren', '0', null, '2', '2019-04-21 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('327', '1', 'testTask', 'renren', '0', null, '0', '2019-04-21 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('328', '1', 'testTask', 'renren', '0', null, '1', '2019-04-21 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('329', '1', 'testTask', 'renren', '0', null, '1', '2019-04-21 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('330', '1', 'testTask', 'renren', '0', null, '1', '2019-04-21 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('331', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('332', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('333', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('334', '1', 'testTask', 'renren', '0', null, '2', '2019-04-22 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('335', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('336', '1', 'testTask', 'renren', '0', null, '2', '2019-04-22 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('337', '1', 'testTask', 'renren', '0', null, '2', '2019-04-22 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('338', '1', 'testTask', 'renren', '0', null, '2', '2019-04-22 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('339', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('340', '1', 'testTask', 'renren', '0', null, '2', '2019-04-22 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('341', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('342', '1', 'testTask', 'renren', '0', null, '0', '2019-04-22 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('343', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('344', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('345', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('346', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('347', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('348', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('349', '1', 'testTask', 'renren', '0', null, '2', '2019-04-22 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('350', '1', 'testTask', 'renren', '0', null, '0', '2019-04-22 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('351', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('352', '1', 'testTask', 'renren', '0', null, '0', '2019-04-22 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('353', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('354', '1', 'testTask', 'renren', '0', null, '2', '2019-04-22 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('355', '1', 'testTask', 'renren', '0', null, '3', '2019-04-22 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('356', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('357', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('358', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('359', '1', 'testTask', 'renren', '0', null, '1', '2019-04-22 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('360', '1', 'testTask', 'renren', '0', null, '6', '2019-04-23 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('361', '1', 'testTask', 'renren', '0', null, '6', '2019-04-23 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('362', '1', 'testTask', 'renren', '0', null, '0', '2019-04-23 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('363', '1', 'testTask', 'renren', '0', null, '0', '2019-04-23 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('364', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('365', '1', 'testTask', 'renren', '0', null, '0', '2019-04-23 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('366', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('367', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('368', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('369', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('370', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('371', '1', 'testTask', 'renren', '0', null, '5', '2019-04-23 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('372', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('373', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('374', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('375', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('376', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('377', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('378', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('379', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('380', '1', 'testTask', 'renren', '0', null, '0', '2019-04-23 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('381', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('382', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('383', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('384', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('385', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('386', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('387', '1', 'testTask', 'renren', '0', null, '2', '2019-04-23 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('388', '1', 'testTask', 'renren', '0', null, '1', '2019-04-23 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('389', '1', 'testTask', 'renren', '0', null, '5', '2019-04-24 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('390', '1', 'testTask', 'renren', '0', null, '2', '2019-04-24 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('391', '1', 'testTask', 'renren', '0', null, '0', '2019-04-24 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('392', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('393', '1', 'testTask', 'renren', '0', null, '0', '2019-04-24 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('394', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('395', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('396', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('397', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('398', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('399', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('400', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('401', '1', 'testTask', 'renren', '0', null, '0', '2019-04-24 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('402', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('403', '1', 'testTask', 'renren', '0', null, '0', '2019-04-24 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('404', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('405', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('406', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('407', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('408', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('409', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('410', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('411', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('412', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('413', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('414', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('415', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('416', '1', 'testTask', 'renren', '0', null, '1', '2019-04-24 14:00:00');

-- ----------------------------
-- Table structure for sys_book
-- ----------------------------
DROP TABLE IF EXISTS `sys_book`;
CREATE TABLE `sys_book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `author` varchar(45) COLLATE utf8_bin NOT NULL,
  `remark` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_book
-- ----------------------------
INSERT INTO `sys_book` VALUES ('1', 'java', 'java', null, null, '200', '999');
INSERT INTO `sys_book` VALUES ('2', '123', '123', null, null, '123', null);
INSERT INTO `sys_book` VALUES ('3', 'java', '123', null, null, '123', null);
INSERT INTO `sys_book` VALUES ('4', '哈啊哈哈', 'java', null, null, '123', null);

-- ----------------------------
-- Table structure for sys_class
-- ----------------------------
DROP TABLE IF EXISTS `sys_class`;
CREATE TABLE `sys_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_class
-- ----------------------------
INSERT INTO `sys_class` VALUES ('1', '软件工程系');
INSERT INTO `sys_class` VALUES ('2', '数字传媒系');

-- ----------------------------
-- Table structure for sys_class_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_class_copy`;
CREATE TABLE `sys_class_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_class_copy
-- ----------------------------
INSERT INTO `sys_class_copy` VALUES ('1', '软件工程系');

-- ----------------------------
-- Table structure for sys_class_copy1
-- ----------------------------
DROP TABLE IF EXISTS `sys_class_copy1`;
CREATE TABLE `sys_class_copy1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_class_copy1
-- ----------------------------
INSERT INTO `sys_class_copy1` VALUES ('1', '软件工程系');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '排污许可申报系统集团', '0', '0');
INSERT INTO `sys_dept` VALUES ('2', '1', '长沙分公司', '1', '0');
INSERT INTO `sys_dept` VALUES ('3', '1', '上海分公司', '2', '0');
INSERT INTO `sys_dept` VALUES ('4', '3', '技术部', '0', '0');
INSERT INTO `sys_dept` VALUES ('5', '3', '销售部', '1', '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '性别', 'sex', '0', '女', '0', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '性别', 'sex', '1', '男', '1', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '性别', 'sex', '2', '未知', '3', null, '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '51', '1', '0:0:0:0:0:0:0:1', '2019-03-30 13:20:24');
INSERT INTO `sys_log` VALUES ('2', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '47', '17', '0:0:0:0:0:0:0:1', '2019-03-30 13:31:57');
INSERT INTO `sys_log` VALUES ('3', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '50', '6', '0:0:0:0:0:0:0:1', '2019-03-30 13:32:15');
INSERT INTO `sys_log` VALUES ('4', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '49', '4', '0:0:0:0:0:0:0:1', '2019-03-30 13:32:31');
INSERT INTO `sys_log` VALUES ('5', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '48', '11', '0:0:0:0:0:0:0:1', '2019-03-30 13:32:54');
INSERT INTO `sys_log` VALUES ('6', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '46', '11', '0:0:0:0:0:0:0:1', '2019-03-30 13:33:12');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":51,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"图书管理\",\"url\":\"modules/sys/book.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '5', '0:0:0:0:0:0:0:1', '2019-03-30 13:34:02');
INSERT INTO `sys_log` VALUES ('8', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":56,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"图书管理\",\"url\":\"sys/book/list\",\"perms\":\"sys:book:list\",\"type\":1,\"orderNum\":0}', '6', '0:0:0:0:0:0:0:1', '2019-03-30 15:48:58');
INSERT INTO `sys_log` VALUES ('9', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '56', '10', '0:0:0:0:0:0:0:1', '2019-03-31 02:27:44');
INSERT INTO `sys_log` VALUES ('10', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '55', '6', '0:0:0:0:0:0:0:1', '2019-03-31 02:27:56');
INSERT INTO `sys_log` VALUES ('11', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '61', '4', '0:0:0:0:0:0:0:1', '2019-03-31 02:28:05');
INSERT INTO `sys_log` VALUES ('12', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '60', '11', '0:0:0:0:0:0:0:1', '2019-03-31 02:28:14');
INSERT INTO `sys_log` VALUES ('13', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '59', '4', '0:0:0:0:0:0:0:1', '2019-03-31 02:28:20');
INSERT INTO `sys_log` VALUES ('14', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '58', '11', '0:0:0:0:0:0:0:1', '2019-03-31 02:28:28');
INSERT INTO `sys_log` VALUES ('15', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '57', '6', '0:0:0:0:0:0:0:1', '2019-03-31 02:28:34');
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":62,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"学生管理\",\"url\":\"modules/sys/sysstudent.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '5', '0:0:0:0:0:0:0:1', '2019-03-31 02:35:02');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":67,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"企业生产 信息\",\"type\":0,\"icon\":\"fa-cogs\",\"orderNum\":1}', '56', '0:0:0:0:0:0:0:1', '2019-04-15 17:33:33');
INSERT INTO `sys_log` VALUES ('18', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":67,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"企业生产 信息\",\"type\":0,\"icon\":\"fa fa-cogs\",\"orderNum\":1}', '8', '0:0:0:0:0:0:0:1', '2019-04-15 17:33:49');
INSERT INTO `sys_log` VALUES ('19', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":67,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"企业生产 信息\",\"type\":0,\"icon\":\"fa fa-cubes\",\"orderNum\":1}', '3', '0:0:0:0:0:0:0:1', '2019-04-15 17:34:22');
INSERT INTO `sys_log` VALUES ('20', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":67,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"企业生产信息\",\"type\":0,\"icon\":\"fa fa-cubes\",\"orderNum\":1}', '9', '0:0:0:0:0:0:0:1', '2019-04-15 17:37:45');
INSERT INTO `sys_log` VALUES ('21', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":68,\"parentId\":67,\"parentName\":\"企业生产信息\",\"name\":\"主要产品及产能信息表\",\"url\":\"modules/produce/produce.html\",\"type\":1,\"icon\":\"fa  fa-cubes\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2019-04-15 18:06:52');
INSERT INTO `sys_log` VALUES ('22', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":68,\"parentId\":67,\"parentName\":\"企业生产信息\",\"name\":\"主要产品及产能信息表\",\"url\":\"modules/produce/produce.html\",\"type\":1,\"icon\":\"fa  fa-cubes\",\"orderNum\":6}', '3', '0:0:0:0:0:0:0:1', '2019-04-15 18:07:15');
INSERT INTO `sys_log` VALUES ('23', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":84,\"parentId\":67,\"parentName\":\"企业生产信息\",\"name\":\"主要产品及产能信息表\",\"url\":\"modules/produce/capacity.html\",\"type\":1,\"icon\":\"fa fa-database\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2019-04-16 01:04:32');
INSERT INTO `sys_log` VALUES ('24', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":94,\"parentId\":67,\"parentName\":\"企业生产信息\",\"name\":\"主要燃料信息表\",\"url\":\"modules/produce/fuel.html\",\"type\":1,\"icon\":\"fa fa-free-code-camp\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2019-04-16 01:05:14');
INSERT INTO `sys_log` VALUES ('25', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":104,\"parentId\":67,\"parentName\":\"企业生产信息\",\"name\":\"废水类别、污染物及污染治理设施信息表\",\"url\":\"modules/produce/waste_water.html\",\"type\":1,\"icon\":\"fa fa-tint\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2019-04-16 01:06:53');
INSERT INTO `sys_log` VALUES ('26', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":94,\"parentId\":67,\"parentName\":\"企业生产信息\",\"name\":\"主要燃料信息表\",\"url\":\"modules/produce/fuel.html\",\"type\":1,\"icon\":\"fa fa-fire\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2019-04-16 01:08:17');
INSERT INTO `sys_log` VALUES ('27', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":99,\"parentId\":67,\"parentName\":\"企业生产信息\",\"name\":\"废气产排污环节、污染物及污染治理设施信息表\",\"url\":\"modules/produce/waste_gas.html\",\"type\":1,\"icon\":\"fa Gas\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2019-04-16 01:09:14');
INSERT INTO `sys_log` VALUES ('28', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":99,\"parentId\":67,\"parentName\":\"企业生产信息\",\"name\":\"废气产排污环节、污染物及污染治理设施信息表\",\"url\":\"modules/produce/waste_gas.html\",\"type\":1,\"icon\":\"fa fa-shower\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2019-04-16 01:09:26');
INSERT INTO `sys_log` VALUES ('29', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":89,\"parentId\":67,\"parentName\":\"企业生产信息\",\"name\":\"主要原料及辅料信息表\",\"url\":\"modules/produce/material.html\",\"type\":1,\"icon\":\"fa fa-shower\",\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2019-04-16 01:10:06');
INSERT INTO `sys_log` VALUES ('30', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":89,\"parentId\":67,\"parentName\":\"企业生产信息\",\"name\":\"主要原料及辅料信息表\",\"url\":\"modules/produce/material.html\",\"type\":1,\"icon\":\"fa fa-linode\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2019-04-16 01:10:31');
INSERT INTO `sys_log` VALUES ('31', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":99,\"parentId\":67,\"parentName\":\"企业生产信息\",\"name\":\"废气产排污环节、污染物\\\\n及污染治理设施信息\",\"url\":\"modules/produce/waste_gas.html\",\"type\":1,\"icon\":\"fa fa-shower\",\"orderNum\":0}', '15', '0:0:0:0:0:0:0:1', '2019-04-16 14:22:05');
INSERT INTO `sys_log` VALUES ('32', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":99,\"parentId\":67,\"parentName\":\"企业生产信息\",\"name\":\"废气产排污环节、污染物及污染治理设施信息\",\"url\":\"modules/produce/waste_gas.html\",\"type\":1,\"icon\":\"fa fa-shower\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2019-04-16 14:22:40');
INSERT INTO `sys_log` VALUES ('33', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":109,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"企业排污信息\",\"type\":0,\"icon\":\"fa fa-certificate\",\"orderNum\":0}', '15', '0:0:0:0:0:0:0:1', '2019-04-19 15:25:31');
INSERT INTO `sys_log` VALUES ('34', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":110,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"排污许可信息\",\"type\":0,\"icon\":\"fa  fa-address-card-o\",\"orderNum\":0}', '10', '0:0:0:0:0:0:0:1', '2019-04-19 15:27:39');
INSERT INTO `sys_log` VALUES ('35', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":109,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"企业排污信息\",\"type\":0,\"icon\":\"fa fa-certificate\",\"orderNum\":2}', '17', '0:0:0:0:0:0:0:1', '2019-04-19 15:28:09');
INSERT INTO `sys_log` VALUES ('36', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":110,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"排污许可信息\",\"type\":0,\"icon\":\"fa  fa-address-card-o\",\"orderNum\":3}', '2', '0:0:0:0:0:0:0:1', '2019-04-19 15:28:18');
INSERT INTO `sys_log` VALUES ('37', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":186,\"parentId\":110,\"parentName\":\"排污许可信息\",\"name\":\"水污染物排放月度许可排放量信息表\",\"url\":\"modules/permit/swrwpfydxk.html\",\"type\":1,\"orderNum\":9}', '6', '0:0:0:0:0:0:0:1', '2019-04-22 15:05:18');
INSERT INTO `sys_log` VALUES ('38', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":187,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"排污许可证\",\"type\":0,\"icon\":\"fa fa-id-card-o\",\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2019-04-23 11:33:08');
INSERT INTO `sys_log` VALUES ('39', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"系统管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":1}', '14', '0:0:0:0:0:0:0:1', '2019-04-23 11:33:30');
INSERT INTO `sys_log` VALUES ('40', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"系统管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":3}', '9', '0:0:0:0:0:0:0:1', '2019-04-23 11:34:12');
INSERT INTO `sys_log` VALUES ('41', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"系统管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":4}', '14', '0:0:0:0:0:0:0:1', '2019-04-23 14:59:49');
INSERT INTO `sys_log` VALUES ('42', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '62', '1', '0:0:0:0:0:0:0:1', '2019-04-24 10:54:45');
INSERT INTO `sys_log` VALUES ('43', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":198,\"parentId\":187,\"parentName\":\"排污许可证\",\"name\":\"管理申请表\",\"url\":\"modules/licence/basicinfo.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '8', '0:0:0:0:0:0:0:1', '2019-04-24 12:51:55');
INSERT INTO `sys_log` VALUES ('44', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '198', '1', '0:0:0:0:0:0:0:1', '2019-04-24 13:00:24');
INSERT INTO `sys_log` VALUES ('45', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '199', '12', '0:0:0:0:0:0:0:1', '2019-04-24 13:00:30');
INSERT INTO `sys_log` VALUES ('46', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '202', '6', '0:0:0:0:0:0:0:1', '2019-04-24 13:00:39');
INSERT INTO `sys_log` VALUES ('47', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '201', '4', '0:0:0:0:0:0:0:1', '2019-04-24 13:00:45');
INSERT INTO `sys_log` VALUES ('48', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '200', '11', '0:0:0:0:0:0:0:1', '2019-04-24 13:00:51');
INSERT INTO `sys_log` VALUES ('49', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '198', '10', '0:0:0:0:0:0:0:1', '2019-04-24 13:00:55');
INSERT INTO `sys_log` VALUES ('50', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":203,\"parentId\":187,\"parentName\":\"排污许可证\",\"name\":\"申请表信息\",\"url\":\"modules/licence/basicinfo.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '8', '0:0:0:0:0:0:0:1', '2019-04-24 13:03:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '4');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员管理', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('31', '1', '部门管理', 'modules/sys/dept.html', null, '1', 'fa fa-file-code-o', '1');
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'sys:dept:save,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'sys:dept:update,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'sys:dept:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '1', '字典管理', 'modules/sys/dict.html', null, '1', 'fa fa-bookmark-o', '6');
INSERT INTO `sys_menu` VALUES ('37', '36', '查看', null, 'sys:dict:list,sys:dict:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('38', '36', '新增', null, 'sys:dict:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('39', '36', '修改', null, 'sys:dict:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('40', '36', '删除', null, 'sys:dict:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('41', '1', '商品管理', 'modules/sys/goods.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('42', '41', '查看', null, 'sys:goods:list,sys:goods:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('43', '41', '新增', null, 'sys:goods:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('44', '41', '修改', null, 'sys:goods:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('45', '41', '删除', null, 'sys:goods:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('51', '1', '图书管理', 'modules/sys/book.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('52', '51', '查看', null, 'sys:book:list,sys:book:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('53', '51', '新增', null, 'sys:book:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('54', '51', '修改', null, 'sys:book:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('67', '0', '企业生产信息', null, null, '0', 'fa fa-cubes', '1');
INSERT INTO `sys_menu` VALUES ('84', '67', '主要产品及产能信息', 'modules/produce/capacity.html', null, '1', 'fa fa-database', '0');
INSERT INTO `sys_menu` VALUES ('85', '84', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('86', '84', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('87', '84', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('88', '84', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('89', '67', '主要原料及辅料信息', 'modules/produce/material.html', null, '1', 'fa fa-linode', '0');
INSERT INTO `sys_menu` VALUES ('90', '89', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('91', '89', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('92', '89', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('93', '89', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('94', '67', '主要燃料信息', 'modules/produce/fuel.html', null, '1', 'fa fa-fire', '0');
INSERT INTO `sys_menu` VALUES ('95', '94', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('96', '94', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('97', '94', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('98', '94', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('99', '67', '废气产排污环节、污染物及污染治理设施信息', 'modules/produce/waste_gas.html', null, '1', 'fa fa-shower', '0');
INSERT INTO `sys_menu` VALUES ('100', '99', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('101', '99', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('102', '99', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('103', '99', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('104', '67', '废水类别、污染物及污染治理设施信息', 'modules/produce/waste_water.html', null, '1', 'fa fa-tint', '0');
INSERT INTO `sys_menu` VALUES ('105', '104', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('106', '104', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('107', '104', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('108', '104', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('109', '0', '企业排污信息', null, null, '0', 'fa fa-certificate', '2');
INSERT INTO `sys_menu` VALUES ('110', '0', '排污许可信息', null, null, '0', 'fa  fa-address-card-o', '3');
INSERT INTO `sys_menu` VALUES ('111', '109', '大气排放口基本情况', 'modules/pollutant/atmosphere.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('112', '111', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('113', '111', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('114', '111', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('115', '111', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('116', '109', '废气污染物排放执行标准表', 'modules/pollutant/wastegas.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('117', '116', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('118', '116', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('119', '116', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('120', '116', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('121', '109', '废水直接排放口基本情况', 'modules/pollutant/wastewater_direct.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('122', '121', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('123', '121', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('124', '121', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('125', '121', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('126', '109', '废水间接排放口基本情况', 'modules/pollutant/wastewater_indirect.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('127', '126', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('128', '126', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('129', '126', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('130', '126', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('131', '109', '废水污染物排放执行标准表', 'modules/pollutant/manage.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('132', '131', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('133', '131', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('134', '131', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('135', '131', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('136', '110', '大气污染物有组织排放信息表（主要排放口）', 'modules/permit/dqwrw.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('137', '136', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('138', '136', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('139', '136', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('140', '136', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('141', '110', '大气污染物有组织排放信息表（一般排放口）', 'modules/permit/dqwrws.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('142', '141', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('143', '141', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('144', '141', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('145', '141', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('146', '110', '大气污染物有组织排放信息表（全厂有组织排放总计）', 'modules/permit/dqwrwqc.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('147', '146', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('148', '146', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('149', '146', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('150', '146', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('151', '110', '大气污染物无组织排放信息表', 'modules/permit/dqwrwwzz.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('152', '151', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('153', '151', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('154', '151', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('155', '151', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('156', '110', '大气排放总许可量信息表', 'modules/permit/dqpfzxkl.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('157', '156', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('158', '156', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('159', '156', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('160', '156', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('161', '110', '大气排放月度许可量信息表', 'modules/permit/dqpfydxkl.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('162', '161', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('163', '161', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('164', '161', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('165', '161', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('166', '110', '水污染物排放信息表（主要排放口）', 'modules/permit/swrwpf.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('167', '166', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('168', '166', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('169', '166', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('170', '166', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('171', '110', '水污染物排放信息表（一般排放口）', 'modules/permit/swrwpfs.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('172', '171', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('173', '171', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('174', '171', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('175', '171', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('176', '110', '水污染物排放信息表（全厂排放口总计）', 'modules/permit/swrwpfqc.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('177', '176', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('178', '176', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('179', '176', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('180', '176', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('182', '186', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('183', '186', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('184', '186', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('185', '186', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('186', '110', '水污染物排放月度许可排放量信息表', 'modules/permit/swrwpfydxk.html', null, '1', null, '9');
INSERT INTO `sys_menu` VALUES ('187', '0', '排污许可证', null, null, '0', 'fa fa-id-card-o', '0');
INSERT INTO `sys_menu` VALUES ('188', '187', '创建申请表', 'modules/licence/found.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('189', '188', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('190', '188', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('191', '188', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('192', '188', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('193', '187', '管理申请表', 'modules/licence/manage.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('194', '193', '查看', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('195', '193', '新增', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('196', '193', '修改', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('197', '193', '删除', null, '', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('203', '187', '申请表信息', 'modules/licence/basicinfo.html', null, '1', 'fa fa-file-code-o', '0');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_student
-- ----------------------------
DROP TABLE IF EXISTS `sys_student`;
CREATE TABLE `sys_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `sex` tinyint(2) DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `age` int(10) NOT NULL,
  `classid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classid` (`classid`) USING BTREE,
  CONSTRAINT `classid` FOREIGN KEY (`classid`) REFERENCES `sys_class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_student
-- ----------------------------
INSERT INTO `sys_student` VALUES ('4', 'Skyzc', '1', '厦门集美', '20', '1');
INSERT INTO `sys_student` VALUES ('6', 'Cstao', '1', '厦门集美', '20', '1');
INSERT INTO `sys_student` VALUES ('7', '游正材', '1', '厦门集美', '21', '1');
INSERT INTO `sys_student` VALUES ('8', '小花', '0', '厦门集美', '20', '1');
INSERT INTO `sys_student` VALUES ('9', '狗松', '1', '山东菏泽', '19', '1');
INSERT INTO `sys_student` VALUES ('10', '阿斯顿', '1', '阿斯蒂芬', '12', '2');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for tb_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tb_capacity`;
CREATE TABLE `tb_capacity` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `techno_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fac_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fac_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `param_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `param_design_value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `param_unit` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `other_param_info` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `other_fac_num` int(11) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `design_capacity` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `run_time` int(20) DEFAULT NULL,
  `other_info` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `other_techno_info` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_capacity
-- ----------------------------
INSERT INTO `tb_capacity` VALUES ('1', '新型金属', '化学热处理', '三号反应堆', '865533039113760', '温度', '100', '摄氏度', null, null, '吨', null, null, null, null);
INSERT INTO `tb_capacity` VALUES ('2', '1', null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `goods_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '商品名',
  `intro` varchar(500) DEFAULT NULL COMMENT '介绍',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品管理';

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('3', 'asdf', 'asdf', '12.00', '1');

-- ----------------------------
-- Table structure for tb_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ----------------------------
-- Records of tb_token
-- ----------------------------
INSERT INTO `tb_token` VALUES ('2', '13916e1e7c49462b9317686fef15b118', '2019-03-27 21:37:48', '2019-03-27 09:37:48');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
INSERT INTO `tb_user` VALUES ('2', 'skyzc', 'skyzc', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '2019-03-27 09:35:54');
