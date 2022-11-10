select Usuario.dni Libro.isbn from Usuario U , Factura F , linea_factura li, Libro l
where F.id_factura = li.id_factura and li.isbn = l.isbn and U.DNI = F.DNI