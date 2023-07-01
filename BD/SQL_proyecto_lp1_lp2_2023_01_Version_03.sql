-- DROP DATABASE IF EXISTS sistema_biblioteca_202301;

-- CREATE DATABASE sistema_biblioteca_202301
--     WITH
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'Spanish_Peru.1252'
--     LC_CTYPE = 'Spanish_Peru.1252'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1
--     IS_TEMPLATE = False;
--
--
-- Table structure for table `grado_autor`
--
DROP TABLE IF EXISTS grado_autor;

CREATE TABLE grado_autor (
  idGrado serial PRIMARY KEY,
  descripcion varchar(45) DEFAULT NULL
);

--
-- Dumping data for table `grado_autor`
--
ALTER TABLE grado_autor DISABLE TRIGGER ALL;
INSERT INTO grado_autor VALUES (1,'Técnico'),(2,'Profesional'),(3,'Magister'),(4,'Doctor');
ALTER TABLE grado_autor ENABLE TRIGGER ALL;
--
-- Table structure for table `categoria_libro`
--
DROP TABLE IF EXISTS categoria_libro;
CREATE TABLE categoria_libro (
  idCategoria serial PRIMARY KEY,
  descripcion varchar(200) DEFAULT NULL
);
--
-- Dumping data for table `categoria_libro`
--
ALTER TABLE categoria_libro DISABLE TRIGGER ALL;
INSERT INTO categoria_libro VALUES (1,'Novela'),(2,'Cuento'),(3,'Poesía'),(4,'Enciclopedia');
ALTER TABLE categoria_libro ENABLE TRIGGER ALL;
--
-- Table structure for table `modalidad`
--

DROP TABLE IF EXISTS modalidad;
CREATE TABLE modalidad (
  idModalidad serial PRIMARY KEY,
  descripcion varchar(200)
);

--
-- Dumping data for table `modalidad`
--

INSERT INTO modalidad VALUES (1,'Físico'),(2,'Virtual');

--
-- Table structure for table `opcion`
--

DROP TABLE IF EXISTS opcion;
CREATE TABLE opcion (
  idOpcion serial PRIMARY KEY,
  nombre varchar(45) DEFAULT NULL,
  estado varchar(45) DEFAULT NULL,
  ruta text,
  tipo smallint DEFAULT NULL
);

--
-- Dumping data for table `opcion`
--

INSERT INTO opcion VALUES (1,'Registro Alumno','1','intranetRegistraAlumno.jsp',1),(2,'Registro Libro','1','intranetRegistraLibro.jsp',1),(3,'Registro Tesis','1','intranetRegistraTesis.jsp',1),(4,'Registro Autor','1','intranetRegistraAutor.jsp',1),(5,'Registro Sala','1','intranetRegistraSala.jsp',1),(6,'Registro Proveedor','1','intranetRegistraProveedor.jsp',1),(7,'Registro Editorial','1','intranetRegistraEditorial.jsp',1),(8,'Registro Revista','1','intranetRegistraRevista.jsp',1),(9,'CRUD Alumno','1','intranetCrudAlumno.jsp',2),(10,'CRUD Libro','1','intranetCrudLibro.jsp',2),(11,'CRUD Tesis','1','intranetCrudTesis.jsp',2),(12,'CRUD Autor','1','intranetCrudAutor.jsp',2),(13,'CRUD Sala','1','intranetCrudSala.jsp',2),(14,'CRUD Proveedor','1','intranetCrudProveedor.jsp',2),(15,'CRUD Editorial','1','intranetCrudEditorial.jsp',2),(16,'CRUD Revista','1','intranetCrudRevista.jsp',2),(17,'Consulta Alumno','1','intranetConsultaAlumno.jsp',3),(18,'Consulta Libro','1','intranetConsultaLibro.jsp',3),(19,'Consulta Tesis','1','intranetConsultaTesis.jsp',3),(20,'Consulta Autor','1','intranetConsultaAutor.jsp',3),(21,'Consulta Sala','1','intranetConsultaSala.jsp',3),(22,'Consulta Proveedor','1','intranetConsultaProveedor.jsp',3),(23,'Consulta Editorial','1','intranetConsultaEditorial.jsp',3),(24,'Consulta Revista','1','intranetConsultaRevista.jsp',3),(25,'Separación','1','intranetTransaccionSeparacion.jsp',4),(26,'Prestamo','1','intranetTransaccionPrestamo.jsp',4),(27,'Devolución','1','intranetTransaccionDevolucion.jsp',4);

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS pais;

CREATE TABLE pais (
  idPais SERIAL PRIMARY KEY,
  iso char(2),
  nombre varchar(80)
);

--
-- Dumping data for table `pais`
--
ALTER TABLE pais DISABLE TRIGGER ALL;
INSERT INTO pais (idPais, iso, nombre) VALUES (1,'AF','Afganistán'),(2,'AX','Islas Gland'),(3,'AL','Albania'),(4,'DE','Alemania'),(5,'AD','Andorra'),(6,'AO','Angola'),(7,'AI','Anguilla'),(8,'AQ','Antártida'),(9,'AG','Antigua y Barbuda'),(10,'AN','Antillas Holandesas'),(11,'SA','Arabia Saudí'),(12,'DZ','Argelia'),(13,'AR','Argentina'),(14,'AM','Armenia'),(15,'AW','Aruba'),(16,'AU','Australia'),(17,'AT','Austria'),(18,'AZ','Azerbaiyán'),(19,'BS','Bahamas'),(20,'BH','Bahréin'),(21,'BD','Bangladesh'),(22,'BB','Barbados'),(23,'BY','Bielorrusia'),(24,'BE','Bélgica'),(25,'BZ','Belice'),(26,'BJ','Benin'),(27,'BM','Bermudas'),(28,'BT','Bhután'),(29,'BO','Bolivia'),(30,'BA','Bosnia y Herzegovina'),(31,'BW','Botsuana'),(32,'BV','Isla Bouvet'),(33,'BR','Brasil'),(34,'BN','Brunéi'),(35,'BG','Bulgaria'),(36,'BF','Burkina Faso'),(37,'BI','Burundi'),(38,'CV','Cabo Verde'),(39,'KY','Islas Caimán'),(40,'KH','Camboya'),(41,'CM','Camerún'),(42,'CA','Canadá'),(43,'CF','República Centroafricana'),(44,'TD','Chad'),(45,'CZ','República Checa'),(46,'CL','Chile'),(47,'CN','China'),(48,'CY','Chipre'),(49,'CX','Isla de Navidad'),(50,'VA','Ciudad del Vaticano'),(51,'CC','Islas Cocos'),(52,'CO','Colombia'),(53,'KM','Comoras'),(54,'CD','República Democrática del Congo'),(55,'CG','Congo'),(56,'CK','Islas Cook'),(57,'KP','Corea del Norte'),(58,'KR','Corea del Sur'),(59,'CI','Costa de Marfil'),(60,'CR','Costa Rica'),(61,'HR','Croacia'),(62,'CU','Cuba'),(63,'DK','Dinamarca'),(64,'DM','Dominica'),(65,'DO','República Dominicana'),(66,'EC','Ecuador'),(67,'EG','Egipto'),(68,'SV','El Salvador'),(69,'AE','Emiratos Árabes Unidos'),(70,'ER','Eritrea'),(71,'SK','Eslovaquia'),(72,'SI','Eslovenia'),(73,'ES','España'),(74,'UM','Islas ultramarinas de Estados Unidos'),(75,'US','Estados Unidos'),(76,'EE','Estonia'),(77,'ET','Etiopía'),(78,'FO','Islas Feroe'),(79,'PH','Filipinas'),(80,'FI','Finlandia'),(81,'FJ','Fiyi'),(82,'FR','Francia'),(83,'GA','Gabón'),(84,'GM','Gambia'),(85,'GE','Georgia'),(86,'GS','Islas Georgias del Sur y Sandwich del Sur'),(87,'GH','Ghana'),(88,'GI','Gibraltar'),(89,'GD','Granada'),(90,'GR','Grecia'),(91,'GL','Groenlandia'),(92,'GP','Guadalupe'),(93,'GU','Guam'),(94,'GT','Guatemala'),(95,'GF','Guayana Francesa'),(96,'GN','Guinea'),(97,'GQ','Guinea Ecuatorial'),(98,'GW','Guinea-Bissau'),(99,'GY','Guyana'),(100,'HT','Haití'),(101,'HM','Islas Heard y McDonald'),(102,'HN','Honduras'),(103,'HK','Hong Kong'),(104,'HU','Hungría'),(105,'IN','India'),(106,'ID','Indonesia'),(107,'IR','Irán'),(108,'IQ','Iraq'),(109,'IE','Irlanda'),(110,'IS','Islandia'),(111,'IL','Israel'),(112,'IT','Italia'),(113,'JM','Jamaica'),(114,'JP','Japón'),(115,'JO','Jordania'),(116,'KZ','Kazajstán'),(117,'KE','Kenia'),(118,'KG','Kirguistán'),(119,'KI','Kiribati'),(120,'KW','Kuwait'),(121,'LA','Laos'),(122,'LS','Lesotho'),(123,'LV','Letonia'),(124,'LB','Líbano'),(125,'LR','Liberia'),(126,'LY','Libia'),(127,'LI','Liechtenstein'),(128,'LT','Lituania'),(129,'LU','Luxemburgo'),(130,'MO','Macao'),(131,'MK','ARY Macedonia'),(132,'MG','Madagascar'),(133,'MY','Malasia'),(134,'MW','Malawi'),(135,'MV','Maldivas'),(136,'ML','Malí'),(137,'MT','Malta'),(138,'FK','Islas Malvinas'),(139,'MP','Islas Marianas del Norte'),(140,'MA','Marruecos'),(141,'MH','Islas Marshall'),(142,'MQ','Martinica'),(143,'MU','Mauricio'),(144,'MR','Mauritania'),(145,'YT','Mayotte'),(146,'MX','México'),(147,'FM','Micronesia'),(148,'MD','Moldavia'),(149,'MC','Mónaco'),(150,'MN','Mongolia'),(151,'MS','Montserrat'),(152,'MZ','Mozambique'),(153,'MM','Myanmar'),(154,'NA','Namibia'),(155,'NR','Nauru'),(156,'NP','Nepal'),(157,'NI','Nicaragua'),(158,'NE','Níger'),(159,'NG','Nigeria'),(160,'NU','Niue'),(161,'NF','Isla Norfolk'),(162,'NO','Noruega'),(163,'NC','Nueva Caledonia'),(164,'NZ','Nueva Zelanda'),(165,'OM','Omán'),(166,'NL','Países Bajos'),(167,'PK','Pakistán'),(168,'PW','Palau'),(169,'PS','Palestina'),(170,'PA','Panamá'),(171,'PG','Papúa Nueva Guinea'),(172,'PY','Paraguay'),(173,'PE','Perú'),(174,'PN','Islas Pitcairn'),(175,'PF','Polinesia Francesa'),(176,'PL','Polonia'),(177,'PT','Portugal'),(178,'PR','Puerto Rico'),(179,'QA','Qatar'),(180,'GB','Reino Unido'),(181,'RE','Reunión'),(182,'RW','Ruanda'),(183,'RO','Rumania'),(184,'RU','Rusia'),(185,'EH','Sahara Occidental'),(186,'SB','Islas Salomón'),(187,'WS','Samoa'),(188,'AS','Samoa Americana'),(189,'KN','San Cristóbal y Nevis'),(190,'SM','San Marino'),(191,'PM','San Pedro y Miquelón'),(192,'VC','San Vicente y las Granadinas'),(193,'SH','Santa Helena'),(194,'LC','Santa Lucía'),(195,'ST','Santo Tomé y Príncipe'),(196,'SN','Senegal'),(197,'CS','Serbia y Montenegro'),(198,'SC','Seychelles'),(199,'SL','Sierra Leona'),(200,'SG','Singapur'),(201,'SY','Siria'),(202,'SO','Somalia'),(203,'LK','Sri Lanka'),(204,'SZ','Suazilandia'),(205,'ZA','Sudáfrica'),(206,'SD','Sudán'),(207,'SE','Suecia'),(208,'CH','Suiza'),(209,'SR','Surinam'),(210,'SJ','Svalbard y Jan Mayen'),(211,'TH','Tailandia'),(212,'TW','Taiwán'),(213,'TZ','Tanzania'),(214,'TJ','Tayikistán'),(215,'IO','Territorio Británico del Océano Índico'),(216,'TF','Territorios Australes Franceses'),(217,'TL','Timor Oriental'),(218,'TG','Togo'),(219,'TK','Tokelau'),(220,'TO','Tonga'),(221,'TT','Trinidad y Tobago'),(222,'TN','Túnez'),(223,'TC','Islas Turcas y Caicos'),(224,'TM','Turkmenistán'),(225,'TR','Turquía'),(226,'TV','Tuvalu'),(227,'UA','Ucrania'),(228,'UG','Uganda'),(229,'UY','Uruguay'),(230,'UZ','Uzbekistán'),(231,'VU','Vanuatu'),(232,'VE','Venezuela'),(233,'VN','Vietnam'),(234,'VG','Islas Vírgenes Británicas'),(235,'VI','Islas Vírgenes de los Estados Unidos'),(236,'WF','Wallis y Futuna'),(237,'YE','Yemen'),(238,'DJ','Yibuti'),(239,'ZM','Zambia'),(240,'ZW','Zimbabue');
ALTER TABLE pais ENABLE TRIGGER ALL;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS rol;
CREATE TABLE rol (
  idRol SERIAL PRIMARY KEY,
  nombre VARCHAR(45) DEFAULT NULL,
  estado VARCHAR(45) DEFAULT NULL
);

--
-- Dumping data for table `rol`
--

INSERT INTO rol VALUES (1,'Bibliotecologo','1');

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario (
  idUsuario SERIAL PRIMARY KEY,
  nombres VARCHAR(100) DEFAULT NULL,
  apellidos VARCHAR(100) DEFAULT NULL,
  dni VARCHAR(8) DEFAULT NULL,
  login VARCHAR(15) DEFAULT NULL,
  password VARCHAR(200) DEFAULT NULL,
  correo VARCHAR(45) DEFAULT NULL,
  fechaRegistro TIMESTAMP DEFAULT NULL,
  fechaNacimiento DATE DEFAULT NULL,
  direccion TEXT 
);


--
-- Dumping data for table `usuario`
--

INSERT INTO usuario VALUES (1,'Luis Alberto','Sanchez Quispe ','74747474','luis','luis','luis@gmail.com','2022-04-04 10:59:07','2000-10-10','Av Lima 123');

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS sede;
CREATE TABLE sede (
  idSede SERIAL PRIMARY KEY,
  nombre VARCHAR(45) DEFAULT NULL
);

--
-- Dumping data for table `sede`
--

INSERT INTO sede VALUES (1,'Lima'),(2,'Arequipa'),(3,'Ayacucho'),(4,'Centro'),(5,'San Miguel'),(6,'Miraflores'),(7,'Independencia');

--
-- Table structure for table `alumno`
--
--
DROP TABLE IF EXISTS alumno;

CREATE TABLE alumno (
  idAlumno SERIAL PRIMARY KEY,
  nombres varchar(100) NOT NULL,
  apellidos varchar(100) NOT NULL,
  telefono varchar(10) NOT NULL,
  dni char(8) NOT NULL,
  correo varchar(100) NOT NULL,
  fechaNacimiento date NOT NULL,
  fechaRegistro timestamp NOT NULL,
  estado smallint NOT NULL,
  idPais int NOT NULL,
  CONSTRAINT fk_alumno_pais FOREIGN KEY (idPais) REFERENCES pais (idPais)
);

ALTER TABLE alumno DISABLE TRIGGER ALL;

-- Insertar registros en la tabla alumno
INSERT INTO alumno (idAlumno, nombres, apellidos, telefono, dni, correo, fechaNacimiento, fechaRegistro, estado, idPais)
VALUES
  (1, 'Elba Carlos', 'Flores Arcos', '912345678', '74859685', 'elbafloreso@gmail.com', '2000-10-10', '2022-04-04 10:59:04', 1, 2),
  (2, 'Juan Jorge', 'Quispe Llanos', '998574858', '87474747', 'juanPerez@gmail.com', '2010-10-10', '2022-04-04 10:59:07', 1, 4),
  (3, 'Pedro Luisa', 'Perez Gutarra', '996857474', '74859685', 'elbafloreso@gmail.com', '2021-05-10', '2022-04-04 10:59:05', 1, 6);

ALTER TABLE alumno ENABLE TRIGGER ALL;


--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS autor;

CREATE TABLE autor (
  idAutor SERIAL PRIMARY KEY,
  nombres varchar(100) NOT NULL,
  apellidos varchar(100) NOT NULL,
  fechaNacimiento date NOT NULL,
  telefono varchar(9) NOT NULL,
  fechaRegistro timestamp NOT NULL,
  estado smallint NOT NULL,
  idGrado int NOT NULL,
  CONSTRAINT fk_autor_grado FOREIGN KEY (idGrado) REFERENCES grado_autor (idGrado)
);

--
INSERT INTO autor VALUES (1,'Luis','Perez','2020-10-11','912345678','2022-04-04 11:59:07',1,2),(2,'Juana','Perez','1995-10-11','998874747','2022-04-04 10:57:07',1,3),(3,'Pedro','Perez','1970-10-11','998588777','2022-04-04 11:59:07',1,2),(4,'Jorge','asasa','1990-10-10','998578477','2022-04-04 06:59:07',1,4),(5,'Juana','Perez','1995-10-11','985888588','2022-04-04 07:59:07',1,1);
--

-- Table structure for table `devolucion`
--

DROP TABLE IF EXISTS devolucion;
CREATE TABLE devolucion (
  idDevolucion serial PRIMARY KEY,
  idAlumno int NOT NULL,
  idUsuario int NOT NULL,
  fechaRegistro timestamp DEFAULT NULL,
  fechaDevolucion timestamp DEFAULT NULL,
  estado int DEFAULT NULL,
  CONSTRAINT fk_devolucion_alumno1 FOREIGN KEY (idAlumno) REFERENCES alumno (idAlumno),
  CONSTRAINT fk_devolucion_usuario1 FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario)
);

--
-- Dumping data for table `devolucion`
--
--LOCK TABLES devolucion WRITE;
/*!40000 ALTER TABLE `devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion` ENABLE KEYS */;
--UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS libro;
CREATE TABLE libro (
  idLibro serial PRIMARY KEY,
  titulo varchar(100),
  anio int,
  serie varchar(100),
  fechaRegistro timestamp,
  estado smallint,
  idCategoria int NOT NULL,
  CONSTRAINT fk_libro_categoria FOREIGN KEY (idCategoria) REFERENCES categoria_libro (idCategoria)
);

--
-- Dumping data for table `libro`
--
INSERT INTO libro VALUES (1,'Trilce',2020,'AX4714774747','2021-05-06 00:00:00',1,1),(2,'Fuente Ovejuna',2021,'XS7474499888','2021-05-06 00:00:00',1,2),(3,'La ciudad y los perros',2021,'VC8174132525','2021-05-06 00:00:00',1,3);

--
-- Table structure for table `devolucion_has_libro`
--
DROP TABLE IF EXISTS devolucion_has_libro;
CREATE TABLE devolucion_has_libro (
  idDevolucion int NOT NULL,
  idLibro int NOT NULL,
  PRIMARY KEY (idDevolucion, idLibro),
  FOREIGN KEY (idDevolucion) REFERENCES devolucion (idDevolucion),
  FOREIGN KEY (idLibro) REFERENCES libro (idLibro)
);

--
-- Dumping data for table `devolucion_has_libro`
--

--LOCK TABLES devolucion_has_libro WRITE;
/*!40000 ALTER TABLE `devolucion_has_libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion_has_libro` ENABLE KEYS */;
--UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS editorial;
CREATE TABLE editorial (
  idEditorial SERIAL PRIMARY KEY,
  razonSocial VARCHAR(45) NOT NULL,
  direccion TEXT NOT NULL,
  ruc VARCHAR(11) NOT NULL,
  fechaCreacion DATE NOT NULL,
  fechaRegistro TIMESTAMP NOT NULL,
  estado SMALLINT NOT NULL,
  idPais INT NOT NULL,
  CONSTRAINT fk_editorial_pais FOREIGN KEY (idPais) REFERENCES pais (idPais)
);
--
-- Dumping data for table `editorial`
--

INSERT INTO editorial VALUES (1,'Isai Lazo','Av Lima 123','74859621414','1998-10-08','2022-04-04 10:59:07',1,2),(2,'Editorial Lima','Av Tacna 747','87474747747','1995-01-01','2022-04-04 10:59:12',1,4);

--
-- Table structure for table `libro_tiene_autor`
--

DROP TABLE IF EXISTS libro_tiene_autor;
CREATE TABLE libro_tiene_autor (
  lidLibro int NOT NULL,
  idAutor int NOT NULL,
  PRIMARY KEY (lidLibro, idAutor),
  CONSTRAINT fk_libro_has_autor_autor1 FOREIGN KEY (idAutor) REFERENCES autor (idAutor),
  CONSTRAINT fk_libro_has_autor_libro FOREIGN KEY (lidLibro) REFERENCES libro (idLibro)
);
--
-- Dumping data for table `libro_tiene_autor`
--

INSERT INTO libro_tiene_autor VALUES (1,1),(2,1);

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS prestamo;
CREATE TABLE prestamo (
  idPrestamo serial PRIMARY KEY,
  fechaPrestamo timestamp DEFAULT NULL,
  fechaDevolucion timestamp DEFAULT NULL,
  idAlumno int NOT NULL,
  idUsuario int NOT NULL,
  CONSTRAINT fk_prestamo_alumno1 FOREIGN KEY (idAlumno) REFERENCES alumno (idAlumno),
  CONSTRAINT fk_prestamo_usuario1 FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario)
);
--
-- Dumping data for table `prestamo`
--

--LOCK TABLES prestamo WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
--UNLOCK TABLES;

--
-- Table structure for table `prestamo_tiene_libro`
--

DROP TABLE IF EXISTS prestamo_tiene_libro;
CREATE TABLE prestamo_tiene_libro (
  idPrestamo int NOT NULL,
  idLibro int NOT NULL,
  PRIMARY KEY (idPrestamo, idLibro),
  CONSTRAINT fk_prestamo_has_libro_prestamo1 FOREIGN KEY (idPrestamo) REFERENCES prestamo (idPrestamo),
  CONSTRAINT fk_prestamo_has_libro_libro1 FOREIGN KEY (idLibro) REFERENCES libro (idLibro)
);
--
-- Dumping data for table `prestamo_tiene_libro`
--

--LOCK TABLES prestamo_tiene_libro WRITE;
/*!40000 ALTER TABLE `prestamo_tiene_libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo_tiene_libro` ENABLE KEYS */;
--UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS proveedor;
CREATE TABLE proveedor (
  idProveedor SERIAL PRIMARY KEY,
  razonsocial VARCHAR(100) NOT NULL,
  nruc CHAR(11) NOT NULL,
  direccion VARCHAR(200) NOT NULL,
  celular CHAR(9) NOT NULL,
  contacto VARCHAR(200) NOT NULL,
  estado SMALLINT NOT NULL,
  fechaRegistro TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  idPais INT NOT NULL,
  CONSTRAINT fk_proveedor_pais FOREIGN KEY (idPais) REFERENCES pais (idPais)
);

--
-- Dumping data for table `proveedor`
--

INSERT INTO proveedor VALUES (1,'Lumbreras','74747478845','Av Lima 141','','Juan Vargas',1,'2022-04-04 10:59:05',1),(2,'Libun','98747474325','Av Lima 874','','Luis Quispe',1,'2022-04-04 10:59:07',2);

--
-- Table structure for table `revista`
--

DROP TABLE IF EXISTS revista;
CREATE TABLE revista (
  idRevista SERIAL PRIMARY KEY,
  nombre VARCHAR(200) NOT NULL,
  frecuencia VARCHAR(200) NOT NULL,
  fechaCreacion DATE NOT NULL,
  fechaRegistro TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  estado SMALLINT NOT NULL,
  idModalidad INT NOT NULL,
  CONSTRAINT fk_revista_modalidad FOREIGN KEY (idModalidad) REFERENCES modalidad (idModalidad)
);

--
-- Dumping data for table `revista`
--

INSERT INTO revista VALUES (1,'Gente','Semanal Todos los miércoles','2021-05-06','2021-05-06 00:00:00',1,1),(3,'Etiqueta Negra','Semanal Todos los lunes','2021-05-06','2021-05-06 00:00:00',1,2);


--
-- Table structure for table `rol_has_opcion`
--

DROP TABLE IF EXISTS rol_has_opcion;
CREATE TABLE rol_has_opcion (
  idrol INT NOT NULL,
  idopcion INT NOT NULL,
  PRIMARY KEY (idrol, idopcion),
  CONSTRAINT fk_rol_has_opcion_opcion1 FOREIGN KEY (idopcion) REFERENCES opcion (idOpcion),
  CONSTRAINT fk_rol_has_opcion_rol1 FOREIGN KEY (idrol) REFERENCES rol (idRol)
);


--
-- Dumping data for table `rol_has_opcion`
--

INSERT INTO rol_has_opcion VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27);

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS sala;
CREATE TABLE sala (
  idSala SERIAL PRIMARY KEY,
  numero VARCHAR(45) NOT NULL,
  piso INT NOT NULL,
  numAlumnos INT NOT NULL,
  recursos TEXT NOT NULL,
  fechaRegistro TIMESTAMP NOT NULL,
  estado SMALLINT NOT NULL,
  idSede INT NOT NULL,
  CONSTRAINT fk_sala_sede FOREIGN KEY (idSede) REFERENCES sede (idSede)
);

--
-- Dumping data for table `sala`
--

INSERT INTO sala VALUES (1,'A001',1,10,'tablet plumones','2021-05-06 00:00:00',1,1),(2,'A002',1,3,'tablet plumones','2021-05-06 00:00:00',1,4),(3,'A003',2,2,'tablet plumones','2021-05-06 00:00:00',1,5);

--
-- Table structure for table `separacion`
--

DROP TABLE IF EXISTS separacion;
CREATE TABLE separacion (
  idSeparacion SERIAL PRIMARY KEY,
  fechaSeparacion TIMESTAMP DEFAULT NULL,
  fechaInicio TIMESTAMP DEFAULT NULL,
  fechaFin TIMESTAMP DEFAULT NULL,
  estado SMALLINT DEFAULT NULL,
  idAlumno INT NOT NULL,
  idSala INT NOT NULL,
  idUsuario INT NOT NULL,
  CONSTRAINT fk_separacion_alumno1 FOREIGN KEY (idAlumno) REFERENCES alumno (idAlumno),
  CONSTRAINT fk_separacion_sala1 FOREIGN KEY (idSala) REFERENCES sala (idSala),
  CONSTRAINT fk_separacion_usuario1 FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario)
);

--
-- Dumping data for table `separacion`
--

--LOCK TABLES separacion WRITE;
/*!40000 ALTER TABLE `separacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `separacion` ENABLE KEYS */;
--UNLOCK TABLES;

--
-- Table structure for table `tesis`
--

DROP TABLE IF EXISTS tesis;
CREATE TABLE tesis (
  idTesis SERIAL PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  tema VARCHAR(200) NOT NULL,
  fechaCreacion DATE NOT NULL,
  fechaRegistro TIMESTAMP NOT NULL,
  estado SMALLINT NOT NULL,
  idAlumno INT NOT NULL,
  CONSTRAINT fk_tesis_alumno FOREIGN KEY (idAlumno) REFERENCES alumno (idAlumno)
);

--
-- Dumping data for table `tesis`
--

INSERT INTO tesis VALUES (1,'Sistema de Redes neuronales aplicado a los colegios','Sistemas','2021-05-10','2022-04-04 10:59:04',1,1),(2,'Sistema de inteligencia artificial aplicado al gobierno','Sistemas','2021-05-10','2022-04-04 10:59:04',1,3);

--
-- Table structure for table `usuario_has_rol`
--

DROP TABLE IF EXISTS usuario_has_rol;
CREATE TABLE usuario_has_rol (
  idUsuario INT NOT NULL,
  idRol INT NOT NULL,
  PRIMARY KEY (idUsuario, idRol),
  CONSTRAINT fk_usuario_has_rol_usuario1 FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario),
  CONSTRAINT fk_usuario_has_rol_rol1 FOREIGN KEY (idRol) REFERENCES rol (idRol)
);

--
-- Dumping data for table `usuario_has_rol`
--
INSERT INTO usuario_has_rol VALUES (1,1);

--
-- Dumping events for database 'sistema_biblioteca_202301'
--

--
-- Dumping routines for database 'sistema_biblioteca_202301'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-15 12:34:53






