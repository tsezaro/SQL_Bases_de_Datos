-- MySQL dump 10.13  Distrib 5.6.41, for Win64 (x86_64)
--
-- Host: localhost    Database: salvadora
-- ------------------------------------------------------
-- Server version	5.6.41-log

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
-- Current Database: `salvadora`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `salvadora` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `salvadora`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `CI` int(15) NOT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `direccion` tinytext,
  `telefono` int(10) DEFAULT NULL,
  PRIMARY KEY (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1830258,'SOLEDAD','FLORES','CALLE 4 z olivos',6654812),(1834505,'DELICIA','CORTEZ','CALLE 56 z green',7254872),(1880804,'RAMIRO','BENITEZ','CALLE 2 z golveta',2579457),(1892870,'LAURA','CRUZ','plaza avaroa',1235798),(2233046,'MERCEDES','MIRANDA','CALLE f z leon',7112081),(5008608,'EDWIN','RAMIREZ','CALLE 12 z fuel',7888021),(5543170,'EDDIE','PERALTA','CALLE 67 z golketa',7985412),(5785085,'JAIME','CRUZ','CALLE 80 z miraflores',7548352),(5798046,'WILDER','ARMELLA','CALLE R z pinos',7885428),(7193156,'LUCERO','RAMIEZZ','CALLE 5 z golbert',12374387);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `CI` int(13) NOT NULL DEFAULT '0',
  `COD_PRODUCTO` int(13) NOT NULL DEFAULT '0',
  `FECHA_COMPRA` date DEFAULT NULL,
  `CANTIDAD` int(15) DEFAULT NULL,
  PRIMARY KEY (`CI`,`COD_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1830258,107,'2019-08-05',2),(1834505,102,'2019-08-02',2),(1880804,108,'2019-08-06',4),(1892870,109,'2019-08-05',1),(2233046,103,'2019-08-02',2),(5008608,106,'2019-08-04',1),(5543170,104,'2019-08-03',4),(5785085,105,'2019-08-01',2),(5798046,103,'2019-08-01',3),(7193156,110,'2019-08-06',3);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `COD_PRODUCTO` int(13) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(22) DEFAULT NULL,
  `MARCA` varchar(22) DEFAULT NULL,
  `COLOR` varchar(22) DEFAULT NULL,
  `MODELO` varchar(22) DEFAULT NULL,
  `STOCK` int(100) DEFAULT NULL,
  `PRECIO` int(100) DEFAULT NULL,
  PRIMARY KEY (`COD_PRODUCTO`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (100,'licuadora','stk','blanco','jty-371',10,2500),(101,'lavajilla','balay','blanco','ju-301',15,31000),(102,'lavadora','sansung','gris','ity-65',15,700),(103,'cocina','dako','blanco','wqe-34',30,2400),(104,'Cafetera','eletrolux','blanco','ui-95',34,1250),(105,'tostadora','vidaelect','negro','ewq-65',15,2300),(106,'secadora','fell','azul','32-uy',34,2400),(107,'horno','continental','negro','12-fr',20,2120),(108,'lavadora','continental','negro','23-ip',24,3000),(109,'horno','continental','negro','81-th',10,1800),(110,'licuadora','electrolux','azul','10-br',24,4000),(111,'lavadora','oster','negro','17-nl',15,1250),(112,'sumidora','bsh','rojo','10-kl',15,1250),(113,'tostadora','continental','negro','13-am',30,2400),(114,'cocina','continental','verde','70-dm',34,2300),(115,'refrigerador','dako','gris','19-bf',20,3000),(116,'batidora','bsh','negro','96-za',10,1800),(117,'cafetera','continental','gris','ev-20',24,2300),(118,'refrigerador','continental','rojo','ay-90',15,1800),(119,'tostadora','bsh','blanco','77-kd',18,4000),(120,'sumidora','continental','rojo','34-tb',16,1250),(121,'licuadora','fell','verde','59-ax',16,1300),(122,'cocina','electrolux','negro','30-em',28,1500);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provee`
--

DROP TABLE IF EXISTS `provee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provee` (
  `ID_PROVEEDOR` int(10) NOT NULL DEFAULT '0',
  `COD_PRODUCTO` int(8) NOT NULL DEFAULT '0',
  `FECHA` date DEFAULT NULL,
  `CANTIDAD` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID_PROVEEDOR`,`COD_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provee`
--

LOCK TABLES `provee` WRITE;
/*!40000 ALTER TABLE `provee` DISABLE KEYS */;
INSERT INTO `provee` VALUES (1201,101,'2019-04-01',12),(1201,110,'2019-04-04',40),(1201,116,'2019-04-07',24),(1201,120,'2019-04-07',40),(1201,123,'2019-04-08',20),(2015,100,'2019-04-01',40),(2015,106,'2019-04-02',12),(2015,113,'2019-04-06',26),(2015,121,'2019-04-07',12),(2018,102,'2019-04-01',20),(2018,103,'2019-04-01',24),(2018,109,'2019-04-03',15),(2018,112,'2019-04-05',24),(2018,115,'2019-04-07',14),(2018,117,'2019-04-07',15),(2018,119,'2019-04-07',20),(2018,122,'2019-04-10',40),(2371,104,'2019-04-01',40),(2371,107,'2019-04-02',20),(2371,108,'2019-04-02',24),(2371,112,'2019-04-06',20),(2371,121,'2019-04-09',12),(3249,102,'2019-04-01',15),(3249,105,'2019-04-02',20),(3249,108,'2019-04-03',40),(3249,110,'2019-04-10',15),(3249,111,'2019-04-04',20),(3249,118,'2019-04-07',24),(3249,122,'2019-04-08',25);
/*!40000 ALTER TABLE `provee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `ID_PROVEEDOR` int(10) NOT NULL DEFAULT '0',
  `NOMBRE` varchar(20) DEFAULT NULL,
  `DIRECCION` varchar(30) DEFAULT NULL,
  `TELEFONO` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID_PROVEEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1201,'DISMAC','CALLE 32 Z. SEYA',1279432),(2015,'LA PRIMERA','CALLE A Z. KOLVER',2256788),(2018,'DORADO','CALLE 4 Z. OLIVOS',1694328),(2371,'COPACABANA','CALLE 6 Z. OBRAJES',7885412),(3249,'AURORA','CALLE 12 Z. SAN PEDRO',77364189);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-15 21:40:51
