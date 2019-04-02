-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: carangos
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `senha` char(32) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'Diovane','827ccb0eea8a706c4c34a16891f84e7b','diovane.gabriel@gmail.com','51991493845'),(3,'Wagner','202cb962ac59075b964b07152d234b70','wagnerjk91@gmail.com',''),(4,'Carlos Schneider','202cb962ac59075b964b07152d234b70','cszneider@gmail.com','51999887765'),(5,'Vinicius','202cb962ac59075b964b07152d234b70','vlinden@tca.com.br','');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(10) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `placa` varchar(8) DEFAULT NULL,
  `tipo` int(1) DEFAULT NULL,
  `quilometragem` int(10) DEFAULT NULL,
  `ano` int(4) DEFAULT NULL,
  `valor` decimal(18,2) DEFAULT NULL,
  `observacoes` varchar(2000) DEFAULT NULL,
  `situacao` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `veiculo_fk` (`usuario_id`),
  CONSTRAINT `veiculo_fk` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,2,'BMW M3 3.0 24V','ILX4077',0,977,2017,399700.00,'Air Bag\r\nAir Bag Duplo\r\nAlarme\r\nAr Condicionado\r\nAr Condicionado Digital\r\nAr Quente\r\nBanco de Couro\r\nBanco Elétrico\r\nBanco Regulável Altura\r\nCâmera de Ré\r\nChave Reserva\r\nComputador de Bordo\r\nControle de Estabilidade\r\nControle de Tração\r\nDesembaçador Traseiro\r\nDireção Elétrica\r\nDireção Escamoteável\r\nDireção Multifuncional\r\nEstribo\r\nFaróis Auxiliares\r\nFreios ABS\r\nGPS\r\nLimpador Traseiro\r\nManual do proprietário\r\nMedia Nav\r\nMultimídia\r\nPaddle Shift / Borboleta\r\nParachoques na cor\r\nPartida Elétrica\r\nPiloto Automatico\r\nProtetor de Carter\r\nRetrovisor Elétrico\r\nRetrovisor Rabatimento Aut.\r\nRodas de Liga Leve\r\nSensor de Chuva\r\nSensor de Estacionamento\r\nSistema Keyless\r\nSom Bluetooth\r\nSom no Volante\r\nSom Original\r\nSom Rádio\r\nSom Rádio CD\r\nSom Rádio DVD\r\nSom Rádio MP3\r\nSpoiler\r\nStart Stop\r\nTeto Solar\r\nTração 4x2\r\nTravas Elétricas\r\nTurbo\r\nVidros Elétricos\r\nVidros Verdes\r\nXenon',1),(2,2,'BMW F650 GS','IXP0980',1,9000,2016,38990.00,'Carenagem\r\nCavalete central\r\nFreio abs\r\nPartida eletrica\r\nPneus originais\r\nRoda liga-leve',1),(3,3,'Ford RANGER 2.2 XLS 4X4 CD 16V','ilx9092',0,3000,2017,134990.00,'Air Bag\r\nAir Bag Duplo\r\nAlarme\r\nAr Condicionado\r\nAr Quente\r\nCabine Dupla\r\nCapota Marítima\r\nChave Reserva\r\nControle de Tração\r\nDesembaçador Traseiro\r\nDireção Hidráulica\r\nEstribo\r\nFaróis Auxiliares\r\nFreios ABS\r\nManual do proprietário\r\nParachoques na cor\r\nProtetor de Caçamba\r\nRetrovisor Elétrico\r\nRodas de Liga Leve\r\nSom Rádio\r\nSom Rádio CD\r\nTração 4x4\r\nTravas Elétricas\r\nVidros Elétricos',1),(4,3,'Chevrolet CELTA 1.0 MPFI VHC 8V','ITG6884',0,62000,2015,26000.00,'Air Bag Duplo\r\nAlarme\r\nAr Condicionado\r\nAr Quente\r\nComputador de Bordo\r\nDesembaçador Traseiro\r\nDireção Hidráulica\r\nFreios ABS\r\nSom Rádio\r\nTravas Elétricas\r\nVidros Elétricos',1),(5,2,'Ford 1929','IOO1929',0,0,1929,115000.00,'Licenciado\r\nPeça de Colecionador',1),(6,2,'FERRARI CALIFORNIA 4.3 GT CONVERSIVEL V8 32V','FER2018',0,0,2012,980000.00,'Air Bag\r\nAir Bag Duplo\r\nAr Condicionado\r\nAr Quente\r\nBanco de Couro\r\nBanco Regulável Altura\r\nControle de Estabilidade\r\nControle de Tração\r\nDesembaçador Traseiro\r\nDireção Escamoteável\r\nDireção Hidráulica\r\nFaróis Auxiliares\r\nFreios ABS\r\nMultimídia\r\nPelícula Solar\r\nPiloto Automatico\r\nPorta Malas Elétrico\r\nProtetor de Carter\r\nRetrovisor Elétrico\r\nRodas de Liga Leve\r\nSensor de Estacionamento\r\nSom no Volante\r\nSom Rádio\r\nSom Rádio CD\r\nTravas Elétricas\r\nVidros Elétricos',1),(7,2,'FERRARI F360 3.6 F1 MODENA V8 40V','FER2000',0,32000,2000,398000.00,'Com 32.000KM Originais, Toda Revisada, Em Estado Impecável c/ Escapamento Challenge.',1),(8,2,'JEEP COMPASS 2.0 SPORT 4X2 16V','JEE2012',0,20000,2018,105000.00,'0 KM , ENTRE EM CONTATO E CONSULTE NOVOS ORÇAMENTOS. 051 3594 1338 051 81057222 (WHATS)',1),(9,4,'Fusca','XYZ9933',0,100000,1970,10000.00,'1.600 sem estepe',0),(10,5,'Punto 1.4','iwl9100',0,90000,2013,30000.00,'Vai que acha um loco',1),(11,2,'DeLorean DMC-12','abc2015',0,10000000,1985,50000.00,'Teste teste',1);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo_imagem`
--

DROP TABLE IF EXISTS `veiculo_imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo_imagem` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `veiculo_id` int(10) DEFAULT NULL,
  `caminho` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `veiculo_imagem_fk` (`veiculo_id`),
  CONSTRAINT `veiculo_imagem_fk` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo_imagem`
--

LOCK TABLES `veiculo_imagem` WRITE;
/*!40000 ALTER TABLE `veiculo_imagem` DISABLE KEYS */;
INSERT INTO `veiculo_imagem` VALUES (41,11,'C:\\Workspace\\Carangos\\WebContent\\assets\\img\\11\\DeLorean-DMC-12-02.jpg'),(42,11,'C:\\Workspace\\Carangos\\WebContent\\assets\\img\\11\\delorean-dmc-12-back-1024x585.jpg');
/*!40000 ALTER TABLE `veiculo_imagem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-01 22:53:50
