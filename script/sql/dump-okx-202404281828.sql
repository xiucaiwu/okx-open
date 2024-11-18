-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: okx
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `copytrading_info`
--

DROP TABLE IF EXISTS `copytrading_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copytrading_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `unique_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '平台唯一标识码',
  `recom_index` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '推荐指数1~5',
  `platform` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '平台 1：okex ',
  `create_by` int DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0：未删除，1：已删除）',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='交易员信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copytrading_info`
--

LOCK TABLES `copytrading_info` WRITE;
/*!40000 ALTER TABLE `copytrading_info` DISABLE KEYS */;
INSERT INTO `copytrading_info` VALUES (1,'浩博交易论势 ','032805718789399F','5','1',NULL,NULL,NULL,NULL,'0','000000',NULL),(3,'墙头草','D5E7A8430A35CA84','4','1',1,'2024-04-28 18:12:41',1,'2024-04-28 18:12:41','0','000000',103),(4,' Plymouth ','A8AF8AFFAB6051B3','5','1',1,'2024-04-28 18:14:39',1,'2024-04-28 18:14:39','0','000000',103),(5,'CopyTradeGPT','B884F39CE972EB2A','5','1',1,'2024-04-28 18:15:29',1,'2024-04-28 18:15:29','0','000000',103),(6,'明明明宏','24D8CE79A97FD35D','5','1',1,'2024-04-28 18:18:15',1,'2024-04-28 18:18:29','0','000000',103),(7,'雪球王','DDF529A6117DBB92','5','1',1,'2024-04-28 18:19:15',1,'2024-04-28 18:19:15','0','000000',103),(8,'小风险，大收益','3714F8E8EFCB56D4','4','1',1,'2024-04-28 18:19:54',1,'2024-04-28 18:19:54','0','000000',103);
/*!40000 ALTER TABLE `copytrading_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copytrading_info_follow`
--

DROP TABLE IF EXISTS `copytrading_info_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copytrading_info_follow` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `copytrading_info_id` int NOT NULL COMMENT '交易员信息id',
  `user_id` int NOT NULL COMMENT '用户id',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='交易员关注表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copytrading_info_follow`
--

LOCK TABLES `copytrading_info_follow` WRITE;
/*!40000 ALTER TABLE `copytrading_info_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `copytrading_info_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `data_name` varchar(200) DEFAULT '' COMMENT '数据源名称',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'master','copytrading_info','交易员信息表',NULL,NULL,'CopytradingInfo','crud','org.dromara.okx','okx','copytradingInfo','交易员信息','cc','0','/','{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"}',103,1,'2024-04-28 15:10:49',1,'2024-04-28 17:10:33',NULL),(2,'master','inst_push_info','定时推送币信息表',NULL,NULL,'InstPushInfo','crud','org.dromara.okx','okx','initpushInfo','定时推送币信息','Lion Li','0','/','{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"}',103,1,'2024-04-28 15:11:03',1,'2024-04-28 17:19:28',NULL),(3,'master','trading_his','交易员带单历史表',NULL,NULL,'TradingHis','crud','org.dromara.okx','okx','tradinghis','交易员带单历史','cc','0','/','{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"}',103,1,'2024-04-28 15:11:17',1,'2024-04-28 17:58:36',NULL),(4,'master','user','用户信息表',NULL,NULL,'User','crud','org.dromara.okx','okx','user','用户信息','cc','0','/','{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"}',103,1,'2024-04-28 15:11:12',1,'2024-04-28 18:23:28',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'id','ID','int','Long','id','1','1','1',NULL,'1','1',NULL,'EQ','input','',1,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:10:33'),(2,1,'name','姓名','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:10:33'),(3,1,'unique_code','标识码','varchar(255)','String','uniqueCode','0','0','1','1','1','1','1','EQ','input','',3,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:10:33'),(4,1,'recom_index','推荐指数','char(1)','String','recomIndex','0','0','1','1','1','1','1','EQ','input','',4,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:10:33'),(5,1,'platform','平台','char(1)','String','platform','0','0','1','1','1','1','1','EQ','select','copytrading_platform',5,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:10:33'),(6,1,'create_by','创建人','int','Long','createBy','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',6,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:10:33'),(7,1,'create_time','创建时间','datetime','Date','createTime','0','0','0',NULL,NULL,NULL,NULL,'EQ','datetime','',7,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:10:33'),(8,1,'update_by','修改人','int','Long','updateBy','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',8,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:10:33'),(9,1,'update_time','修改时间','datetime','Date','updateTime','0','0','0',NULL,NULL,NULL,NULL,'EQ','datetime','',9,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:10:33'),(10,1,'del_flag','删除标志（0：未删除，1：已删除）','char(1)','String','delFlag','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',10,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:10:33'),(11,1,'tenant_id','租户编号','varchar(20)','String','tenantId','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',11,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:10:33'),(12,2,'id','ID','int','Long','id','1','1','1',NULL,'1','1',NULL,'EQ','input','',1,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:19:28'),(13,2,'name','币的简称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:19:28'),(14,2,'inst_id','产品id ','varchar(255)','String','instId','0','0','1','1','1','1','1','EQ','input','',3,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:19:28'),(15,2,'inst_type','产品类型','varchar(255)','String','instType','0','0','1','1','1','1','1','EQ','select','trading_inst_type',4,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:19:28'),(16,2,'create_by','创建人','int','Long','createBy','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',5,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:19:28'),(17,2,'create_time','创建时间','datetime','Date','createTime','0','0','0',NULL,NULL,NULL,NULL,'EQ','datetime','',6,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:19:28'),(18,2,'update_by','修改人','int','Long','updateBy','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',7,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:19:28'),(19,2,'update_time','修改时间','datetime','Date','updateTime','0','0','0',NULL,NULL,NULL,NULL,'EQ','datetime','',8,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:19:28'),(20,2,'del_flag','删除标志（0：未删除，1：已删除）','char(1)','String','delFlag','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',9,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:19:28'),(21,2,'tenant_id','租户编号','varchar(20)','String','tenantId','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',10,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:19:28'),(22,3,'id','id','int','Long','id','1','1','1',NULL,'1','1',NULL,'EQ','input','',1,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(23,3,'inst_id','产品ID','varchar(255)','String','instId','0','0','1','1','1','1','1','EQ','input','',2,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(24,3,'sub_pos_id','带单仓位ID','varchar(255)','String','subPosId','0','0','1','1','1','0','0','EQ','input','',3,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(25,3,'pos_side','持仓方向','varchar(255)','String','posSide','0','0','1','1','1','1','1','EQ','select','trading_his_pos_side',4,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(26,3,'mgn_mode','保证金模式','varchar(255)','String','mgnMode','0','0','1','1','1','1','1','EQ','select','trading_his_mgn_mode',5,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(27,3,'lever','杠杆倍数','varchar(255)','String','lever','0','0','1','1','1','1','1','EQ','input','',6,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(28,3,'open_avg_px','开仓均价','varchar(255)','String','openAvgPx','0','0','1','1','1','1','1','EQ','input','',7,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(29,3,'open_time','开仓时间','varchar(255)','String','openTime','0','0','1','1','1','0','0','EQ','input','',8,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(30,3,'open_time_date','开仓时间','datetime','Date','openTimeDate','0','0','1','1','1','1','1','EQ','datetime','',9,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(31,3,'sub_pos','持仓张数','varchar(255)','String','subPos','0','0','1','1','1','1','1','EQ','input','',10,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(32,3,'inst_type','产品类型','varchar(255)','String','instType','0','0','1','1','1','1','1','EQ','select','trading_his_inst_type',11,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(33,3,'margin','保证金','varchar(255)','String','margin','0','0','1','1','1','1','1','EQ','input','',12,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(34,3,'upl','未实现收益','varchar(255)','String','upl','0','0','1','1','1','1','1','EQ','input','',13,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(35,3,'upl_ratio','未实现收益率','varchar(255)','String','uplRatio','0','0','1','1','1','1','1','EQ','input','',14,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(36,3,'mark_px','最新标记价格','varchar(255)','String','markPx','0','0','1','1','1','1','1','EQ','input','',15,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(37,3,'unique_code','交易员标识码','varchar(255)','String','uniqueCode','0','0','1','1','1','1','1','EQ','input','',16,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(38,3,'ccy','币种','varchar(255)','String','ccy','0','0','1','1','1','1','1','EQ','input','',17,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(39,3,'tenant_id','租户编号','varchar(20)','String','tenantId','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',18,103,1,'2024-04-28 16:05:11',1,'2024-04-28 17:58:36'),(40,4,'id','用户ID','int','Long','id','1','1','1',NULL,'1','1',NULL,'EQ','input','',1,103,1,'2024-04-28 16:05:11',1,'2024-04-28 18:23:28'),(41,4,'username','账号','varchar(255)','String','username','0','0','1','1','1','1','1','LIKE','input','',2,103,1,'2024-04-28 16:05:11',1,'2024-04-28 18:23:28'),(42,4,'password','密码','varchar(255)','String','password','0','0','1','1','1','1','0','EQ','input','',3,103,1,'2024-04-28 16:05:11',1,'2024-04-28 18:23:28'),(43,4,'nick_name','用户名','varchar(255)','String','nickName','0','0','1','1','1','1','1','LIKE','input','',4,103,1,'2024-04-28 16:05:11',1,'2024-04-28 18:23:28'),(44,4,'avatar','头像URL','varchar(255)','String','avatar','0','0','0','1','1','1','0','EQ','imageUpload','',5,103,1,'2024-04-28 16:05:11',1,'2024-04-28 18:23:28'),(45,4,'tel','手机号码','varchar(20)','String','tel','0','0','1','1','1','1','1','EQ','input','',6,103,1,'2024-04-28 16:05:11',1,'2024-04-28 18:23:28'),(46,4,'ding_tel','钉钉号','varchar(20)','String','dingTel','0','0','1','1','1','1','1','EQ','input','',7,103,1,'2024-04-28 16:05:11',1,'2024-04-28 18:23:28'),(47,4,'qq','QQ号码','varchar(20)','String','qq','0','0','0','1','1','1','1','EQ','input','',8,103,1,'2024-04-28 16:05:11',1,'2024-04-28 18:23:28'),(48,4,'sex','用户性别','char(1)','String','sex','0','0','1','1','1','1','1','EQ','select','sys_user_sex',9,103,1,'2024-04-28 16:05:12',1,'2024-04-28 18:23:28'),(49,4,'introduction','简介','varchar(255)','String','introduction','0','0','0','1','1','0','0','EQ','input','',10,103,1,'2024-04-28 16:05:12',1,'2024-04-28 18:23:28'),(50,4,'last_login_time','上次登录时间','datetime','Date','lastLoginTime','0','0','0','0','0','1','1','EQ','datetime','',11,103,1,'2024-04-28 16:05:12',1,'2024-04-28 18:23:28'),(51,4,'create_by','创建人','int','Long','createBy','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',12,103,1,'2024-04-28 16:05:12',1,'2024-04-28 18:23:28'),(52,4,'create_time','创建时间','datetime','Date','createTime','0','0','0',NULL,NULL,NULL,NULL,'EQ','datetime','',13,103,1,'2024-04-28 16:05:12',1,'2024-04-28 18:23:28'),(53,4,'update_by','修改人','int','Long','updateBy','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',14,103,1,'2024-04-28 16:05:12',1,'2024-04-28 18:23:28'),(54,4,'update_time','修改时间','datetime','Date','updateTime','0','0','0',NULL,NULL,NULL,NULL,'EQ','datetime','',15,103,1,'2024-04-28 16:05:12',1,'2024-04-28 18:23:28'),(55,4,'del_flag','删除标志（0：未删除，1：已删除）','char(1)','String','delFlag','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',16,103,1,'2024-04-28 16:05:12',1,'2024-04-28 18:23:28'),(56,4,'tenant_id','租户编号','varchar(20)','String','tenantId','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',17,103,1,'2024-04-28 16:05:12',1,'2024-04-28 18:23:28'),(57,1,'create_dept','创建部门','bigint','Long','createDept','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',12,103,1,'2024-04-28 17:09:03',1,'2024-04-28 17:10:33'),(58,2,'create_dept','创建部门','bigint','Long','createDept','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',11,103,1,'2024-04-28 17:09:05',1,'2024-04-28 17:19:28'),(59,3,'create_dept','创建部门','bigint','Long','createDept','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',19,103,1,'2024-04-28 17:09:07',1,'2024-04-28 17:58:36'),(60,4,'create_dept','创建部门','bigint','Long','createDept','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',18,103,1,'2024-04-28 17:09:08',1,'2024-04-28 18:23:28'),(61,3,'create_by','','int','Long','createBy','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',20,103,1,'2024-04-28 17:44:04',1,'2024-04-28 17:58:36'),(62,3,'create_time','','datetime','Date','createTime','0','0','0',NULL,NULL,NULL,NULL,'EQ','datetime','',21,103,1,'2024-04-28 17:44:04',1,'2024-04-28 17:58:36'),(63,3,'update_by','','int','Long','updateBy','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',22,103,1,'2024-04-28 17:44:04',1,'2024-04-28 17:58:36'),(64,3,'update_time','','datetime','Date','updateTime','0','0','0',NULL,NULL,NULL,NULL,'EQ','datetime','',23,103,1,'2024-04-28 17:44:04',1,'2024-04-28 17:58:36'),(65,3,'del_flag','','varchar(100)','String','delFlag','0','0','0',NULL,NULL,NULL,NULL,'EQ','input','',24,103,1,'2024-04-28 17:44:04',1,'2024-04-28 17:58:36');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inst_push_info`
--

DROP TABLE IF EXISTS `inst_push_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inst_push_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '币的简称',
  `inst_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '对应okx产品id ',
  `inst_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品类型\r\nSPOT：币币\r\nSWAP：永续合约\r\nFUTURES：交割合约\r\nOPTION：期权',
  `create_by` int DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0：未删除，1：已删除）',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时推送币信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inst_push_info`
--

LOCK TABLES `inst_push_info` WRITE;
/*!40000 ALTER TABLE `inst_push_info` DISABLE KEYS */;
INSERT INTO `inst_push_info` VALUES (1,'BTC','BTC-USDT','SPOT',1,'2024-04-28 18:26:41',1,'2024-04-28 18:27:04','0','000000',103),(2,'ETH','ETH-USDT','SPOT',1,'2024-04-28 18:26:59',1,'2024-04-28 18:26:59','0','000000',103),(3,'DOGE','DOGE-USDT','SPOT',1,'2024-04-28 18:27:17',1,'2024-04-28 18:27:17','0','000000',103),(4,'SOL','SOL-USDT','SPOT',1,'2024-04-28 18:27:29',1,'2024-04-28 18:27:29','0','000000',103),(5,'MEME','MEME-USDT','SPOT',1,'2024-04-28 18:27:44',1,'2024-04-28 18:27:44','0','000000',103),(6,'PEPE','PEPE-USDT','SPOT',1,'2024-04-28 18:27:58',1,'2024-04-28 18:27:58','0','000000',103);
/*!40000 ALTER TABLE `inst_push_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pj_app_info`
--

DROP TABLE IF EXISTS `pj_app_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pj_app_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) DEFAULT NULL,
  `current_server` varchar(255) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT NULL,
  `gmt_modified` datetime(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uidx01_app_info` (`app_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pj_app_info`
--

LOCK TABLES `pj_app_info` WRITE;
/*!40000 ALTER TABLE `pj_app_info` DISABLE KEYS */;
INSERT INTO `pj_app_info` VALUES (1,'ruoyi-worker','127.0.0.1:10010','2023-06-13 16:32:59.263000','2023-07-04 17:25:49.798000','123456');
/*!40000 ALTER TABLE `pj_app_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pj_container_info`
--

DROP TABLE IF EXISTS `pj_container_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pj_container_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_id` bigint DEFAULT NULL,
  `container_name` varchar(255) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT NULL,
  `gmt_modified` datetime(6) DEFAULT NULL,
  `last_deploy_time` datetime(6) DEFAULT NULL,
  `source_info` varchar(255) DEFAULT NULL,
  `source_type` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx01_container_info` (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pj_container_info`
--

LOCK TABLES `pj_container_info` WRITE;
/*!40000 ALTER TABLE `pj_container_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pj_container_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pj_instance_info`
--

DROP TABLE IF EXISTS `pj_instance_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pj_instance_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `actual_trigger_time` bigint DEFAULT NULL,
  `app_id` bigint DEFAULT NULL,
  `expected_trigger_time` bigint DEFAULT NULL,
  `finished_time` bigint DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT NULL,
  `gmt_modified` datetime(6) DEFAULT NULL,
  `instance_id` bigint DEFAULT NULL,
  `instance_params` longtext,
  `job_id` bigint DEFAULT NULL,
  `job_params` longtext,
  `last_report_time` bigint DEFAULT NULL,
  `result` longtext,
  `running_times` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `task_tracker_address` varchar(255) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `wf_instance_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx01_instance_info` (`job_id`,`status`) USING BTREE,
  KEY `idx02_instance_info` (`app_id`,`status`) USING BTREE,
  KEY `idx03_instance_info` (`instance_id`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pj_instance_info`
--

LOCK TABLES `pj_instance_info` WRITE;
/*!40000 ALTER TABLE `pj_instance_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pj_instance_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pj_job_info`
--

DROP TABLE IF EXISTS `pj_job_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pj_job_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alarm_config` varchar(255) DEFAULT NULL,
  `app_id` bigint DEFAULT NULL,
  `concurrency` int DEFAULT NULL,
  `designated_workers` varchar(255) DEFAULT NULL,
  `dispatch_strategy` int DEFAULT NULL,
  `execute_type` int DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT NULL,
  `gmt_modified` datetime(6) DEFAULT NULL,
  `instance_retry_num` int DEFAULT NULL,
  `instance_time_limit` bigint DEFAULT NULL,
  `job_description` varchar(255) DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `job_params` longtext,
  `lifecycle` varchar(255) DEFAULT NULL,
  `log_config` varchar(255) DEFAULT NULL,
  `max_instance_num` int DEFAULT NULL,
  `max_worker_count` int DEFAULT NULL,
  `min_cpu_cores` double NOT NULL,
  `min_disk_space` double NOT NULL,
  `min_memory_space` double NOT NULL,
  `next_trigger_time` bigint DEFAULT NULL,
  `notify_user_ids` varchar(255) DEFAULT NULL,
  `processor_info` varchar(255) DEFAULT NULL,
  `processor_type` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `task_retry_num` int DEFAULT NULL,
  `time_expression` varchar(255) DEFAULT NULL,
  `time_expression_type` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx01_job_info` (`app_id`,`status`,`time_expression_type`,`next_trigger_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pj_job_info`
--

LOCK TABLES `pj_job_info` WRITE;
/*!40000 ALTER TABLE `pj_job_info` DISABLE KEYS */;
INSERT INTO `pj_job_info` VALUES (1,'{\"alertThreshold\":0,\"silenceWindowLen\":0,\"statisticWindowLen\":0}',1,5,'',2,1,NULL,'2023-06-02 15:01:27.717000','2023-07-04 17:22:12.374000',1,0,'','单机处理器执行测试',NULL,'{}','{\"type\":1}',0,0,0,0,0,NULL,NULL,'org.dromara.job.processors.StandaloneProcessorDemo',1,2,NULL,1,'30000',3),(2,'{\"alertThreshold\":0,\"silenceWindowLen\":0,\"statisticWindowLen\":0}',1,5,'',1,2,NULL,'2023-06-02 15:04:45.342000','2023-07-04 17:22:12.816000',0,0,NULL,'广播处理器测试',NULL,'{}','{\"type\":1}',0,0,0,0,0,NULL,NULL,'org.dromara.job.processors.BroadcastProcessorDemo',1,2,NULL,1,'30000',3),(3,'{\"alertThreshold\":0,\"silenceWindowLen\":0,\"statisticWindowLen\":0}',1,5,'',1,4,NULL,'2023-06-02 15:13:23.519000','2023-06-02 16:03:22.421000',0,0,NULL,'Map处理器测试',NULL,'{}','{\"type\":1}',0,0,0,0,0,NULL,NULL,'org.dromara.job.processors.MapProcessorDemo',1,2,NULL,1,'1000',3),(4,'{\"alertThreshold\":0,\"silenceWindowLen\":0,\"statisticWindowLen\":0}',1,5,'',1,3,NULL,'2023-06-02 15:45:25.896000','2023-06-02 16:03:23.125000',0,0,NULL,'MapReduce处理器测试',NULL,'{}','{\"type\":1}',0,0,0,0,0,NULL,NULL,'org.dromara.job.processors.MapReduceProcessorDemo',1,2,NULL,1,'1000',3);
/*!40000 ALTER TABLE `pj_job_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pj_oms_lock`
--

DROP TABLE IF EXISTS `pj_oms_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pj_oms_lock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(6) DEFAULT NULL,
  `gmt_modified` datetime(6) DEFAULT NULL,
  `lock_name` varchar(255) DEFAULT NULL,
  `max_lock_time` bigint DEFAULT NULL,
  `ownerip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uidx01_oms_lock` (`lock_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pj_oms_lock`
--

LOCK TABLES `pj_oms_lock` WRITE;
/*!40000 ALTER TABLE `pj_oms_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `pj_oms_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pj_server_info`
--

DROP TABLE IF EXISTS `pj_server_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pj_server_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(6) DEFAULT NULL,
  `gmt_modified` datetime(6) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uidx01_server_info` (`ip`) USING BTREE,
  KEY `idx01_server_info` (`gmt_modified`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pj_server_info`
--

LOCK TABLES `pj_server_info` WRITE;
/*!40000 ALTER TABLE `pj_server_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pj_server_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pj_user_info`
--

DROP TABLE IF EXISTS `pj_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pj_user_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT NULL,
  `gmt_modified` datetime(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `web_hook` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uidx01_user_info` (`username`) USING BTREE,
  KEY `uidx02_user_info` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pj_user_info`
--

LOCK TABLES `pj_user_info` WRITE;
/*!40000 ALTER TABLE `pj_user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pj_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pj_workflow_info`
--

DROP TABLE IF EXISTS `pj_workflow_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pj_workflow_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_id` bigint DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT NULL,
  `gmt_modified` datetime(6) DEFAULT NULL,
  `lifecycle` varchar(255) DEFAULT NULL,
  `max_wf_instance_num` int DEFAULT NULL,
  `next_trigger_time` bigint DEFAULT NULL,
  `notify_user_ids` varchar(255) DEFAULT NULL,
  `pedag` longtext,
  `status` int DEFAULT NULL,
  `time_expression` varchar(255) DEFAULT NULL,
  `time_expression_type` int DEFAULT NULL,
  `wf_description` varchar(255) DEFAULT NULL,
  `wf_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx01_workflow_info` (`app_id`,`status`,`time_expression_type`,`next_trigger_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pj_workflow_info`
--

LOCK TABLES `pj_workflow_info` WRITE;
/*!40000 ALTER TABLE `pj_workflow_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pj_workflow_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pj_workflow_instance_info`
--

DROP TABLE IF EXISTS `pj_workflow_instance_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pj_workflow_instance_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `actual_trigger_time` bigint DEFAULT NULL,
  `app_id` bigint DEFAULT NULL,
  `dag` longtext,
  `expected_trigger_time` bigint DEFAULT NULL,
  `finished_time` bigint DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT NULL,
  `gmt_modified` datetime(6) DEFAULT NULL,
  `parent_wf_instance_id` bigint DEFAULT NULL,
  `result` longtext,
  `status` int DEFAULT NULL,
  `wf_context` longtext,
  `wf_init_params` longtext,
  `wf_instance_id` bigint DEFAULT NULL,
  `workflow_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uidx01_wf_instance` (`wf_instance_id`) USING BTREE,
  KEY `idx01_wf_instance` (`workflow_id`,`status`,`app_id`,`expected_trigger_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pj_workflow_instance_info`
--

LOCK TABLES `pj_workflow_instance_info` WRITE;
/*!40000 ALTER TABLE `pj_workflow_instance_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pj_workflow_instance_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pj_workflow_node_info`
--

DROP TABLE IF EXISTS `pj_workflow_node_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pj_workflow_node_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_id` bigint NOT NULL,
  `enable` bit(1) NOT NULL,
  `extra` longtext,
  `gmt_create` datetime(6) DEFAULT NULL,
  `gmt_modified` datetime(6) DEFAULT NULL,
  `job_id` bigint DEFAULT NULL,
  `node_name` varchar(255) DEFAULT NULL,
  `node_params` longtext,
  `skip_when_failed` bit(1) NOT NULL,
  `type` int DEFAULT NULL,
  `workflow_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx01_workflow_node_info` (`workflow_id`,`gmt_create`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pj_workflow_node_info`
--

LOCK TABLES `pj_workflow_node_info` WRITE;
/*!40000 ALTER TABLE `pj_workflow_node_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pj_workflow_node_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_client`
--

DROP TABLE IF EXISTS `sys_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_client` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `client_id` varchar(64) DEFAULT NULL COMMENT '客户端id',
  `client_key` varchar(32) DEFAULT NULL COMMENT '客户端key',
  `client_secret` varchar(255) DEFAULT NULL COMMENT '客户端秘钥',
  `grant_type` varchar(255) DEFAULT NULL COMMENT '授权类型',
  `device_type` varchar(32) DEFAULT NULL COMMENT '设备类型',
  `active_timeout` int DEFAULT '1800' COMMENT 'token活跃超时时间',
  `timeout` int DEFAULT '604800' COMMENT 'token固定超时',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_client`
--

LOCK TABLES `sys_client` WRITE;
/*!40000 ALTER TABLE `sys_client` DISABLE KEYS */;
INSERT INTO `sys_client` VALUES (1,'e5cd7e4891bf95d1d19206ce24a7b32e','pc','pc123','password,social','pc',1800,604800,'0','0',103,1,'2024-04-28 14:51:26',1,'2024-04-28 14:51:26'),(2,'428a8310cd442757ae699df5d894f051','app','app123','password,sms,social','android',1800,604800,'0','0',103,1,'2024-04-28 14:51:26',1,'2024-04-28 14:51:26');
/*!40000 ALTER TABLE `sys_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'000000','主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y',103,1,'2024-04-28 14:51:26',NULL,NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'000000','用户管理-账号初始密码','sys.user.initPassword','123456','Y',103,1,'2024-04-28 14:51:26',NULL,NULL,'初始化密码 123456'),(3,'000000','主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y',103,1,'2024-04-28 14:51:26',NULL,NULL,'深色主题theme-dark，浅色主题theme-light'),(5,'000000','账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y',103,1,'2024-04-28 14:51:26',NULL,NULL,'是否开启注册用户功能（true开启，false关闭）'),(11,'000000','OSS预览列表资源开关','sys.oss.previewListResource','true','Y',103,1,'2024-04-28 14:51:26',NULL,NULL,'true:开启, false:关闭');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(500) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` bigint DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,'000000',0,'0','cc科技',0,NULL,'','','0','0',103,1,'2024-04-28 14:51:23',1,'2024-04-28 15:51:37'),(101,'000000',100,'0,100','深圳总公司',1,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-04-28 14:51:23',NULL,NULL),(102,'000000',100,'0,100','长沙分公司',2,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-04-28 14:51:23',NULL,NULL),(103,'000000',101,'0,100,101','研发部门',1,1,'15888888888','xxx@qq.com','0','0',103,1,'2024-04-28 14:51:23',NULL,NULL),(104,'000000',101,'0,100,101','市场部门',2,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-04-28 14:51:23',NULL,NULL),(105,'000000',101,'0,100,101','测试部门',3,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-04-28 14:51:23',NULL,NULL),(106,'000000',101,'0,100,101','财务部门',4,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-04-28 14:51:23',NULL,NULL),(107,'000000',101,'0,100,101','运维部门',5,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-04-28 14:51:23',NULL,NULL),(108,'000000',102,'0,100,102','市场部门',1,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-04-28 14:51:23',NULL,NULL),(109,'000000',102,'0,100,102','财务部门',2,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-04-28 14:51:23',NULL,NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,'000000',1,'男','0','sys_user_sex','','','Y',103,1,'2024-04-28 14:51:26',NULL,NULL,'性别男'),(2,'000000',2,'女','1','sys_user_sex','','','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'性别女'),(3,'000000',3,'未知','2','sys_user_sex','','','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'性别未知'),(4,'000000',1,'显示','0','sys_show_hide','','primary','Y',103,1,'2024-04-28 14:51:26',NULL,NULL,'显示菜单'),(5,'000000',2,'隐藏','1','sys_show_hide','','danger','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'隐藏菜单'),(6,'000000',1,'正常','0','sys_normal_disable','','primary','Y',103,1,'2024-04-28 14:51:26',NULL,NULL,'正常状态'),(7,'000000',2,'停用','1','sys_normal_disable','','danger','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'停用状态'),(12,'000000',1,'是','Y','sys_yes_no','','primary','Y',103,1,'2024-04-28 14:51:26',NULL,NULL,'系统默认是'),(13,'000000',2,'否','N','sys_yes_no','','danger','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'系统默认否'),(14,'000000',1,'通知','1','sys_notice_type','','warning','Y',103,1,'2024-04-28 14:51:26',NULL,NULL,'通知'),(15,'000000',2,'公告','2','sys_notice_type','','success','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'公告'),(16,'000000',1,'正常','0','sys_notice_status','','primary','Y',103,1,'2024-04-28 14:51:26',NULL,NULL,'正常状态'),(17,'000000',2,'关闭','1','sys_notice_status','','danger','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'关闭状态'),(18,'000000',1,'新增','1','sys_oper_type','','info','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'新增操作'),(19,'000000',2,'修改','2','sys_oper_type','','info','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'修改操作'),(20,'000000',3,'删除','3','sys_oper_type','','danger','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'删除操作'),(21,'000000',4,'授权','4','sys_oper_type','','primary','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'授权操作'),(22,'000000',5,'导出','5','sys_oper_type','','warning','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'导出操作'),(23,'000000',6,'导入','6','sys_oper_type','','warning','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'导入操作'),(24,'000000',7,'强退','7','sys_oper_type','','danger','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'强退操作'),(25,'000000',8,'生成代码','8','sys_oper_type','','warning','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'生成操作'),(26,'000000',9,'清空数据','9','sys_oper_type','','danger','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'清空操作'),(27,'000000',1,'成功','0','sys_common_status','','primary','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'正常状态'),(28,'000000',2,'失败','1','sys_common_status','','danger','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'停用状态'),(29,'000000',99,'其他','0','sys_oper_type','','info','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'其他操作'),(30,'000000',0,'密码认证','password','sys_grant_type','el-check-tag','default','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'密码认证'),(31,'000000',0,'短信认证','sms','sys_grant_type','el-check-tag','default','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'短信认证'),(32,'000000',0,'邮件认证','email','sys_grant_type','el-check-tag','default','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'邮件认证'),(33,'000000',0,'小程序认证','xcx','sys_grant_type','el-check-tag','default','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'小程序认证'),(34,'000000',0,'三方登录认证','social','sys_grant_type','el-check-tag','default','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'三方登录认证'),(35,'000000',0,'PC','pc','sys_device_type','','default','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'PC'),(36,'000000',0,'安卓','android','sys_device_type','','default','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'安卓'),(37,'000000',0,'iOS','ios','sys_device_type','','default','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'iOS'),(38,'000000',0,'小程序','xcx','sys_device_type','','default','N',103,1,'2024-04-28 14:51:26',NULL,NULL,'小程序'),(39,'000000',0,'开平仓模式开多','long','trading_his_pos_side','','default','N',103,1,'2024-04-28 17:02:03',1,'2024-04-28 17:02:03',''),(40,'000000',0,'开平仓模式开空','short','trading_his_pos_side','','default','N',103,1,'2024-04-28 17:02:13',1,'2024-04-28 17:02:13',''),(41,'000000',0,'买卖模式（subPos为正代表开多，subPos为负代表开空）','netv','trading_his_pos_side','','default','N',103,1,'2024-04-28 17:02:21',1,'2024-04-28 18:09:40',''),(42,'000000',0,'币币','SPOT','trading_his_inst_type','','default','N',103,1,'2024-04-28 17:02:45',1,'2024-04-28 17:02:45',''),(43,'000000',0,'永续合约','SWAP','trading_his_inst_type','','default','N',103,1,'2024-04-28 17:02:54',1,'2024-04-28 17:02:54',''),(44,'000000',0,'逐仓','isolated','trading_his_mgn_mode','','default','N',103,1,'2024-04-28 17:03:10',1,'2024-04-28 17:03:10',''),(45,'000000',0,'全仓','cross','trading_his_mgn_mode','','default','N',103,1,'2024-04-28 17:03:18',1,'2024-04-28 17:03:18',''),(46,'000000',0,'okx','1','copytrading_platform','','default','N',103,1,'2024-04-28 17:05:14',1,'2024-04-28 17:05:14',''),(47,'000000',0,'币安','2','copytrading_platform','','default','N',103,1,'2024-04-28 17:05:36',1,'2024-04-28 17:05:36',''),(48,'000000',0,'Bitget','3','copytrading_platform','','default','N',103,1,'2024-04-28 17:06:01',1,'2024-04-28 17:06:01',''),(49,'000000',0,'币币','SPOT','trading_inst_type','','default','N',103,1,'2024-04-28 17:16:05',1,'2024-04-28 17:16:05',''),(50,'000000',0,'永续合约','SWAP','trading_inst_type','','default','N',103,1,'2024-04-28 17:17:21',1,'2024-04-28 17:17:21',''),(51,'000000',0,'交割合约','FUTURES','trading_inst_type','','default','N',103,1,'2024-04-28 17:17:39',1,'2024-04-28 17:17:39',''),(52,'000000',0,'期权','OPTION','trading_inst_type','','default','N',103,1,'2024-04-28 17:17:49',1,'2024-04-28 17:17:49','');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `tenant_id` (`tenant_id`,`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'000000','用户性别','sys_user_sex',103,1,'2024-04-28 14:51:25',NULL,NULL,'用户性别列表'),(2,'000000','菜单状态','sys_show_hide',103,1,'2024-04-28 14:51:25',NULL,NULL,'菜单状态列表'),(3,'000000','系统开关','sys_normal_disable',103,1,'2024-04-28 14:51:25',NULL,NULL,'系统开关列表'),(6,'000000','系统是否','sys_yes_no',103,1,'2024-04-28 14:51:25',NULL,NULL,'系统是否列表'),(7,'000000','通知类型','sys_notice_type',103,1,'2024-04-28 14:51:25',NULL,NULL,'通知类型列表'),(8,'000000','通知状态','sys_notice_status',103,1,'2024-04-28 14:51:25',NULL,NULL,'通知状态列表'),(9,'000000','操作类型','sys_oper_type',103,1,'2024-04-28 14:51:25',NULL,NULL,'操作类型列表'),(10,'000000','系统状态','sys_common_status',103,1,'2024-04-28 14:51:25',NULL,NULL,'登录状态列表'),(11,'000000','授权类型','sys_grant_type',103,1,'2024-04-28 14:51:25',NULL,NULL,'认证授权类型'),(12,'000000','设备类型','sys_device_type',103,1,'2024-04-28 14:51:25',NULL,NULL,'客户端设备类型'),(13,'000000','交易员当前带单的持仓方向','trading_his_pos_side',103,1,'2024-04-28 17:00:38',1,'2024-04-28 17:00:38',''),(14,'000000','交易员当前带单的产品类型','trading_his_inst_type',103,1,'2024-04-28 17:00:49',1,'2024-04-28 17:00:49',''),(15,'000000','交易员当前带单的保证金模式','trading_his_mgn_mode',103,1,'2024-04-28 17:01:00',1,'2024-04-28 17:01:00',''),(16,'000000','交易员平台','copytrading_platform',103,1,'2024-04-28 17:05:04',1,'2024-04-28 17:05:04',''),(17,'000000','产品类型','trading_inst_type',103,1,'2024-04-28 17:15:48',1,'2024-04-28 17:15:48','');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `client_key` varchar(32) DEFAULT '' COMMENT '客户端',
  `device_type` varchar(32) DEFAULT '' COMMENT '设备类型',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (1,'000000','admin','pc','pc','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','1','密码输入错误1次','2024-04-28 16:10:01'),(2,'000000','admin','pc','pc','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','1','验证码错误','2024-04-28 16:10:09'),(3,'000000','admin','pc','pc','127.0.0.1','内网IP','Chrome','Windows 10 or Windows Server 2016','0','登录成功','2024-04-28 16:10:13');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1784515380670935048 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system',103,1,'2024-04-28 14:51:23',NULL,NULL,'系统管理目录'),(2,'系统监控',0,3,'monitor',NULL,'',1,0,'M','0','0','','monitor',103,1,'2024-04-28 14:51:23',NULL,NULL,'系统监控目录'),(3,'系统工具',0,4,'tool',NULL,'',1,0,'M','0','0','','tool',103,1,'2024-04-28 14:51:23',NULL,NULL,'系统工具目录'),(4,'PLUS官网',0,5,'https://gitee.com/dromara/RuoYi-Vue-Plus',NULL,'',0,0,'M','0','0','','guide',103,1,'2024-04-28 14:51:23',NULL,NULL,'RuoYi-Vue-Plus官网地址'),(6,'租户管理',0,2,'tenant',NULL,'',1,0,'M','0','0','','chart',103,1,'2024-04-28 14:51:23',NULL,NULL,'租户管理目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user',103,1,'2024-04-28 14:51:23',NULL,NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples',103,1,'2024-04-28 14:51:23',NULL,NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table',103,1,'2024-04-28 14:51:23',NULL,NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree',103,1,'2024-04-28 14:51:23',NULL,NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post',103,1,'2024-04-28 14:51:23',NULL,NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict',103,1,'2024-04-28 14:51:23',NULL,NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit',103,1,'2024-04-28 14:51:23',NULL,NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message',103,1,'2024-04-28 14:51:23',NULL,NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log',103,1,'2024-04-28 14:51:23',NULL,NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online',103,1,'2024-04-28 14:51:23',NULL,NULL,'在线用户菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis',103,1,'2024-04-28 14:51:23',NULL,NULL,'缓存监控菜单'),(114,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build',103,1,'2024-04-28 14:51:23',NULL,NULL,'表单构建菜单'),(115,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code',103,1,'2024-04-28 14:51:23',NULL,NULL,'代码生成菜单'),(117,'Admin监控',2,5,'Admin','monitor/admin/index','',1,0,'C','0','0','monitor:admin:list','dashboard',103,1,'2024-04-28 14:51:23',NULL,NULL,'Admin监控菜单'),(118,'文件管理',1,10,'oss','system/oss/index','',1,0,'C','0','0','system:oss:list','upload',103,1,'2024-04-28 14:51:23',NULL,NULL,'文件管理菜单'),(120,'任务调度中心',2,5,'powerjob','monitor/powerjob/index','',1,0,'C','0','0','monitor:powerjob:list','job',103,1,'2024-04-28 14:51:23',NULL,NULL,'PowerJob控制台菜单'),(121,'租户管理',6,1,'tenant','system/tenant/index','',1,0,'C','0','0','system:tenant:list','list',103,1,'2024-04-28 14:51:23',NULL,NULL,'租户管理菜单'),(122,'租户套餐管理',6,2,'tenantPackage','system/tenantPackage/index','',1,0,'C','0','0','system:tenantPackage:list','form',103,1,'2024-04-28 14:51:23',NULL,NULL,'租户套餐管理菜单'),(123,'客户端管理',1,11,'client','system/client/index','',1,0,'C','0','0','system:client:list','international',103,1,'2024-04-28 14:51:23',NULL,NULL,'客户端管理菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form',103,1,'2024-04-28 14:51:23',NULL,NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor',103,1,'2024-04-28 14:51:24',NULL,NULL,'登录日志菜单'),(1001,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1002,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1003,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1004,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1005,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1006,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1007,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1008,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1009,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1010,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1011,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1012,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1013,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1014,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1015,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1016,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1017,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1018,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1019,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1020,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1021,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1022,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1023,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1024,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1025,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1026,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1027,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1028,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1029,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1030,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1031,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1032,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1033,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1034,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1035,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1036,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1037,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1038,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1039,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1040,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1041,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1042,'日志导出',500,4,'#','','',1,0,'F','0','0','monitor:operlog:export','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1043,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1044,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1045,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1050,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1055,'生成查询',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1056,'生成修改',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1057,'生成删除',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1058,'导入代码',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1059,'预览代码',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1060,'生成代码',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1061,'客户端管理查询',123,1,'#','','',1,0,'F','0','0','system:client:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1062,'客户端管理新增',123,2,'#','','',1,0,'F','0','0','system:client:add','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1063,'客户端管理修改',123,3,'#','','',1,0,'F','0','0','system:client:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1064,'客户端管理删除',123,4,'#','','',1,0,'F','0','0','system:client:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1065,'客户端管理导出',123,5,'#','','',1,0,'F','0','0','system:client:export','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1600,'文件查询',118,1,'#','','',1,0,'F','0','0','system:oss:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1601,'文件上传',118,2,'#','','',1,0,'F','0','0','system:oss:upload','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1602,'文件下载',118,3,'#','','',1,0,'F','0','0','system:oss:download','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1603,'文件删除',118,4,'#','','',1,0,'F','0','0','system:oss:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1606,'租户查询',121,1,'#','','',1,0,'F','0','0','system:tenant:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1607,'租户新增',121,2,'#','','',1,0,'F','0','0','system:tenant:add','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1608,'租户修改',121,3,'#','','',1,0,'F','0','0','system:tenant:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1609,'租户删除',121,4,'#','','',1,0,'F','0','0','system:tenant:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1610,'租户导出',121,5,'#','','',1,0,'F','0','0','system:tenant:export','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1611,'租户套餐查询',122,1,'#','','',1,0,'F','0','0','system:tenantPackage:query','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1612,'租户套餐新增',122,2,'#','','',1,0,'F','0','0','system:tenantPackage:add','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1613,'租户套餐修改',122,3,'#','','',1,0,'F','0','0','system:tenantPackage:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1614,'租户套餐删除',122,4,'#','','',1,0,'F','0','0','system:tenantPackage:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1615,'租户套餐导出',122,5,'#','','',1,0,'F','0','0','system:tenantPackage:export','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1620,'配置列表',118,5,'#','','',1,0,'F','0','0','system:ossConfig:list','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1621,'配置添加',118,6,'#','','',1,0,'F','0','0','system:ossConfig:add','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1622,'配置编辑',118,6,'#','','',1,0,'F','0','0','system:ossConfig:edit','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1623,'配置删除',118,6,'#','','',1,0,'F','0','0','system:ossConfig:remove','#',103,1,'2024-04-28 14:51:24',NULL,NULL,''),(1624,'okx',0,1,'okx',NULL,NULL,1,0,'M','0','0',NULL,'money',103,1,'2024-04-28 16:12:29',1,'2024-04-28 16:12:54',''),(1784515378255015938,'交易员信息',1624,1,'copytradingInfo','okx/copytradingInfo/index',NULL,1,0,'C','0','0','okx:copytradingInfo:list','#',103,1,'2024-04-28 17:31:25',NULL,NULL,'交易员信息菜单'),(1784515378255015939,'交易员信息查询',1784515378255015938,1,'#','',NULL,1,0,'F','0','0','okx:copytradingInfo:query','#',103,1,'2024-04-28 17:31:25',NULL,NULL,''),(1784515378255015940,'交易员信息新增',1784515378255015938,2,'#','',NULL,1,0,'F','0','0','okx:copytradingInfo:add','#',103,1,'2024-04-28 17:31:25',NULL,NULL,''),(1784515378255015941,'交易员信息修改',1784515378255015938,3,'#','',NULL,1,0,'F','0','0','okx:copytradingInfo:edit','#',103,1,'2024-04-28 17:31:25',NULL,NULL,''),(1784515378255015942,'交易员信息删除',1784515378255015938,4,'#','',NULL,1,0,'F','0','0','okx:copytradingInfo:remove','#',103,1,'2024-04-28 17:31:25',NULL,NULL,''),(1784515378255015943,'交易员信息导出',1784515378255015938,5,'#','',NULL,1,0,'F','0','0','okx:copytradingInfo:export','#',103,1,'2024-04-28 17:31:25',NULL,NULL,''),(1784515379307786242,'定时推送币信息',1624,1,'initpushInfo','okx/initpushInfo/index',NULL,1,0,'C','0','0','okx:initpushInfo:list','#',103,1,'2024-04-28 17:31:35',NULL,NULL,'定时推送币信息菜单'),(1784515379307786243,'定时推送币信息查询',1784515379307786242,1,'#','',NULL,1,0,'F','0','0','okx:initpushInfo:query','#',103,1,'2024-04-28 17:31:35',NULL,NULL,''),(1784515379307786244,'定时推送币信息新增',1784515379307786242,2,'#','',NULL,1,0,'F','0','0','okx:initpushInfo:add','#',103,1,'2024-04-28 17:31:35',NULL,NULL,''),(1784515379307786245,'定时推送币信息修改',1784515379307786242,3,'#','',NULL,1,0,'F','0','0','okx:initpushInfo:edit','#',103,1,'2024-04-28 17:31:35',NULL,NULL,''),(1784515379307786246,'定时推送币信息删除',1784515379307786242,4,'#','',NULL,1,0,'F','0','0','okx:initpushInfo:remove','#',103,1,'2024-04-28 17:31:35',NULL,NULL,''),(1784515379307786247,'定时推送币信息导出',1784515379307786242,5,'#','',NULL,1,0,'F','0','0','okx:initpushInfo:export','#',103,1,'2024-04-28 17:31:35',NULL,NULL,''),(1784515379760771074,'交易员带单历史',1624,1,'tradinghis','okx/tradinghis/index',NULL,1,0,'C','0','0','okx:tradinghis:list','#',103,1,'2024-04-28 17:31:59',NULL,NULL,'交易员带单历史菜单'),(1784515379760771075,'交易员带单历史查询',1784515379760771074,1,'#','',NULL,1,0,'F','0','0','okx:tradinghis:query','#',103,1,'2024-04-28 17:31:59',NULL,NULL,''),(1784515379760771076,'交易员带单历史新增',1784515379760771074,2,'#','',NULL,1,0,'F','0','0','okx:tradinghis:add','#',103,1,'2024-04-28 17:31:59',NULL,NULL,''),(1784515379760771077,'交易员带单历史修改',1784515379760771074,3,'#','',NULL,1,0,'F','0','0','okx:tradinghis:edit','#',103,1,'2024-04-28 17:31:59',NULL,NULL,''),(1784515379760771078,'交易员带单历史删除',1784515379760771074,4,'#','',NULL,1,0,'F','0','0','okx:tradinghis:remove','#',103,1,'2024-04-28 17:31:59',NULL,NULL,''),(1784515379760771079,'交易员带单历史导出',1784515379760771074,5,'#','',NULL,1,0,'F','0','0','okx:tradinghis:export','#',103,1,'2024-04-28 17:31:59',NULL,NULL,''),(1784515380670935042,'用户信息',1624,1,'user','okx/user/index',NULL,1,0,'C','0','0','okx:user:list','#',103,1,'2024-04-28 17:32:08',1,'2024-04-28 17:43:21','用户信息菜单'),(1784515380670935043,'用户信息查询',1784515380670935042,1,'#','',NULL,1,0,'F','0','0','okx:user:query','#',103,1,'2024-04-28 17:32:08',NULL,NULL,''),(1784515380670935044,'用户信息新增',1784515380670935042,2,'#','',NULL,1,0,'F','0','0','okx:user:add','#',103,1,'2024-04-28 17:32:08',NULL,NULL,''),(1784515380670935045,'用户信息修改',1784515380670935042,3,'#','',NULL,1,0,'F','0','0','okx:user:edit','#',103,1,'2024-04-28 17:32:08',NULL,NULL,''),(1784515380670935046,'用户信息删除',1784515380670935042,4,'#','',NULL,1,0,'F','0','0','okx:user:remove','#',103,1,'2024-04-28 17:32:08',NULL,NULL,''),(1784515380670935047,'用户信息导出',1784515380670935042,5,'#','',NULL,1,0,'F','0','0','okx:user:export','#',103,1,'2024-04-28 17:32:08',NULL,NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` bigint NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'000000','温馨提醒：2018-07-01 新版本发布啦','2',_binary '新版本内容','0',103,1,'2024-04-28 14:51:26',NULL,NULL,'管理员'),(2,'000000','维护通知：2018-07-01 系统凌晨维护','1',_binary '维护内容','0',103,1,'2024-04-28 14:51:26',NULL,NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'000000','代码生成',6,'org.dromara.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','\"trading_his,user,inst_push_info,copytrading_info\" \"master\"','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 16:05:12',190),(2,'000000','代码生成',8,'org.dromara.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tableIdStr\":\"1\"}','',0,'','2024-04-28 16:06:08',157),(3,'000000','菜单管理',1,'org.dromara.system.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":0,\"menuName\":\"okx\",\"orderNum\":1,\"path\":\"okx\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"money\",\"remark\":null}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 16:12:29',67),(4,'000000','菜单管理',2,'org.dromara.system.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-28 16:12:29\",\"updateBy\":null,\"updateTime\":null,\"menuId\":1624,\"parentId\":0,\"menuName\":\"okx\",\"orderNum\":1,\"path\":\"okx\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"money\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 16:12:54',25),(5,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 16:13:43\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"},\"tableId\":1,\"dataName\":\"master\",\"tableName\":\"copytrading_info\",\"tableComment\":\"交易员信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"CopytradingInfo\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"tradingInfo\",\"functionName\":\"交易员信息\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 16:13:43\",\"columnId\":1,\"tableId\":1,\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"insert\":false,\"query\":false,\"capJavaField\":\"Id\",\"increment\":true},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 16:13:43\",\"columnId\":2,\"tableId\":1,\"columnName\":\"name\",\"columnComment\":\"姓名\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"pk\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"query\":true,\"capJavaField\":\"Name\",\"increment\":false},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 16:13:43\",\"columnId\":3,\"tableId\":1,\"columnName\":\"unique_code\",\"columnComment\":\"平台唯一标识码\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"uniqueCode\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEd','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 16:13:43',101),(6,'000000','代码生成',8,'org.dromara.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tableIdStr\":\"1\"}','',0,'','2024-04-28 16:13:47',533),(7,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 16:30:35\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"},\"tableId\":1,\"dataName\":\"master\",\"tableName\":\"copytrading_info\",\"tableComment\":\"交易员信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"CopytradingInfo\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"copytradingInfo\",\"functionName\":\"交易员信息\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 16:30:35\",\"columnId\":1,\"tableId\":1,\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\",\"list\":true,\"edit\":true,\"usableColumn\":false,\"pk\":true,\"insert\":false,\"superColumn\":false},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 16:30:35\",\"columnId\":2,\"tableId\":1,\"columnName\":\"name\",\"columnComment\":\"姓名\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"query\":true,\"increment\":false,\"capJavaField\":\"Name\",\"list\":true,\"edit\":true,\"usableColumn\":false,\"pk\":false,\"insert\":true,\"superColumn\":false},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 16:30:35\",\"columnId\":3,\"tableId\":1,\"columnName\":\"unique_code\",\"columnComment\":\"平台唯一标识码\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"uniqueCode\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 16:30:35',186),(8,'000000','代码生成',8,'org.dromara.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tableIdStr\":\"1\"}','',0,'','2024-04-28 16:30:48',227),(9,'000000','字典类型',1,'org.dromara.system.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"交易员当前带单的持仓方向\",\"dictType\":\"trading_his_pos_side\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:00:38',99),(10,'000000','字典类型',1,'org.dromara.system.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"交易员当前带单的产品类型\",\"dictType\":\"trading_his_inst_type\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:00:49',30),(11,'000000','字典类型',1,'org.dromara.system.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"交易员当前带单的保证金模式\",\"dictType\":\"trading_his_mgn_mode\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:01:00',33),(12,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"开平仓模式开多\",\"dictValue\":\"long\",\"dictType\":\"trading_his_pos_side\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:02:03',50),(13,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"开平仓模式开空\",\"dictValue\":\"short\",\"dictType\":\"trading_his_pos_side\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:02:13',40),(14,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"netv\",\"dictValue\":\"买卖模式（subPos为正代表开多，subPos为负代表开空）\",\"dictType\":\"trading_his_pos_side\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:02:21',36),(15,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"币币\",\"dictValue\":\"SPOT\",\"dictType\":\"trading_his_inst_type\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:02:45',42),(16,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"永续合约\",\"dictValue\":\"SWAP\",\"dictType\":\"trading_his_inst_type\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:02:54',41),(17,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"逐仓\",\"dictValue\":\"isolated\",\"dictType\":\"trading_his_mgn_mode\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:03:10',58),(18,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"全仓\",\"dictValue\":\"cross\",\"dictType\":\"trading_his_mgn_mode\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:03:18',34),(19,'000000','字典类型',1,'org.dromara.system.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"交易员平台\",\"dictType\":\"copytrading_platform\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:05:04',24),(20,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"okx\",\"dictValue\":\"1\",\"dictType\":\"copytrading_platform\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:05:14',36),(21,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"币安\",\"dictValue\":\"2\",\"dictType\":\"copytrading_platform\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:05:36',38),(22,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"Bitget\",\"dictValue\":\"3\",\"dictType\":\"copytrading_platform\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:06:01',38),(23,'000000','字典类型',9,'org.dromara.system.controller.system.SysDictTypeController.refreshCache()','DELETE',1,'admin','研发部门','/system/dict/type/refreshCache','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:06:39',3),(24,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 17:08:57\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"},\"tableId\":1,\"dataName\":\"master\",\"tableName\":\"copytrading_info\",\"tableComment\":\"交易员信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"CopytradingInfo\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"copytradingInfo\",\"functionName\":\"交易员信息\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:08:57\",\"columnId\":1,\"tableId\":1,\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"usableColumn\":false,\"insert\":false,\"edit\":true,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:08:57\",\"columnId\":2,\"tableId\":1,\"columnName\":\"name\",\"columnComment\":\"姓名\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"pk\":false,\"usableColumn\":false,\"insert\":true,\"edit\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Name\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:08:57\",\"columnId\":3,\"tableId\":1,\"columnName\":\"unique_code\",\"columnComment\":\"标识码\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"uniqueCode\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEd','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:08:57',70),(25,'000000','代码生成',2,'org.dromara.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/1','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:09:03',266),(26,'000000','代码生成',2,'org.dromara.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/2','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:09:05',69),(27,'000000','代码生成',2,'org.dromara.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/3','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:09:07',87),(28,'000000','代码生成',2,'org.dromara.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/4','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:09:08',94),(29,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 17:10:32\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"},\"tableId\":1,\"dataName\":\"master\",\"tableName\":\"copytrading_info\",\"tableComment\":\"交易员信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"CopytradingInfo\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"copytradingInfo\",\"functionName\":\"交易员信息\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:10:32\",\"columnId\":1,\"tableId\":1,\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"usableColumn\":false,\"insert\":false,\"edit\":true,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:10:32\",\"columnId\":2,\"tableId\":1,\"columnName\":\"name\",\"columnComment\":\"姓名\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"pk\":false,\"usableColumn\":false,\"insert\":true,\"edit\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Name\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:10:32\",\"columnId\":3,\"tableId\":1,\"columnName\":\"unique_code\",\"columnComment\":\"标识码\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"uniqueCode\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEd','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:10:33',34),(30,'000000','代码生成',2,'org.dromara.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/2','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:13:24',51),(31,'000000','字典类型',1,'org.dromara.system.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"产品类型\",\"dictType\":\"trading_inst_type\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:15:48',24),(32,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"币币\",\"dictValue\":\"SPOT\",\"dictType\":\"trading_inst_type\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:16:06',42),(33,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"永续合约\",\"dictValue\":\"SWAP\",\"dictType\":\"trading_inst_type\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:17:21',37),(34,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"交割合约\",\"dictValue\":\"FUTURES\",\"dictType\":\"trading_inst_type\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:17:39',36),(35,'000000','字典数据',1,'org.dromara.system.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"期权\",\"dictValue\":\"OPTION\",\"dictType\":\"trading_inst_type\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:17:49',35),(36,'000000','字典类型',9,'org.dromara.system.controller.system.SysDictTypeController.refreshCache()','DELETE',1,'admin','研发部门','/system/dict/type/refreshCache','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:18:15',3),(37,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 17:19:27\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"},\"tableId\":2,\"dataName\":\"master\",\"tableName\":\"inst_push_info\",\"tableComment\":\"定时推送币信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"InstPushInfo\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"initpushInfo\",\"functionName\":\"定时推送币信息\",\"functionAuthor\":\"Lion Li\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:19:27\",\"columnId\":12,\"tableId\":2,\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"usableColumn\":false,\"insert\":false,\"edit\":true,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:19:27\",\"columnId\":13,\"tableId\":2,\"columnName\":\"name\",\"columnComment\":\"币的简称\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"pk\":false,\"usableColumn\":false,\"insert\":true,\"edit\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Name\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:19:27\",\"columnId\":14,\"tableId\":2,\"columnName\":\"inst_id\",\"columnComment\":\"产品id \",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"instId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEd','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:19:28',23),(38,'000000','代码生成',2,'org.dromara.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/3','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:19:35',66),(39,'000000','代码生成',2,'org.dromara.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/4','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:19:37',65),(40,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 17:23:36\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":3,\"dataName\":\"master\",\"tableName\":\"trading_his\",\"tableComment\":\"交易员带单历史表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"TradingHis\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.system\",\"moduleName\":\"system\",\"businessName\":\"his\",\"functionName\":\"交易员带单历史\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:23:36\",\"columnId\":22,\"tableId\":3,\"columnName\":\"id\",\"columnComment\":\"\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"usableColumn\":false,\"insert\":false,\"edit\":true,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:23:36\",\"columnId\":23,\"tableId\":3,\"columnName\":\"inst_id\",\"columnComment\":\"产品ID\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"instId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"pk\":false,\"usableColumn\":false,\"insert\":true,\"edit\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"InstId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:23:36\",\"columnId\":24,\"tableId\":3,\"columnName\":\"sub_pos_id\",\"columnComment\":\"带单仓位ID\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"subPosId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:23:37',41),(41,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 17:27:09\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"},\"tableId\":3,\"dataName\":\"master\",\"tableName\":\"trading_his\",\"tableComment\":\"交易员带单历史表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"TradingHis\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"tradinghis\",\"functionName\":\"交易员带单历史\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:27:09\",\"columnId\":22,\"tableId\":3,\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"usableColumn\":false,\"insert\":false,\"edit\":true,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:27:09\",\"columnId\":23,\"tableId\":3,\"columnName\":\"inst_id\",\"columnComment\":\"产品ID\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"instId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"pk\":false,\"usableColumn\":false,\"insert\":true,\"edit\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"InstId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:27:09\",\"columnId\":24,\"tableId\":3,\"columnName\":\"sub_pos_id\",\"columnComment\":\"带单仓位ID\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"subPosId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdi','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:27:09',37),(42,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 17:29:48\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":4,\"dataName\":\"master\",\"tableName\":\"user\",\"tableComment\":\"用户信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"User\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"user\",\"functionName\":\"用户信息\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:29:48\",\"columnId\":40,\"tableId\":4,\"columnName\":\"id\",\"columnComment\":\"用户ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"usableColumn\":false,\"insert\":false,\"edit\":true,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:29:48\",\"columnId\":41,\"tableId\":4,\"columnName\":\"username\",\"columnComment\":\"账号\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"username\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"pk\":false,\"usableColumn\":false,\"insert\":true,\"edit\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Username\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:29:48\",\"columnId\":42,\"tableId\":4,\"columnName\":\"password\",\"columnComment\":\"密码\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"password\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQue','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:29:49',31),(43,'000000','代码生成',8,'org.dromara.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tableIdStr\":\"1,2,3,4\"}','',0,'','2024-04-28 17:29:56',806),(44,'000000','菜单管理',2,'org.dromara.system.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-28 17:32:08\",\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1784515380670935042\",\"parentId\":1624,\"menuName\":\"用户信息\",\"orderNum\":1,\"path\":\"user\",\"component\":\"okx/user/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"okx:user:list\",\"icon\":\"#\",\"remark\":\"用户信息菜单\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:43:21',188),(45,'000000','代码生成',2,'org.dromara.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/3','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:44:04',335),(46,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 17:47:19\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"},\"tableId\":3,\"dataName\":\"master\",\"tableName\":\"trading_his\",\"tableComment\":\"交易员带单历史表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"TradingHis\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"tradinghis\",\"functionName\":\"交易员带单历史\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:47:19\",\"columnId\":22,\"tableId\":3,\"columnName\":\"id\",\"columnComment\":\"\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"superColumn\":false,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:47:19\",\"columnId\":23,\"tableId\":3,\"columnName\":\"inst_id\",\"columnComment\":\"产品ID\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"instId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"superColumn\":false,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"InstId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:47:19\",\"columnId\":24,\"tableId\":3,\"columnName\":\"sub_pos_id\",\"columnComment\":\"带单仓位ID\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"subPosId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\"','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:47:20',146),(47,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 17:50:03\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"},\"tableId\":4,\"dataName\":\"master\",\"tableName\":\"user\",\"tableComment\":\"用户信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"User\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"user\",\"functionName\":\"用户信息\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:50:03\",\"columnId\":40,\"tableId\":4,\"columnName\":\"id\",\"columnComment\":\"用户ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"superColumn\":false,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:50:03\",\"columnId\":41,\"tableId\":4,\"columnName\":\"username\",\"columnComment\":\"账号\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"username\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"superColumn\":false,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Username\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:50:03\",\"columnId\":42,\"tableId\":4,\"columnName\":\"password\",\"columnComment\":\"密码\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"password\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQ','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:50:03',45),(48,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 17:50:29\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"},\"tableId\":3,\"dataName\":\"master\",\"tableName\":\"trading_his\",\"tableComment\":\"交易员带单历史表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"TradingHis\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"tradinghis\",\"functionName\":\"交易员带单历史\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:50:29\",\"columnId\":22,\"tableId\":3,\"columnName\":\"id\",\"columnComment\":\"\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"superColumn\":false,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:50:29\",\"columnId\":23,\"tableId\":3,\"columnName\":\"inst_id\",\"columnComment\":\"产品ID\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"instId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"superColumn\":false,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"InstId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:50:29\",\"columnId\":24,\"tableId\":3,\"columnName\":\"sub_pos_id\",\"columnComment\":\"带单仓位ID\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"subPosId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\"','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:50:29',62),(49,'000000','代码生成',8,'org.dromara.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tableIdStr\":\"3\"}','',0,'','2024-04-28 17:50:53',289),(50,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 17:58:35\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"},\"tableId\":3,\"dataName\":\"master\",\"tableName\":\"trading_his\",\"tableComment\":\"交易员带单历史表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"TradingHis\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"tradinghis\",\"functionName\":\"交易员带单历史\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:58:35\",\"columnId\":22,\"tableId\":3,\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"usableColumn\":false,\"superColumn\":false,\"pk\":true,\"insert\":false,\"edit\":true,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:58:35\",\"columnId\":23,\"tableId\":3,\"columnName\":\"inst_id\",\"columnComment\":\"产品ID\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"instId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"usableColumn\":false,\"superColumn\":false,\"pk\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"InstId\",\"query\":true,\"increment\":false},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 17:58:35\",\"columnId\":24,\"tableId\":3,\"columnName\":\"sub_pos_id\",\"columnComment\":\"带单仓位ID\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"subPosId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdi','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 17:58:36',244),(51,'000000','代码生成',8,'org.dromara.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tableIdStr\":\"1\"}','',0,'','2024-04-28 18:05:56',679),(52,'000000','字典数据',2,'org.dromara.system.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-28 17:02:21\",\"updateBy\":null,\"updateTime\":null,\"dictCode\":41,\"dictSort\":0,\"dictLabel\":\"买卖模式（subPos为正代表开多，subPos为负代表开空）\",\"dictValue\":\"netv\",\"dictType\":\"trading_his_pos_side\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":\"N\",\"remark\":\"\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:09:40',96),(53,'000000','字典类型',9,'org.dromara.system.controller.system.SysDictTypeController.refreshCache()','DELETE',1,'admin','研发部门','/system/dict/type/refreshCache','127.0.0.1','内网IP','{}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:09:44',4),(54,'000000','交易员信息',1,'org.dromara.okx.controller.CopytradingInfoController.add()','POST',1,'admin','研发部门','/okx/copytradingInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":3,\"name\":\"墙头草\",\"uniqueCode\":\"D5E7A8430A35CA84\",\"recomIndex\":\"4\",\"platform\":\"1\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:12:41',27),(55,'000000','交易员信息',1,'org.dromara.okx.controller.CopytradingInfoController.add()','POST',1,'admin','研发部门','/okx/copytradingInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":4,\"name\":\" Plymouth \",\"uniqueCode\":\"A8AF8AFFAB6051B3\",\"recomIndex\":\"5\",\"platform\":\"1\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:14:39',22),(56,'000000','交易员信息',1,'org.dromara.okx.controller.CopytradingInfoController.add()','POST',1,'admin','研发部门','/okx/copytradingInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":5,\"name\":\"CopyTradeGPT\",\"uniqueCode\":\"B884F39CE972EB2A\",\"recomIndex\":\"5\",\"platform\":\"1\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:15:29',19),(57,'000000','交易员信息',1,'org.dromara.okx.controller.CopytradingInfoController.add()','POST',1,'admin','研发部门','/okx/copytradingInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":6,\"name\":\"明明明宏\",\"uniqueCode\":\"24D8CE79A97FD35D\",\"recomIndex\":\"4\",\"platform\":\"1\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:18:15',23),(58,'000000','交易员信息',2,'org.dromara.okx.controller.CopytradingInfoController.edit()','PUT',1,'admin','研发部门','/okx/copytradingInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":6,\"name\":\"明明明宏\",\"uniqueCode\":\"24D8CE79A97FD35D\",\"recomIndex\":\"5\",\"platform\":\"1\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:18:29',17),(59,'000000','交易员信息',1,'org.dromara.okx.controller.CopytradingInfoController.add()','POST',1,'admin','研发部门','/okx/copytradingInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":7,\"name\":\"雪球王\",\"uniqueCode\":\"DDF529A6117DBB92\",\"recomIndex\":\"5\",\"platform\":\"1\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:19:16',16),(60,'000000','交易员信息',1,'org.dromara.okx.controller.CopytradingInfoController.add()','POST',1,'admin','研发部门','/okx/copytradingInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":8,\"name\":\"小风险，大收益\",\"uniqueCode\":\"3714F8E8EFCB56D4\",\"recomIndex\":\"4\",\"platform\":\"1\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:19:54',20),(61,'000000','OSS对象存储',1,'org.dromara.system.controller.system.SysOssController.upload()','POST',1,'admin','研发部门','/resource/oss/upload','127.0.0.1','内网IP','','',1,'创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: no further information]','2024-04-28 18:20:29',2427),(62,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 18:21:05\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"},\"tableId\":4,\"dataName\":\"master\",\"tableName\":\"user\",\"tableComment\":\"用户信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"User\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"user\",\"functionName\":\"用户信息\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 18:21:05\",\"columnId\":40,\"tableId\":4,\"columnName\":\"id\",\"columnComment\":\"用户ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"insert\":false,\"usableColumn\":false,\"superColumn\":false,\"edit\":true,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 18:21:05\",\"columnId\":41,\"tableId\":4,\"columnName\":\"username\",\"columnComment\":\"账号\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"username\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"pk\":false,\"insert\":true,\"usableColumn\":false,\"superColumn\":false,\"edit\":true,\"query\":true,\"increment\":false,\"capJavaField\":\"Username\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 18:21:05\",\"columnId\":42,\"tableId\":4,\"columnName\":\"password\",\"columnComment\":\"密码\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"password\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQ','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:21:05',134),(63,'000000','代码生成',2,'org.dromara.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-28 18:23:28\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1624\"},\"tableId\":4,\"dataName\":\"master\",\"tableName\":\"user\",\"tableComment\":\"用户信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"User\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.okx\",\"moduleName\":\"okx\",\"businessName\":\"user\",\"functionName\":\"用户信息\",\"functionAuthor\":\"cc\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 18:23:28\",\"columnId\":40,\"tableId\":4,\"columnName\":\"id\",\"columnComment\":\"用户ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"edit\":true,\"superColumn\":false,\"insert\":false,\"usableColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 18:23:28\",\"columnId\":41,\"tableId\":4,\"columnName\":\"username\",\"columnComment\":\"账号\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"username\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"pk\":false,\"edit\":true,\"superColumn\":false,\"insert\":true,\"usableColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Username\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-28 16:05:11\",\"updateBy\":1,\"updateTime\":\"2024-04-28 18:23:28\",\"columnId\":42,\"tableId\":4,\"columnName\":\"password\",\"columnComment\":\"密码\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"password\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQ','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:23:28',176),(64,'000000','用户信息',1,'org.dromara.okx.controller.UserController.add()','POST',1,'admin','研发部门','/okx/user','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":1,\"username\":\"15516995759\",\"nickName\":\"陈志坤\",\"avatar\":null,\"tel\":\"15516995759\",\"dingTel\":\"15516995759\",\"qq\":null,\"sex\":\"0\",\"introduction\":null,\"lastLoginTime\":null}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:23:56',31),(65,'000000','定时推送币信息',1,'org.dromara.okx.controller.InstPushInfoController.add()','POST',1,'admin','研发部门','/okx/initpushInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":1,\"name\":\"比特币\",\"instId\":\"BTC-USDT\",\"instType\":\"SPOT\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:26:41',23),(66,'000000','定时推送币信息',1,'org.dromara.okx.controller.InstPushInfoController.add()','POST',1,'admin','研发部门','/okx/initpushInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":2,\"name\":\"ETH\",\"instId\":\"ETH-USDT\",\"instType\":\"SPOT\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:26:59',16),(67,'000000','定时推送币信息',2,'org.dromara.okx.controller.InstPushInfoController.edit()','PUT',1,'admin','研发部门','/okx/initpushInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":1,\"name\":\"BTC\",\"instId\":\"BTC-USDT\",\"instType\":\"SPOT\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:27:05',69),(68,'000000','定时推送币信息',1,'org.dromara.okx.controller.InstPushInfoController.add()','POST',1,'admin','研发部门','/okx/initpushInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":3,\"name\":\"DOGE\",\"instId\":\"DOGE-USDT\",\"instType\":\"SPOT\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:27:17',14),(69,'000000','定时推送币信息',1,'org.dromara.okx.controller.InstPushInfoController.add()','POST',1,'admin','研发部门','/okx/initpushInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":4,\"name\":\"SOL\",\"instId\":\"SOL-USDT\",\"instType\":\"SPOT\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:27:29',21),(70,'000000','定时推送币信息',1,'org.dromara.okx.controller.InstPushInfoController.add()','POST',1,'admin','研发部门','/okx/initpushInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":5,\"name\":\"MEME\",\"instId\":\"MEME-USDT\",\"instType\":\"SPOT\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:27:44',16),(71,'000000','定时推送币信息',1,'org.dromara.okx.controller.InstPushInfoController.add()','POST',1,'admin','研发部门','/okx/initpushInfo','127.0.0.1','内网IP','{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":6,\"name\":\"PEPE\",\"instId\":\"PEPE-USDT\",\"instType\":\"SPOT\"}','{\"code\":200,\"msg\":\"操作成功\",\"data\":null}',0,'','2024-04-28 18:27:58',17);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss`
--

DROP TABLE IF EXISTS `sys_oss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss` (
  `oss_id` bigint NOT NULL AUTO_INCREMENT COMMENT '对象存储主键',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) NOT NULL COMMENT 'URL地址',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '上传人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `service` varchar(20) NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='OSS对象存储表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss`
--

LOCK TABLES `sys_oss` WRITE;
/*!40000 ALTER TABLE `sys_oss` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss_config`
--

DROP TABLE IF EXISTS `sys_oss_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss_config` (
  `oss_config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主建',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `config_key` varchar(20) NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) DEFAULT '' COMMENT '域',
  `access_policy` char(1) NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) DEFAULT '' COMMENT '扩展字段',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='对象存储配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss_config`
--

LOCK TABLES `sys_oss_config` WRITE;
/*!40000 ALTER TABLE `sys_oss_config` DISABLE KEYS */;
INSERT INTO `sys_oss_config` VALUES (1,'000000','minio','ruoyi','ruoyi123','ruoyi','','127.0.0.1:9000','','N','','1','0','',103,1,'2024-04-28 14:51:26',1,'2024-04-28 14:51:26',NULL),(2,'000000','qiniu','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','ruoyi','','s3-cn-north-1.qiniucs.com','','N','','1','1','',103,1,'2024-04-28 14:51:26',1,'2024-04-28 14:51:26',NULL),(3,'000000','aliyun','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','ruoyi','','oss-cn-beijing.aliyuncs.com','','N','','1','1','',103,1,'2024-04-28 14:51:26',1,'2024-04-28 14:51:26',NULL),(4,'000000','qcloud','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','ruoyi-1250000000','','cos.ap-beijing.myqcloud.com','','N','ap-beijing','1','1','',103,1,'2024-04-28 14:51:26',1,'2024-04-28 14:51:26',NULL),(5,'000000','image','ruoyi','ruoyi123','ruoyi','image','127.0.0.1:9000','','N','','1','1','',103,1,'2024-04-28 14:51:26',1,'2024-04-28 14:51:26',NULL);
/*!40000 ALTER TABLE `sys_oss_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'000000','ceo','董事长',1,'0',103,1,'2024-04-28 14:51:23',NULL,NULL,''),(2,'000000','se','项目经理',2,'0',103,1,'2024-04-28 14:51:23',NULL,NULL,''),(3,'000000','hr','人力资源',3,'0',103,1,'2024-04-28 14:51:23',NULL,NULL,''),(4,'000000','user','普通员工',4,'0',103,1,'2024-04-28 14:51:23',NULL,NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'000000','超级管理员','superadmin',1,'1',1,1,'0','0',103,1,'2024-04-28 14:51:23',NULL,NULL,'超级管理员'),(2,'000000','普通角色','common',2,'2',1,1,'0','0',103,1,'2024-04-28 14:51:23',NULL,NULL,'普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1050),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,1061),(2,1062),(2,1063),(2,1064),(2,1065);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_social`
--

DROP TABLE IF EXISTS `sys_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_social` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) DEFAULT NULL COMMENT '租户id',
  `auth_id` varchar(255) NOT NULL COMMENT '平台+平台唯一id',
  `source` varchar(255) NOT NULL COMMENT '用户来源',
  `open_id` varchar(255) DEFAULT NULL COMMENT '平台编号唯一id',
  `user_name` varchar(30) NOT NULL COMMENT '登录账号',
  `nick_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `email` varchar(255) DEFAULT '' COMMENT '用户邮箱',
  `avatar` varchar(500) DEFAULT '' COMMENT '头像地址',
  `access_token` varchar(255) NOT NULL COMMENT '用户的授权令牌',
  `expire_in` int DEFAULT NULL COMMENT '用户的授权令牌的有效期，部分平台可能没有',
  `refresh_token` varchar(255) DEFAULT NULL COMMENT '刷新令牌，部分平台可能没有',
  `access_code` varchar(255) DEFAULT NULL COMMENT '平台的授权信息，部分平台可能没有',
  `union_id` varchar(255) DEFAULT NULL COMMENT '用户的 unionid',
  `scope` varchar(255) DEFAULT NULL COMMENT '授予的权限，部分平台可能没有',
  `token_type` varchar(255) DEFAULT NULL COMMENT '个别平台的授权信息，部分平台可能没有',
  `id_token` varchar(255) DEFAULT NULL COMMENT 'id token，部分平台可能没有',
  `mac_algorithm` varchar(255) DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `mac_key` varchar(255) DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `code` varchar(255) DEFAULT NULL COMMENT '用户的授权code，部分平台可能没有',
  `oauth_token` varchar(255) DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `oauth_token_secret` varchar(255) DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='社会化关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_social`
--

LOCK TABLES `sys_social` WRITE;
/*!40000 ALTER TABLE `sys_social` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_tenant`
--

DROP TABLE IF EXISTS `sys_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_tenant` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(20) NOT NULL COMMENT '租户编号',
  `contact_user_name` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `company_name` varchar(50) DEFAULT NULL COMMENT '企业名称',
  `license_number` varchar(30) DEFAULT NULL COMMENT '统一社会信用代码',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `intro` varchar(200) DEFAULT NULL COMMENT '企业简介',
  `domain` varchar(200) DEFAULT NULL COMMENT '域名',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `package_id` bigint DEFAULT NULL COMMENT '租户套餐编号',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `account_count` int DEFAULT '-1' COMMENT '用户数量（-1不限制）',
  `status` char(1) DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='租户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_tenant`
--

LOCK TABLES `sys_tenant` WRITE;
/*!40000 ALTER TABLE `sys_tenant` DISABLE KEYS */;
INSERT INTO `sys_tenant` VALUES (1,'000000','管理组','15888888888','XXX有限公司',NULL,NULL,'多租户通用后台管理管理系统',NULL,NULL,NULL,NULL,-1,'0','0',103,1,'2024-04-28 14:51:23',NULL,NULL);
/*!40000 ALTER TABLE `sys_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_tenant_package`
--

DROP TABLE IF EXISTS `sys_tenant_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_tenant_package` (
  `package_id` bigint NOT NULL AUTO_INCREMENT COMMENT '租户套餐id',
  `package_name` varchar(20) DEFAULT NULL COMMENT '套餐名称',
  `menu_ids` varchar(3000) DEFAULT NULL COMMENT '关联菜单id',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='租户套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_tenant_package`
--

LOCK TABLES `sys_tenant_package` WRITE;
/*!40000 ALTER TABLE `sys_tenant_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_tenant_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` bigint DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'000000',103,'admin','cc','sys_user','1320122344@qq.com','15888888888','0',NULL,'$2a$10$K5PJnf9.bPp1bpFQOMJ/ier9seoMf5v9bRPKrMgVlonkbf1VtshDi','0','0','127.0.0.1','2024-04-28 16:10:13',103,1,'2024-04-28 14:51:23',1,'2024-04-28 16:10:13','管理员'),(2,'000000',105,'lionli','疯狂的狮子Li','sys_user','crazyLionLi@qq.com','15666666666','1',NULL,'$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','2','127.0.0.1','2024-04-28 14:51:23',103,1,'2024-04-28 14:51:23',NULL,NULL,'测试员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trading_his`
--

DROP TABLE IF EXISTS `trading_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trading_his` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inst_id` varchar(255) NOT NULL COMMENT '产品ID',
  `sub_pos_id` varchar(255) NOT NULL COMMENT '带单仓位ID',
  `pos_side` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '持仓方向\r\nlong：开平仓模式开多\r\nshort：开平仓模式开空\r\nnet：买卖模式（subPos为正代表开多，subPos为负代表开空）',
  `mgn_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '保证金模式\r\nisolated：逐仓 ；cross：全仓',
  `lever` varchar(255) NOT NULL COMMENT '杠杆倍数',
  `open_avg_px` varchar(255) NOT NULL COMMENT '开仓均价',
  `open_time` varchar(255) NOT NULL COMMENT '开仓时间',
  `open_time_date` datetime NOT NULL COMMENT '开仓时间',
  `sub_pos` varchar(255) NOT NULL COMMENT '持仓张数',
  `inst_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品类型\r\nSPOT：币币\r\nSWAP：永续合约',
  `margin` varchar(255) NOT NULL COMMENT '保证金',
  `upl` varchar(255) NOT NULL COMMENT '未实现收益',
  `upl_ratio` varchar(255) NOT NULL COMMENT '未实现收益率',
  `mark_px` varchar(255) DEFAULT NULL COMMENT '最新标记价格（仅适用于合约）',
  `unique_code` varchar(255) NOT NULL COMMENT '交易员唯一标识代码',
  `ccy` varchar(255) NOT NULL COMMENT '币种',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trading_his_unique_code_IDX` (`unique_code`) USING BTREE,
  KEY `trading_his_open_time_date_IDX` (`open_time_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='交易员带单历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trading_his`
--

LOCK TABLES `trading_his` WRITE;
/*!40000 ALTER TABLE `trading_his` DISABLE KEYS */;
INSERT INTO `trading_his` VALUES (54,'AAVE-USDT-SWAP','704516453744320512','long','cross','20','91.33','1714241811855','2024-04-28 02:16:52','712','SWAP','325.1348','67.64','0.208036789663856','92.28','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0'),(55,'KSM-USDT-SWAP','704516397339320320','long','cross','20','29.67','1714241798407','2024-04-28 02:16:38','154','SWAP','22.8459','8.316','0.364004044489384','30.21','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0'),(56,'KSM-USDT-SWAP','704512157850083328','long','cross','20','29.86','1714240787634','2024-04-28 01:59:48','765','SWAP','114.2145','26.775','0.234427327528466','30.21','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0'),(57,'AAVE-USDT-SWAP','704510458058055680','long','cross','20','91.58','1714240382372','2024-04-28 01:53:02','750','SWAP','343.425','52.5','0.152871806071194','92.28','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0'),(58,'COMP-USDT-SWAP','704510327485177856','long','cross','20','57.04','1714240351241','2024-04-28 01:52:31','1530','SWAP','436.356','93.33','0.213884992987378','57.65','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0'),(59,'KSM-USDT-SWAP','704509967936856064','long','cross','20','29.7978133333333332','1714240265518','2024-04-28 01:51:06','1500','SWAP','223.483599999999999','61.82800000000002','0.276655647215276','30.21','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0'),(60,'EOS-USDT-SWAP','703643099676090368','long','cross','20','0.8188','1714033588019','2024-04-25 16:26:28','854','SWAP','349.6276','13.664','0.039081582804104','0.8204','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0'),(61,'EOS-USDT-SWAP','703641213375946752','long','cross','20','0.8577','1714033138290','2024-04-25 16:18:58','803','SWAP','344.36655','-299.519','-0.86976798414364','0.8204','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0'),(62,'EOS-USDT-SWAP','703595314570403840','long','cross','20','0.8563','1714022195162','2024-04-25 13:16:35','864','SWAP','369.9216','-310.176','-0.838491182996614','0.8204','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0'),(63,'EOS-USDT-SWAP','703546180752711680','long','cross','20','0.8941','1714010480747','2024-04-25 10:01:21','649','SWAP','290.13545','-478.313','-1.648585169444134','0.8204','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0'),(64,'EOS-USDT-SWAP','703545920894607360','long','cross','20','0.9304584795321636','1714010418792','2024-04-25 10:00:19','684','SWAP','318.2167999999999512','-752.799999999999024','-2.365682767220332','0.8204','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0'),(65,'EOS-USDT-SWAP','703542932700471296','long','cross','20','0.9490779166666666','1714009706351','2024-04-25 09:48:26','720','SWAP','341.668049999999976','-926.48099999999952','-2.711640728479','0.8204','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0'),(66,'EOS-USDT-SWAP','703542854539616256','long','cross','20','0.9407','1714009687716','2024-04-25 09:48:08','600','SWAP','282.21','-721.8','-2.55766982034655','0.8204','032805718789399F','USDT','000000',NULL,NULL,NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `trading_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) NOT NULL COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像URL',
  `tel` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `ding_tel` varchar(20) DEFAULT NULL COMMENT '钉钉艾特的手机号码',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ号码',
  `sex` char(1) DEFAULT NULL COMMENT '用户性别（0男 1女 2未知）',
  `introduction` varchar(255) DEFAULT NULL COMMENT '简介',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `create_by` int DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0：未删除，1：已删除）',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'15516995759','123456','陈志坤',NULL,'15516995759','15516995759',NULL,'0',NULL,NULL,1,'2024-04-28 18:23:56',1,'2024-04-28 18:23:56','0','000000',103);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'okx'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-28 18:28:45
