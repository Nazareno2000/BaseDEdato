CREATE USER Cliente1 PASSWORD '111';
CREATE USER Cliente2 PASSWORD '222';
CREATE USER Cliente3 PASSWORD '111';
CREATE USER Cliente4 PASSWORD '222';

GRANT ALL PRIVILEGES ON autor,carrito,ciudad,cupon,editorial,envio,factura,genero
,libro,linea_factura,oferta,provincia,usuario,valoracion TO postgres;
GRANT insert ON carrito,envio,usuario to Cliente1,Cliente2,Cliente3,Cliente4;