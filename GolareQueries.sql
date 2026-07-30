CREATE DATABASE golare;

USE golare;

CREATE TABLE areas(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL UNIQUE,
descripcion TEXT
);

CREATE TABLE marcas(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL UNIQUE,
descripcion TEXT,
imagen VARCHAR(255)
);

CREATE TABLE usuarios(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
password_hash VARCHAR(100) NOT NULL,
departamento ENUM(
    'Direccion',
    'Sub-Direccion',
    'Gerencia de Operaciones',
    'Gerencia de Ventas',
    'Gerencia de Administracion',
    'Jefe de Almacen',
    'Jefe de Ingenieria',
    'Vendedor',
    'Operador',
    'Ingeniero',
    'RH',
    'Asesoria',
    'Cobranza',
    'Facturacion',
    'Sistemas',
    'Intendencia'
) NOT NULL DEFAULT 'Operador'
);

INSERT INTO usuarios (nombre,email,password_hash,departamento) VALUES ('Admin', 'admin@gmail.com', '$2b$10$UN7fTRIlsiF3f/.y/Hq0EO25bGjGhFJey.KA/xjl/WvTBZMf6InGS', 'Direccion');

CREATE TABLE clientes(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre_comercial VARCHAR(150) NOT NULL,
contacto_principal VARCHAR(100),
telefono VARCHAR(20),
correo VARCHAR(100),
direccion TEXT,
estado ENUM('Activo','Inactivo') DEFAULT 'Activo',
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE equipos(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
numero_serie VARCHAR(100) UNIQUE NOT NULL,
modelo VARCHAR(100),
area_id INT NOT NULL,
marca_id INT,
cliente_id INT,
fecha_instalacion DATE NULL,
fecha_mantenimiento DATE NULL,
estado ENUM('Activo','Inactivo') DEFAULT 'Activo',
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (area_id) REFERENCES areas(id) ON DELETE RESTRICT,
FOREIGN KEY (marca_id) REFERENCES marcas(id) ON DELETE RESTRICT,
FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE RESTRICT
);

CREATE TABLE categorias_producto(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
);

CREATE TABLE productos(
id INT AUTO_INCREMENT PRIMARY KEY,
sku VARCHAR(50) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL UNIQUE,
descripcion TEXT,
presentacion VARCHAR(100) NULL,
precio DECIMAL(10,2) NOT NULL,
stock_minimo INT NOT NULL,
estado BOOLEAN NOT NULL,
marca_id INT,
area_id INT,
equipo_id INT,
categoria_id INT,
FOREIGN KEY (categoria_id) REFERENCES categorias_producto(id),
FOREIGN KEY (marca_id) REFERENCES marcas(id) ON DELETE SET NULL,
FOREIGN KEY (area_id) REFERENCES areas(id) ON DELETE SET NULL,
FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON DELETE RESTRICT
);

CREATE TABLE lotes (
id INT AUTO_INCREMENT PRIMARY KEY,
producto_id INT,
numero_lote VARCHAR(100) NOT NULL UNIQUE,
fecha_caducidad DATE NOT NULL,
cantidad_inicial INT NOT NULL,
cantidad_disponible INT NOT NULL,
estado ENUM('Activo','Agotado','Caducado'),
FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE RESTRICT
);

CREATE TABLE movimientos_inventario(
id INT AUTO_INCREMENT PRIMARY KEY,
folio VARCHAR(255) NOT NULL UNIQUE,
lote_id INT,
usuario_id INT,
cliente_id INT, 
tipo_movimiento ENUM('Entrada','Salida','Ajuste','Merma'),
cantidad INT NOT NULL,
fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
comentarios TEXT,
FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL,
FOREIGN KEY (lote_id) REFERENCES lotes(id) ON DELETE RESTRICT,
FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE RESTRICT
);

ALTER TABLE clientes ADD COLUMN razon_social VARCHAR(150) AFTER nombre_comercial;

ALTER TABLE movimientos_inventario ADD COLUMN precio_venta DECIMAL(10,2) DEFAULT NULL AFTER cantidad;

ALTER TABLE movimientos_inventario DROP INDEX `folio`;

select * from clientes;

SELECT 
                m.folio, 
                m.fecha_hora, 
                m.cantidad, 
                m.precio_venta, 
                l.numero_lote, 
                p.sku, 
                p.nombre as producto 
            FROM movimientos_inventario m 
            JOIN lotes l ON m.lote_id = l.id 
            JOIN productos p ON l.producto_id = p.id 
            WHERE m.cliente_id = 9 AND m.tipo_movimiento = 'Salida' 
            ORDER BY m.fecha_hora DESC;
            
SELECT 
                m.folio, 
                m.tipo_movimiento, 
                m.cantidad, 
                m.precio,
                m.fecha_hora, 
                m.comentarios,
                p.nombre AS producto, 
                p.sku,
                l.numero_lote,
                u.nombre AS usuario,
                c.nombre_comercial AS cliente
            FROM movimientos_inventario m
            JOIN lotes l ON m.lote_id = l.id
            JOIN productos p ON l.producto_id = p.id
            JOIN usuarios u ON m.usuario_id = u.id
            LEFT JOIN clientes c ON m.cliente_id = c.id
            ORDER BY m.fecha_hora DESC
            LIMIT 150;

ALTER TABLE productos DROP COLUMN precio;
             



