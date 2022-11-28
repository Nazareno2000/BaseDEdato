CREATE OR REPLACE FUNCTION DenegarValoracion2() RETURNS TRIGGER AS
$DenegarValoraciono$
BEGIN
        if NEW.DNI not in (select dni from usuario_isbn1 where isbn=NEW.isbn)then
        RAISE EXCEPTION 'no puede valor sin antes comprar';
        end if;

 RETURN NEW;
END;
$DenegarValoraciono$ LANGUAGE plpgsql;

CREATE TRIGGER Valoracion17 BEFORE INSERT OR UPDATE ON Valoracion2
FOR EACH ROW EXECUTE PROCEDURE DenegarValoracion2();

INSERT INTO Valoracion2(id_valoracion,Cantidad_estrellas,ISBN,DNI)
values(23,3,123,42477160);


CREATE OR REPLACE FUNCTION crearCarrito() RETURNS TRIGGER AS
$crearCarritoCuandoSeCreaUsuario$
BEGIN    if NEW.DNI not in (select dni from Usuario2)then
         RAISE EXCEPTION 'no puede tener carrito sin antes registrarte';
         END IF;
 RETURN NEW;
END;
$crearCarritoCuandoSeCreaUsuario$ LANGUAGE plpgsql;

CREATE TRIGGER creaciondecarrito1 BEFORE INSERT OR UPDATE ON Carrito4
FOR EACH ROW EXECUTE PROCEDURE crearCarrito();


INSERT INTO Carrito4 (id_carrito,DNI)
VALUES(334,43355688);


CREATE OR REPLACE FUNCTION FacturaTolal() RETURNS TRIGGER AS
$FacturaTolal$
DECLARE 
cantidadx int;
precio_unitariox float;
monto int;
BEGIN
cantidadx =(select linea_factura3.Cantidad from linea_factura3);
precio_unitariox =(select linea_factura3.Precio_Unitario from linea_factura3);

        monto =(cantidadx * cast(precio_unitariox as int));
        UPDATE factura2 SET factura2.monto = monto WHERE idfactura = xxxx; 
        

 RETURN NEW;
END;
$FacturaTolal$ LANGUAGE plpgsql;

CREATE TRIGGER Facturacion2 AFTER INSERT OR UPDATE ON linea_factura3
FOR EACH ROW EXECUTE PROCEDURE FacturaTolal();


CREATE OR REPLACE FUNCTION LineadecarritoTolal() RETURNS TRIGGER AS
$LineadecarritoTolal$
DECLARE 
cantidadx int;
precio_unitariox float;
monto int;
BEGIN
cantidadx =(select linea_carrito4.Cantidad from linea_factura3),
precio_unitariox =(select linea_carrito4.Precio_Unitario from linea_factura3),

        monto =(cantidadx * cast(precio_unitariox as int));
        UPDATE linea_carrito4 SET linea_carrito4.monto = monto; 
        

 RETURN NEW;
END;
$LineadecarritoTolal$ LANGUAGE plpgsql;

CREATE TRIGGER Facturacion1 AFTER INSERT OR UPDATE ON linea_carrito4
FOR EACH ROW EXECUTE PROCEDURE LineadecarritoTolal();

/***/
