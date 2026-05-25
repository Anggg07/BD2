CREATE DATABASE comercializadora_aguacates;
GO

USE comercializadora_aguacates;
GO

CREATE TABLE productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE empleados (
    id_empleado INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

CREATE TABLE ventas (
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    cantidad INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    id_producto INT,
    id_cliente INT,
    id_empleado INT,
    CONSTRAINT fk_ventas_productos FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    CONSTRAINT fk_ventas_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_ventas_empleados FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);
GO

INSERT INTO productos (nombre, tipo, precio, cantidad) VALUES
('Hass', 'Premium', 5000, 100),
('Papelillo', 'Exportacion', 4500, 80),
('Choquette', 'Nacional', 3000, 120),
('Fuerte', 'Premium', 5500, 60),
('Criollo', 'Tradicional', 2500, 200);

INSERT INTO clientes (nombre, telefono, ciudad) VALUES
('Andres Llanos', '3001234567', 'Medellin'),
('Maria Gomez', '3019876543', 'Bogota'),
('Carlos Ramirez', '3024567890', 'Cali'),
('Laura Torres', '3041122334', 'Barranquilla'),
('Santiago Ruiz', '3059988776', 'Cartagena');

INSERT INTO empleados (nombre, cargo, salario) VALUES
('Juan Perez', 'Administrador', 3500000),
('Camila Lopez', 'Vendedora', 1800000),
('David Martinez', 'Supervisor', 2500000),
('Sara Gutierrez', 'Cajera', 1600000),
('Felipe Castro', 'Bodega', 1700000);

INSERT INTO ventas (fecha, cantidad, total, id_producto, id_cliente, id_empleado) VALUES
('2026-05-19', 10, 50000, 1, 1, 2),
('2026-05-19', 15, 67500, 2, 2, 2),
('2026-05-20', 20, 60000, 3, 3, 4),
('2026-05-20', 8, 44000, 4, 4, 1),
('2026-05-21', 30, 75000, 5, 5, 3);
GO

SELECT * FROM productos;
SELECT * FROM clientes;
SELECT nombre, precio FROM productos;
SELECT * FROM productos WHERE tipo = 'Premium';
SELECT * FROM productos WHERE precio > 4000;
SELECT * FROM clientes WHERE ciudad = 'Medellin';
SELECT * FROM productos ORDER BY precio ASC;
SELECT * FROM productos ORDER BY precio DESC;
SELECT TOP 3 * FROM productos; 
SELECT COUNT(*) AS total_productos FROM productos;
SELECT SUM(total) AS total_ventas FROM ventas;
SELECT AVG(precio) AS promedio FROM productos;
SELECT MAX(total) AS venta_mayor FROM ventas;
SELECT MIN(total) AS venta_menor FROM ventas;
SELECT * FROM productos WHERE nombre LIKE 'H%';
SELECT * FROM clientes WHERE nombre LIKE '%a%';
SELECT * FROM ventas WHERE total > 50000;
UPDATE productos SET precio = 6000 WHERE id_producto = 1;
DELETE FROM clientes WHERE id_cliente = 5;

SELECT 
    c.nombre AS cliente, 
    p.nombre AS producto, 
    e.nombre AS empleado, 
    v.total
FROM ventas v
INNER JOIN productos p 
ON v.id_producto = p.id_producto
INNER JOIN clientes c 
ON v.id_cliente = c.id_cliente
INNER JOIN empleados e 
ON v.id_empleado = e.id_empleado;