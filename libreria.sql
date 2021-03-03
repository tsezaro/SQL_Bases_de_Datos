create database libreria;

use libreria;

create table libros 
(
id_libro int identity primary key,
nombre varchar(50) not null,
precio_venta int not null,
precio_compra float not null
)

insert into libros values('El Lobo',115,95.23);
insert into libros values('Caperucita Roja',236,189.25);
insert into libros values('Programación en Java',78,50.36);
insert into libros values('Programando desde cero con C',115,95.23);
insert into libros values('SQL Server 2000',454,365.56);
insert into libros values('El Codigo Da Vinci',232,199.98);
insert into libros values('Aura',147,112.31);
insert into libros values('100 Años de Soledad',166,124.23);
insert into libros values('La Fisica es Divertida',168,123.32);
insert into libros values('Calculo Integral',456,289.56);
insert into libros values('Las 20 Lenguas del Dragon',345,234.42);
insert into libros values('Narnia',100,89.36);
insert into libros values('El Señor de Los Anillos',157,123.54);
insert into libros values('Ruperth',145,123.21);
insert into libros values('Tutoriales Ankro',457,349.54);
insert into libros values('La Magia de las Matemáticas',456,345.45);