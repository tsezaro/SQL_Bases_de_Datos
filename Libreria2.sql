create database Libreria2;

use libreria2 


create table libros
(
titulo varchar(50)not null,
descripción varchar(100)not null,
autor varchar(50)not null,
precio_venta int not null,
precio_compra int not null,
)



insert into libros values ('El Arbol Místico','libro de misterio','Daniel Cortez',128,111);
insert into libros values ('El Canguro Saltarín','libro infantil','Mariana Perez',189,145);
insert into libros values ('El Gran Secreto','libro de misterio','Roxana Pilar',254,212);
insert into libros values ('Ladron de sueños','libro de fantasia','Carlos Mantilla',321,231);
insert into libros values ('Programacion en PHP','libro de programación','David Hakro',256,231);
insert into libros values ('Programacion en Java','libro de programación','Tatiana Romero',411,356);
insert into libros values ('El Caracol Feliz','libro infantil','Gael Vega',123,111);
insert into libros values ('Los Misterios del Mar','libro de misterio','Pedro Arturo',232,211);
insert into libros values ('Los Lugares mas Aterradores','libro de terror','Karla Sanchez',453,321);
insert into libros values ('Lluvia de Sal','libro de fantasia','Steve Roll',200,145);