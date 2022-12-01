
/*Primer crear esto*/
create domain t_dni as varchar(8)
check (value ~ '^\d{8}$');
create domain val as varchar(5) check (value ~ '^\d{1,5}$');


/* Tercero */
CREATE TABLE Provincia (
    id_provincia serial NOT NULL primary key,
    Nombre varchar NOT NULL
  
);

CREATE TABLE Ciudad (
    Cod_postal int NOT NULL primary key,
    Nombre varchar NOT NULL,
    id_provincia int NOT NULL,
    constraint FK_Provincia foreign key(id_provincia) 
    references Provincia(id_provincia) ON DELETE RESTRICT ON UPDATE CASCADE
    
);


CREATE TABLE Usuario(
    Nombre varchar NOT NULL ,
    Apellido varchar NOT NULL ,
    DNI t_dni NOT NULL unique primary key,
    Email varchar NOT NULL unique,
    Domcilio varchar NOT NULL,
    Telefono numeric NOT NULL  unique,
    EsAdmin Boolean NOT NULL,
    Cod_postal int NOT NULL,
    constraint FK_Ciudad foreign key(Cod_postal)
    references Ciudad(Cod_postal) ON DELETE RESTRICT ON UPDATE CASCADE
    
);


CREATE TABLE Carrito (
    id_carrito serial NOT NULL primary key,
    DNI t_dni NOT NULL unique,
    constraint FK_Usuario foreign key(DNI) 
    references Usuario(DNI) ON DELETE RESTRICT ON UPDATE CASCADE
    
   
);

CREATE TABLE Envio (
    id_envio serial NOT NULL primary key,
    Direccion varchar NOT NULL,
    Nro_pedido serial NOT NULL unique,
    Cod_postal int NOT NULL,
    id_carrito int NOT NULL,
    constraint FK_ciudad foreign key (Cod_postal) references Ciudad(Cod_postal) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
    constraint FK_carrito  foreign key (id_carrito) references Carrito (id_carrito)
    ON DELETE RESTRICT ON UPDATE CASCADE
   
);

CREATE TABLE Factura(
    id_factura serial NOT NULL primary key,
    fecha date NOT NULL,
    monto float NOT NULL,
    DNI t_dni NOT NULL,
    constraint FK_usuario foreign key (DNI) references Usuario(DNI) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Cupon (
    Codigo serial NOT NULL primary key,
    Cantidad_descuento float NOT NULL,
    id_factura int NOT NULL,
    constraint FK_Factura foreign key (id_factura) references Factura(id_factura) 
    ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Libro (
    Isbn varchar NOT NULL primary key,
    Nombre varchar NOT NULL,
    Precio_venta float NOT NULL,
    Stock int NOT NULL,
    Stock_min int NOT NULL,
    id_genero int NOT NULL,
    id_oferta int NOT NULL,
    DNI_Autor t_dni NOT NULL,
    id_editorial int NOT NULL,
    constraint FK_Genero foreign key (id_genero) references Genero(id_genero) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
    constraint FK_Oferta foreign key (id_oferta) references Oferta (id_oferta)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    constraint FK_Autor foreign key ( DNI_Autor) references Autor( DNI_Autor)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    constraint FK_Editorial foreign key (id_editorial) references Editorial (id_editorial)
    ON DELETE RESTRICT ON UPDATE CASCADE
   
);
/*segundo*/
CREATE TABLE Genero(
    id_genero serial NOT NULL primary key,
    Nombre varchar NOT NULL
);

CREATE TABLE Oferta(
    id_oferta serial NOT NULL primary key,
    Descuento float NOT NULL
    
    
);

CREATE TABLE Autor (
    DNI_autor t_dni NOT NULL primary key ,
    Nombre varchar NOT NULL,
    Apellido varchar NOT NULL
    
    
);
CREATE TABLE Editorial (
    id_editorial serial NOT NULL primary key,
    Nombre varchar NOT NULL
    
);
/*Cuarto*/
CREATE TABLE linea_factura(
    id_linea_factura serial NOT NULL primary key,
    ISBN varchar NOT NULL,
    Cantidad int,
    Precio_Unitario float ,
    id_factura int NOT NULL,
    monto float,
    id_linea_carrito int,
    constraint FK_Factura foreign key(id_factura) references Factura(id_factura) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
    constraint FK_Libro foreign key (ISBN) references Libro(ISBN) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE linea_carrito(
    id_linea_carrito serial NOT NULL primary key,
    Cantidad int NOT NULL,
    id_carrito int NOT NULL,
    ISBN varchar NOT NULL,
    precio_unitario float ,
    monto float ,
    constraint FK_Carrito foreign key (id_carrito) references Carrito(id_carrito),
    constraint FK_Libro foreign key (ISBN) references Libro(ISBN)
    
);

CREATE TABLE Valoracion(
    id_valoracion serial NOT NULL primary key,
    Cantidad_estrellas val NOT NULL,
    ISBN varchar NOT NULL,
    DNI t_dni  NOT NULL,
    constraint FK_Libro foreign key (ISBN) references Libro(ISBN) ON DELETE RESTRICT ON UPDATE CASCADE,
    constraint FK_Usuario foreign key (DNI) references Usuario(DNI) ON DELETE RESTRICT ON UPDATE CASCADE
    
    
);