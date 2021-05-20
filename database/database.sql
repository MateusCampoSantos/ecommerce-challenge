CREATE DATABASE  IF NOT EXISTS `banco-workbench` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banco-workbench`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: banco-workbench
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idAddress` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `publicPlace` varchar(45) NOT NULL,
  `publicPlaceAddress` varchar(255) NOT NULL,
  `numberAddress` int NOT NULL,
  `complementAddress` varchar(45) DEFAULT NULL,
  `cep` varchar(8) NOT NULL,
  `districtAddress` varchar(45) NOT NULL,
  `cityStateAddress` int NOT NULL,
  `clientID` int NOT NULL,
  PRIMARY KEY (`idAddress`),
  KEY `fkCityStates_idx` (`cityStateAddress`),
  KEY `fkClient_idx` (`clientID`),
  CONSTRAINT `fkCityStates` FOREIGN KEY (`cityStateAddress`) REFERENCES `citystates` (`idCityStates`),
  CONSTRAINT `fkClientId` FOREIGN KEY (`clientID`) REFERENCES `clients` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Residencial','Avenida','Av. Amazonas',5046,'Casa','35914789','Centro',1,1),(2,'Comercial','Rua','Rua Rio Tigre',456,'Apartamento, Bloco 2','32456789','Novo Riacho',2,2),(3,'Residencial','Avenida','Av. Porto Alegre',4789,'Loja','94123654','Cidade Nova',3,4),(4,'Residencial','Rua','Rua. Tietê',45,'Casa B','65987145','Bangu',4,3);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citystates`
--

DROP TABLE IF EXISTS `citystates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citystates` (
  `idCityStates` int NOT NULL AUTO_INCREMENT,
  `city` varchar(100) NOT NULL,
  `states` varchar(100) NOT NULL,
  PRIMARY KEY (`idCityStates`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citystates`
--

LOCK TABLES `citystates` WRITE;
/*!40000 ALTER TABLE `citystates` DISABLE KEYS */;
INSERT INTO `citystates` VALUES (1,'Belo Horizonte','Minas Gerais'),(2,'Contagem','Minas Gerais'),(3,'Itaperuna','Rio de Janeiro'),(4,'Rio de Janeiro','Rio de Janeiro');
/*!40000 ALTER TABLE `citystates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `nameClient` varchar(255) NOT NULL,
  `emailClient` varchar(255) NOT NULL,
  `whatsClient` varchar(45) DEFAULT NULL,
  `passwordClient` varchar(10) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Mateus','mateus@mateus.com','+55(31)97898-6545','123456ab'),(2,'Marcos','marcos@marcos.com','+55(31)97487-6512','654987bc'),(3,'Elaine','elaine@elaine.com','+55(37)99845-6587','elaine456'),(4,'Anna','anna@anna.com','+55(11)98798-1234','annanna');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `idDepartment` int NOT NULL AUTO_INCREMENT,
  `nameDepartment` varchar(100) NOT NULL,
  PRIMARY KEY (`idDepartment`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Adaptadores'),(2,'Ferramentas'),(3,'Eletronicos'),(4,'Casa'),(5,'Acessorios'),(6,'Moveis'),(7,'Tablets e Celulares'),(8,'Games'),(9,'Informatica');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `codProduct` varchar(45) NOT NULL,
  `descriptionProduct` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `available` int NOT NULL,
  `highlight` int DEFAULT NULL,
  `department` int NOT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `fkDepartment_idx` (`department`),
  CONSTRAINT `fkDepartment` FOREIGN KEY (`department`) REFERENCES `departments` (`idDepartment`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'25754','ADAPTADOR BLUETOOH USB RECEPTOR DE AUDIO P2',5,1,1,1),(2,'20212','ADAPTADOR CONECTOR HDMI FEMEA L / FEMEA',2.8,1,1,1),(3,'11719','ALICATE PARA CRIMPAR TL-315 3 EM 1',15,1,1,2),(4,'15883','CADEADO SEGURANCA PARA NOTEBOOK HLD F\\u0026K LLAVE',6.5,1,0,2),(5,'23213','ANTENA P/TV DIGITAL KOLKE KVV288 INTERNA VHF/UHF/FHD PRETO',9,1,1,3),(6,'18092','APRESENTADOR LASER SATELLITE LR-26R PRETO',8,0,0,3),(7,'26414','ASPIRADOR NAPPO NLAR-063 ROBOT WIFI 350ML PRETO',87,1,0,4),(8,'26333','BABA ELETRONICA MOTOROLA MBP161TIMER BRANCO',36.5,1,1,4),(9,'16845','BASTAO SELFIE BLUETOOTH HAVIT HV-BTM33 PRETO',8.1,1,1,5),(10,'8971','BATERIA GOLINE ALKALINE 9V 500MAH',1.2,1,1,5),(11,'27065','CADEIRA GAMER HAVIT 922 GAMENOTE VERMELHO',185,1,0,6),(12,'20437','CADEIRA GAMER MTEK MK01 PRETO/AZUL',175,0,0,6),(13,'24672','CEL SAMSUNG A31 A315G 4GB/128GB AZUL DUAL SIM LTE 6.4',204.5,1,1,7),(14,'27131','TABLET AMAZON FIRE  HD8 KIDS EDITION 2GB/32GB AZUL WIFI/QUAD CORE 8\\u0027\\u0027',99,1,0,7),(15,'23734','CONSOLE NINTENDO SWITCH LITE DH-S-YAZAA AMARELO',205,0,0,8),(16,'26335','CONSOLE SONY PS4 SLIM 1TB CUH-2215B PRETO BIVOLT',382,1,1,8),(17,'27707','FONE C/ MICROFONE JBL C50HI PRETO',7,1,1,9),(18,'25963','IMPRESSORA  XIAOMI FOTOGRAFICA MI PORTABLE PHOTO PRINTER TEJ4018GL BLUETOOTH BRANCO',48.9,1,0,9);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestclients`
--

DROP TABLE IF EXISTS `requestclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requestclients` (
  `idRequestClient` int NOT NULL AUTO_INCREMENT,
  `codRequest` int NOT NULL,
  `dateRequest` datetime NOT NULL,
  `statusRequest` int NOT NULL,
  `clientRequest` int NOT NULL,
  PRIMARY KEY (`idRequestClient`),
  KEY `fkStatus_idx` (`statusRequest`),
  KEY `fkClient_idx` (`clientRequest`),
  CONSTRAINT `fkClient` FOREIGN KEY (`clientRequest`) REFERENCES `clients` (`idClient`),
  CONSTRAINT `fkStatus` FOREIGN KEY (`statusRequest`) REFERENCES `requeststatus` (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestclients`
--

LOCK TABLES `requestclients` WRITE;
/*!40000 ALTER TABLE `requestclients` DISABLE KEYS */;
INSERT INTO `requestclients` VALUES (1,1,'2021-05-19 00:00:00',3,1),(2,2,'2021-05-17 00:00:00',5,2),(3,3,'2021-05-01 00:00:00',8,4);
/*!40000 ALTER TABLE `requestclients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestproducts`
--

DROP TABLE IF EXISTS `requestproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requestproducts` (
  `idRequestProduct` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `priceProduct` double NOT NULL,
  `chosenQuantity` int NOT NULL,
  `totalAmount` double NOT NULL,
  `request` int NOT NULL,
  PRIMARY KEY (`idRequestProduct`),
  KEY `fkpedido_idx` (`request`),
  CONSTRAINT `fkrequest` FOREIGN KEY (`request`) REFERENCES `requestclients` (`idRequestClient`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestproducts`
--

LOCK TABLES `requestproducts` WRITE;
/*!40000 ALTER TABLE `requestproducts` DISABLE KEYS */;
INSERT INTO `requestproducts` VALUES (1,'CONSOLE SONY PS4 SLIM 1TB CUH-2215B PRETO BIVOLT',382,1,382,1),(2,'TABLET AMAZON FIRE  HD8 KIDS EDITION 2GB/32GB AZUL WIFI/QUAD CORE 8\\u0027\\u0027',99,2,198,1),(3,'CEL SAMSUNG A31 A315G 4GB/128GB AZUL DUAL SIM LTE 6.4',204.5,1,204.5,1),(4,'CADEIRA GAMER HAVIT 922 GAMENOTE VERMELHO',185,3,555,2),(5,'BABA ELETRONICA MOTOROLA MBP161TIMER BRANCO',36.5,1,36.5,3);
/*!40000 ALTER TABLE `requestproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requeststatus`
--

DROP TABLE IF EXISTS `requeststatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requeststatus` (
  `idStatus` int NOT NULL AUTO_INCREMENT,
  `statusr` varchar(100) NOT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requeststatus`
--

LOCK TABLES `requeststatus` WRITE;
/*!40000 ALTER TABLE `requeststatus` DISABLE KEYS */;
INSERT INTO `requeststatus` VALUES (1,'Novo pedido'),(2,'Cancelado'),(3,'Aguardando pagamento'),(4,'Pagamento autorizado'),(5,'Pagamento negado'),(6,'Em separação'),(7,'Em transporte'),(8,'Entregue');
/*!40000 ALTER TABLE `requeststatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `idStock` int NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`idStock`),
  KEY `fkProductStock_idx` (`productId`),
  CONSTRAINT `fkProductStock` FOREIGN KEY (`productId`) REFERENCES `products` (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,1,15),(2,2,1),(3,3,45),(4,4,10),(5,5,20),(6,6,0),(7,7,41),(8,8,9),(9,9,1),(10,10,4),(11,11,6),(12,12,0),(13,13,5),(14,14,8),(15,15,0),(16,16,7),(17,17,10),(18,18,3);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20  9:23:51
