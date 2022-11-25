CREATE OR REPLACE FUNCTION CarritoDelCliente2 (doc int) 
    RETURNS TABLE (
        isbn VARCHAR,
        cantidad INT
) 
AS $$
BEGIN
    RETURN QUERY SELECT
        usuario_carrito.isbn,usuario_carrito.cantidad
       
    FROM
        usuario_carrito
    WHERE
       cast(usuario_carrito.dni as int ) = doc ;
END; $$ 

LANGUAGE 'plpgsql';

select * from CarritoDelCliente2(42477160)


CREATE OR REPLACE FUNCTION DevolverInfoFactura (doc int) 
    RETURNS TABLE (
        fecha VARCHAR,
        monto INT,
        Isbn varchar,
        cantida int,
        precio_unitario float,
        id_factura int,
        dni t_dni
) 
AS $$
BEGIN
    RETURN QUERY SELECT
        Factura1.fecha,Factura1.monto,cast(Factura1.dni as int),
        linea_factura2.isbn,linea_factura2.cantidad,
        linea_factura2.precio_unitario,linea_factura2.id_factura
       
    FROM
        Factura1,linea_factura2
    WHERE
      cast(Factura1.dni as int) = doc and Factura1.id_factura = linea_factura2.id_factura;
END; $$ 

LANGUAGE 'plpgsql';

select * from DevolverInfoFactura(42477160)


CREATE TABLE Factura2(
    id_factura int NOT NULL primary key,
    fecha varchar NOT NULL,
    monto float NOT NULL,
    DNI t_dni NOT NULL,
    constraint FK_usuario foreign key (DNI) references Usuario2(DNI) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE linea_factura3(
    id_linea_factura int NOT NULL primary key,
    ISBN varchar NOT NULL,
    Cantidad int NOT NULL,
    Precio_Unitario float NOT NULL,
    id_factura int NOT NULL,
    constraint FK_Factura foreign key(id_factura) references Factura1(id_factura) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
    constraint FK_Libro foreign key (ISBN) references Libro3(ISBN) ON DELETE RESTRICT ON UPDATE CASCADE
);
