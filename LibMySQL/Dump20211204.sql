--
-- Current Database: `wksistemas`
--

/*!40000 DROP DATABASE IF EXISTS `%s` */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `wksistemas` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `wksistemas`;

-- MySQL dump 10.13  Distrib 5.7.30, for Win32 (AMD64)
--
-- Host: localhost    Database: wksistemas
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `PKCodCli` bigint NOT NULL COMMENT 'Código do Cliente',
  `Nome` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Nome do Cliente',
  `Cidade` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Nome da cidade do Cliente',
  `UF` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`PKCodCli`),
  UNIQUE KEY `Codigo` (`PKCodCli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Marcelo Fortes','Blumenau','SC'),(2,'Theo de Raad','Florianópolis','SC'),(3,'Adriana Abenantti','São luis','MA'),(4,'Wander Taffo','Rio de Janeiro','RJ'),(5,'Reisidalt Coulto','São Luis','MA'),(6,'Eder Mancinni','São Paulo','SP'),(7,'Chrystian Revelles Gatti','Santa Maria','RS'),(8,'Carlos Appel','Caxias do Sul','RS'),(9,'Marcos Dornelles','Florianópolis','SC'),(10,'Hans Wolfgang Kürsten','Joinville','SC'),(11,'Waléria Mainoth','São luis ','MA'),(12,'Fabiano Jansen Müller','São Luis','MA'),(13,'Carla Senna','São Luis ','MA'),(14,'Flavia Isa Cristina','Cuiabá','MT'),(15,'Keyla Cristina','São Luis ','MA'),(16,'André Lima Mourão','São luis','MA'),(17,'Bruno Soltis','São Joaquim do Sul','SC'),(18,'Jonas Hoffmann','Blumenau','SC'),(19,'Hendrik Abenante Fortes','São Luis','SC'),(20,'Franz Hartmann','Caxoeirinha','RS');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidosdadosgerais`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidosdadosgerais` (
  `NumPedido` bigint NOT NULL AUTO_INCREMENT,
  `DataEmisao` date DEFAULT NULL COMMENT 'Data de emissão',
  `FkCodCli` bigint DEFAULT NULL,
  `ValorTotal` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`NumPedido`),
  UNIQUE KEY `NumPedido` (`NumPedido`),
  KEY `FK_Cod_Cli` (`FkCodCli`),
  CONSTRAINT `FK_Cod_Cli` FOREIGN KEY (`FkCodCli`) REFERENCES `clientes` (`PKCodCli`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosdadosgerais`
--

LOCK TABLES `pedidosdadosgerais` WRITE;
/*!40000 ALTER TABLE `pedidosdadosgerais` DISABLE KEYS */;
INSERT INTO `pedidosdadosgerais` VALUES (5,'2021-12-04',1,379.95),(6,'2021-12-04',2,120.00),(7,'2021-12-04',3,631.93),(8,'2021-12-04',4,726.78);
/*!40000 ALTER TABLE `pedidosdadosgerais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidosprodutos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidosprodutos` (
  `Autoincrem` bigint NOT NULL AUTO_INCREMENT,
  `FkNumeroPedido` bigint DEFAULT NULL,
  `FkCodProd` bigint DEFAULT NULL,
  `Qtd` int DEFAULT NULL COMMENT 'Qnatidade',
  `VlrUnitario` decimal(15,2) DEFAULT NULL,
  `VlrTotal` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`Autoincrem`),
  KEY `FK_Numero_Pedido` (`FkNumeroPedido`),
  KEY `tmp_ems_index_144` (`FkCodProd`,`FkNumeroPedido`,`Autoincrem`) USING BTREE,
  CONSTRAINT `FK_Codigo_Produto` FOREIGN KEY (`FkCodProd`) REFERENCES `produtos` (`PkCodProd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Numero_Pedido` FOREIGN KEY (`FkNumeroPedido`) REFERENCES `pedidosdadosgerais` (`NumPedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosprodutos`
--

LOCK TABLES `pedidosprodutos` WRITE;
/*!40000 ALTER TABLE `pedidosprodutos` DISABLE KEYS */;
INSERT INTO `pedidosprodutos` VALUES (5,5,1,2,4.00,8.00),(6,5,2,3,4.00,12.00),(7,5,4,3,39.99,119.97),(8,5,5,1,60.00,60.00),(9,5,6,2,89.99,179.98),(10,6,5,2,60.00,120.00),(11,7,3,4,45.50,182.00),(12,7,4,6,39.99,239.94),(13,7,5,2,60.00,120.00),(14,7,6,1,89.99,89.99),(15,8,5,3,60.00,180.00),(16,8,6,2,89.99,179.98),(17,8,7,2,15.60,31.20),(18,8,8,3,20.00,60.00),(19,8,9,4,68.90,275.60);
/*!40000 ALTER TABLE `pedidosprodutos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `PkCodProd` bigint NOT NULL AUTO_INCREMENT COMMENT 'Codigo do produto',
  `Descricao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PrecoVenda` decimal(15,2) NOT NULL COMMENT 'Preço de venda do produto',
  PRIMARY KEY (`PkCodProd`),
  UNIQUE KEY `Codigo` (`PkCodProd`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Maçã',4.00),(2,'Pêra',4.00),(3,'Camisa Polo',45.50),(4,'Caderno espiralado capa dura',39.99),(5,'Calça Jeans Skinny',60.00),(6,'Cadeira plástica',89.99),(7,'Baygon Spray',15.60),(8,'Camisa regata algodão',20.00),(9,'Bermuda jeans',68.90),(10,'Jarra com copos',30.00),(11,'Tênis Nike pump',399.00),(12,'Smartphone GXX',999.00),(13,'Notebook Alien',999.00),(14,'Trenzinho de Brinquedo',20.00),(15,'Cadeira praiana',59.90),(16,'Perfume masculinho madeira',200.00),(17,'Adesivo Tigre PVC ',5.20),(18,'Parafuso de roda',1.00),(19,'Lixa d\'água',0.70),(20,'Flange Tirgre',12.50);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-04 13:25:32
