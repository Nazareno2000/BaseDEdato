
INSERT INTO Provincia2(id_provincia,Nombre)
VALUES (1,'Entre Rios')

INSERT INTO Ciudad2(Cod_postal,Nombre,id_provincia)
VALUES(3260,'Concepcion del Uruguay',1)

INSERT INTO Usuario2 (Nombre,Apellido,DNI,Email,Domcilio,Telefono,EsAdmin,Cod_postal) 
VALUES ('Nazareno','Blanchet',42477160,'naza@hotmail.com','14 de julio',3442,True,3260);

INSERT INTO Factura1(id_factura,fecha,monto,DNI)
VALUES(1,14072000,500,42477160)

INSERT INTO linea_factura1(id_linea_factura,ISBN,Cantidad,Precio_Unitario,id_factura) 
VALUES (11,123,30,25,1)


INSERT INTO Libro2 (Isbn, Nombre,Precio_venta,Stock,Stock_min,id_genero,id_oferta,DNI_Autor,id_editoriaL)
VALUES(123,'Tom',125,10,8,1,33,43267890,23)

INSERT INTO Genero(id_genero,Nombre)
VALUES(1,'Romantico');

INSERT INTO Oferta(id_oferta,descuento,fecha)
VALUES(33,10,14072010);

INSERT INTO Autor(DNI_autor,Nombre,Apellido)
VALUES(43267890,'Carlos','Sanchez');

INSERT INTO Editorial(id_editorial,Nombre)
VALUES (23,'Morango');

    