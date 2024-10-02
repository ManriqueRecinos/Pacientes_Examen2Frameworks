-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-10-2024 a las 05:31:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clinica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `IDCita` int(11) NOT NULL,
  `FechaCita` date DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`IDCita`, `FechaCita`, `PacienteID`, `DoctorID`) VALUES
(1, '2024-10-01', 1, 1),
(2, '2024-10-02', 2, 2),
(3, '2024-10-03', 3, 3),
(4, '2024-10-01', 2, 1),
(5, '2024-10-02', 4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctores`
--

CREATE TABLE `doctores` (
  `DoctorID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Especialidad` varchar(100) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `doctores`
--

INSERT INTO `doctores` (`DoctorID`, `Nombre`, `Especialidad`, `Telefono`, `Email`) VALUES
(1, 'Dr. Ana Torres', 'Cardiología', '555-1234', 'ana.torres@clinica.com'),
(2, 'Dr. Pedro Sánchez', 'Pediatría', '555-5678', 'pedro.sanchez@clinica.com'),
(3, 'Dra. Laura Díaz', 'Dermatología', '555-9101', 'laura.diaz@clinica.com'),
(4, 'Manrique', 'Cirujano Plastico', '65416511', 'manr@gmail.com'),
(5, 'prueba', 'prueba', '1231', 'prueba@GMAIL.COM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `IDPaciente` int(11) NOT NULL,
  `NombrePaciente` varchar(100) NOT NULL,
  `Edad` int(11) NOT NULL,
  `DireccionPaciente` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`IDPaciente`, `NombrePaciente`, `Edad`, `DireccionPaciente`) VALUES
(1, 'Juan Pérez', 30, 'Calle Principal #123'),
(2, 'María García', 45, 'Avenida Central #456'),
(3, 'Carlos López', 25, 'Colonia Nueva #789'),
(4, 'prueba', 2, 'prueba');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`IDCita`),
  ADD KEY `PacienteID` (`PacienteID`),
  ADD KEY `DoctorID` (`DoctorID`);

--
-- Indices de la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`DoctorID`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`IDPaciente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `IDCita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `doctores`
--
ALTER TABLE `doctores`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `IDPaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`PacienteID`) REFERENCES `pacientes` (`IDPaciente`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctores` (`DoctorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
