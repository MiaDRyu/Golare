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

ALTER TABLE productos
ADD COLUMN presentacion VARCHAR(100) NULL AFTER nombre;

CREATE TABLE equipos(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
area_id INT NOT NULL,
estado ENUM('Activo','Inactivo') DEFAULT 'Activo',
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_equipo_area FOREIGN KEY (area_id) REFERENCES areas(id) ON DELETE RESTRICT
);

ALTER TABLE productos 
ADD COLUMN equipo_id INT NULL AFTER area_id,
ADD CONSTRAINT fk_producto_equipo FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON DELETE RESTRICT; 

CREATE TABLE usuarios(
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
password_hash VARCHAR(100) NOT NULL,
departamento ENUM('Almacen','Ingenieria','Ventas','Administracion')
);

ALTER TABLE usuarios
MODIFY COLUMN departamento ENUM(
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
) NOT NULL DEFAULT 'Operador';

UPDATE usuarios SET departamento = 'Jefe de Almacen' WHERE departamento = 'Almacen';
UPDATE usuarios SET departamento = 'Jefe de Ingenieria' WHERE departamento = 'Ingenieria';
UPDATE usuarios SET departamento = 'Gerencia de Ventas' WHERE departamento = 'Ventas';
UPDATE usuarios SET departamento = 'Direccion' WHERE departamento = 'administracion';

DELETE FROM usuarios WHERE departamento is null;

SET SQL_SAFE_UPDATES = 1;

select * from usuarios;

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

ALTER TABLE movimientos_inventario 
ADD COLUMN cliente_id INT NULL AFTER usuario_id,
ADD CONSTRAINT fk_mov_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE RESTRICT;

ALTER TABLE lotes ADD UNIQUE(numero_lote);

INSERT INTO areas (nombre, descripcion) VALUES
('Diagnóstico', 'Equipos y reactivos para diagnóstico clínico'),
('Hematología', 'Material para análisis sanguíneos'),
('Microbiología', 'Equipos y consumibles microbiológicos'),
('Química Clínica', 'Reactivos y equipos de química clínica'),
('Patología', 'Material para histopatología'),
('Imagenología', 'Equipos de imagen médica'),
('Urgencias', 'Material de atención inmediata'),
('Cirugía', 'Instrumental quirúrgico'),
('Hospitalización', 'Insumos para pacientes'),
('Odontología', 'Material odontológico'),
('Veterinaria', 'Productos para clínicas veterinarias'),
('Investigación', 'Material para investigación científica'),
('Biología Molecular', 'Equipos y reactivos moleculares'),
('Esterilización', 'Control y procesos de esterilización'),
('Seguridad', 'Equipo de protección personal'),
('Almacenamiento', 'Conservación de muestras'),
('Banco de Sangre', 'Material para transfusión'),
('Laboratorio Escolar', 'Equipo para enseñanza'),
('Control de Calidad', 'Validación y pruebas'),
('Administración Técnica', 'Apoyo técnico y documentación');

INSERT INTO marcas (nombre, descripcion, imagen) VALUES
('MedLab', 'Equipos para laboratorio clínico', 'medlab.png'),
('BioTech', 'Tecnología biomédica', 'biotech.png'),
('LabPro', 'Consumibles de laboratorio', 'labpro.png'),
('HealthPlus', 'Material médico general', 'healthplus.png'),
('MediCore', 'Equipos hospitalarios', 'medicore.png'),
('Diagnostix', 'Reactivos diagnósticos', 'diagnostix.png'),
('SafeMed', 'Equipo de protección', 'safemed.png'),
('SteriLab', 'Productos de esterilización', 'sterilab.png'),
('GeneTech', 'Biología molecular', 'genetech.png'),
('MicroScience', 'Microbiología avanzada', 'microscience.png'),
('VisionMed', 'Imagenología médica', 'visionmed.png'),
('HematoPlus', 'Equipos hematológicos', 'hematoplus.png'),
('DentalCare', 'Material odontológico', 'dentalcare.png'),
('VetSolutions', 'Productos veterinarios', 'vetsolutions.png'),
('ChemLab', 'Química clínica', 'chemlab.png'),
('ResearchPro', 'Investigación científica', 'researchpro.png'),
('CryoSafe', 'Almacenamiento y refrigeración', 'cryosafe.png'),
('QualityCheck', 'Control de calidad', 'qualitycheck.png'),
('SurgiTech', 'Instrumental quirúrgico', 'surgitech.png'),
('MediSupply', 'Suministros médicos', 'medisupply.png');

INSERT INTO productos
(sku,nombre,descripcion,precio,stock_minimo,estado,marca_id,area_id)
VALUES
('MED001','Guantes de Nitrilo','Caja de 100 guantes',250.00,20,1,7,15),
('MED002','Mascarilla KN95','Paquete de 10 piezas',120.00,30,1,7,15),
('MED003','Jeringa 10ml','Jeringa estéril desechable',8.50,100,1,20,7),
('MED004','Termómetro Digital','Uso clínico',450.00,10,1,5,7),
('MED005','Microscopio Binocular','Microscopio profesional',12500.00,2,1,10,3),
('MED006','Centrífuga de Laboratorio','12 tubos',9800.00,2,1,2,2),
('MED007','Reactivo Glucosa','Kit para química clínica',1800.00,5,1,15,4),
('MED008','Tubo Vacutainer EDTA','Caja de 100 tubos',650.00,20,1,12,2),
('MED009','Portaobjetos','Caja de 50 piezas',220.00,15,1,3,3),
('MED010','Autoclave 50L','Esterilizador automático',35000.00,1,1,8,14),
('MED011','PCR Master Mix','Reactivo molecular',4200.00,3,1,9,13),
('MED012','Puntas para Micropipeta','Bolsa 1000 unidades',350.00,30,1,3,12),
('MED013','Micropipeta 100-1000uL','Micropipeta ajustable',2500.00,5,1,16,12),
('MED014','Monitor de Signos Vitales','Equipo hospitalario',28500.00,2,1,5,9),
('MED015','Bata Desechable','Protección médica',45.00,100,1,7,15),
('MED016','Refrigerador para Vacunas','Conservación biológica',45000.00,1,1,17,16),
('MED017','Bolsa para Sangre','Bolsa estéril',120.00,50,1,20,17),
('MED018','Kit de Cultivo Bacteriano','Microbiología básica',950.00,10,1,10,3),
('MED019','Instrumental de Sutura','Kit quirúrgico',1800.00,5,1,19,8),
('MED020','Modelo Anatómico Humano','Material educativo',3200.00,2,1,16,18);

INSERT INTO usuarios
(nombre,email,password_hash,departamento)
VALUES
('Juan Perez','juan@empresa.com','hash001','Almacen'),
('Maria Lopez','maria@empresa.com','hash002','Ventas'),
('Carlos Ruiz','carlos@empresa.com','hash003','Ingenieria'),
('Ana Torres','ana@empresa.com','hash004','Administracion'),
('Luis Garcia','luis@empresa.com','hash005','Almacen'),
('Sofia Mendoza','sofia@empresa.com','hash006','Ventas'),
('Pedro Chavez','pedro@empresa.com','hash007','Ingenieria'),
('Laura Diaz','laura@empresa.com','hash008','Administracion'),
('Diego Ramos','diego@empresa.com','hash009','Almacen'),
('Valeria Cruz','valeria@empresa.com','hash010','Ventas'),
('Jorge Morales','jorge@empresa.com','hash011','Ingenieria'),
('Fernanda Soto','fernanda@empresa.com','hash012','Administracion'),
('Miguel Herrera','miguel@empresa.com','hash013','Almacen'),
('Daniela Flores','daniela@empresa.com','hash014','Ventas'),
('Ricardo Vega','ricardo@empresa.com','hash015','Ingenieria'),
('Paola Navarro','paola@empresa.com','hash016','Administracion'),
('Alejandro Silva','alejandro@empresa.com','hash017','Almacen'),
('Gabriela Ortiz','gabriela@empresa.com','hash018','Ventas'),
('Hector Castillo','hector@empresa.com','hash019','Ingenieria'),
('Monica Luna','monica@empresa.com','hash020','Administracion');

INSERT INTO lotes
(producto_id,numero_lote,fecha_caducidad,cantidad_inicial,cantidad_disponible,estado)
VALUES
(2,'LOT-2026-001','2027-12-31',500,420,'Activo'),
(63,'LOT-2026-002','2027-08-15',300,250,'Activo'),
(64,'LOT-2026-003','2028-01-20',1000,860,'Activo'),
(65,'LOT-2026-004','2029-05-10',100,85,'Activo'),
(66,'LOT-2026-005','2032-12-31',20,18,'Activo'),
(67,'LOT-2026-006','2031-09-30',15,12,'Activo'),
(68,'LOT-2026-007','2027-06-15',80,50,'Activo'),
(69,'LOT-2026-008','2028-03-12',400,350,'Activo'),
(70,'LOT-2026-009','2030-01-01',200,180,'Activo'),
(71,'LOT-2026-010','2035-12-31',5,4,'Activo'),
(72,'LOT-2026-011','2027-11-30',40,28,'Activo'),
(73,'LOT-2026-012','2030-06-30',1000,920,'Activo'),
(74,'LOT-2026-013','2031-04-15',50,40,'Activo'),
(75,'LOT-2026-014','2033-08-20',10,7,'Activo'),
(76,'LOT-2026-015','2028-10-01',800,650,'Activo'),
(77,'LOT-2026-016','2034-02-28',4,3,'Activo'),
(78,'LOT-2026-017','2027-09-15',600,510,'Activo'),
(79,'LOT-2026-018','2027-05-25',150,120,'Activo'),
(80,'LOT-2026-019','2030-12-31',50,43,'Activo'),
(81,'LOT-2026-020','2035-01-01',10,9,'Activo');

select * from lotes where producto_id = 65;

select * from movimientos_inventario;





