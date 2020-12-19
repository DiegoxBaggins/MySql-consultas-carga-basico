create database hoteleria;

use hoteleria;

create table hoteleria.pais (
    codigo_pais int not null,
    nombre varchar(45) not null,
    primary key (codigo_pais)
);

create table hoteleria.cliente (
    dpi bigint not null,
    nombre varchar(90) not null,
    tarjeta_credito int not null,
    telefono int not null,
    primary key (dpi)
);

create table hoteleria.hotel (
    codigo_hotel int auto_increment not null,
    nombre varchar(45) not null,
    estrellas int not null,
    pais int not null,
    primary key (codigo_hotel),
    foreign key (pais) references pais(codigo_pais)
);

create table hoteleria.habitacion (
    codigo_habitacion int not null,
    tipo varchar(45) not null,
    hotel int not null,
    primary key (codigo_habitacion, hotel),
    foreign key (hotel) references hotel(codigo_hotel)
);

create table hoteleria.reservacion (
    codigo_reservacion int auto_increment not null,
    monto decimal(9,2) not null,
    fecha_ingreso date not null,
    fecha_salida date not null,
    habitacion int not null,
    hotel int not null,
    cliente bigint not null,
    primary key (codigo_reservacion),
    foreign key (habitacion) references habitacion(codigo_habitacion),
    foreign key (hotel) references habitacion(hotel),
    foreign key (cliente) references cliente(dpi)
);

create table hoteleria.checkin (
    reservacion int not null,
    fecha datetime not null,
    primary key (reservacion),
    foreign key (reservacion) references reservacion(codigo_reservacion)
);

create table hoteleria.checkout (
    reservacion int not null,
    fecha datetime not null,
    primary key (reservacion),
    foreign key (reservacion) references reservacion(codigo_reservacion)
)