create domain t_dni as varchar(8)
check (value ~ '^\d{8}$');
create domain val as varchar(5) check (value ~ '^\d{1,5}$');



CREATE TABLE Provincia2 (
    id_provincia int NOT NULL primary key,
    Nombre varchar NOT NULL
  
);

CREATE TABLE Ciudad3 (
    Cod_postal int NOT NULL primary key,
    Nombre varchar NOT NULL,
    id_provincia int NOT NULL,
    constraint FK_Provincia1 foreign key(id_provincia) 
    references Provincia2(id_provincia) ON DELETE RESTRICT ON UPDATE CASCADE
    
);


CREATE TABLE Usuario2 (
    Nombre varchar NOT NULL ,
    Apellido varchar NOT NULL ,
    DNI t_dni NOT NULL unique primary key,
    Email varchar NOT NULL unique,
    Domcilio varchar NOT NULL,
    Telefono numeric NOT NULL  unique,
    EsAdmin Boolean NOT NULL,
    Cod_postal int NOT NULL,
    constraint FK_Ciudad foreign key(Cod_postal)
    references Ciudad2(Cod_postal) ON DELETE RESTRICT ON UPDATE CASCADE
    
);


CREATE TABLE Carrito4 (
    id_carrito serial NOT NULL primary key,
    DNI t_dni NOT NULL unique,
    constraint FK_Usuario foreign key(DNI) 
    references Usuario2(DNI) ON DELETE RESTRICT ON UPDATE CASCADE
    
   
);

CREATE TABLE Envio2 (
    id_envio serial NOT NULL primary key,
    Direccion varchar NOT NULL,
    Nro_pedido serial NOT NULL unique,
    Cod_postal int NOT NULL,
    id_carrito serial NOT NULL,
    constraint FK_ciudad foreign key (Cod_postal) references Ciudad2(Cod_postal) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
    constraint FK_carrito  foreign key (id_carrito) references Carrito4 (id_carrito)
    ON DELETE RESTRICT ON UPDATE CASCADE
   
);

CREATE TABLE Factura2(
    id_factura int NOT NULL primary key,
    fecha varchar NOT NULL,
    monto float NOT NULL,
    DNI t_dni NOT NULL,
    constraint FK_usuario foreign key (DNI) references Usuario2(DNI) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Cupon (
    Codigo int NOT NULL primary key,
    Cantidad_descuento float NOT NULL,
    id_factura serial NOT NULL,
    constraint FK_Factura foreign key (id_factura) references Factura1(id_factura) 
    ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Libro3 (
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
    constraint FK_Oferta foreign key (id_oferta) references Oferta2 (id_oferta)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    constraint FK_Autor foreign key ( DNI_Autor) references Autor( DNI_Autor)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    constraint FK_Editorial foreign key (id_editorial) references Editorial (id_editorial)
    ON DELETE RESTRICT ON UPDATE CASCADE
   
);

CREATE TABLE Genero (
    id_genero int NOT NULL primary key,
    Nombre varchar NOT NULL
    
);
CREATE TABLE Oferta2(
    id_oferta int NOT NULL primary key,
    Descuento float NOT NULL
    
    
);

CREATE TABLE Autor (
    DNI_autor t_dni NOT NULL primary key ,
    Nombre varchar NOT NULL,
    Apellido varchar NOT NULL
    
    
);
CREATE TABLE Editorial (
    id_editorial int NOT NULL primary key,
    Nombre varchar NOT NULL
    
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

CREATE TABLE linea_carrito4 (
    id_linea_carrito int NOT NULL primary key,
    Cantidad int NOT NULL,
    id_carrito int NOT NULL,
    ISBN varchar NOT NULL,
    precio_unitario float NOT NULL,
    monto float NOT NULL,
    constraint FK_Carrito foreign key (id_carrito) references Carrito3(id_carrito),
    constraint FK_Libro foreign key (ISBN) references Libro3 (ISBN)
    
);

CREATE TABLE Valoracion2(
    id_valoracion int NOT NULL primary key,
    Cantidad_estrellas val NOT NULL,
    ISBN varchar NOT NULL,
    DNI t_dni  NOT NULL,
    constraint FK_Libro foreign key (ISBN) references Libro3(ISBN) ON DELETE RESTRICT ON UPDATE CASCADE,
    constraint FK_Usuario foreign key (DNI) references Usuario2(DNI) ON DELETE RESTRICT ON UPDATE CASCADE
    
    
);
