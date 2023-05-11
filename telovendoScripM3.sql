-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: telovendo
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Pérez','Av. Siempreviva 123'),(2,'María','García','Calle Falsa 321'),(3,'Luis','Fernández','Av. Corrientes 456'),(4,'Ana','Sánchez','Calle Real 789'),(5,'Pedro','González','Av. Libertador 555'),(6,'Carla','Rodríguez','Calle de la Rosa 987'),(7,'José','Martínez','Av. del Sol 111'),(8,'Laura','Hernández','Calle del Sur 222'),(9,'Jorge','Díaz','Av. del Norte 333'),(10,'Lucía','Torres','Calle del Este 444');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `precio` int NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'iPhone 13 Pro',1200000,'Electrónica y computación','Graphite'),(2,'Samsung Galaxy S21',799000,'Electrónica y computación','Phantom Gray'),(3,'iPad Pro',1099000,'Electrónica y computación','Space Gray'),(4,'MacBook Pro',1999000,'Electrónica y computación','Silver'),(5,'Sony Bravia TV',1199000,'Electrónica y computación','Black'),(6,'Bose QuietComfort headphones',349000,'Electrónica y computación','Silver'),(7,'Canon EOS R6 camera',2499000,'Electrónica y computación','Black'),(8,'Nest Learning Thermostat',249000,'Casa','Stainless Steel'),(9,'Roomba i7+ robot vacuum',799000,'Casa','Black'),(10,'Weber Genesis II grill',899000,'Outdoors','Black'),(11,'Dyson V15 vacuum',699000,'Casa','Red'),(12,'Fitbit Charge 5',149000,'Fitness','Black'),(13,'Xbox Series X',499000,'Electrónica y computación','Black'),(14,'PlayStation 5',499000,'Electrónica y computación','White'),(15,'Samsung 65\" QLED TV',1599000,'Electrónica y computación','Titan Black');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_proveedores`
--

DROP TABLE IF EXISTS `productos_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_proveedores` (
  `idProducto` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `Stock` int DEFAULT NULL,
  PRIMARY KEY (`idProducto`,`id_proveedor`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `productos_proveedores_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `productos_proveedores_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_proveedores`
--

LOCK TABLES `productos_proveedores` WRITE;
/*!40000 ALTER TABLE `productos_proveedores` DISABLE KEYS */;
INSERT INTO `productos_proveedores` VALUES (1,1,50),(2,2,20),(3,3,30),(4,1,10),(4,2,15),(5,4,5),(5,5,5),(6,1,20),(6,3,10),(7,2,25),(7,3,15),(8,4,8),(8,5,12),(9,1,15),(9,2,10),(9,3,5),(10,5,20);
/*!40000 ALTER TABLE `productos_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_representante` varchar(50) NOT NULL,
  `nombre_corporativo` varchar(50) NOT NULL,
  `telefono1` varchar(20) NOT NULL,
  `telefono2` varchar(20) DEFAULT NULL,
  `nombre_contacto` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) NOT NULL,
  `correo_facturacion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Juan Perez','Electronics Corp.','555-1234','555-5678','Maria','Electrónicos','juan.perez@electronics.com'),(2,'Luisa Martinez','Tech Suppliers','555-7890','555-2345','Pedro','Electrónicos','luisa.martinez@techsuppliers.com'),(3,'Carlos Gonzalez','Gadgets Inc.','555-1111','555-2222','Laura','Electrónicos','carlos.gonzalez@gadgets.com'),(4,'Patricia Sanchez','Smart Devices','555-3333','555-4444','Javier','Electrónicos','patricia.sanchez@smartdevices.com'),(5,'Mario Rodriguez','Electronics World','555-5555','555-6666','Ana','Electrónicos','mario.rodriguez@electronicsworld.com'),(6,'Gabriela Torres','Smart Innovations','555-1212','555-3434','Miguel','Electrónicos','gabriela.torres@smartinnovations.com'),(7,'Ricardo Hernandez','Tech Emporium','555-7878','555-6767','Fernanda','Electrónicos','ricardo.hernandez@techemporium.com'),(8,'Mariana Aguilar','Digital Solutions','555-9999','555-0000','Jorge','Electrónicos','mariana.aguilar@digitalsolutions.com'),(9,'Luis Lopez','Innovative Devices','555-2323','555-5656','Ana','Electrónicos','luis.lopez@innovativedevices.com'),(10,'Carmen Garcia','Electronics Universe','555-2323','555-5656','Santiago','Electrónicos','carmen.garcia@electronicsuniverse.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'telovendo'
--

--
-- Dumping routines for database 'telovendo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-10 21:40:14
