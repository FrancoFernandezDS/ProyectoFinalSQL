CREATE DATABASE  IF NOT EXISTS `negociosql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `negociosql`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: negociosql
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accion` varchar(50) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_insert` int DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `modificación_realizada` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Cliente_id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Apellido` varchar(80) NOT NULL,
  `DNI` int NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Dirección` varchar(80) DEFAULT NULL,
  `Teléfono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Cliente_id`),
  UNIQUE KEY `Cliente_id` (`Cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Denise','Jurado',40091945,'denise@jurado.com','16 n 1324','2147483647'),(2,'Theo','Fernandez',45673332,'theo@fernandez.com','56 n 798','2156723452'),(3,'Facundo','Chanes',40345629,'facundo@chanes.com','33 n 201','2189456382'),(4,'Federico','Forciniti',38654039,'federico@forciniti.com','32 n 445','2131642380');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes_morosos`
--

DROP TABLE IF EXISTS `clientes_morosos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_morosos` (
  `moroso_id` int NOT NULL AUTO_INCREMENT,
  `deuda_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `monto_deuda` int DEFAULT NULL,
  `fecha_deuda` date DEFAULT NULL,
  PRIMARY KEY (`moroso_id`),
  UNIQUE KEY `moroso_id` (`moroso_id`),
  KEY `deuda_id` (`deuda_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `clientes_morosos_ibfk_1` FOREIGN KEY (`deuda_id`) REFERENCES `cuotas_adeudadas` (`deuda_id`),
  CONSTRAINT `clientes_morosos_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`Cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_morosos`
--

LOCK TABLES `clientes_morosos` WRITE;
/*!40000 ALTER TABLE `clientes_morosos` DISABLE KEYS */;
INSERT INTO `clientes_morosos` VALUES (1,3,3,99000,'2023-01-20'),(2,2,1,98400,'2023-01-03'),(3,1,3,70500,'2023-01-07');
/*!40000 ALTER TABLE `clientes_morosos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `Compras_id` int NOT NULL AUTO_INCREMENT,
  `Cliente_id` int NOT NULL,
  `Producto_id` int NOT NULL,
  `Fecha_compra` date DEFAULT NULL,
  `Precio_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`Compras_id`),
  UNIQUE KEY `Compras_id` (`Compras_id`),
  KEY `Cliente_id` (`Cliente_id`),
  KEY `Producto_id` (`Producto_id`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`Cliente_id`) REFERENCES `clientes` (`Cliente_id`),
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`Producto_id`) REFERENCES `productos` (`Producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,2,4,'2023-01-01',125000,1),(2,1,6,'2023-01-03',295000,1),(3,4,2,'2023-01-05',75000,1),(4,2,1,'2023-01-07',87000,1),(5,3,7,'2023-01-07',235000,1),(6,1,10,'2023-01-12',68000,1),(7,2,10,'2023-01-15',68000,1),(8,4,9,'2023-01-15',99000,1),(9,3,5,'2023-01-15',59000,1),(10,3,8,'2023-01-20',198000,1),(11,1,4,'2023-01-21',125000,1),(12,2,5,'2023-01-21',59000,1);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_bitacora` AFTER INSERT ON `compras` FOR EACH ROW begin 
insert into bitacora (accion, fecha, id_insert, usuario, modificación_realizada) values ('insert', now(),new.Compras_id, system_user(),'compras');
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cuotas_adeudadas`
--

DROP TABLE IF EXISTS `cuotas_adeudadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuotas_adeudadas` (
  `deuda_id` int NOT NULL AUTO_INCREMENT,
  `compra_id` int NOT NULL,
  `cant_cuotas` int DEFAULT NULL,
  `cuotas_vencidas` int DEFAULT NULL,
  `monto_cuotas` int DEFAULT NULL,
  PRIMARY KEY (`deuda_id`),
  UNIQUE KEY `deuda_id` (`deuda_id`),
  KEY `compra_id` (`compra_id`),
  CONSTRAINT `cuotas_adeudadas_ibfk_1` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`Compras_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas_adeudadas`
--

LOCK TABLES `cuotas_adeudadas` WRITE;
/*!40000 ALTER TABLE `cuotas_adeudadas` DISABLE KEYS */;
INSERT INTO `cuotas_adeudadas` VALUES (1,5,10,3,23500),(2,2,6,2,49200),(3,10,12,6,16500);
/*!40000 ALTER TABLE `cuotas_adeudadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_negocio`
--

DROP TABLE IF EXISTS `datos_negocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_negocio` (
  `negocio_id` int NOT NULL AUTO_INCREMENT,
  `cuit` int NOT NULL,
  `dirección` varchar(20) NOT NULL,
  `localidad` varchar(80) NOT NULL,
  `codigo_postal` int NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `celular` int DEFAULT NULL,
  PRIMARY KEY (`negocio_id`),
  UNIQUE KEY `negocio_id` (`negocio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_negocio`
--

LOCK TABLES `datos_negocio` WRITE;
/*!40000 ALTER TABLE `datos_negocio` DISABLE KEYS */;
INSERT INTO `datos_negocio` VALUES (1,2020111222,'calle 24 n 342','General Belgrano',7223,'negocio@gmail.com',222134543);
/*!40000 ALTER TABLE `datos_negocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `Empleado_id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Apellido` varchar(80) NOT NULL,
  `DNI` int NOT NULL,
  `Teléfono` varchar(25) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Empleado_id`),
  UNIQUE KEY `Empleado_id` (`Empleado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Franco','Fernandez',41546032,'2245687935','franco@fernandez.com'),(2,'Dario','Andrik',32564043,'2231958763','dario@andrik.com'),(3,'Rogelio','Gaitan',27689440,'2298302398','rogelio@gaitan.com'),(4,'Juan','Aguero',42801098,'2265398999','juan@aguero.com');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `info_negocio`
--

DROP TABLE IF EXISTS `info_negocio`;
/*!50001 DROP VIEW IF EXISTS `info_negocio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_negocio` AS SELECT 
 1 AS `cuit`,
 1 AS `dirección`,
 1 AS `localidad`,
 1 AS `codigo_postal`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listado_cliente`
--

DROP TABLE IF EXISTS `listado_cliente`;
/*!50001 DROP VIEW IF EXISTS `listado_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listado_cliente` AS SELECT 
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Email`,
 1 AS `Teléfono`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listado_empleados`
--

DROP TABLE IF EXISTS `listado_empleados`;
/*!50001 DROP VIEW IF EXISTS `listado_empleados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listado_empleados` AS SELECT 
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Teléfono`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listado_productos`
--

DROP TABLE IF EXISTS `listado_productos`;
/*!50001 DROP VIEW IF EXISTS `listado_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listado_productos` AS SELECT 
 1 AS `Tipo_producto`,
 1 AS `Precio`,
 1 AS `Stock_producto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listado_proveedores`
--

DROP TABLE IF EXISTS `listado_proveedores`;
/*!50001 DROP VIEW IF EXISTS `listado_proveedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listado_proveedores` AS SELECT 
 1 AS `nombre`,
 1 AS `prov_de`,
 1 AS `celular`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `proveedor_id` int NOT NULL,
  `pedido` varchar(20) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`pedido_id`),
  UNIQUE KEY `pedido_id` (`pedido_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'televisor 32\"',10),(2,1,'televisor 50\"',5),(3,3,'colchon resorte 1,40',4),(4,2,'termotanque 80lts',10);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `Producto_id` int NOT NULL AUTO_INCREMENT,
  `Tipo_producto` varchar(100) NOT NULL,
  `Precio` int DEFAULT NULL,
  `Stock_producto` int DEFAULT NULL,
  PRIMARY KEY (`Producto_id`),
  UNIQUE KEY `Producto_id` (`Producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Cocina Morelli ACERO',87000,50),(2,'Termotanque 80lts',75000,38),(3,'Cocina Longvie BLANCA',79000,68),(4,'Led smart 50\" TCL',125000,22),(5,'Termotanque 50lts',59000,45),(6,'Notebook Asus I7',295000,12),(7,'Led smart 65\" Samsung',235000,10),(8,'Notebook Lenovo I3',198000,15),(9,'Colchon Cannon 2p',99000,12),(10,'Led smart 32\" TCL',68000,50);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_bitacora_prod` AFTER UPDATE ON `productos` FOR EACH ROW begin 
insert into bitacora (accion, fecha, id_insert, usuario, modificación_realizada) values ('update', now(),new.Producto_id, system_user(),'productos');
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_productos` BEFORE DELETE ON `productos` FOR EACH ROW begin
insert into bitacora (accion, fecha, id_insert, usuario, modificación_realizada) values ('delete', now(), old.Producto_id, system_user(),'productos');
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `prov_de` varchar(80) DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `Email` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  UNIQUE KEY `proveedor_id` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Juan Conte','televisores y nootebook',224321332,'juan@conte.com'),(2,'Adrian Juares','termotanques y cocinas',112332122,'adrian@juares.com'),(3,'Mauricio Bastian','colchones',112132119,'mauricio@bastian.com'),(4,'Nicolas Gomez','Tablet y Celulares',221265249,'nicolas@gomez.com'),(5,'Daniel Diaz','Lavarropas y Heladeras',221459088,'daniel@diaz.com'),(6,'Fernando Paz','Sonido (parlantes, amplificadores)',221233100,'fernando@paz.com'),(7,'Luis Gonzalez','Herramientas',224399201,'luis@gonzalez.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamos`
--

DROP TABLE IF EXISTS `reclamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reclamos` (
  `reclamo_id` int NOT NULL AUTO_INCREMENT,
  `Cliente_id` int NOT NULL,
  `Producto_id` int NOT NULL,
  `falla_producto` varchar(80) DEFAULT NULL,
  `numero_fac` int DEFAULT NULL,
  PRIMARY KEY (`reclamo_id`),
  UNIQUE KEY `reclamo_id` (`reclamo_id`),
  KEY `Cliente_id` (`Cliente_id`),
  KEY `Producto_id` (`Producto_id`),
  CONSTRAINT `reclamos_ibfk_1` FOREIGN KEY (`Cliente_id`) REFERENCES `clientes` (`Cliente_id`),
  CONSTRAINT `reclamos_ibfk_2` FOREIGN KEY (`Producto_id`) REFERENCES `productos` (`Producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamos`
--

LOCK TABLES `reclamos` WRITE;
/*!40000 ALTER TABLE `reclamos` DISABLE KEYS */;
INSERT INTO `reclamos` VALUES (1,3,5,'no queda en piloto y se apaga',223),(2,1,6,'no carga',124),(3,2,10,'le aparecio una raya en el medio de la pantalla',220),(4,4,9,'se rompio resorte parte superior',139);
/*!40000 ALTER TABLE `reclamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'negociosql'
--

--
-- Dumping routines for database 'negociosql'
--
/*!50003 DROP FUNCTION IF EXISTS `circunferencia_circulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `circunferencia_circulo`(radio float) RETURNS float
    DETERMINISTIC
begin
	declare resultado float;
    declare pi float;
    set pi = 3.14;
    set resultado = pi * radio * radio;
    return resultado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ver_compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ver_compras`(id int) RETURNS int
    DETERMINISTIC
begin
	declare resultado int;
	select count(*) into resultado from compras where Cliente_id = id; 
    return resultado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cliente`(in nom varchar(80), in ape varchar(80), in dni int, in email varchar(100), in dire varchar(80), in tel int)
begin
    insert into clientes (Nombre, Apellido, DNI, Email, Dirección, Teléfono) values (nom, ape, dni, email, dire, tel);
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_productos`(in dato int, in asc_desc varchar(50))
begin
	declare errormensaje varchar(255);
    set errormensaje = 'Presionar 1 para ordenar y ASC ascendente o DESC desendente';
		if dato < 1 or dato > 1 and asc_desc != 'asc' or 'desc' then 
			signal sqlstate '45000'
			set message_text = errormensaje;
		else 
			if dato=1 then
				select Precio from productos order by Precio;
                if asc_desc = 'asc' then
					select Precio from productos order by Precio asc;
				else
					select Precio from productos order by Precio desc;
				end if;
			end if;
		end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `info_negocio`
--

/*!50001 DROP VIEW IF EXISTS `info_negocio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_negocio` AS select `datos_negocio`.`cuit` AS `cuit`,`datos_negocio`.`dirección` AS `dirección`,`datos_negocio`.`localidad` AS `localidad`,`datos_negocio`.`codigo_postal` AS `codigo_postal`,`datos_negocio`.`Email` AS `Email` from `datos_negocio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listado_cliente`
--

/*!50001 DROP VIEW IF EXISTS `listado_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listado_cliente` AS select `clientes`.`Nombre` AS `Nombre`,`clientes`.`Apellido` AS `Apellido`,`clientes`.`Email` AS `Email`,`clientes`.`Teléfono` AS `Teléfono` from `clientes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listado_empleados`
--

/*!50001 DROP VIEW IF EXISTS `listado_empleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listado_empleados` AS select `empleados`.`Nombre` AS `Nombre`,`empleados`.`Apellido` AS `Apellido`,`empleados`.`Teléfono` AS `Teléfono`,`empleados`.`Email` AS `Email` from `empleados` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listado_productos`
--

/*!50001 DROP VIEW IF EXISTS `listado_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listado_productos` AS select `productos`.`Tipo_producto` AS `Tipo_producto`,`productos`.`Precio` AS `Precio`,`productos`.`Stock_producto` AS `Stock_producto` from `productos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listado_proveedores`
--

/*!50001 DROP VIEW IF EXISTS `listado_proveedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listado_proveedores` AS select `proveedores`.`nombre` AS `nombre`,`proveedores`.`prov_de` AS `prov_de`,`proveedores`.`celular` AS `celular`,`proveedores`.`Email` AS `Email` from `proveedores` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-24 13:26:58
