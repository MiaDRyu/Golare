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

CREATE TABLE productos(
id INT AUTO_INCREMENT PRIMARY KEY,
sku VARCHAR(50) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL UNIQUE,
descripcion TEXT,
precio DECIMAL(10,2) NOT NULL,
stock_minimo INT NOT NULL,
estado BOOLEAN NOT NULL,
marca_id INT,
area_id INT,
FOREIGN KEY (marca_id) REFERENCES marcas(id) ON DELETE SET NULL,
FOREIGN KEY (area_id) REFERENCES areas(id) ON DELETE SET NULL
);

CREATE TABLE usuarios(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
password_hash VARCHAR(100) NOT NULL,
departamento ENUM('Almacen','Ingenieria','Ventas','Administracion')
);

CREATE TABLE lotes (
id INT AUTO_INCREMENT PRIMARY KEY,
producto_id INT,
numero_lote VARCHAR(100) NOT NULL,
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
tipo_movimiento ENUM('Entrada','Salida','Ajuste','Merma'),
cantidad INT NOT NULL,
fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
comentarios TEXT,
FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL,
FOREIGN KEY (lote_id) REFERENCES lotes(id) ON DELETE RESTRICT
);



