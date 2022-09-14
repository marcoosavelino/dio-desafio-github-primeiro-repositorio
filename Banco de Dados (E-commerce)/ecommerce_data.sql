-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Pnome` varchar(10) DEFAULT NULL,
  `NmeioInicial` char(1) DEFAULT NULL,
  `Sobrenome` varchar(20) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrega` (
  `id_entrega` int(11) NOT NULL AUTO_INCREMENT,
  `status_entrega` varchar(30) NOT NULL,
  `cod_rastreio` int(11) NOT NULL,
  `fk_id_pedido` int(11) NOT NULL,
  PRIMARY KEY (`id_entrega`),
  UNIQUE KEY `cod_rastreio` (`cod_rastreio`),
  KEY `fk_id_pedido` (`fk_id_pedido`),
  CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`fk_id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `id_estoque` int(11) NOT NULL AUTO_INCREMENT,
  `local_estoque` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_estoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forma_pagamento` (
  `id_forma_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_nome` varchar(20) NOT NULL,
  `prazo_compensacao_` varchar(20) DEFAULT NULL,
  `nome_cartao` varchar(45) DEFAULT NULL,
  `numero_cartao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_forma_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(50) DEFAULT NULL,
  `cnpj` char(14) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` char(14) DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `cnpj` (`cnpj`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefone` (`telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `status_pedido` enum('Em andamento','Processando','Enviado','Entregue') NOT NULL DEFAULT 'Em andamento',
  `descricao` text DEFAULT NULL,
  `frete` float DEFAULT NULL,
  `fk_id_cliente` int(11) NOT NULL,
  `valor_total` float DEFAULT NULL,
  `fk_id_vendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_id_cliente` (`fk_id_cliente`),
  KEY `id_fk_vendedor` (`fk_id_vendedor`),
  CONSTRAINT `id_fk_vendedor` FOREIGN KEY (`fk_id_vendedor`) REFERENCES `vendedor_terceiro` (`id_vendedor`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pfisica`
--

DROP TABLE IF EXISTS `pfisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pfisica` (
  `id_pfisica` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` char(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone_celular` varchar(14) NOT NULL,
  `fk_id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_pfisica`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `telefone_celular` (`telefone_celular`),
  KEY `fk_id_cliente` (`fk_id_cliente`),
  CONSTRAINT `pfisica_ibfk_1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pfisica`
--

LOCK TABLES `pfisica` WRITE;
/*!40000 ALTER TABLE `pfisica` DISABLE KEYS */;
/*!40000 ALTER TABLE `pfisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjuridica`
--

DROP TABLE IF EXISTS `pjuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjuridica` (
  `id_pjuridica` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(50) NOT NULL,
  `cnpj` char(14) NOT NULL,
  `inscricao_estadual` char(9) NOT NULL,
  `fk_id_cliente` int(11) NOT NULL,
  `telefone_fixo` varchar(13) NOT NULL,
  `telefone_celular` varchar(14) NOT NULL,
  PRIMARY KEY (`id_pjuridica`),
  UNIQUE KEY `cnpj` (`cnpj`),
  UNIQUE KEY `inscricao_estadual` (`inscricao_estadual`),
  UNIQUE KEY `telefone_fixo` (`telefone_fixo`),
  UNIQUE KEY `telefone_celular` (`telefone_celular`),
  KEY `fk_id_cliente` (`fk_id_cliente`),
  CONSTRAINT `pjuridica_ibfk_1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjuridica`
--

LOCK TABLES `pjuridica` WRITE;
/*!40000 ALTER TABLE `pjuridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(20) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `valor_unit` float DEFAULT NULL,
  `fk_id_fornecedor` int(11) NOT NULL,
  `avaliacao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_id_fornecedor` (`fk_id_fornecedor`),
  CONSTRAINT `fk_id_fornecedor` FOREIGN KEY (`fk_id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qtd_produto_estoque`
--

DROP TABLE IF EXISTS `qtd_produto_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qtd_produto_estoque` (
  `fk_id_produto` int(11) NOT NULL,
  `fk_id_estoque` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 0,
  KEY `fk_id_produto` (`fk_id_produto`),
  KEY `fk_id_estoque` (`fk_id_estoque`),
  CONSTRAINT `qtd_produto_estoque_ibfk_1` FOREIGN KEY (`fk_id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `qtd_produto_estoque_ibfk_2` FOREIGN KEY (`fk_id_estoque`) REFERENCES `estoque` (`id_estoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qtd_produto_estoque`
--

LOCK TABLES `qtd_produto_estoque` WRITE;
/*!40000 ALTER TABLE `qtd_produto_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `qtd_produto_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_compra`
--

DROP TABLE IF EXISTS `registro_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_compra` (
  `id_registro_compra` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_forma_pagamento` int(11) NOT NULL,
  `fk_id_pedido` int(11) NOT NULL,
  `fk_id_cliente` int(11) NOT NULL,
  `fk_id_entrega` int(11) NOT NULL,
  `fk_id_vendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_registro_compra`),
  KEY `fk_id_forma_pagamento` (`fk_id_forma_pagamento`),
  KEY `fk_id_pedido` (`fk_id_pedido`),
  KEY `fk_id_cliente` (`fk_id_cliente`),
  KEY `fk_id_entrega` (`fk_id_entrega`),
  KEY `fk_id_vendedor` (`fk_id_vendedor`),
  CONSTRAINT `fk_id_vendedor` FOREIGN KEY (`fk_id_vendedor`) REFERENCES `vendedor_terceiro` (`id_vendedor`),
  CONSTRAINT `registro_compra_ibfk_1` FOREIGN KEY (`fk_id_forma_pagamento`) REFERENCES `forma_pagamento` (`id_forma_pagamento`),
  CONSTRAINT `registro_compra_ibfk_2` FOREIGN KEY (`fk_id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `registro_compra_ibfk_3` FOREIGN KEY (`fk_id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `registro_compra_ibfk_4` FOREIGN KEY (`fk_id_entrega`) REFERENCES `entrega` (`id_entrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_compra`
--

LOCK TABLES `registro_compra` WRITE;
/*!40000 ALTER TABLE `registro_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacao_produto_pedido`
--

DROP TABLE IF EXISTS `relacao_produto_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacao_produto_pedido` (
  `fk_id_produto` int(11) NOT NULL,
  `fk_id_pedido` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  KEY `fk_id_produto` (`fk_id_produto`),
  KEY `fk_id_pedido` (`fk_id_pedido`),
  CONSTRAINT `relacao_produto_pedido_ibfk_1` FOREIGN KEY (`fk_id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `relacao_produto_pedido_ibfk_2` FOREIGN KEY (`fk_id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacao_produto_pedido`
--

LOCK TABLES `relacao_produto_pedido` WRITE;
/*!40000 ALTER TABLE `relacao_produto_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacao_produto_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor_terceiro`
--

DROP TABLE IF EXISTS `vendedor_terceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor_terceiro` (
  `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `razao_social` varchar(50) DEFAULT NULL,
  `local_vendedor` varchar(50) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_terceiro`
--

LOCK TABLES `vendedor_terceiro` WRITE;
/*!40000 ALTER TABLE `vendedor_terceiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor_terceiro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-14 13:20:27
