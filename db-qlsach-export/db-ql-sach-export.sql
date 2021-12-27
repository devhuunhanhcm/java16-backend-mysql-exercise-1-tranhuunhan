-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_QLBanSach
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `chi_tiet_tac_gia_sach`
--

DROP TABLE IF EXISTS `chi_tiet_tac_gia_sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_tac_gia_sach` (
  `ma_tac_gia` int NOT NULL,
  `ma_sach` int NOT NULL,
  `vai_tro` varchar(255) NOT NULL,
  `vi_tri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ma_tac_gia`,`ma_sach`),
  KEY `fk_sach` (`ma_sach`),
  CONSTRAINT `fk_sach` FOREIGN KEY (`ma_sach`) REFERENCES `sach` (`ma_sach`),
  CONSTRAINT `fk_tac_gia` FOREIGN KEY (`ma_tac_gia`) REFERENCES `tac_gia` (`ma_tac_gia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_tac_gia_sach`
--

LOCK TABLES `chi_tiet_tac_gia_sach` WRITE;
/*!40000 ALTER TABLE `chi_tiet_tac_gia_sach` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_tac_gia_sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chu_de`
--

DROP TABLE IF EXISTS `chu_de`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chu_de` (
  `ma_chu_de` int NOT NULL AUTO_INCREMENT,
  `ten_chu_de` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_chu_de`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chu_de`
--

LOCK TABLES `chu_de` WRITE;
/*!40000 ALTER TABLE `chu_de` DISABLE KEYS */;
/*!40000 ALTER TABLE `chu_de` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_hang`
--

DROP TABLE IF EXISTS `don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_hang` (
  `ma_don_hang` int NOT NULL AUTO_INCREMENT,
  `ngay_dat` datetime NOT NULL,
  `ngay_giao` datetime NOT NULL,
  `tinh_trang_don_hang` varchar(255) NOT NULL,
  `da_thanh_toan` bit(1) NOT NULL,
  `ma_khach_hang` int NOT NULL,
  PRIMARY KEY (`ma_don_hang`),
  KEY `fk_don_hang_ma_kh` (`ma_khach_hang`),
  CONSTRAINT `fk_don_hang_ma_kh` FOREIGN KEY (`ma_khach_hang`) REFERENCES `khach_hang` (`ma_khach_hang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_hang`
--

LOCK TABLES `don_hang` WRITE;
/*!40000 ALTER TABLE `don_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_hang_chi_tiet`
--

DROP TABLE IF EXISTS `don_hang_chi_tiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_hang_chi_tiet` (
  `ma_sach` int NOT NULL,
  `ma_don_hang` int NOT NULL,
  `so_luong` int NOT NULL,
  `don_gia` float NOT NULL,
  PRIMARY KEY (`ma_sach`,`ma_don_hang`),
  KEY `fk_ma_don_hang` (`ma_don_hang`),
  CONSTRAINT `fk_ma_don_hang` FOREIGN KEY (`ma_don_hang`) REFERENCES `don_hang` (`ma_don_hang`),
  CONSTRAINT `fk_ma_sach` FOREIGN KEY (`ma_sach`) REFERENCES `sach` (`ma_sach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_hang_chi_tiet`
--

LOCK TABLES `don_hang_chi_tiet` WRITE;
/*!40000 ALTER TABLE `don_hang_chi_tiet` DISABLE KEYS */;
/*!40000 ALTER TABLE `don_hang_chi_tiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach_hang`
--

DROP TABLE IF EXISTS `khach_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khach_hang` (
  `ma_khach_hang` int NOT NULL AUTO_INCREMENT,
  `ho_ten` varchar(255) NOT NULL,
  `tai_khoan` varchar(255) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dia_chi` varchar(255) NOT NULL,
  `dien_thoai` varchar(20) NOT NULL,
  `gioi_tinh` char(5) NOT NULL,
  `ngay_sinh` date DEFAULT NULL,
  PRIMARY KEY (`ma_khach_hang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach_hang`
--

LOCK TABLES `khach_hang` WRITE;
/*!40000 ALTER TABLE `khach_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khach_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nha_xuat_ban`
--

DROP TABLE IF EXISTS `nha_xuat_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nha_xuat_ban` (
  `ma_nxb` int NOT NULL AUTO_INCREMENT,
  `ten_nxb` varchar(255) NOT NULL,
  `dia_chi` varchar(255) NOT NULL,
  `dien_thoai` varchar(20) NOT NULL,
  PRIMARY KEY (`ma_nxb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nha_xuat_ban`
--

LOCK TABLES `nha_xuat_ban` WRITE;
/*!40000 ALTER TABLE `nha_xuat_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `nha_xuat_ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sach`
--

DROP TABLE IF EXISTS `sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sach` (
  `ma_sach` int NOT NULL AUTO_INCREMENT,
  `gia_sach` float NOT NULL,
  `mo_ta` varchar(255) NOT NULL,
  `anh_bia` varchar(255) NOT NULL,
  `ngay_cap_nhat` datetime NOT NULL,
  `so_luong_ton` int NOT NULL,
  `ma_chu_de` int NOT NULL,
  `ma_nxb` int NOT NULL,
  PRIMARY KEY (`ma_sach`),
  KEY `fk_sach_chu_de` (`ma_chu_de`),
  KEY `fk_sach_nxb` (`ma_nxb`),
  CONSTRAINT `fk_sach_chu_de` FOREIGN KEY (`ma_chu_de`) REFERENCES `chu_de` (`ma_chu_de`),
  CONSTRAINT `fk_sach_nxb` FOREIGN KEY (`ma_nxb`) REFERENCES `nha_xuat_ban` (`ma_nxb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sach`
--

LOCK TABLES `sach` WRITE;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tac_gia`
--

DROP TABLE IF EXISTS `tac_gia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tac_gia` (
  `ma_tac_gia` int NOT NULL AUTO_INCREMENT,
  `ten_tac_gia` varchar(255) NOT NULL,
  `dia_chi` varchar(255) NOT NULL,
  `tieu_su` varchar(255) DEFAULT NULL,
  `dien_thoai` varchar(20) NOT NULL,
  PRIMARY KEY (`ma_tac_gia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tac_gia`
--

LOCK TABLES `tac_gia` WRITE;
/*!40000 ALTER TABLE `tac_gia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tac_gia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-27 19:46:50
