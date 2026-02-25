-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-02-2026 a las 03:52:24
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
-- Base de datos: `supermercado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_Categoria` int(11) NOT NULL,
  `NombreCategoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido_web`
--

CREATE TABLE `detalles_pedido_web` (
  `ID_DetallePedido` int(11) NOT NULL,
  `CantidadPedida` int(11) NOT NULL,
  `PrecioAlMomento` decimal(10,2) NOT NULL,
  `ID_PedidoWeb` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_venta_fisica`
--

CREATE TABLE `detalles_venta_fisica` (
  `ID_DetalleVenta` int(11) NOT NULL,
  `CantidadComprada` int(11) NOT NULL,
  `PrecioAlMomento` decimal(10,2) NOT NULL,
  `ID_Venta` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_movimientos`
--

CREATE TABLE `historial_movimientos` (
  `ID_Movimiento` int(11) NOT NULL,
  `FechaHora` datetime DEFAULT current_timestamp(),
  `TipoMovimiento` varchar(50) NOT NULL,
  `CantidadMovida` int(11) NOT NULL,
  `Observaciones` varchar(255) DEFAULT NULL,
  `ID_Producto` int(11) NOT NULL,
  `ID_Lote_Afectado` int(11) DEFAULT NULL,
  `ID_Usuario_Responsable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_lotes`
--

CREATE TABLE `inventario_lotes` (
  `ID_Lote` int(11) NOT NULL,
  `CodigoLoteFisico` varchar(50) NOT NULL,
  `FechaProduccion` date NOT NULL,
  `FechaVencimiento` date NOT NULL,
  `FechaIngreso` datetime DEFAULT current_timestamp(),
  `CantidadOriginal` int(11) NOT NULL,
  `UnidadesEnBodega` int(11) DEFAULT 0,
  `UnidadesEnEstante` int(11) DEFAULT 0,
  `UnidadesVendidas` int(11) DEFAULT 0,
  `ID_Producto` int(11) NOT NULL,
  `ID_Proveedor` int(11) NOT NULL,
  `ID_Usuario_Recibio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_web_pickup`
--

CREATE TABLE `pedidos_web_pickup` (
  `ID_PedidoWeb` int(11) NOT NULL,
  `FechaHoraPedido` datetime DEFAULT current_timestamp(),
  `TotalPedido` decimal(10,2) NOT NULL,
  `EstadoPedido` varchar(30) DEFAULT 'PENDIENTE',
  `ID_Usuario_Cliente` int(11) NOT NULL,
  `ID_Usuario_Cajero_Atendio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Producto` int(11) NOT NULL,
  `SKU_CodigoInterno` varchar(50) NOT NULL,
  `NombreProducto` varchar(150) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `UbicacionBodega` varchar(100) DEFAULT 'Pasillo N/A',
  `PrecioVenta` decimal(10,2) NOT NULL,
  `Stock_Bodega_Total` int(11) DEFAULT 0,
  `Stock_Estante_Total` int(11) DEFAULT 0,
  `Stock_Reservado_Total` int(11) DEFAULT 0,
  `ID_Categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_Proveedor` int(11) NOT NULL,
  `NombreEmpresa` varchar(150) NOT NULL,
  `ContactoAsignado` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `EstadoActivo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_Rol` int(11) NOT NULL,
  `NombreRol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `NombreCompleto` varchar(150) NOT NULL,
  `Correo_Usuario` varchar(100) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `EstadoActivo` tinyint(1) DEFAULT 1,
  `ID_Rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_fisicas`
--

CREATE TABLE `ventas_fisicas` (
  `ID_Venta` int(11) NOT NULL,
  `FechaHora` datetime DEFAULT current_timestamp(),
  `TotalVenta` decimal(10,2) NOT NULL,
  `EstadoVenta` varchar(20) DEFAULT 'APROBADA',
  `ID_Usuario_Cajero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `detalles_pedido_web`
--
ALTER TABLE `detalles_pedido_web`
  ADD PRIMARY KEY (`ID_DetallePedido`),
  ADD KEY `ID_PedidoWeb` (`ID_PedidoWeb`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `detalles_venta_fisica`
--
ALTER TABLE `detalles_venta_fisica`
  ADD PRIMARY KEY (`ID_DetalleVenta`),
  ADD KEY `ID_Venta` (`ID_Venta`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `historial_movimientos`
--
ALTER TABLE `historial_movimientos`
  ADD PRIMARY KEY (`ID_Movimiento`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `ID_Lote_Afectado` (`ID_Lote_Afectado`),
  ADD KEY `ID_Usuario_Responsable` (`ID_Usuario_Responsable`);

--
-- Indices de la tabla `inventario_lotes`
--
ALTER TABLE `inventario_lotes`
  ADD PRIMARY KEY (`ID_Lote`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`),
  ADD KEY `ID_Usuario_Recibio` (`ID_Usuario_Recibio`);

--
-- Indices de la tabla `pedidos_web_pickup`
--
ALTER TABLE `pedidos_web_pickup`
  ADD PRIMARY KEY (`ID_PedidoWeb`),
  ADD KEY `ID_Usuario_Cliente` (`ID_Usuario_Cliente`),
  ADD KEY `ID_Usuario_Cajero_Atendio` (`ID_Usuario_Cajero_Atendio`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD UNIQUE KEY `SKU_CodigoInterno` (`SKU_CodigoInterno`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_Proveedor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_Rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `Correo_Usuario` (`Correo_Usuario`),
  ADD KEY `ID_Rol` (`ID_Rol`);

--
-- Indices de la tabla `ventas_fisicas`
--
ALTER TABLE `ventas_fisicas`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `ID_Usuario_Cajero` (`ID_Usuario_Cajero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido_web`
--
ALTER TABLE `detalles_pedido_web`
  MODIFY `ID_DetallePedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_venta_fisica`
--
ALTER TABLE `detalles_venta_fisica`
  MODIFY `ID_DetalleVenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_movimientos`
--
ALTER TABLE `historial_movimientos`
  MODIFY `ID_Movimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario_lotes`
--
ALTER TABLE `inventario_lotes`
  MODIFY `ID_Lote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_web_pickup`
--
ALTER TABLE `pedidos_web_pickup`
  MODIFY `ID_PedidoWeb` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_Producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_Rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas_fisicas`
--
ALTER TABLE `ventas_fisicas`
  MODIFY `ID_Venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_pedido_web`
--
ALTER TABLE `detalles_pedido_web`
  ADD CONSTRAINT `detalles_pedido_web_ibfk_1` FOREIGN KEY (`ID_PedidoWeb`) REFERENCES `pedidos_web_pickup` (`ID_PedidoWeb`),
  ADD CONSTRAINT `detalles_pedido_web_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `detalles_venta_fisica`
--
ALTER TABLE `detalles_venta_fisica`
  ADD CONSTRAINT `detalles_venta_fisica_ibfk_1` FOREIGN KEY (`ID_Venta`) REFERENCES `ventas_fisicas` (`ID_Venta`),
  ADD CONSTRAINT `detalles_venta_fisica_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `historial_movimientos`
--
ALTER TABLE `historial_movimientos`
  ADD CONSTRAINT `historial_movimientos_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`),
  ADD CONSTRAINT `historial_movimientos_ibfk_2` FOREIGN KEY (`ID_Lote_Afectado`) REFERENCES `inventario_lotes` (`ID_Lote`),
  ADD CONSTRAINT `historial_movimientos_ibfk_3` FOREIGN KEY (`ID_Usuario_Responsable`) REFERENCES `usuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `inventario_lotes`
--
ALTER TABLE `inventario_lotes`
  ADD CONSTRAINT `inventario_lotes_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`),
  ADD CONSTRAINT `inventario_lotes_ibfk_2` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`),
  ADD CONSTRAINT `inventario_lotes_ibfk_3` FOREIGN KEY (`ID_Usuario_Recibio`) REFERENCES `usuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `pedidos_web_pickup`
--
ALTER TABLE `pedidos_web_pickup`
  ADD CONSTRAINT `pedidos_web_pickup_ibfk_1` FOREIGN KEY (`ID_Usuario_Cliente`) REFERENCES `usuarios` (`ID_Usuario`),
  ADD CONSTRAINT `pedidos_web_pickup_ibfk_2` FOREIGN KEY (`ID_Usuario_Cajero_Atendio`) REFERENCES `usuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_Categoria`) REFERENCES `categorias` (`ID_Categoria`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_Rol`) REFERENCES `roles` (`ID_Rol`);

--
-- Filtros para la tabla `ventas_fisicas`
--
ALTER TABLE `ventas_fisicas`
  ADD CONSTRAINT `ventas_fisicas_ibfk_1` FOREIGN KEY (`ID_Usuario_Cajero`) REFERENCES `usuarios` (`ID_Usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
