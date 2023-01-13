CREATE DATABASE  IF NOT EXISTS `db_2018102102` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_2018102102`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: db_2018102102
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `drink`
--

DROP TABLE IF EXISTS `drink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drink` (
  `drink_id` int NOT NULL,
  `drink_name` varchar(30) NOT NULL,
  `price` int NOT NULL,
  `calorie` int NOT NULL,
  `carbonated` char(1) NOT NULL,
  `dicount` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`drink_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drink`
--

LOCK TABLES `drink` WRITE;
/*!40000 ALTER TABLE `drink` DISABLE KEYS */;
INSERT INTO `drink` VALUES (1,'제주 한라봉 칠러',2000,300,'0','0'),(2,'애플망고 칠러',2100,310,'0','1'),(3,'배 칠러',2700,330,'0','0'),(4,'카페라떼',2000,104,'0','0'),(5,'디카페인 카페라떼',2200,194,'0','1'),(6,'아이스 카페라떼',2000,104,'0','0'),(7,'아메리카노',1000,9,'0','0'),(8,'디카페인 아메리카노',1200,10,'0','1'),(9,'아이스 아메리카노',1000,9,'0','0'),(10,'카푸치노',2000,85,'0','1'),(11,'디카페인 카푸치노',2400,80,'0','1'),(12,'에스프레소',1500,6,'0','0'),(13,'디카페인 에스프레소',1800,8,'0','0'),(14,'드립 커피',1000,7,'0','1'),(15,'아이스 드립 커피',1000,7,'0','0'),(16,'바닐라 쉐이크',2500,344,'0','0'),(17,'딸기 쉐이크',2400,350,'0','1'),(18,'초코 쉐이크',2500,343,'0','0'),(19,'오렌지 주스',1800,44,'0','0'),(20,'코카콜라',1300,143,'1','0'),(21,'코카콜라 제로',1800,0,'1','0'),(22,'스프라이트',1300,149,'1','0'),(23,'환타 오렌지맛',1300,62,'1','1'),(24,'생수',1200,0,'0','0'),(25,'우유',1500,130,'0','0'),(26,'음료',1200,130,'0','1'),(27,'밀키스',1200,130,'1','1'),(28,'미린다',1400,120,'1','1'),(29,'음료예시',1400,120,'1','1');
/*!40000 ALTER TABLE `drink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `burger_id` int NOT NULL,
  `food_name` varchar(30) NOT NULL,
  `price` int NOT NULL,
  `calorie` int NOT NULL,
  `vegetable` varchar(50) DEFAULT NULL,
  `discount` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`burger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'트리플 치즈버거',5600,619,'1','0'),(2,'빅맥',4600,583,'1','0'),(3,'맥스파이시 상하이 버거',4600,494,'0','1'),(4,'1955 버거',7200,536,'1','0'),(5,'더블 필레오피쉬',5000,481,'0','0'),(6,'필레 오 피쉬',3500,342,'0','0'),(7,'맥치킨 모짜렐라',4800,688,'1','1'),(8,'맥치킨',3300,483,'0','0'),(9,'더블 불고기 버거',4400,677,'1','1'),(10,'에그 불고기 버거',2500,514,'1','1'),(11,'불고기 버거',3900,430,'0','0'),(12,'슈슈 버거',4500,432,'1','1'),(13,'슈비 버거',5500,563,'1','1'),(14,'베이컨 토마토 디럭스',5500,545,'1','1'),(15,'더블 쿼터파운더 치즈',5200,770,'0','1'),(16,'쿼터차운더 치즈',5000,535,'1','0'),(17,'치즈버거',2000,317,'1','0'),(18,'더블 치즈버거',4400,478,'0','1'),(19,'햄버거',2000,256,'1','0'),(20,'베이컨 토마토 에그 머핀',3600,327,'1','0'),(21,'치킨 치즈 머핀',3200,452,'1','0'),(22,'애그 맥 머핀',3000,292,'1','0'),(23,'베이컨 에그 맥머핀',3000,290,'1','0'),(24,'소시지 에그 맥머핀',3000,452,'0','1'),(25,'상하이 치킨 스낵랩',1500,283,'1','1'),(26,'디럭스 브렉퍼스트',4800,780,'0','1'),(27,'핫케익 3조각',3700,331,'0','1'),(28,'핫케익 2조각',2400,220,'0','0'),(29,'케이준 비프 스낵랩',1500,312,'0','0');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `order_id` int NOT NULL,
  `menu_info` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `drink_drink_id` int DEFAULT NULL,
  `food_burger_id` int DEFAULT NULL,
  `user_user_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_drink_idx` (`drink_drink_id`),
  KEY `fk_order_food1_idx` (`food_burger_id`),
  KEY `fk_order_user1_idx` (`user_user_id`),
  CONSTRAINT `fk_order_drink` FOREIGN KEY (`drink_drink_id`) REFERENCES `drink` (`drink_id`),
  CONSTRAINT `fk_order_food1` FOREIGN KEY (`food_burger_id`) REFERENCES `food` (`burger_id`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,'필레 오 피쉬','2021-06-01 12:54:38',NULL,NULL,6),(2,'햄버거','2021-06-01 18:04:29',NULL,NULL,3),(3,'환타 오렌지맛','2021-06-02 23:31:11',NULL,NULL,4),(4,'우유','2021-06-04 11:43:22',NULL,NULL,1),(5,'햄버거','2021-06-04 11:46:54',NULL,NULL,5),(6,'불고기 버거','2021-06-04 23:59:00',NULL,NULL,2),(7,'제주 한라봉 칠러','2021-06-06 13:45:48',NULL,NULL,5),(8,'케이준 비프 스낵랩','2021-06-07 01:22:45',NULL,NULL,6);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `phone` char(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'!!!','1011111111'),(2,'@@@','1022222222'),(3,'###','1033333333'),(4,'$$$','1044444444'),(5,'%%%','1055555555'),(6,'^^^','1066666666');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-13  0:02:39
