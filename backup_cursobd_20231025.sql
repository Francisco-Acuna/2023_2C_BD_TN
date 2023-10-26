CREATE DATABASE  IF NOT EXISTS `cursobd` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `cursobd`;
-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: cursobd
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `amigos`
--

DROP TABLE IF EXISTS `amigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amigos` (
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amigos`
--

LOCK TABLES `amigos` WRITE;
/*!40000 ALTER TABLE `amigos` DISABLE KEYS */;
INSERT INTO `amigos` VALUES ('Agustín','González'),('Jorge','García'),('Malena','Fernández'),('Juan','Gardoni'),('Fernando','Flores'),('Juan','Novoa'),('Marcelo','Galván'),('María','Guerra'),('Marcela','Nuñez'),('Analía','Ponce'),('Juan Pablo','López'),('Marcelo','Peña'),('Juan Pablo','Nuñez'),('Pedro','Sanchez'),('Pedro','Sanchez'),('Pedro','Sanchez'),('Pedro','Sanchez'),('Juan','Lopez'),('Tomás','Pepsi'),('María','Picapiedra');
/*!40000 ALTER TABLE `amigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` double NOT NULL,
  `stock` int(11) NOT NULL,
  `stockMinimo` smallint(6) NOT NULL,
  `stockMaximo` smallint(6) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'destornillador',1638.7499999999998,200,100,500),(2,'tornillo',114.99999999999999,2000,10,1000),(200,'martillo Hammer',16387.5,200,10,1000),(500,'pinza amperométrica',32775,200,10,1000),(550,'cable x mt',546.25,5000,10,1000),(551,'pinza',2185,500,10,1000),(552,'soldador',5462.5,200,10,1000),(553,'pala',1638.7499999999998,400,10,1000),(554,'tijera',546.25,200,10,1000),(555,'foco de luz',1857.2499999999998,200,10,1000),(556,'maza',8740,1000,10,1000),(557,'cinta métrica',3278.5924999999993,200,10,1000);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` char(8) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Jose','Grillo','11334466',NULL),(2,'Lorena','García','56359874',NULL),(3,'Pablo','Fuentes','21053119',NULL),(4,'Lorena','Gardoni','98999888',NULL),(5,'Lorena','Flores','12345678',NULL),(6,'Lorena','Novoa','12334443',NULL),(7,'Lorena','Galván','88999888',NULL),(8,'Lorena','Guerra','78787877',NULL),(10,'Lorena','Ponce','55000222',NULL),(12,'Lorena','Peña','66444555',NULL),(14,'Santiago','Etcheverría','35320124',NULL),(16,'Lucas','Rodriguez','43910249',NULL),(17,'Tatiana','Acosta','64759532',NULL),(20,'Tomas','Coca Cola','12345678',NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes2`
--

DROP TABLE IF EXISTS `clientes2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes2` (
  `codigo` int(11) NOT NULL DEFAULT 0,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` char(8) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes2`
--

LOCK TABLES `clientes2` WRITE;
/*!40000 ALTER TABLE `clientes2` DISABLE KEYS */;
INSERT INTO `clientes2` VALUES (1,'Agustín','González','22333444','Paso 1521'),(2,'Jorge','García','56359874','Lanús 2042'),(3,'Malena','Fernández','33568568','España 123'),(4,'Juan','Gardoni','98999888','Lavalle 1236'),(5,'Fernando','Flores','12345678','Belgrano 122'),(6,'Juan','Novoa','12334443','Belgrano 2033'),(7,'Marcelo','Galván','88999888','Salta 242'),(8,'María','Guerra','78787877','Bragado 777'),(9,'Marcela','Nuñez','98765432','Azul 232'),(10,'Analía','Ponce','55000222','Lavalle 82'),(11,'Juan Pablo','López','11000333','Salta 789'),(12,'Marcelo','Peña','66444555',''),(13,'Juan Pablo','Nuñez','77666555',NULL);
/*!40000 ALTER TABLE `clientes2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `letra` char(1) NOT NULL,
  `numero` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` double NOT NULL,
  PRIMARY KEY (`letra`,`numero`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`letra` in ('A','B','C'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES ('A',1,'1993-07-27',200),('A',2,'2003-08-05',550),('A',3,'2023-09-27',13000),('B',1,'1993-01-09',300),('C',1,'2023-09-27',1700);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nombres`
--

DROP TABLE IF EXISTS `nombres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nombres` (
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nombres`
--

LOCK TABLES `nombres` WRITE;
/*!40000 ALTER TABLE `nombres` DISABLE KEYS */;
INSERT INTO `nombres` VALUES ('Agustín'),('Jorge'),('Malena'),('Juan'),('Fernando'),('Marcelo'),('María'),('Marcela'),('Analía'),('Juan Pablo');
/*!40000 ALTER TABLE `nombres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-25 21:51:39
