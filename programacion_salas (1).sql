-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2024 a las 15:31:44
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
-- Base de datos: `programacion_salas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assembly_hall`
--

CREATE TABLE `assembly_hall` (
  `id` int(30) NOT NULL,
  `room_name` varchar(250) NOT NULL,
  `location` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `assembly_hall`
--

INSERT INTO `assembly_hall` (`id`, `room_name`, `location`, `description`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Pecera', 'Planta baja', 'Sala de conferencias con capacidad de 8 personas', 1, '2024-11-09 09:26:01', '2024-11-12 09:42:27'),
(2, 'Sala 2', 'Piso 1', 'Sala de conferencias con capacidad para 16 personas', 1, '2021-11-09 09:31:14', '2024-11-13 12:18:38'),
(3, 'Sala 1', 'Planta baja', 'Sala de conferencia con capacidad para 12 personas', 1, '2024-11-13 11:56:19', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `id` int(50) NOT NULL,
  `department_name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id`, `department_name`) VALUES
(1, 'Informática'),
(2, 'Administración y Finanzas'),
(3, 'RRHH'),
(4, 'Suministros e Importaciones'),
(5, 'Comercialización y Ventas'),
(6, 'Publicidad y Mercadeo'),
(7, 'Logística'),
(8, 'SSLA'),
(9, 'Sistemas de Gestión'),
(10, 'Producción '),
(11, 'Dirección Creativa'),
(12, 'Mantenimiento'),
(13, 'Aseguramiento de la Calidad'),
(14, 'Servicios Industriales'),
(15, 'Planta Física'),
(16, 'Almacén e Insumos'),
(17, 'Almacén de Repuestos'),
(18, 'Control de Inventario'),
(19, 'Proyectos, Mejoras y CGO'),
(20, 'Operaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedule_list`
--

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `assembly_hall_id` int(30) NOT NULL,
  `id_user` int(50) NOT NULL,
  `schedule_remarks` text NOT NULL,
  `datetime_start` datetime NOT NULL,
  `datetime_end` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `assembly_hall_id`, `id_user`, `schedule_remarks`, `datetime_start`, `datetime_end`, `status`, `date_created`, `date_updated`) VALUES
(1, 1, 1, 'Reunión de gerentes', '2024-11-27 13:00:00', '2024-11-27 15:00:00', 0, '2024-11-26 10:04:40', NULL),
(2, 1, 1, 'hola', '2024-11-28 10:09:00', '2024-11-28 10:09:00', 0, '2024-11-26 10:09:31', NULL),
(3, 3, 1, 'Hola', '2024-11-29 10:12:00', '2024-11-29 14:12:00', 0, '2024-11-26 10:13:01', NULL),
(4, 1, 1, 'Reunión de gerentes', '2024-11-30 10:16:00', '2024-11-30 15:16:00', 0, '2024-11-26 10:17:04', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Sistema para Reserva de Salas de Conferencias'),
(6, 'short_name', 'SRSC'),
(11, 'logo', 'uploads/1731419040_logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1628211420_1.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `id_department` int(50) NOT NULL,
  `id_superior` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `position` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `gmail` varchar(250) NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `id_department`, `id_superior`, `firstname`, `lastname`, `position`, `username`, `password`, `gmail`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 1, 55, 'Anderson', 'Villalonga', 'analista', 'AndersonVD', '1234', 'andersonvillalongaduran@gmail.com', 'uploads/1732200091_1632106140_avatar.gif', '2024-11-21 22:41:31', 1, '2024-11-10 14:02:37', '2024-11-26 09:53:50'),
(2, 1, 0, 'Jeniffer', 'Orellana', 'gerente', 'jeniffer', '1234', 'jenifferorellana@gmail.com', 'uploads/1732202904_1732112511_1731419040_logo.png', '2024-11-22 02:40:50', 2, '2024-11-12 14:02:37', '2024-11-21 14:40:50'),
(50, 1, 0, 'ewewe', 'dfgtrrgv', '', 'wqd', 'sad', 'andwbjdwcdd@gmail.com', 'uploads/1732134852_2.jpg', '2024-11-21 04:34:12', 2, '2024-11-20 16:34:12', '2024-11-20 16:34:12'),
(51, 1, 0, 'Eduardo', 'Omanas', 'analista', 'eduardo1234', '1234', 'eduardo@gmail.com', 'uploads/1732202904_1732112511_1731419040_logo.png', '2024-11-22 02:48:32', 2, '2024-11-21 08:31:03', '2024-11-21 14:48:32'),
(52, 1, 0, 'Roni', 'Analista', '', 'roni1234', '1234', 'roni@gmail.com', 'uploads/1732193711_IMG_20241102_080948.jpg', '2024-11-21 20:55:11', 0, '2024-11-21 08:55:11', '2024-11-21 08:55:11'),
(53, 2, 0, 'adsdad', 'asdas', 'analista', 'asdeee', 'sda', 'daqd@gmail.com', 'uploads/1732217594_1632105900_sistema reservas php y mysql.png', '2024-11-22 03:33:14', 0, '2024-11-21 10:13:45', '2024-11-21 15:33:14'),
(54, 2, 0, 'hola', 'adwed', 'coordinador', 'awfe', 'jdadk', 'daqdded@gmail.com', 'uploads/1732202904_1732112511_1731419040_logo.png', '2024-11-21 23:28:59', 0, '2024-11-21 11:28:24', '2024-11-21 14:42:27'),
(55, 10, 0, 'Marcel', 'Lara', 'gerente', 'Marcel23', '1234', 'exodustecnologia3d@gmail.com', 'uploads/1732200091_1632106140_avatar.gif', '2024-11-26 04:16:14', 0, '2024-11-21 15:45:19', '2024-11-25 16:16:14'),
(56, 17, 0, 'sfg', 'saxd', 'analista', 'sdq', '1234', 'sa@gmail.com', 'uploads/1732219612_1731419040_logo.png', '2024-11-22 04:29:45', 0, '2024-11-21 16:06:52', '2024-11-21 16:29:45');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `assembly_hall`
--
ALTER TABLE `assembly_hall`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_schedule_user` (`id_user`);

--
-- Indices de la tabla `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_department` (`id_department`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `assembly_hall`
--
ALTER TABLE `assembly_hall`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD CONSTRAINT `fk_schedule_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_department` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
