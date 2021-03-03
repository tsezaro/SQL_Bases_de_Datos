create database libreria;

use libreria;


create table libros
(
id_libro int identity primary key,
nombre varchar(50)not null,
precio_venta int not null,
precio_compra float not null
)

insert into libros values('el lobo',115,95.23);
insert into libros values('caperusa roja',236,189.25);
insert into libros values('programacion en java',123,101.56);
insert into libros values('programando desde cero con C',78,50.36);
insert into libros values('sql server 2000',456,368.56);
insert into libros values('el codigo da vinci',232,199.98);
insert into libros values('aura',147,112.31);
insert into libros values('100 años de soleda',166,124.23);
insert into libros values('la fisica es divertida',168,123.32);
insert into libros values('calculo integral',456,289.56);
insert into libros values('las 20 lenguas del dragon',365,236.42);
insert into libros values('narnia',100,89.36);
insert into libros values('el señor de los anillos',157,123.56);
insert into libros values('ruperth',145,123.21);
insert into libros values('tutoriales hackro',457,369.54);
insert into libros values('la magia de las matematicas',456,345.45);
