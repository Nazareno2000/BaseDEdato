CREATE OR REPLACE FUNCTION DenegarValoracion() RETURNS TRIGGER AS
$DenegarValoraciono$
BEGIN
        if NEW.DNI not in (select dni from usuario_isbn where isbn=NEW.isbn)then
        RAISE EXCEPTION 'no puede valor sin antes comprar';
        end if;

 RETURN NEW;
END;
$DenegarValoraciono$ LANGUAGE plpgsql;

CREATE TRIGGER ValoracionT BEFORE INSERT OR UPDATE ON Valoracion
FOR EACH ROW EXECUTE PROCEDURE DenegarValoracion();

INSERT INTO Valoracion(id_valoracion,Cantidad_estrellas,ISBN,DNI)
values(23,3,123,42477160);


CREATE OR REPLACE FUNCTION crearCarrito() RETURNS TRIGGER AS
$crearCarritoCuandoSeCreaUsuario$
BEGIN    if NEW.DNI not in (select dni from Usuario)then
         RAISE EXCEPTION 'no puede tener carrito sin antes registrarte';
         END IF;
 RETURN NEW;
END;
$crearCarritoCuandoSeCreaUsuario$ LANGUAGE plpgsql;

CREATE TRIGGER creaciondecarrito BEFORE INSERT OR UPDATE ON Carrito
FOR EACH ROW EXECUTE PROCEDURE crearCarrito();


INSERT INTO Carrito (id_carrito,DNI)
VALUES(334,43355688);

CREATE OR REPLACE FUNCTION LineadefacturaTolal() RETURNS TRIGGER AS
$LineadefacturaTolal$
DECLARE 
cantidadx int;
precio_unitariox float;
monto int;

BEGIN
       	precio_unitariox=(select Precio_venta from libro where isbn=new.isbn);
        cantidadx= (select cantidad from linea_carrito where id_linea_carrito=new.id_linea_carrito);
        new.cantidad=cantidadx;
	new.precio_unitario = precio_unitariox;
	new.monto = new.precio_unitario * new.cantidad;
	return new; 
END;


$LineadefacturaTolal$ LANGUAGE plpgsql;

CREATE TRIGGER lineafactura BEFORE INSERT OR UPDATE ON linea_factura
FOR EACH ROW EXECUTE PROCEDURE LineadefacturaTolal();



CREATE OR REPLACE FUNCTION LineadecarritoTolal() RETURNS TRIGGER AS
$LineadecarritoTolal$
DECLARE 
cantidadx int;
precio_unitariox float;
monto int;

BEGIN
       	precio_unitariox=(select Precio_venta from libro where isbn=new.isbn);
	new.precio_unitario = precio_unitariox;
	new.monto = new.precio_unitario * new.cantidad;
	return new; 
END;


$LineadecarritoTolal$ LANGUAGE plpgsql;

CREATE TRIGGER lineacarrito BEFORE INSERT OR UPDATE ON linea_carrito
FOR EACH ROW EXECUTE PROCEDURE LineadecarritoTolal();

CREATE OR REPLACE FUNCTION UpdateLineafactura() RETURNS TRIGGER AS
$UpdateLineafactura$
DECLARE 
cantidadx int;
precio_unitariox float;
monto int;

BEGIN
     UPDATE factura fac
	SET monto =COALESCE(fac.monto,0) + NEW.monto -COALESCE(OLD.monto,0) 
	WHERE fac.id_factura = NEW.id_factura;
    RETURN NEW;
END;


$UpdateLineafactura$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER UpdateInsertLineafactura BEFORE INSERT OR UPDATE ON linea_factura
FOR EACH ROW EXECUTE PROCEDURE UpdateLineafactura();
