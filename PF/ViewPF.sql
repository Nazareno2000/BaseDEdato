create view usuario_isbn as
select U.DNI ,l.ISBN from Usuario2 U , Factura1 F , linea_factura2 li, Libro3 l
where F.id_factura = li.id_factura and li.isbn = l.isbn and U.DNI = F.DNI

create view usuario_carrito as
select U.DNI ,l.ISBN ,li.Cantidad from Usuario2 U , Carrito4 ca , linea_carrito3 li, Libro3 l
where ca.id_carrito = li.id_carrito and li.isbn = l.isbn and U.DNI = ca.DNI

create view usuario_factura as
select U.DNI ,li.isbn , F.monto , F.fecha,li.cantidad, li.precio_unitario from Usuario2 U , Factura1 F , linea_factura2 li, Libro3 l
where F.id_factura = li.id_factura and li.isbn = l.isbn and U.DNI = F.DNI


create view informcion_usuario as
select U.Nombre,U.Apellido,U.DNI,U.Email,U.Domcilio,U.Telefono,U.EsAdmin,U.Cod_postal
from Usuario2 U , Ciudad3 C , Provincia2 P 
where U.Cod_postal = C.Cod_postal and C.id_provincia = P.id_provincia