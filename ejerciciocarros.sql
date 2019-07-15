-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-07-2019 a las 07:53:22
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejerciciocarros`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarPorId` (IN `id` VARCHAR(10))  READS SQL DATA
SELECT CATIPO FROM categoria WHERE CATID=id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `CATID` int(11) NOT NULL,
  `CATIPO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`CATID`, `CATIPO`) VALUES
(1, 'Campero'),
(2, 'Deportivo'),
(3, 'SuperSport');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datospersonales`
--

CREATE TABLE `datospersonales` (
  `DATID` int(11) NOT NULL,
  `USUID` int(11) DEFAULT NULL,
  `DATNOMBRE` varchar(50) DEFAULT NULL,
  `DATAPELLIDO` varchar(50) DEFAULT NULL,
  `DATIPOID` varchar(20) DEFAULT NULL,
  `DATNUMEROID` varchar(20) DEFAULT NULL,
  `DATELEFONO` varchar(20) DEFAULT NULL,
  `DATCORREO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `datospersonales`
--

INSERT INTO `datospersonales` (`DATID`, `USUID`, `DATNOMBRE`, `DATAPELLIDO`, `DATIPOID`, `DATNUMEROID`, `DATELEFONO`, `DATCORREO`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ROLID` int(11) NOT NULL,
  `ROLTIPO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `USUID` int(11) NOT NULL,
  `USULOGIN` varchar(20) DEFAULT NULL,
  `USUPASSWORD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`USUID`, `USULOGIN`, `USUPASSWORD`) VALUES
(1, 'Admin', '123456'),
(2, 'pepe', '123'),
(3, 'Felipe', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE `usuario_rol` (
  `ROLID` int(11) NOT NULL,
  `USUID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `VEHPLACA` varchar(10) NOT NULL,
  `DATID` int(11) DEFAULT NULL,
  `CATID` int(11) DEFAULT NULL,
  `VEHMODELO` int(11) DEFAULT NULL,
  `VEHMARCA` varchar(50) DEFAULT NULL,
  `VEHESTADO` varchar(30) DEFAULT NULL,
  `VEHPRECIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`VEHPLACA`, `DATID`, `CATID`, `VEHMODELO`, `VEHMARCA`, `VEHESTADO`, `VEHPRECIO`) VALUES
('ARF854', 1, 3, 2017, 'Renault', 'Nuevo', 400000000),
('AUJ853', 1, 1, 2017, 'FORD', 'Segunda', 50000000),
('HTR095', 1, 2, 2019, 'Ferrari', 'Nuevo', 50000000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CATID`);

--
-- Indices de la tabla `datospersonales`
--
ALTER TABLE `datospersonales`
  ADD PRIMARY KEY (`DATID`),
  ADD KEY `FK_RELATIONSHIP_1` (`USUID`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ROLID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`USUID`);

--
-- Indices de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD PRIMARY KEY (`ROLID`,`USUID`),
  ADD KEY `FK_RELATIONSHIP_2` (`USUID`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`VEHPLACA`),
  ADD KEY `FK_REFERENCE_5` (`CATID`),
  ADD KEY `FK_REFERENCE_6` (`DATID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `CATID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `datospersonales`
--
ALTER TABLE `datospersonales`
  MODIFY `DATID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ROLID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `USUID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datospersonales`
--
ALTER TABLE `datospersonales`
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`USUID`) REFERENCES `usuario` (`USUID`);

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`USUID`) REFERENCES `usuario` (`USUID`),
  ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`ROLID`) REFERENCES `rol` (`ROLID`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `FK_REFERENCE_5` FOREIGN KEY (`CATID`) REFERENCES `categoria` (`CATID`),
  ADD CONSTRAINT `FK_REFERENCE_6` FOREIGN KEY (`DATID`) REFERENCES `datospersonales` (`DATID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
