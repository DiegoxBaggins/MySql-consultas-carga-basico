select * from pais;
select * from hotel;
select * from habitacion;
select * from cliente;
select * from reservacion;
select * from checkin;
select * from checkout;

#consulta1
select pais.nombre, count(codigo_hotel) as 'Numero de Hoteles' from hotel inner join pais on hotel.pais = pais.codigo_pais group by pais;

#consulta2
select hotel.nombre as 'Hotel', hotel.estrellas, habitacion.codigo_habitacion as 'habitacion', reservacion.codigo_reservacion as 'Reservacion', cliente.nombre as 'Cliente', reservacion.monto, 
reservacion.fecha_ingreso, reservacion.fecha_salida from hotel, reservacion, cliente, habitacion where reservacion.cliente = cliente.dpi 
and reservacion.hotel = habitacion.hotel and reservacion.habitacion = habitacion.codigo_habitacion and habitacion.hotel = hotel.codigo_hotel and ('2020-12-25' between fecha_ingreso and fecha_salida 
or '2020-5-10' between fecha_ingreso and fecha_salida or '2020-9-15' between fecha_ingreso and fecha_salida) and (hotel.estrellas = 4 or hotel.estrellas = 5) order by hotel.estrellas;

select fecha_ingreso from reservacion where month(fecha_ingreso) = '12' and day(fecha_ingreso) = '25';
select fecha_ingreso from reservacion where month(fecha_ingreso) = '5' and day(fecha_ingreso) = '10';
select fecha_ingreso from reservacion where month(fecha_ingreso) = '9' and day(fecha_ingreso) = '15';
select fecha_ingreso, fecha_salida from reservacion where '2020-12-25' between fecha_ingreso and fecha_salida 
or '2020-5-10' between fecha_ingreso and fecha_salida or '2020-9-15' between fecha_ingreso and fecha_salida order by fecha_ingreso;

#consulta3
select cliente.nombre, count(reservacion.codigo_reservacion) as 'reservaciones' , habitacion.tipo from reservacion, habitacion, cliente where reservacion.habitacion = habitacion.codigo_habitacion and 
reservacion.hotel = habitacion.hotel and reservacion.cliente = cliente.dpi group by habitacion.tipo, cliente.dpi  order by count(reservacion.codigo_reservacion) desc, tipo limit 10;

#consulta4
select cliente.nombre, count(reservacion.codigo_reservacion) as 'reservaciones' , hotel.estrellas from hotel, reservacion, habitacion, cliente 
where hotel.codigo_hotel = habitacion.hotel and reservacion.habitacion = habitacion.codigo_habitacion and reservacion.hotel = habitacion.hotel and 
reservacion.cliente = cliente.dpi group by hotel.estrellas, cliente.dpi  order by count(reservacion.codigo_reservacion) desc, hotel.estrellas limit 15;

#consulta5
select hotel.nombre as 'Hotel' from hotel, reservacion, cliente, habitacion, checkout where reservacion.cliente = cliente.dpi 
and reservacion.hotel = habitacion.hotel and reservacion.habitacion = habitacion.codigo_habitacion and habitacion.hotel = hotel.codigo_hotel 
and hour(checkout.fecha) > 12 group by hotel.nombre;

#consulta6
select hotel.nombre as 'Hotel', habitacion.tipo, count(reservacion.codigo_reservacion) as 'reservaciones' from hotel, reservacion, habitacion where 
reservacion.hotel = habitacion.hotel and reservacion.habitacion = habitacion.codigo_habitacion and habitacion.hotel = hotel.codigo_hotel 
group by habitacion.tipo, hotel.nombre order by count(reservacion.codigo_reservacion) desc, hotel.codigo_hotel;

#consulta7
select hotel.estrellas, habitacion.tipo, count(reservacion.codigo_reservacion) as 'reservaciones' from hotel, reservacion, habitacion where 
reservacion.hotel = habitacion.hotel and reservacion.habitacion = habitacion.codigo_habitacion and habitacion.hotel = hotel.codigo_hotel 
group by habitacion.tipo, hotel.estrellas order by count(reservacion.codigo_reservacion) desc, hotel.codigo_hotel;

#consulta8
select monthname(fecha_ingreso) as 'mes', count(reservacion.codigo_reservacion) as 'clientes' from reservacion
group by monthname(fecha_ingreso) order by month(fecha_ingreso);