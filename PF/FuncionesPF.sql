CREATE OR REPLACE FUNCTION CarritoDelCliente (doc int) 
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

CREATE OR REPLACE FUNCTION InformacionCliente (doc int) 
    RETURNS TABLE (
        Nombre varchar,
        Apellido varchar,
        DNI t_dni,
        Email varchar,
        Domcilio varchar,
        Telefono numeric,
        EsAdmin boolean,
        Cod_postal int
       )
AS $$
BEGIN
    RETURN QUERY SELECT
       informcion_usuario.Nombre,
       informcion_usuario.Apellido,
        informcion_usuario.DNI,
        informcion_usuario.Email,
        informcion_usuario.Domcilio,informcion_usuario.Telefono,
        informcion_usuario.EsAdmin,
        informcion_usuario.Cod_postal
       
    FROM
        informcion_usuario
    WHERE
       cast(informcion_usuario.dni as int ) = doc ;
END; $$ 

LANGUAGE 'plpgsql';

select * from InformacionCliente(42477160)


CREATE OR REPLACE PROCEDURE Facturar(p_id_carrito integer,
                                 p_fecha date ,p_dni t_dni)
  

AS $$
DECLARE
v_id_factura INTEGER:=0;
BEGIN

INSERT INTO factura (fecha,dni) VALUES (P_fecha,cast(P_dni as int))
RETURNING id_factura into v_id_factura;
INSERT INTO linea_factura (isbn,cantidad,precio_unitario,monto,id_factura,id_linea_carrito) 
 (SELECT isbn,cantidad,precio_unitario,monto,v_id_factura,id_linea_carrito
    FROM linea_carrito idc
   WHERE idc.id_carrito = p_id_carrito  );
   
END;


$$
LANGUAGE plpgsql;

call facturar(1,current_date,'42477160')