CREATE USER Cliente1 PASSWORD '111';
CREATE USER Cliente2 PASSWORD '222';
CREATE USER Cliente3 PASSWORD '111';
CREATE USER Cliente4 PASSWORD '222';

GRANT ALL PRIVILEGES ON autor,carrito4,ciudad3,cupon,editorial,envio2,factura2,genero
,libro3,linea_factura3,oferta2,provincia2,usuario2,valoracion2 TO postgres;
GRANT insert ON carrito4,envio2,usuario2 to Cliente1,Cliente2,Cliente3,Cliente4;