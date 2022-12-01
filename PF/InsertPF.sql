INSERT INTO Provincia(id_provincia,Nombre)
VALUES(1,'Entre Rios'),(2,'Misiones'),(3,'Corrientes'),(4,'Buenos Aires'),(5,'Santa fe'),(6,'San Luis'),
(7,'Cordoba'),(8,'Catamarca'),(9,'San Juan'),
(10,'Jujuy'),(11,'Salta'),(12,'Chubut'),
(13,'Tucuman'),(14,'Neuquen'),(15,'Santa Cruz');

INSERT INTO Ciudad(Cod_postal,Nombre,id_provincia)
VALUES(3260,'Concepcion del Uruguay',1),(3261,'Posadas',2),(3262,'Corrientes',3),
(3263,'Caba',4),(3264,'Rosario',5),(3265,'Merlo',6),
(3266,'Rio Tercero',7),(3267,'San Fernardo del valle de catamarcar',8),(3268,'San Juan',9),
(3269,'Tilcara',10),(3270,'Salta',11),(3271,'Rawson',12),
(3272,'San Miguel de Tucuman',13),(3273,'Neuquen',14),(3274,'Rio Gallegos',15);

INSERT INTO Usuario (Nombre,Apellido,DNI,Email,Domcilio,Telefono,EsAdmin,Cod_postal) 
VALUES ('Nazareno','Blanchet',42477160,'naza@hotmail.com','14 de julio',3442,True,3260),
('Enzo','Bua',42477161,'Enzo@hotmail.com','15 de julio',3443,False,3261),
('Alejandro','Valdez',42477162,'Ale@hotmail.com','16 de julio',3444,False,3262),
('Arnulfo','Gomez',42477163,'Ar@hotmail.com','17 de julio',3445,False,3263),
('Bernardo','Jark',42477164,'Ber@hotmail.com','18 de julio',3446,False,3264),
('Carlos','Bilardo',42477165,'Carlos@hotmail.com','19 de julio',3447,False,3265),
('Fermina','Guidui',42477166,'Fer@hotmail.com','20 de julio',3448,False,3266),
('José','De San Martin',42477167,'Jose@hotmail.com','122 de julio',3478,True,3267),
('Luis','Majul',42477168,'Luis@hotmail.com','144 de julio',3449,False,3268),
('Leonel','Messi',42477169,'D10s@hotmail.com','147 de julio',3450,False,3269),
('Martin','Palermo',42477170,'Martinnn@hotmail.com','1444 de julio',34451,False,3270),
('Javier','Zanneti',42477171,'Javi@hotmail.com','1411 de julio',3452,False,3271),
('Kun','Aguero',42477173,'Kuni@hotmail.com','1400 de julio',3453,False,3272),
('Roman','Riquelme',42477174,'Roman@hotmail.com','194 de julio',3454,False,3273),
('Romero','Chiquito',42477172,'Romero@hotmail.com','1940 de julio',3455,False,3274);


INSERT INTO Factura(id_factura,DNI,fecha,monto)
VALUES(1,42477160,NULL,NULL),(2,42477161,NULL,NULL);

INSERT INTO Genero(id_genero,Nombre)
VALUES(1,'Romantico'),(2,'Fantasia'),(3,'Novela'),(4,'Terror'),(5,'Misterio');

INSERT INTO Oferta(id_oferta,descuento)
VALUES(33,10),(34,10),(35,10),(36,10),(37,10),
(38,10),(39,10),(40,10),(41,10),(42,10),(43,10),
(44,10),(45,10),(46,10),(47,10);

INSERT INTO Autor(DNI_autor,Nombre,Apellido)
VALUES(43267890,'Carlos','Maire'),(43267891,'Carlos','Miguel'),(43267892,'Florencia','Sanchez'),
(43267893,'Miriam','Sanchez'),(43267894,'Ester','Lujan'),(43267895,'Jorge','Sanchez'),
(43267896,'Esteban','Wilson'),(43267897,'Maike','Sanchez'),(43267898,'Jimmy','Sanchez');

INSERT INTO Editorial(id_editorial,Nombre)
VALUES (23,'Morango'),(24,'Dinarl'),(25,'Carto'),(26,'Luke'),(27,'Nest'),(28,'Niron'),(29,'Rayos');


INSERT INTO Libro(Isbn, Nombre,Precio_venta,Stock,Stock_min,id_genero,id_oferta,DNI_Autor,id_editoriaL)
VALUES(123,'Tom',125,10,8,1,33,43267890,23),(124,'Tom 2',250,11,8,5,34,43267890,27),
(125,'Trueno',25,12,8,2,35,43267891,24),(126,'Tom y jerry',253,13,8,4,36,43267891,23),
(127,'Torth',215,14,8,1,37,43267892,26),(128,'Milwakee',215,14,8,5,38,43267892,26),
(129,'Minkera',205,16,8,4,39,43267894,25),(130,'High',295,17,8,1,40,43267893,25),
(131,'Kirka',190,19,8,5,41,43267895,29),(132,'El muro',265,20,8,3,42,43267894,28),
(133,'Lausr',285,20,8,3,43,43267896,24),(134,'El presidente',2115,180,8,4,44,43267895,23),
(135,'Mar',2005,120,8,2,45,43267897,28),(136,'Yugantar',2225,110,8,1,46,43267896,26),
(137,'Universo',2995,108,8,1,47,43267898,23);

INSERT INTO Carrito(id_carrito,DNI)
VALUES(1,42477160),(2,42477161),(3,42477162),(4,42477163),(5,42477164),(6,42477165),(7,42477166),
(8,42477167),(9,42477168),(10,42477169),(11,42477170),(12,42477171),(13,42477172),(14,42477173),(15,42477174);


INSERT INTO linea_carrito(id_linea_carrito,Cantidad,id_carrito,ISBN,precio_unitario,monto)
VALUES(3,20,1,137,NULL,NULL);

INSERT INTO linea_factura(id_linea_factura,ISBN,Cantidad,Precio_Unitario,id_factura,monto,id_linea_carrito) 
VALUES (11,123,NULL,NULL,1,NULL,NULL),(111,124,NULL,NULL,2,NULL,NULL);

INSERT INTO Valoracion(id_valoracion,Cantidad_estrellas,ISBN,DNI)
VALUES(1,3,123,42477161),(2,1,124,42477162),(3,4,125,42477160),(4,1,123,42477161),(5,5,124,42477163),
(6,3,128,42477164),
(7,1,129,42477165),
(8,2,125,42477166),(9,4,124,42477167),(10,5,126,42477165),
(11,1,123,42477161),(12,1,129,42477166),(13,1,130,42477168),(14,1,132,42477169);


INSERT INTO Cupon(Codigo,Cantidad_descuento,id_factura)
VALUES (12,10,1),(13,10,2);

INSERT INTO Envio(id_envio,Direccion,Nro_pedido,Cod_postal,id_carrito)
VALUES (1,'14 jul1io 273',3,3260,1),(2,'14 jul1io 273',4,3260,2),(3,'14 jul1io 273',5,3260,3),
(4,'14 jul1io 273',6,3260,4),(5,'14 jul1io 273',7,3260,5),(6,'14 jul1io 273',8,3260,6),
(7,'14 jul1io 273',9,3260,7),(8,'14 jul1io 273',10,3260,8),(9,'14 jul1io 273',11,3260,9),
(10,'14 jul1io 273',12,3260,10),(11,'14 jul1io 273',13,3260,11),(12,'14 jul1io 273',14,3260,12),
(13,'14 jul1io 273',15,3260,13),(14,'14 jul1io 273',16,3260,14),(15,'14 jul1io 273',17,3260,15);