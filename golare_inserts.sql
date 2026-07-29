INSERT INTO areas (nombre, descripcion) VALUES
('QUIMICA CLINICA', 'Reactivos, controles y consumibles para equipos de química clínica.'),
('HEMATOLOGIA', 'Reactivos y consumibles para equipos de hematología.'),
('MAGLUMI 100', 'Reactivos y accesorios para el analizador de inmunoensayo Maglumi 100.'),
('MAGLUMI 50', 'Reactivos y accesorios para el analizador de inmunoensayo Maglumi 50.'),
('UROLOGIA', 'Reactivos y tiras para análisis de orina.'),
('HB GLICOSILADA', 'Reactivos y consumibles para determinación de hemoglobina glicosilada (HbA1c).');

INSERT INTO marcas (nombre, descripcion, imagen) VALUES
('FUJI', 'Fabricante de reactivos y equipos para química clínica.', NULL),
('SNIBE', 'Fabricante de reactivos y analizadores de inmunoensayo Maglumi.', NULL),
('HORIBA', 'Fabricante del analizador hematológico Micros 60 OT.', NULL),
('SIEMENS', 'Fabricante del analizador de uroanálisis Clinitek Status.', NULL),
('EPITHOD', 'Fabricante del analizador para hemoglobina glicosilada EPITHOD 616.', NULL);

INSERT INTO equipos
(nombre, numero_serie, modelo, area_id, marca_id, cliente_id, fecha_instalacion, fecha_mantenimiento, estado)
VALUES
('FUJI 500', 'FJ500-001', 'FUJI 500', 1, 1, NULL, '2024-01-15', '2025-01-15', 'Activo'),
('MICROS 60 OT', 'M60OT-001', 'MICROS 60 OT', 2, 3, NULL, '2024-02-10', '2025-02-10', 'Activo'),
('MAGLUMI 800', 'MG800-001', 'MAGLUMI 800', 3, 2, NULL, '2024-03-05', '2025-03-05', 'Activo'),
('CLINITEK STATUS', 'CLS-001', 'CLINITEK STATUS', 5, 4, NULL, '2024-04-12', '2025-04-12', 'Activo'),
('EPITHOD 616', 'EP616-001', 'EPITHOD 616', 6, 5, NULL, '2024-05-20', '2025-05-20', 'Activo');

INSERT INTO clientes
(nombre_comercial, contacto_principal, telefono, correo, direccion, estado)
VALUES
('Laboratorio Clínico San José', 'Dra. Ana Martínez', '6141234567', 'contacto@labsanjose.com', 'Chihuahua, Chihuahua', 'Activo'),
('Hospital Ángeles Chihuahua', 'Ing. Roberto López', '6142234567', 'compras@hangeleschih.com', 'Chihuahua, Chihuahua', 'Activo'),
('Laboratorio Médico del Norte', 'QFB Laura Hernández', '6143234567', 'ventas@labnorte.com', 'Chihuahua, Chihuahua', 'Activo'),
('Clínica Integral Salud', 'Dr. Miguel Torres', '6144234567', 'administracion@clintegral.com', 'Delicias, Chihuahua', 'Activo'),
('Centro de Diagnóstico BioLab', 'QFB Patricia Gómez', '6145234567', 'contacto@biolab.com.mx', 'Cuauhtémoc, Chihuahua', 'Activo'),
('Laboratorio San Felipe', 'Dra. Verónica Ruiz', '6146234567', 'direccion@labsanfelipe.com', 'Parral, Chihuahua', 'Activo'),
('Hospital Regional del Centro', 'Lic. Eduardo Castro', '6147234567', 'compras@hospitalregional.com', 'Chihuahua, Chihuahua', 'Activo'),
('Laboratorios Nova', 'QFB Karla Medina', '6148234567', 'ventas@laboratoriosnova.com', 'Ciudad Juárez, Chihuahua', 'Activo'),
('Centro Médico Christus', 'Ing. Ricardo Salas', '6149234567', 'abastecimiento@christus.com', 'Ciudad Juárez, Chihuahua', 'Activo'),
('Diagnóstico Especializado del Norte', 'Dra. Sofía Ramírez', '6141112233', 'contacto@diagnosticonorte.com', 'Chihuahua, Chihuahua', 'Activo');

INSERT INTO productos
(sku,nombre,descripcion,presentacion,precio,stock_minimo,estado,marca_id,area_id,equipo_id)
VALUES
('1050','FDC GLUCOSA (GLU) C/24 100476',NULL,NULL,0.00,1,TRUE,1,1,1),
('1094','FDC ELECTROLITOS (NAKCI) C/24 100487',NULL,NULL,0.00,1,TRUE,1,1,1),
('1150','FDC NITROGENO UREICO (BUN) C/24 100472',NULL,NULL,0.00,1,TRUE,1,1,1),
('1350','FDC ACIDO URICO (UA) C/24 100486',NULL,NULL,0.00,1,TRUE,1,1,1),
('1450','FDC COLESTEROL TOTAL (TCHO) C/24 100483',NULL,NULL,0.00,1,TRUE,1,1,1);

 select * from equipos where nombre like '%FUJI%';
select * from marcas;

INSERT INTO lotes
(producto_id,numero_lote,fecha_caducidad,cantidad_inicial,cantidad_disponible,estado)
VALUES
(1,'FJ250701','2027-07-31',1,1,'Activo'),
(2,'FJ250702','2027-07-31',0,0,'Agotado'),
(3,'FJ250703','2027-07-31',1,1,'Activo'),
(4,'FJ250704','2027-07-31',1,1,'Activo'),
(5,'FJ250705','2027-07-31',1,1,'Activo');

INSERT INTO equipos
(nombre, numero_serie, modelo, area_id, marca_id, cliente_id, fecha_instalacion, fecha_mantenimiento, estado)
VALUES
('XS 1000i', 'XS1000I-001', 'XS 1000i', 2, NULL, NULL, '2024-06-15', '2025-06-15', 'Activo');

INSERT INTO productos
(sku,nombre,descripcion,presentacion,precio,stock_minimo,estado,marca_id,area_id,equipo_id)
VALUES
('h20201','Diaton-Diff-LMG-Diluent',NULL,'20 LT.',0.00,2,TRUE,3,2,2),
('h20212','Dialyse-Diff-LMG',NULL,'1 LT.',0.00,2,TRUE,3,2,2),
('h20215','Dia-Cleaner',NULL,'1 LT.',0.00,2,TRUE,3,2,2),
('DDC-18T','D-CHECK-D TRI LEVEL',NULL,'2.5 x 3 ml',0.00,1,TRUE,3,2,2);

INSERT INTO productos
(sku,nombre,descripcion,presentacion,precio,stock_minimo,estado,marca_id,area_id,equipo_id)
VALUES
('h23101','Diaton-SYS-Diluent',NULL,'20 LT.',0.00,2,TRUE,3,2,6),
('h23105','Dialyser-SYS-SHB',NULL,'5 LT.',0.00,2,TRUE,3,2,6),
('h23601','Diastromlyser-SYS-4DL',NULL,'5 LT.',0.00,2,TRUE,3,2,6),
('h23602','Diastromlyser-SYS-4DS-Dye',NULL,'42 ML.',0.00,2,TRUE,3,2,6);

INSERT INTO categorias_producto (nombre, descripcion) VALUES
('Tiroides', 'Pruebas relacionadas con la función y enfermedades tiroideas.'),
('Fertilidad', 'Pruebas hormonales para evaluación de fertilidad y reproducción.'),
('Tamiz Prenatal', 'Pruebas utilizadas para el cribado prenatal.'),
('Marcadores Tumorales', 'Pruebas para la detección y seguimiento de marcadores tumorales.'),
('Metabolismo', 'Pruebas relacionadas con el metabolismo y funciones endocrinas.'),
('Cardiología', 'Pruebas para evaluación de enfermedades cardiovasculares.'),
('Función Renal', 'Pruebas para evaluar la función de los riñones.'),
('Alergias', 'Pruebas inmunológicas relacionadas con alergias e inmunoglobulinas.'),
('TORCH', 'Pruebas para el diagnóstico de infecciones del complejo TORCH.'),
('Virus de Epstein-Barr (EBV)', 'Pruebas serológicas para infección por el virus de Epstein-Barr.'),
('Fibrosis Hepática', 'Pruebas para la evaluación de fibrosis y daño hepático.'),
('Metabolismo Óseo', 'Pruebas relacionadas con el metabolismo del tejido óseo.'),
('Monitoreo de Fármacos', 'Pruebas para el seguimiento de niveles terapéuticos de medicamentos.'),
('COVID-19', 'Pruebas para el diagnóstico y seguimiento de SARS-CoV-2.'),
('Controles Internos', 'Controles de calidad internos para el equipo.'),
('Consumibles', 'Reactivos auxiliares y consumibles necesarios para la operación del equipo.');

INSERT INTO productos
(sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, area_id, equipo_id, categoria_id)
VALUES
 
-- === THYROID (categoria_id = 1) ===
('130203001M', 'MAGLUMI TSH (3ra. GENERACION)', NULL, '100 PBAS', 2292.59, 1, 1, 2, 3, 3, 1),
('130203002M', 'MAGLUMI T4', NULL, '100 PBAS', 2292.59, 1, 1, 2, 3, 3, 1),
('130203003M', 'MAGLUMI T3', NULL, '100 PBAS', 2292.59, 1, 1, 2, 3, 3, 1),
('130203004M', 'MAGLUMI FT4', NULL, '100 PBAS', 2292.59, 1, 1, 2, 3, 3, 1),
('130203005M', 'MAGLUMI FT3', NULL, '100 PBAS', 2216.12, 1, 1, 2, 3, 3, 1),
('130203011M', 'MAGLUMI Anti-TPO', NULL, '100 PBAS', 7952.95, 1, 1, 2, 3, 3, 1),
('130203006M', 'MAGLUMI TG (Tiroglobulina)', NULL, '100 PBAS', 4435.29, 1, 1, 2, 3, 3, 1),
('130203007M', 'MAGLUMI TGA (ANTI-Tg)', NULL, '100 PBAS', 5047.06, 1, 1, 2, 3, 3, 1),
('130203009M', 'MAGLUMI TRAb', NULL, '100 PBAS', 9752.60, 1, 1, 2, 3, 3, 1),
('130203008M', 'MAGLUMI TMA (Microsoma Tiroideo)', NULL, '100 PBAS', 5047.06, 1, 1, 2, 3, 3, 1),
 
-- === FERTILITY (categoria_id = 2) ===
('130202001M', 'MAGLUMI FSH', NULL, '100 PBAS', 2882.72, 1, 1, 2, 3, 3, 2),
('130202002M', 'MAGLUMI LH', NULL, '100 PBAS', 2882.88, 1, 1, 2, 3, 3, 2),
('130202003M', 'MAGLUMI HCG/Beta-HCG', NULL, '100 PBAS', 2882.88, 1, 1, 2, 3, 3, 2),
('130202006M', 'MAGLUMI PRL', NULL, '100 PBAS', 2882.88, 1, 1, 2, 3, 3, 2),
('130202007M', 'MAGLUMI ESTRADIOL (E2)', NULL, '100 PBAS', 2882.88, 1, 1, 2, 3, 3, 2),
('130202008M', 'MAGLUMI ESTRIOL LIBRE (FE3)', NULL, '100 PBAS', 2882.88, 1, 1, 2, 3, 3, 2),
('130202009M', 'MAGLUMI PROGESTERONA (PRG)', NULL, '100 PBAS', 2882.88, 1, 1, 2, 3, 3, 2),
('130202010M', 'MAGLUMI TESTOSTERONA (TEST)', NULL, '100 PBAS', 2882.88, 1, 1, 2, 3, 3, 2),
('130202011M', 'MAGLUMI FREE TESTOSTERONE', NULL, '100 PBAS', 4710.59, 1, 1, 2, 3, 3, 2),
('130202012M', 'MAGLUMI DHEA-S', NULL, '100 PBAS', 7623.36, 1, 1, 2, 3, 3, 2),
 
-- === PRENATAL SCREENING (categoria_id = 3) ===
('130214001M', 'MAGLUMI cAFP', NULL, '100 PBAS', 4595.12, 1, 1, 2, 3, 3, 3),
('130214002M', 'MAGLUMI FREE B-HCG', NULL, '100 PBAS', 5352.95, 1, 1, 2, 3, 3, 3),
('130214003M', 'MAGLUMI PAPP-A', NULL, '100 PBAS', 8105.88, 1, 1, 2, 3, 3, 3),
 
-- === TUMOR MARKER (categoria_id = 4) ===
('130201001M', 'MAGLUMI FERRITIN', NULL, '100 PBAS', 2292.59, 1, 1, 2, 3, 3, 4),
('130201002M', 'MAGLUMI AFP', NULL, '100 PBAS', 2292.59, 1, 1, 2, 3, 3, 4),
('130201003M', 'MAGLUMI CEA', NULL, '100 PBAS', 2292.59, 1, 1, 2, 3, 3, 4),
('130201004M', 'MAGLUMI PSA', NULL, '100 PBAS', 4970.59, 1, 1, 2, 3, 3, 4),
('130201005M', 'MAGLUMI F-PSA', NULL, '100 PBAS', 4970.59, 1, 1, 2, 3, 3, 4),
('130201009M', 'MAGLUMI CA 125', NULL, '100 PBAS', 7119.41, 1, 1, 2, 3, 3, 4),
('130201010M', 'MAGLUMI CA 15-3', NULL, '100 PBAS', 7119.41, 1, 1, 2, 3, 3, 4),
('130201012M', 'MAGLUMI CA 50', NULL, '100 PBAS', 7119.41, 1, 1, 2, 3, 3, 4),
('130201015M', 'MAGLUMI CA 72-4', NULL, '100 PBAS', 7119.41, 1, 1, 2, 3, 3, 4),
('130201011M', 'MAGLUMI CA 19-9', NULL, '100 PBAS', 7119.41, 1, 1, 2, 3, 3, 4),
('130201014M', 'MAGLUMI CA 242', NULL, '100 PBAS', 8311.59, 1, 1, 2, 3, 3, 4),
('130201013M', 'MAGLUMI CYFRA 21-1', NULL, '100 PBAS', 7800.00, 1, 1, 2, 3, 3, 4),
('130201016M', 'MAGLUMI NSE', NULL, '100 PBAS', 7341.18, 1, 1, 2, 3, 3, 4),
('130201019M', 'MAGLUMI PEPSINOGEN I (PG I)', NULL, '100 PBAS', 7341.18, 1, 1, 2, 3, 3, 4),
('130204018M', 'MAGLUMI SCCA', NULL, '100 PBAS', 10262.36, 1, 1, 2, 3, 3, 4),
('130201017M', 'MAGLUMI S-100 (Proteina Sangtec 100)', NULL, '100 PBAS', 21865.55, 1, 1, 2, 3, 3, 4),
('130201006M', 'MAGLUMI PAP (Fosfatasa Acida Prostatica)', NULL, '100 PBAS', 7609.28, 1, 1, 2, 3, 3, 4),
 
-- === METABOLISMO (categoria_id = 5) ===
('130205001M', 'MAGLUMI PEPTIDO C', NULL, '100 PBAS', 7058.82, 1, 1, 2, 3, 3, 5),
('130205002M', 'MAGLUMI INSULINA', NULL, '100 PBAS', 7058.82, 1, 1, 2, 3, 3, 5),
('130205007M', 'MAGLUMI IGF-I', NULL, '100 PBAS', 19482.36, 1, 1, 2, 3, 3, 5),
('130211004M', 'MAGLUMI 25 OH-VITAMIN D', NULL, '100 PBAS', 21441.17, 1, 1, 2, 3, 3, 5),
('130211001M', 'MAGLUMI Intact PTH', NULL, '100 PBAS', 12941.18, 1, 1, 2, 3, 3, 5),
('130216001M', 'MAGLUMI PROCALCITONINA (PCT)', NULL, '100 PBAS', 25647.06, 1, 1, 2, 3, 3, 5),
('130298001M', 'MAGLUMI GH', NULL, '100 PBAS', 6823.53, 1, 1, 2, 3, 3, 5),
('130298002M', 'MAGLUMI CORTISOL', NULL, '100 PBAS', 4941.17, 1, 1, 2, 3, 3, 5),
('130298003M', 'MAGLUMI ACTH', NULL, '100 PBAS', 12531.19, 1, 1, 2, 3, 3, 5),
('130213002M', 'MAGLUMI VITAMINA B12', NULL, '100 PBAS', 14588.24, 1, 1, 2, 3, 3, 5),
('130205004M', 'MAGLUMI Proinsulin', NULL, '100 PBAS', 15004.00, 1, 1, 2, 3, 3, 5),
('130213001M', 'MAGLUMI FA (Acido Folico)', NULL, '100 PBAS', 8712.00, 1, 1, 2, 3, 3, 5),
('130205003M', 'MAGLUMI IAA (Autoanticuerpos Insulina)', NULL, '100 PBAS', 14067.05, 1, 1, 2, 3, 3, 5),
('130205005M', 'MAGLUMI GAD 65', NULL, '100 PBAS', 12787.06, 1, 1, 2, 3, 3, 5),
 
-- === CARDIAC (categoria_id = 6) ===
('130206002M', 'MAGLUMI TROPONINA I', NULL, '100 PBAS', 15294.12, 1, 1, 2, 3, 3, 6),
('130206007M', 'MAGLUMI ALDOSTERONA', NULL, '100 PBAS', 11741.17, 1, 1, 2, 3, 3, 6),
('130206008M', 'MAGLUMI DIMERO D', NULL, '100 PBAS', 15764.71, 1, 1, 2, 3, 3, 6),
('130216002M', 'MAGLUMI CRP', NULL, '100 PBAS', 8235.29, 1, 1, 2, 3, 3, 6),
('130206003M', 'MAGLUMI MYOGLOBIN', NULL, '100 PBAS', 12787.06, 1, 1, 2, 3, 3, 6),
('130206004M', 'MAGLUMI NT-proBNP', NULL, '100 PBAS', 25647.06, 1, 1, 2, 3, 3, 6),
('130206001M', 'MAGLUMI CK-MB', NULL, '100 PBAS', 19831.06, 1, 1, 2, 3, 3, 6),
('130206005M', 'MAGLUMI ANGIOTENSINA I', NULL, '100 PBAS', 18668.94, 1, 1, 2, 3, 3, 6),
 
-- === KIDNEY FUNCTION (categoria_id = 7) ===
('130204001M', 'MAGLUMI B2-MG', NULL, '100 PBAS', 7294.12, 1, 1, 2, 3, 3, 7),
('130204002M', 'MAGLUMI ALBUMIN (ALBUMINA)', NULL, '100 PBAS', 8727.52, 1, 1, 2, 3, 3, 7),
 
-- === ALERGENOS (categoria_id = 8) ===
('130208001M', 'MAGLUMI IgE', NULL, '100 PBAS', 6057.88, 1, 1, 2, 3, 3, 8),
('130208002M', 'MAGLUMI IgM', NULL, '100 PBAS', 6057.88, 1, 1, 2, 3, 3, 8),
 
-- === TORCH (categoria_id = 9) ===
('130212001M', 'MAGLUMI TOXO IgG', NULL, '100 PBAS', 8470.59, 1, 1, 2, 3, 3, 9),
('130212002M', 'MAGLUMI TOXO IgM', NULL, '100 PBAS', 8470.59, 1, 1, 2, 3, 3, 9),
('130212003M', 'MAGLUMI RUBEOLA IgG', NULL, '100 PBAS', 8470.59, 1, 1, 2, 3, 3, 9),
('130212004M', 'MAGLUMI RUBEOLA IgM', NULL, '100 PBAS', 8470.59, 1, 1, 2, 3, 3, 9),
('130212005M', 'MAGLUMI CMV IgG', NULL, '100 PBAS', 8470.59, 1, 1, 2, 3, 3, 9),
('130212006M', 'MAGLUMI CMV IgM', NULL, '100 PBAS', 8470.59, 1, 1, 2, 3, 3, 9),
('130212007M', 'MAGLUMI HSV-1/2 IgG', NULL, '100 PBAS', 8470.59, 1, 1, 2, 3, 3, 9),
('130212008M', 'MAGLUMI HSV-2 IgG', NULL, '100 PBAS', 8470.59, 1, 1, 2, 3, 3, 9),
('130212009M', 'MAGLUMI HSV-1/2 IgM', NULL, '100 PBAS', 8470.59, 1, 1, 2, 3, 3, 9),
 
-- === EBV (categoria_id = 10) ===
('130215003M', 'MAGLUMI EBV VCA IgG', NULL, '100 PBAS', 6729.41, 1, 1, 2, 3, 3, 10),
('130215001M', 'MAGLUMI EBV EA IgG', NULL, '100 PBAS', 6729.41, 1, 1, 2, 3, 3, 10),
('130215002M', 'MAGLUMI EBV EA IgA', NULL, '100 PBAS', 6729.41, 1, 1, 2, 3, 3, 10),
('130215006M', 'MAGLUMI EBV NA IgG', NULL, '100 PBAS', 6729.41, 1, 1, 2, 3, 3, 10),
('130215005M', 'MAGLUMI EBV VCA IgA', NULL, '100 PBAS', 6729.41, 1, 1, 2, 3, 3, 10),
('130215004M', 'MAGLUMI EBV VCA IgM', NULL, '100 PBAS', 6729.41, 1, 1, 2, 3, 3, 10),
 
-- === HEPATIC FIBROSIS (categoria_id = 11) ===
('130209002M', 'MAGLUMI PIII N-P', NULL, '100 PBAS', 6882.36, 1, 1, 2, 3, 3, 11),
('130209003M', 'MAGLUMI C-IV (Colageno tipo IV)', NULL, '100 PBAS', 6882.36, 1, 1, 2, 3, 3, 11),
('130209001M', 'MAGLUMI HA (Acido Hialuronico)', NULL, '100 PBAS', 6882.36, 1, 1, 2, 3, 3, 11),
('130209005M', 'MAGLUMI Cholyglycine (Coliglicina)', NULL, '100 PBAS', 6882.36, 1, 1, 2, 3, 3, 11),
('130209004M', 'MAGLUMI Laminin (Laminina)', NULL, '100 PBAS', 6882.36, 1, 1, 2, 3, 3, 11),
 
-- === BONE METABOLISM (categoria_id = 12) ===
('130211002M', 'MAGLUMI CALCITONIN', NULL, '100 PBAS', 10161.41, 1, 1, 2, 3, 3, 12),
('130211003M', 'MAGLUMI OSTEOCALCIN', NULL, '100 PBAS', 10228.71, 1, 1, 2, 3, 3, 12),
 
-- === DRUG MONITORING (categoria_id = 13) ===
('130207002M', 'MAGLUMI DIGOXIN', NULL, '100 PBAS', 7326.64, 1, 1, 2, 3, 3, 13),
('130207003M', 'MAGLUMI FK 506 (Tacrolimus)', NULL, '100 PBAS', 18964.71, 1, 1, 2, 3, 3, 13),
('130207001M', 'MAGLUMI CSA (Ciclosporina A)', NULL, '100 PBAS', 18964.71, 1, 1, 2, 3, 3, 13),
 
-- === COVID (categoria_id = 14) ===
('130219017M', 'MAGLUMI SARS-CoV-2 S-RBD IgG', NULL, '100 PBAS', 9520.59, 1, 1, 2, 3, 3, 14),
('130219015M', 'MAGLUMI 2019 n-CoV IgG', NULL, '100 PBAS', 9520.59, 1, 1, 2, 3, 3, 14),
('130219016M', 'MAGLUMI 2019 n-CoV IgM', NULL, '100 PBAS', 9520.59, 1, 1, 2, 3, 3, 14),
('130219026M', 'MAGLUMI SARS-CoV-2 Ag', NULL, '100 PBAS', 4014.71, 1, 1, 2, 3, 3, 14),
('19026-COV-AG', 'MAGLUMI SARS-CoV-2 Ag Combo', 'Combo antigeno, presentacion especial', '100 PBAS', 13703.53, 1, 1, 2, 3, 3, 14),
 
-- === CONTROLES INTERNOS (categoria_id = 15) ===
('1307010001', 'IMMUNOASSAY CONTROL', NULL, '100 PBAS', 2810.29, 1, 1, 2, 3, 3, 15),
 
-- === CONSUMIBLES (categoria_id = 16) ===
('630003', 'MAGLUMI REACTION MODULES (6 CAJAS)', NULL, '6 CAJAS CON 64 TIRAS', 4741.18, 1, 1, 2, 3, 3, 16),
('630003-1', 'MAGLUMI REACTION MODULES (1 CAJA)', NULL, '1 CAJA CON 64 TIRAS', 790.21, 1, 1, 2, 3, 3, 16),
('130299004M', 'MAGLUMI STARTER KIT (3x230ML)', NULL, '3 x 230 ML (STARTER 1)/3 X 230 ML (STARTER 2)', 5200.00, 1, 1, 2, 3, 3, 16),
('130299004M-1', 'MAGLUMI STARTER KIT (1x230ML)', NULL, '1 x 230 ML (STARTER 1)/1 X 230 ML (STARTER 2)', 1733.33, 1, 1, 2, 3, 3, 16),
('130299006M', 'MAGLUMI LIGHT CHECK (5x2ML)', NULL, '5 x 2 ML', 1514.12, 1, 1, 2, 3, 3, 16),
('130299006M-1', 'MAGLUMI LIGHT CHECK (1x2ML)', NULL, '1 x 2 ML', 302.82, 1, 1, 2, 3, 3, 16),
('130299005M', 'MAGLUMI WASH LIQUID (6x714ML)', NULL, '6 x 714 ML', 6180.36, 1, 1, 2, 3, 3, 16),
('130299005M-1', 'MAGLUMI WASH LIQUID (1x714ML)', NULL, '1 x 714 ML', 1030.06, 1, 1, 2, 3, 3, 16),
('130299007M', 'MAGLUMI TUBING CLEANING SOL.', NULL, '1 x 500 ML', 2905.88, 1, 1, 2, 3, 3, 16),
('130105000000', 'COPILLA X3 REACTION', NULL, '546', 1079.00, 1, 1, 2, 3, 3, 16);

INSERT INTO productos
(sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, area_id, equipo_id, categoria_id)
VALUES
 
-- === THYROID (categoria_id = 1) ===
('130603001M', 'MAGLUMI TSH (3ra. GENERACION) 50', NULL, '50 PBAS', 1597.20, 1, 1, 2, 4, 3, 1),
('130603002M', 'MAGLUMI T4 50', NULL, '50 PBAS', 1597.20, 1, 1, 2, 4, 3, 1),
('130603003M', 'MAGLUMI T3 50', NULL, '50 PBAS', 1597.20, 1, 1, 2, 4, 3, 1),
('130603004M', 'MAGLUMI FT4 50', NULL, '50 PBAS', 1597.20, 1, 1, 2, 4, 3, 1),
('130603005M', 'MAGLUMI FT3 50', NULL, '50 PBAS', 1597.20, 1, 1, 2, 4, 3, 1),
('130603011M', 'MAGLUMI Anti-TPO 50', NULL, '50 PBAS', 5210.12, 1, 1, 2, 4, 3, 1),
('130603006M', 'MAGLUMI TG (Tiroglobulina) 50', NULL, '50 PBAS', 3501.89, 1, 1, 2, 4, 3, 1),
('130603007M', 'MAGLUMI TGA (ANTI-Tg) 50', NULL, '50 PBAS', 3886.23, 1, 1, 2, 4, 3, 1),
('130603009M', 'MAGLUMI TRAb 50', NULL, '50 PBAS', 6189.17, 1, 1, 2, 4, 3, 1),
('130603008M', 'MAGLUMI TMA (Microsoma Tiroideo) 50', NULL, '50 PBAS', 4535.37, 1, 1, 2, 4, 3, 1),
 
-- === FERTILITY (categoria_id = 2) ===
('130602001M', 'MAGLUMI FSH 50', NULL, '50 PBAS', 1829.52, 1, 1, 2, 4, 3, 2),
('130602002M', 'MAGLUMI LH 50', NULL, '50 PBAS', 1829.52, 1, 1, 2, 4, 3, 2),
('130602003M', 'MAGLUMI HCG/Beta-HCG 50', NULL, '50 PBAS', 1829.52, 1, 1, 2, 4, 3, 2),
('130602006M', 'MAGLUMI PRL 50', NULL, '50 PBAS', 1829.52, 1, 1, 2, 4, 3, 2),
('130602007M', 'MAGLUMI ESTRADIOL (E2) 50', NULL, '50 PBAS', 1829.52, 1, 1, 2, 4, 3, 2),
('130602008M', 'MAGLUMI ESTRIOL LIBRE (FE3) 50', NULL, '50 PBAS', 1829.52, 1, 1, 2, 4, 3, 2),
('130602009M', 'MAGLUMI PROGESTERONA (PRG) 50', NULL, '50 PBAS', 1829.52, 1, 1, 2, 4, 3, 2),
('130602010M', 'MAGLUMI TESTOSTERONA (TEST) 50', NULL, '50 PBAS', 1829.52, 1, 1, 2, 4, 3, 2),
('130602011M', 'MAGLUMI FREE TESTOSTERONE 50', NULL, '50 PBAS', 2989.41, 1, 1, 2, 4, 3, 2),
('130602012M', 'MAGLUMI DHEA-S 50', NULL, '50 PBAS', 4994.88, 1, 1, 2, 4, 3, 2),
 
-- === PRENATAL SCREENING (categoria_id = 3) ===
('130614001M', 'MAGLUMI cAFP 50', NULL, '50 PBAS', 3074.82, 1, 1, 2, 4, 3, 3),
('130614002M', 'MAGLUMI FREE B-HCG 50', NULL, '50 PBAS', 3630.00, 1, 1, 2, 4, 3, 3),
('130614003M', 'MAGLUMI PAPP-A 50', NULL, '50 PBAS', 5150.33, 1, 1, 2, 4, 3, 3),
 
-- === TUMOR MARKER (categoria_id = 4) ===
('130601019M', 'MAGLUMI PEPSINOGEN I (PG I) 50', NULL, '50 PBAS', 4791.60, 1, 1, 2, 4, 3, 4),
('130601001M', 'MAGLUMI FERRITIN 50', NULL, '50 PBAS', 1767.89, 1, 1, 2, 4, 3, 4),
('130601017M', 'MAGLUMI S-100 (Proteina Sangtec 100) 50', NULL, '50 PBAS', 13876.22, 1, 1, 2, 4, 3, 4),
 
-- === METABOLISMO (categoria_id = 5) ===
('130605001M', 'MAGLUMI PEPTIDO C 50', NULL, '50 PBAS', 3194.40, 1, 1, 2, 4, 3, 5),
('130605002M', 'MAGLUMI INSULINA 50', NULL, '50 PBAS', 3194.40, 1, 1, 2, 4, 3, 5),
('130605007M', 'MAGLUMI IGF-I 50', NULL, '50 PBAS', 8276.40, 1, 1, 2, 4, 3, 5),
('130611004M', 'MAGLUMI 25 OH-VITAMIN D 50', NULL, '50 PBAS', 9089.52, 1, 1, 2, 4, 3, 5),
('130611001M', 'MAGLUMI Intact PTH 50', NULL, '50 PBAS', 5722.59, 1, 1, 2, 4, 3, 5),
('130616001M', 'MAGLUMI PROCALCITONINA (PCT) 50', NULL, '50 PBAS', 11180.40, 1, 1, 2, 4, 3, 5),
('130698001M', 'MAGLUMI GH 50', NULL, '50 PBAS', 3194.40, 1, 1, 2, 4, 3, 5),
('130698002M', 'MAGLUMI CORTISOL 50', NULL, '50 PBAS', 2470.59, 1, 1, 2, 4, 3, 5),
('130698003M', 'MAGLUMI ACTH 50', NULL, '50 PBAS', 5169.12, 1, 1, 2, 4, 3, 5),
('130613002M', 'MAGLUMI VITAMINA B12 50', NULL, '50 PBAS', 6330.72, 1, 1, 2, 4, 3, 5),
('130605004M', 'MAGLUMI Proinsulin 50', NULL, '50 PBAS', 6189.17, 1, 1, 2, 4, 3, 5),
('130613001M', 'MAGLUMI FA (Acido Folico) 50', NULL, '50 PBAS', 3593.70, 1, 1, 2, 4, 3, 5),
('130605003M', 'MAGLUMI IAA (Autoanticuerpos Insulina) 50', NULL, '50 PBAS', 5802.68, 1, 1, 2, 4, 3, 5),
('130605005M', 'MAGLUMI GAD 65 50', NULL, '50 PBAS', 6824.40, 1, 1, 2, 4, 3, 5),
 
-- === CARDIAC (categoria_id = 6) ===
('130606002M', 'MAGLUMI TROPONINA I 50', NULL, '50 PBAS', 6824.40, 1, 1, 2, 4, 3, 6),
('130606007M', 'MAGLUMI ALDOSTERONA 50', NULL, '50 PBAS', 4994.88, 1, 1, 2, 4, 3, 6),
('130606008M', 'MAGLUMI DIMERO D 50', NULL, '50 PBAS', 6824.40, 1, 1, 2, 4, 3, 6),
('130616002M', 'MAGLUMI CRP 50', NULL, '50 PBAS', 3758.12, 1, 1, 2, 4, 3, 6),
('130606003M', 'MAGLUMI MYOGLOBIN 50', NULL, '50 PBAS', 5551.77, 1, 1, 2, 4, 3, 6),
('130606004M', 'MAGLUMI NT-proBNP 50', NULL, '50 PBAS', 11317.07, 1, 1, 2, 4, 3, 6),
('130606001M', 'MAGLUMI CK-MB 50', NULL, '50 PBAS', 8180.31, 1, 1, 2, 4, 3, 6),
('130606005M', 'MAGLUMI ANGIOTENSINA I 50', NULL, '50 PBAS', 7700.94, 1, 1, 2, 4, 3, 6),
 
-- === KIDNEY FUNCTION (categoria_id = 7) ===
('130604001M', 'MAGLUMI B2-MG 50', NULL, '50 PBAS', 3194.40, 1, 1, 2, 4, 3, 7),
('130604002M', 'MAGLUMI ALBUMIN (ALBUMINA) 50', NULL, '50 PBAS', 3600.11, 1, 1, 2, 4, 3, 7),
 
-- === ALERGENOS (categoria_id = 8) ===
('130608001M', 'MAGLUMI IgE 50', NULL, '50 PBAS', 2729.76, 1, 1, 2, 4, 3, 8),
('130608002M', 'MAGLUMI IgM 50', NULL, '50 PBAS', 2729.76, 1, 1, 2, 4, 3, 8),
 
-- === HEPATIC FIBROSIS (categoria_id = 11) ===
('130609002M', 'MAGLUMI PIII N-P 50', NULL, '50 PBAS', 6320.48, 1, 1, 2, 4, 3, 11),
('130609003M', 'MAGLUMI C-IV (Colageno tipo IV) 50', NULL, '50 PBAS', 6320.48, 1, 1, 2, 4, 3, 11),
('130609001M', 'MAGLUMI HA (Acido Hialuronico) 50', NULL, '50 PBAS', 6320.48, 1, 1, 2, 4, 3, 11),
('130609005M', 'MAGLUMI Cholyglycine (Coliglicina) 50', NULL, '50 PBAS', 6320.48, 1, 1, 2, 4, 3, 11),
('130609004M', 'MAGLUMI Laminin (Laminina) 50', NULL, '50 PBAS', 6320.48, 1, 1, 2, 4, 3, 11),
 
-- === BONE METABOLISM (categoria_id = 12) ===
('130611002M', 'MAGLUMI CALCITONIN 50', NULL, '50 PBAS', 6448.59, 1, 1, 2, 4, 3, 12),
('130611003M', 'MAGLUMI OSTEOCALCIN 50', NULL, '50 PBAS', 6491.30, 1, 1, 2, 4, 3, 12),
 
-- === DRUG MONITORING (categoria_id = 13) ===
-- Nota: 130607001M corregido (venia como 130207001M en el original, typo)
('130607002M', 'MAGLUMI DIGOXIN 50', NULL, '50 PBAS', 4649.61, 1, 1, 2, 4, 3, 13),
('130607003M', 'MAGLUMI FK 506 (Tacrolimus) 50', NULL, '50 PBAS', 12035.60, 1, 1, 2, 4, 3, 13),
('130607001M', 'MAGLUMI CSA (Ciclosporina A) 50', NULL, '50 PBAS', 12035.60, 1, 1, 2, 4, 3, 13),
 
-- === CONSUMIBLES (categoria_id = 16) ===
-- SKU con sufijo -M50 porque son existencias independientes de las de MAGLUMI 100
('630003-M50', 'MAGLUMI REACTION MODULES (6 CAJAS) - MAGLUMI 50', NULL, '6 CAJAS CON 64 TIRAS', 4741.18, 1, 1, 2, 4, 3, 16),
('630003-1-M50', 'MAGLUMI REACTION MODULES (1 CAJA) - MAGLUMI 50', NULL, '1 CAJA CON 64 TIRAS', 790.21, 1, 1, 2, 4, 3, 16),
('130299004M-M50', 'MAGLUMI STARTER KIT (3x230ML) - MAGLUMI 50', NULL, '3 x 230 ML (STARTER 1)/3 X 230 ML (STARTER 2)', 5200.00, 1, 1, 2, 4, 3, 16),
('130299004M-1-M50', 'MAGLUMI STARTER KIT (1x230ML) - MAGLUMI 50', NULL, '1 x 230 ML (STARTER 1)/1 X 230 ML (STARTER 2)', 1733.33, 1, 1, 2, 4, 3, 16),
('130299006M-M50', 'MAGLUMI LIGHT CHECK (5x2ML) - MAGLUMI 50', NULL, '5 x 2 ML', 1514.12, 1, 1, 2, 4, 3, 16),
('130299006M-1-M50', 'MAGLUMI LIGHT CHECK (1x2ML) - MAGLUMI 50', NULL, '1 x 2 ML', 302.82, 1, 1, 2, 4, 3, 16),
('130299005M-M50', 'MAGLUMI WASH LIQUID (6x714ML) - MAGLUMI 50', NULL, '6 x 714 ML', 6180.36, 1, 1, 2, 4, 3, 16),
('130299005M-1-M50', 'MAGLUMI WASH LIQUID (1x714ML) - MAGLUMI 50', NULL, '1 x 714 ML', 1030.06, 1, 1, 2, 4, 3, 16),
('130299007M-M50', 'MAGLUMI TUBING CLEANING SOL. - MAGLUMI 50', NULL, '1 x 500 ML', 2905.88, 1, 1, 2, 4, 3, 16),
('130105000000-M50', 'COPILLA X3 REACTION - MAGLUMI 50', NULL, '546', 1079.00, 1, 1, 2, 4, 3, 16);

INSERT INTO productos
(sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, area_id, equipo_id, categoria_id)
VALUES
('753', 'TIRAS MULTISTIX', NULL, 'C/100', 950.00, 1, 1, 4, 5, 4, NULL);

INSERT INTO productos
(sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, area_id, equipo_id, categoria_id)
VALUES
('EOC100', 'EPITHOD 616 HbA1c', NULL, '25 PBAS', 3150.00, 1, 1, 5, 6, 5, NULL),
('AUX003', 'SQUEEZE CAPILLARY (5 ul)', NULL, '25 PBAS', 225.00, 1, 1, 5, 6, 5, NULL);

DELIMITER $$

CREATE PROCEDURE generar_lotes()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT;

    WHILE i <= (SELECT MAX(id) FROM productos) DO

        SET j = 1;

        WHILE j <= 3 DO

            INSERT INTO lotes(
                producto_id,
                numero_lote,
                fecha_caducidad,
                cantidad_inicial,
                cantidad_disponible,
                estado
            )
            VALUES(
                i,
                CONCAT('LOT-', LPAD(i,4,'0'), '-', j),
                DATE_ADD(CURDATE(), INTERVAL FLOOR(RAND()*730)+30 DAY),
                FLOOR(RAND()*40)+10,
                FLOOR(RAND()*40)+1,
                'Activo'
            );

            SET j = j + 1;

        END WHILE;

        SET i = i + 1;

    END WHILE;

END$$

DELIMITER ;

CALL generar_lotes();

DROP PROCEDURE generar_lotes;

INSERT INTO marcas (nombre, descripcion, imagen) VALUES
('SYSMEX', 'Fabricante de analizadores hematológicos y reactivos.', NULL),
('DIRUI', 'Fabricante de analizadores de química clínica y uroanálisis.', NULL),
('MINDRAY', 'Fabricante de equipos médicos y de laboratorio clínico.', NULL),
('ABBOTT', 'Fabricante de equipos y reactivos para diagnóstico clínico.', NULL),
('ROCHE', 'Fabricante de equipos y reactivos para laboratorio clínico.', NULL),
('BECKMAN COULTER', 'Fabricante de analizadores clínicos y hematológicos.', NULL),
('BIORAD', 'Fabricante de controles de calidad y reactivos clínicos.', NULL),
('THERMO FISHER', 'Fabricante de reactivos e instrumentos de laboratorio.', NULL),
('AGAPPE', 'Fabricante de reactivos para química clínica.', NULL),
('ERBA', 'Fabricante de equipos y reactivos para diagnóstico clínico.', NULL),
('RANDOX', 'Fabricante de controles de calidad y reactivos.', NULL),
('SEKISUI', 'Fabricante de reactivos para laboratorio clínico.', NULL),
('TOSOH', 'Fabricante de analizadores para HbA1c.', NULL),
('BIOBASE', 'Fabricante de equipos para laboratorio.', NULL),
('WIENER LAB', 'Fabricante de reactivos para diagnóstico clínico.', NULL);

INSERT INTO equipos
(nombre, numero_serie, modelo, area_id, marca_id, cliente_id, fecha_instalacion, fecha_mantenimiento, estado)
VALUES
-- QUÍMICA CLÍNICA
('FUJI 500', 'FJ500-003', 'NX500', 1, 1, 1, '2024-01-10', '2025-01-10', 'Activo'),
('FUJI 500', 'FJ500-002', 'NX500', 1, 1, 2, '2024-02-18', '2025-02-18', 'Activo'),
('DIRUI CS-T240', 'DIRUI-T240-001', 'CS-T240', 1, 26, 3, '2024-03-12', '2025-03-12', 'Activo'),

-- HEMATOLOGÍA
('MICROS 60 OT', 'M60OT-002', 'MICROS 60 OT', 2, 3, 4, '2024-01-25', '2025-01-25', 'Activo'),
('XS 1000i', 'XS1000I-002', 'XS 1000i', 2, 5, 5, '2024-04-08', '2025-04-08', 'Activo'),
('BC-3000 Plus', 'BC3000-001', 'BC-3000 Plus', 2, 28, NULL, '2024-05-20', '2025-05-20', 'Activo'),

-- MAGLUMI 100
('MAGLUMI 800', 'MAG800-002', 'MAGLUMI 800', 3, 2, 6, '2024-02-14', '2025-02-14', 'Activo'),
('MAGLUMI X3', 'MAGX3-001', 'MAGLUMI X3', 3, 2, NULL, '2024-06-01', '2025-06-01', 'Activo'),

-- MAGLUMI 50
('MAGLUMI 600', 'MAG600-002', 'MAGLUMI 600', 4, 2, 7, '2024-03-18', '2025-03-18', 'Activo'),
('MAGLUMI 400', 'MAG400-001', 'MAGLUMI 400', 4, 2, NULL, '2024-07-10', '2025-07-10', 'Activo'),

-- UROLOGÍA
('CLINITEK STATUS', 'CLS-002', 'CLINITEK STATUS', 5, 4, 8, '2024-04-05', '2025-04-05', 'Activo'),
('FUS-1000', 'FUS1000-001', 'FUS-1000', 5, 27, NULL, '2024-08-15', '2025-08-15', 'Activo'),

-- Hb GLICOSILADA
('EPITHOD 616', 'EP616-002', 'EPITHOD 616', 6, 5, 9, '2024-05-12', '2025-05-12', 'Activo'),
('HLC-723G8', 'HLC723-001', 'HLC-723G8', 6, 40, NULL, '2024-09-02', '2025-09-02', 'Activo');

INSERT INTO clientes
(nombre_comercial, contacto_principal, telefono, correo, direccion, estado)
VALUES
('Clínica Álvarez', 'Dra. Laura Álvarez', '6141234501', 'contacto@clinicaalvarez.com', 'Chihuahua, Chihuahua', 'Activo'),
('Clinic Lab', 'QFB Carlos Mendoza', '6141234502', 'ventas@cliniclab.com.mx', 'Chihuahua, Chihuahua', 'Activo'),
('Laboratorio Clínico San José', 'QFB Ana Martínez', '6141234503', 'contacto@labsanjose.com', 'Chihuahua, Chihuahua', 'Activo'),
('Hospital Ángeles Chihuahua', 'Ing. Roberto López', '6141234504', 'compras@hangeleschihuahua.com', 'Chihuahua, Chihuahua', 'Activo'),
('Hospital Star Médica Chihuahua', 'Lic. Patricia Gómez', '6141234505', 'abastecimiento@starmedica.com', 'Chihuahua, Chihuahua', 'Activo'),
('Centro Médico Christus Muguerza', 'Ing. Ricardo Salas', '6141234506', 'compras@christus.mx', 'Chihuahua, Chihuahua', 'Activo'),
('Laboratorio Médico del Norte', 'QFB Fernanda Ríos', '6141234507', 'direccion@labnorte.com', 'Ciudad Juárez, Chihuahua', 'Activo'),
('Laboratorios Nova', 'Dra. Sofía Ramírez', '6141234508', 'contacto@laboratoriosnova.com', 'Ciudad Juárez, Chihuahua', 'Activo'),
('Hospital General de Delicias', 'Lic. Eduardo Castro', '6141234509', 'compras@hgdelicias.gob.mx', 'Delicias, Chihuahua', 'Activo'),
('Clínica Integral Salud', 'Dr. Miguel Torres', '6141234510', 'administracion@clintegral.com', 'Delicias, Chihuahua', 'Activo'),
('Centro de Diagnóstico BioLab', 'QFB Karla Medina', '6141234511', 'ventas@biolab.com.mx', 'Cuauhtémoc, Chihuahua', 'Activo'),
('Laboratorio San Felipe', 'Dra. Verónica Ruiz', '6141234512', 'direccion@labsanfelipe.com', 'Parral, Chihuahua', 'Activo'),
('Hospital de Especialidades del Norte', 'Lic. Alejandro Ponce', '6141234513', 'compras@hesnorte.com', 'Ciudad Juárez, Chihuahua', 'Activo'),
('Laboratorio Diagnóstico Integral', 'QFB Andrea Vega', '6141234514', 'contacto@diagintegral.com', 'Chihuahua, Chihuahua', 'Activo'),
('Médica Norte', 'Dr. José Hernández', '6141234515', 'direccion@medicanorte.com', 'Chihuahua, Chihuahua', 'Activo'),
('Centro de Especialidades Médicas', 'Lic. Martha Soto', '6141234516', 'compras@cemedicas.com', 'Chihuahua, Chihuahua', 'Activo'),
('Laboratorio Biomédico Avanzado', 'QFB Luis Aguilar', '6141234517', 'ventas@biomedico.com', 'Ciudad Juárez, Chihuahua', 'Activo'),
('Hospital Santa María', 'Ing. Daniel Carrillo', '6141234518', 'abastecimiento@hsmaria.com', 'Chihuahua, Chihuahua', 'Activo'),
('Laboratorio Clínico del Centro', 'QFB Miriam Acosta', '6141234519', 'contacto@labcentro.com', 'Cuauhtémoc, Chihuahua', 'Activo'),
('Unidad de Diagnóstico Integral', 'Dra. Paola Fuentes', '6141234520', 'direccion@udi.com.mx', 'Chihuahua, Chihuahua', 'Activo');

insert into areas (nombre) values ('VARIOS');

delete from areas where nombre = 'varios';

insert into areas (nombre) values ('INMUNOLOGÍA', 'COAGULACIÓN');

INSERT INTO categorias_producto (nombre) VALUES ('LAVADO');

INSERT INTO productos (sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, equipo_id, area_id) VALUES
('3150', 'TRANSAMINASA GLUTAMICO-OXA (GOT)', 'FDC TRANSAMINASA GLUTAMICO-OXA (GOT) C/24 100468', 'C/24', 398.52, 1, 1, 1, 1, 1),
('3250', 'TRANSAMINASA GLUTAMICO-PIR (GPT)', 'FDC TRANSAMINASA GLUTAMICO-PIR (GPT) C/24 100469', 'C/24', 398.52, 1, 1, 1, 1, 1),
('3350', 'CREATININA FOSFOQUINASA (CPK)', 'FDC CREATININA FOSFOQUINASA (CPK) C/24 100466', 'C/24', 481.55, 1, 1, 1, 1, 1),
('3450', 'LACTATO DESHIDROGENASA (LDH)', 'FDC LACTATO DESHIDROGENASA (LDH) 100470', 'N/A', 398.52, 1, 1, 1, 1, 1),
('3550', 'FOSTATASA ALCALINA (ALP)', 'FDC FOSTATASA ALCALINA (ALP) 100463', 'N/A', 398.52, 1, 1, 1, 1, 1),
('3750', 'LEUCINA AMINOPEPTIDASA (LAP)', 'FDC LEUCINA AMINOPEPTIDASA (LAP) C/24 100462', 'C/24', 398.52, 1, 1, 1, 1, 1),
('3850', 'CREATININA FOSFOQUINASA MB (CKMB)', 'FDC CREATININA FOSFOQUINASA MB (CKMB) C/24 100465', 'C/24', 813.65, 1, 1, 1, 1, 1),
('3950', 'COLINESTERASA (CHE)', 'FDC COLINESTERASA (CHE) C/24 100461', 'C/24', 398.52, 1, 1, 1, 1, 1),
('4350', 'AMILASA (AMYL)', 'FDC AMILASA (AMYL) 100464', 'N/A', 481.55, 1, 1, 1, 1, 1),
('4450', 'LIPASA (LIP)', 'FDC LIPASA (LIP) C/24 100489', 'C/24', 913.28, 1, 1, 1, 1, 1);

INSERT INTO productos (sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, equipo_id, area_id) VALUES
('450826', 'FDC TUBO SENCILLO 0.5 ML', 'FDC TUBO SENCILLO 0.5 ML 100504 NL', 'N/A', 3287.79, 1, 1, 1, 1, 1),
('450826-NUEVO', 'FDC TUBO SENCILLO 0.5ML NVO', 'FDC TUBO SENCILLO 0.5ML 873000017 NVO 100504', 'N/A', 3287.79, 1, 1, 1, 1, 1),
('5150', 'FDC PROTEINA C REACTIVA (CRP)', 'FDC PROTEINA C REACTIVA (CRP) 100488', 'N/A', 597.78, 1, 1, 1, 1, 1),
('872000031', 'FDC DIOXIDO DE CARBONO (TCO2)', 'FDC DIOXIDO DE CARBONO (TCO2) cj/24 100490', 'cj/24', 1012.91, 1, 1, 1, 1, 1),
('873000001', 'FDC TUBO SENCILLO 1.5ML', 'FDC TUBO SENCILLO 1.5ML-500PZA 100491', '500 PZA', 3287.79, 1, 1, 1, 1, 1),
('873000003', 'FDC PIPETA AUTOTIPS', 'FDC PIPETA AUTOTIPS 100493', 'N/A', 2042.42, 1, 1, 1, 1, 1),
('873000004', 'FDC DILUYENTE CRP 32ml', 'FDC DILUYENTE CRP 32mlX 1 PZA 100494', '1 PZA', 199.26, 1, 1, 1, 1, 1),
('873000007', 'FDC SOLUCION DE REF P/ELECTROLITOS 8ml', 'FDC SOLUCION DE REF P/ELECTROLITOS 8mlX6 PZA 100496', '6 PZA', 531.36, 1, 1, 1, 1, 1),
('873000009', 'FDC CALIBRADOR CP (CRP) 1ml', 'FDC CALIBRADOR CP (CRP) 1mlX3 PZAS 100497', '3 PZAS', 2656.80, 1, 1, 1, 1, 1),
('873000011', 'FDC SOLUCION CONTROL QP-H 3mL', 'FDC SOLUCION CONTROL QP-H 3mLX6 PZAS 100499', '6 PZAS', 2656.80, 1, 1, 1, 1, 1),
('20325-NUEVO', 'FDC SOLUCION CONTROL QN 3 ML', 'FDC SOLUCION CONTROL QN 3 MLX2 100495', '2 PZAS', 365.31, 1, 1, 1, 1, 1),
('30115', 'FDC SOLUCION CONTROL QE 1ml', 'FDC SOLUCION CONTROL QE 1mlX10 100500', '10 PZAS', 597.78, 1, 1, 1, 1, 1),
('873000014', 'FDC MIXING CUPS NX500', 'FDC MIXING CUPS NX500 C/100 PZS NL 100502', 'C/100 PZS', 597.78, 1, 1, 1, 1, 1),
('873000014-NUEVO', 'FDC MIXING CUPS NX500 NVO', 'FDC MIXING CUPS NX500 C/100PZ NVO 100502', 'C/100 PZ', 597.78, 1, 1, 1, 1, 1),
('873000019', 'FDC PAPEL TERMICO PQTE', 'FDC PAPEL TERMICO PQTE C/10 NL 100506', 'C/10', 249.08, 1, 1, 1, 1, 1),
('873000013', 'FDC MIXING CUPS FDC7000', 'FDC MIXING CUPS FDC7000 C/50PZS', 'C/50 PZS', 239.85, 1, 1, 1, 1, 1),
('93RQ385H0007', 'FDC TUBE FUJI H0007', 'TUBE FUJI H0007', 'N/A', 239.85, 1, 1, 1, 1, 1),
('93RQ385Y100012', 'FDC TUBE FUJI Y100012', 'TUBE FUJI Y100012', 'N/A', 783.51, 1, 1, 1, 1, 1);

INSERT INTO productos (sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, equipo_id, area_id) VALUES
('41116000-1562', 'WIENER LAB Soluplastin 10x2ml', 'WIENER LABSoluplastin 10x2ml (100/200 det.)', '10x2ml', 1562.00, 1, 1, 40, 63, 1),
('41116000-2326', 'WIENER LAB Uricostat enzimático AA líquida', 'WIENER LAB Uricostat enzimático AA líquida 2x100 + 50 ml', '2x100 + 50 ml', 2326.00, 1, 1, 40, 63, 1),
('41116000-2638', 'WIENER LAB Urea UV cinética AA líquida', 'WIENER LAB Urea UV cinética AA líquida 4x100 + 4x25 ml', '4x100 + 4x25 ml', 2638.00, 1, 1, 40, 63, 1),
('41116000-1555', 'WIENER LAB TW AA 2 x 5 ml 2 x 5 ml', 'WIENER LAB TW AA 2 x 5 ml 2 x 5 ml', '2 x 5 ml', 1555.00, 1, 1, 40, 63, 1),
('41116000-4740', 'WIENER LAB TG Color GPO/PAP AA líquida', 'WIENER LAB TG Color GPO/PAP AA líquida 4 x 100 ml', '4 x 100 ml', 4740.00, 1, 1, 40, 63, 1),
('41116000-1763', 'WIENER LAB RPR slide test 250 determinaciones', 'WIENER LAB RPR slide test 250 determinaciones', '250 det.', 1763.00, 1, 1, 40, 63, 1),
('41116000-1235', 'WIENER LAB Proti U/LCR 1 x 100 ml', 'WIENER LAB Proti U/LCR 1 x 100 ml', '1 x 100 ml', 1235.00, 1, 1, 40, 63, 1),
('41116000-1577', 'WIENER LAB Proteínas Totales AA 6 x 120 ml', 'WIENER LAB Proteínas Totales AA 6 x 120 ml', '6 x 120 ml', 1577.00, 1, 1, 40, 63, 1),
('41116000-1094', 'WIENER LAB PCR Látex directo 50 determinaciones', 'WIENER LAB PCR Látex directo 50 determinaciones', '50 det.', 1094.00, 1, 1, 40, 63, 1),
('41116000-4337', 'WIENER LAB Lipasa AA líquida', 'WIENER LAB Lipasa AA líquida 1x20 + 1x12 ml', '1x20 + 1x12 ml', 4337.00, 1, 1, 40, 63, 1),
('41116000-4102', 'WIENER LAB HDL Cholesterol Fast 80 ml', 'WIENER LAB HDL Cholesterol Fast 80 ml (sin calibrador) 1 x 60 + 1 x 20 ml', '1 x 60 + 1 x 20 ml', 4102.00, 1, 1, 40, 63, 1),
('41116000-418', 'WIENER LAB HDL cholesterol Calibrator', 'WIENER LAB HDL cholesterol Calibrator 1 x 1 ml', '1 x 1 ml', 418.00, 1, 1, 40, 63, 1),
('41116000-2646', 'WIENER LAB Colestat enzimático AA líquida', 'WIENER LAB Colestat enzimático AA líquida 4 x 100 ml', '4 x 100 ml', 2646.00, 1, 1, 40, 63, 1),
('41116000-1087', 'WIENER LAB ASO Látex', 'WIENER LAB ASO Látex', 'Pieza', 1087.00, 1, 1, 40, 63, 1),
('41116000-708', 'WIENER LAB ARTRITEST DIRECTO', 'WIENER LAB ARTRITEST DIRECTO', 'Pieza', 708.00, 1, 1, 40, 63, 1);

insert into areas (nombre) values ('INMUNOLOGIA');
insert into areas (nombre) values ('MICROBIOLOGIA');

select * from areas;

INSERT INTO productos (sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, area_id) VALUES
('41116000-TSH', 'MINIVIDAS TSH', 'MINIVIDAS TSH', 'Pieza', 8153.20, 1, 1, 63, 9),
('41116000-PSA', 'MINIVIDAS TOTAL PSA', 'MINIVIDAS TOTAL PSA 60 PBAS', '60 PBAS', 12100.00, 1, 1, 63, 9),
('41116000-T4L', 'MINIVIDAS T4LIBRE', 'MINIVIDAS T4LIBRE 60 PBAS', '60 PBAS', 8153.20, 1, 1, 63, 9),
('41116000-T3T', 'MINIVIDAS T3T', 'Minividas T3T con 60PBAS', '60 PBAS', 8153.20, 1, 1, 63, 9),
('41116000-HCG', 'MINIVIDAS HCG', 'MINIVIDAS HCG C/60 pbas', '60 PBAS', 8153.20, 1, 1, 63, 9);

INSERT INTO productos (sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, area_id) VALUES
('41116000-ACCU-HCG', 'ACCUTRACK HGC TEST', 'ACCUTRACK HGC TEST 50 PBAS', '50 PBAS', 400.00, 1, 1, 64, 9),
('41116000-ACCU-HIV', 'ACCUTRACK ONE STEP ANTI-HIV', 'ACCUTRACK ONE STEP ANTI-HIV 50 PBAS', '50 PBAS', 1552.00, 1, 1, 64, 9);

INSERT INTO productos (sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, area_id) VALUES
('41116000-ACEITE-30ML', 'Aceite de inmersión 30 ml', 'Aceite de inmersión 30 ml', '30 ml', 450.00, 1, 1, 59, 10),
('41116000-AGAR-EMB', 'Agar EOSINA y azul de metileno (EMB)', 'Agar EOSINA y azul de metileno (EMB)', 'Pieza', 207.90, 1, 1, 59, 10),
('41116000-AGAR-SANGRE', 'Agar sangre en placa preparada', 'Agar sangre en placa preparada', 'Pieza', 268.38, 1, 1, 59, 10);

INSERT INTO productos (sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, area_id) VALUES
('41116000-ANTI-A', 'Anti A Monoclonal LORNE 10 ml', 'Anti A Monoclonal LORNE 10 ml', '10 ml', 180.00, 1, 1, 59, 2),
('41116000-ANTI-AB', 'Anti AB monoclonal SPINREACT 10 ml', 'Anti AB monoclonal SPINREACT 10 ml', '10 ml', 180.00, 1, 1, 59, 2),
('41116000-ANTI-B', 'Anti B monoclonal LORNE 10 ml', 'Anti B monoclonal LORNE 10 ml', '10 ml', 180.00, 1, 1, 59, 2),
('41116000-ANTI-D', 'Anti D LORNE 10 ml', 'Anti D LORNE 10 ml', '10 ml', 320.00, 1, 1, 59, 2);

INSERT INTO productos (sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, area_id) VALUES
('41116000-ARSENAZO', 'Ca-Color Arsenazo III AA 4X50ML', 'Ca-Color Arsenazo III AA 4X50ML', '4X50ML', 1108.00, 1, 1, 40, 1),
('41116000-CREATININA-ENZ', 'Creatinina enzimática AA líquida', 'Creatinina enzimática AA líquida 1x40 + 1x20 ml', '1x40 + 1x20 ml', 3618.00, 1, 1, 40, 1);

INSERT INTO productos (sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, area_id) VALUES
('41116000-EPH-HBA1C', 'EPHITODE 616 HbA1c test kit', 'EPHITODE 616 HbA1c test kit c/25 piezas', 'c/25 piezas', 2835.00, 1, 1, 5, 6),
('41116000-EPH-SQUEZY', 'EPHITODE 616 Squezy capilares 25 ul', 'EPHITODE 616 Squezy capilares 25 ul c/25 piezas', 'c/25 piezas', 243.00, 1, 1, 5, 6);

INSERT INTO productos (sku, nombre, descripcion, presentacion, precio, stock_minimo, estado, marca_id, area_id) VALUES
('41116000-FACTOR-RH-ANTID', 'Factor Rh Anti D LORNE 10 ml', 'Factor Rh Anti D LORNE 10 ml', '10 ml', 310.00, 1, 1, 59, 2);


 
