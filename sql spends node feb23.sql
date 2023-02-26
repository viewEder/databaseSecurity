CREATE DATABASE  IF NOT EXISTS `spendsapp` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `spendsapp`;
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: spendsapp
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `concepto`
--

DROP TABLE IF EXISTS `concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concepto` (
  `idconcepto` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  `estado` varchar(45) DEFAULT 'Activo',
  `idusuario` int NOT NULL,
  `idcategoria` int NOT NULL,
  PRIMARY KEY (`idconcepto`,`idusuario`,`idcategoria`),
  KEY `fk_concepto_usuario1_idx` (`idusuario`),
  KEY `fk_concepto_Categoria1_idx` (`idcategoria`),
  CONSTRAINT `fk_concepto_Categoria1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`),
  CONSTRAINT `fk_concepto_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datosUsuario`
--

DROP TABLE IF EXISTS `datosUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datosUsuario` (
  `iddatosUsuario` int NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(255) NOT NULL,
  `emailUsuario` varchar(145) NOT NULL,
  `fechaNace` date NOT NULL,
  `imgUsuario` varchar(45) NOT NULL DEFAULT 'default.png',
  `creado_el` datetime NOT NULL,
  `modificado_el` varchar(45) NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`iddatosUsuario`,`idusuario`),
  KEY `fk_datosUsuario_usuario_idx` (`idusuario`),
  CONSTRAINT `fk_datosUsuario_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mes`
--

DROP TABLE IF EXISTS `mes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mes` (
  `idmes` int NOT NULL AUTO_INCREMENT,
  `nombreMes` varchar(45) NOT NULL,
  PRIMARY KEY (`idmes`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `idmovimiento` int NOT NULL AUTO_INCREMENT,
  `valorMovimiento` decimal(20,2) NOT NULL,
  `notaMovimiento` mediumtext NOT NULL,
  `creado_el` datetime NOT NULL,
  `modificado_el` datetime NOT NULL,
  `idmes` int NOT NULL,
  `idperiodo` int NOT NULL,
  `idconcepto` int NOT NULL,
  `idusuario` int NOT NULL,
  `idcategoria` int NOT NULL,
  PRIMARY KEY (`idmovimiento`,`idmes`,`idperiodo`,`idconcepto`,`idusuario`,`idcategoria`),
  KEY `fk_movimiento_mes1_idx` (`idmes`),
  KEY `fk_movimiento_periodo1_idx` (`idperiodo`),
  KEY `fk_movimiento_concepto1_idx` (`idconcepto`),
  KEY `fk_movimiento_usuario1_idx` (`idusuario`),
  KEY `fk_movimiento_Categoria1_idx` (`idcategoria`),
  CONSTRAINT `fk_movimiento_Categoria1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`),
  CONSTRAINT `fk_movimiento_concepto1` FOREIGN KEY (`idconcepto`) REFERENCES `concepto` (`idconcepto`),
  CONSTRAINT `fk_movimiento_mes1` FOREIGN KEY (`idmes`) REFERENCES `mes` (`idmes`),
  CONSTRAINT `fk_movimiento_periodo1` FOREIGN KEY (`idperiodo`) REFERENCES `periodo` (`idperiodo`),
  CONSTRAINT `fk_movimiento_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo` (
  `idperiodo` int NOT NULL AUTO_INCREMENT,
  `periodo` int NOT NULL,
  PRIMARY KEY (`idperiodo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `presupuesto`
--

DROP TABLE IF EXISTS `presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presupuesto` (
  `idpresupuesto` int NOT NULL AUTO_INCREMENT,
  `valorPresupuesto` decimal(20,2) NOT NULL,
  `creado_el` datetime NOT NULL,
  `modificado_el` datetime NOT NULL,
  `idperiodo` int NOT NULL,
  `idmes` int NOT NULL,
  `idconcepto` int NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idpresupuesto`,`idperiodo`,`idmes`,`idconcepto`,`idusuario`),
  KEY `fk_presupuesto_periodo1_idx` (`idperiodo`),
  KEY `fk_presupuesto_mes1_idx` (`idmes`),
  KEY `fk_presupuesto_concepto1_idx` (`idconcepto`,`idusuario`),
  CONSTRAINT `fk_presupuesto_concepto1` FOREIGN KEY (`idconcepto`, `idusuario`) REFERENCES `concepto` (`idconcepto`, `idusuario`),
  CONSTRAINT `fk_presupuesto_mes1` FOREIGN KEY (`idmes`) REFERENCES `mes` (`idmes`),
  CONSTRAINT `fk_presupuesto_periodo1` FOREIGN KEY (`idperiodo`) REFERENCES `periodo` (`idperiodo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(145) NOT NULL,
  `password` varchar(145) NOT NULL,
  `estado` varchar(45) NOT NULL DEFAULT 'Activo',
  `creado_el` datetime NOT NULL,
  `modificado_el` datetime NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vpresupuesto`
--

DROP TABLE IF EXISTS `vpresupuesto`;
/*!50001 DROP VIEW IF EXISTS `vpresupuesto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vpresupuesto` AS SELECT 
 1 AS `periodo`,
 1 AS `nombreMes`,
 1 AS `tipo`,
 1 AS `concepto`,
 1 AS `valorPresupuesto`,
 1 AS `modificado_el`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'spendsapp'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `insertion_event` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`%`*/ /*!50106 EVENT `insertion_event` ON SCHEDULE EVERY 1 YEAR STARTS '2023-01-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO periodo VALUES ('', year(curdate())) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Final view structure for view `vpresupuesto`
--

/*!50001 DROP VIEW IF EXISTS `vpresupuesto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vpresupuesto` AS select `p`.`periodo` AS `periodo`,`m`.`nombreMes` AS `nombreMes`,`t`.`nombreCategoria` AS `tipo`,`c`.`categoria` AS `concepto`,`pr`.`valorPresupuesto` AS `valorPresupuesto`,`pr`.`modificado_el` AS `modificado_el` from ((((`presupuesto` `pr` join `periodo` `p` on((`pr`.`idperiodo` = `p`.`idperiodo`))) join `mes` `m` on((`pr`.`idmes` = `m`.`idmes`))) join `concepto` `c` on((`pr`.`idconcepto` = `c`.`idconcepto`))) join `categoria` `t` on((`c`.`idcategoria` = `t`.`idcategoria`))) where (`p`.`periodo` = year(sysdate())) order by `p`.`periodo`,`pr`.`idmes` */;
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

/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'spendsapp'
--
/*!50003 DROP FUNCTION IF EXISTS `PresupuestoGastoMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `PresupuestoGastoMes`(anio int, mes int, iduser int) RETURNS decimal(10,0)
BEGIN
	DECLARE total_gasto decimal(20,2);
    set total_gasto = (select ifnull(sum(p.valorPresupuesto),0) 
				from presupuesto p
				inner join concepto c
				on (p.idconcepto = c.idconcepto)
				where p.idmes = mes and p.idperiodo = anio and c.idcategoria = 1  and p.idusuario = iduser);

RETURN total_gasto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PresupuestoIngresoMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `PresupuestoIngresoMes`(mes int, iduser int) RETURNS decimal(10,0)
BEGIN
	DECLARE total_ingreso decimal(20,2);
    set total_ingreso = (select ifnull(sum(p.valorPresupuesto),0) 
				from presupuesto p
				inner join concepto c
				on (p.idconcepto = c.idconcepto)
				where p.idmes = mes and p.idperiodo = 2 and c.idcategoria = 1 and p.idusuario = iduser);

RETURN total_ingreso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `RestaOp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `RestaOp`(a decimal(20,2), b decimal(20,2)) RETURNS decimal(10,0)
BEGIN
	DECLARE c DECIMAL;
    SET c = (a - b );
RETURN c;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crudPresupuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `crudPresupuesto`(
in v_idpresupuesto int, 
in v_valorPresupuesto decimal(20,2), 
in v_creado_el datetime, 
in v_modificado_el datetime, 
in v_idperiodo int, 
in v_idmes int, 
in v_idconcepto int, 
in v_idusuario int, 
in accion varchar(45)
)
BEGIN
DECLARE mes INT DEFAULT 12;
set @concepto = (select categoria from concepto where idconcepto = v_idconcepto);
	CASE
		WHEN accion = 'crear' then
			while mes > 0 do
				set v_idpresupuesto = 0;
				insert into presupuesto values (v_idpresupuesto, v_valorPresupuesto, v_creado_el, v_modificado_el, v_idperiodo, mes, v_idconcepto, v_idusuario);
				set mes = mes - 1;
			end while;
			select concat ('Se ha registrado el presupuesto anual para el concepto ', @concepto) as mensaje;
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crudUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `crudUsuario`(
in v_idusuario int,
in v_nickname varchar(150),
in v_passuser varchar(200),
in v_nameuser varchar(255),
in v_emailuser varchar(150),
in v_fechanace date,
in v_imguser varchar(150),
in v_creadoel datetime,
in v_modificado datetime,
in accion varchar(45)
)
BEGIN
CASE 
	when accion = 'crear' then
		set @estado = 'Activo'; 
		# validaciòn deusuario creado:
        set @usuario = (select ifnull(count(emailUsuario), 0) from datosUsuario where emailUsuario = v_emailuser);
        if @usuario = 0 then
			set v_idusuario = 0;
			insert into usuario values (v_idusuario, v_nickname, sha(v_passuser), @estado, v_creadoel, v_modificado);
            # Capturamos el id del usuario creado:
            set @id = (select idusuario from usuario where nickname = v_nickname);
            insert into datosUsuario values (v_idusuario, v_nameuser, v_emailuser, v_fechanace, v_imguser, v_creadoel, v_modificado, @id);
            # mostramos el usuario ingresado:
            select u.idusuario, u.nickname, d.nombreUsuario, d.emailUsuario, d.fechaNace, u.estado
			from usuario u 
			inner join datosUsuario d
			on d.idusuario = u.idusuario
			where emailUsuario = v_emailuser;
        else
			select ('El usuario que intenta crear ya existe') as mensaje;
        end if;
end case;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `loginUser`(
in nickuser varchar(200),
in passuser varchar(200)
)
BEGIN
	DECLARE sub int;
    
    SET sub = (
		select count(u.idusuario)	
		from usuario u 
		inner join datosUsuario d
		on d.idusuario = u.idusuario
		where u.nickname = nickuser and u.password = sha(passuser)
		);
	 if sub != 1 then
		select ('NoAuth') as mensaje;
	 else
		select u.idusuario, u.nickname, d.nombreUsuario, d.emailUsuario, d.fechaNace, u.estado
		from usuario u 
		inner join datosUsuario d
		on d.idusuario = u.idusuario
		where u.nickname = nickuser and u.password = sha(passuser);
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-26 15:42:24

-- Dump completed on 2023-02-26 15:10:28
