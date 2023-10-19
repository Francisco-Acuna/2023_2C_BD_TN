use cursobd;
-- Basándose en la tabla clientes realizar los siguientes puntos.

-- 1- 	Insertar 5 clientes en la tabla clientes dejando que el motor de la BD complete su código

insert into clientes (nombre, apellido, dni, direccion) values 
('Santiago', 'Etcheverría', '35320124', 'Medrano 120'),
('Pedro', 'Vazquez', '36230421', 'Rivadavia 6000'),
('Lucas', 'Rodriguez', '43910249','Nazca 7878'),
('Tatiana', 'Acosta', '64759532', 'Brandsen 1143'),
('Ramiro','Gonzalez', '42820151', null);

-- 2-	Insertar 5 clientes en la tabla clientes utilizando los campos como parte de la sentencias,
-- es decir de la forma extendida. Completando todos los campos
insert into clientes (codigo, nombre, apellido, dni, direccion) values
(19,'Roman','Gómez','65863012','Mercedes 1697'),
(20, 'Tomas', 'Coca Cola', '12345678',null),
(21,'Rosa','García','88997740',''),
(22, 'Juan','López','54642150',null),
(23,'Tamara','Gutierrez','32326597','Río de Janeiro esq. Rivadavia');

-- 3-	Actualizar el nombre del cliente 1 a Jose.
update clientes set nombre='Jose' where codigo=1;

-- 4-	Actualizar el nombre, apellido y dni del cliente 3 a Pablo Fuentes 21053119
update clientes set nombre='Pablo', apellido='Fuentes', dni='21053119' where codigo=3;

-- 5-  Actualizar la dirección del cliente de código 2 a vacío
update clientes set direccion = '' where codigo=2;

-- 6-	Actualizar las direcciones de los clientes de código 3, 5 y 7 a 'null'
update clientes set direccion = null where codigo in (3,5,7);

-- 7-	Eliminar los clientes con apellido Perez.
delete from clientes where apellido = 'Perez';

-- 8-	Eliminar los clientes con dni que terminan en 0.
delete from clientes where dni like '%0';

-- 9-  Eliminar los clientes cuyo nombre contenga una r y su apellido termine en z
delete from clientes where nombre like '%r%' and apellido like '%z';

-- Basando se en la tabla artículos, realizar los siguientes puntos.
-- 	10- Aumentar un 20% los precios de los artículos con precio menor igual a 50.
update articulos set precio=precio*1.2 where precio <= 50;

-- 	11- Aumentar un 15% los precios de los artículos con precio mayor a 50.
update articulos set precio=precio*1.15 where precio > 50;

-- 	12- Bajar un 5% los precios de los artículos con precio mayor a 200.
update articulos set precio=precio*0.95 where precio > 200;

-- 13- bajar el %50 del precio a los artículos que estén entre 20000 y 40000
update articulos set precio= precio/2 where precio between 20000 and 40000;

-- 14- aumentar el stock a 200 a todos aquellos productos que tengan el stock mayor a 0 y hasta 150
update articulos set stock=200 where stock between 0 and 150;

-- 15- Eliminar los artículos con stock menor a 0.
delete from articulos where stock < 0;

-- 16- eliminar todos los artículos cuyo precio sea mayor a $50.000
delete from articulos where precio>50000;

select * from articulos;
select * from clientes;

-- DDL (DATA DEFINITION LANGUAGE)
-- CREATE
-- ALTER
-- DROP

-- DML (DATA MANIPULATION LANGUAGE)
-- SELECT
-- INSERT 
-- UPDATE
-- DELETE

-- ALTER TABLE
-- modifica estructuras de tablas

describe clientes;

-- agregar campos
alter table clientes add edad smallint unsigned not null;
describe clientes;
select * from clientes;

update clientes set edad=25 where codigo=3;
update clientes set edad=18 where codigo>3;

-- modificar campos
alter table clientes modify edad tinyint unsigned;
describe clientes;

-- cambiar nombre a un campo
alter table clientes change edad antiguedad tinyint unsigned;
describe clientes;

-- borrar campos
alter table clientes drop antiguedad;
describe clientes;

-- eliminar la llave primaria
-- para poder eliminar la PK, no debe ser auto incrementable
alter table clientes modify codigo int;
describe clientes;
-- al eliminar la restriccion de auto incrementable, puedo eliminar la PK
alter table clientes drop primary key;
describe clientes;

-- agregar clave primaria
alter table clientes add primary key(codigo);
describe clientes;

-- volver a poner la condición de auto incrementable
alter table clientes modify codigo int auto_increment;
describe clientes;

-- renombrar tablas
rename table clientes to auxiliar, facturas to auxiliar2;
show tables;

rename table auxiliar to clientes, auxiliar2 to facturas;
show tables;

-- funciones de agrupamiento

-- las funciones de agrupamiento devuelven un solo registro como resultado

-- MAX con números
select * from facturas;
select max(monto) from facturas;
-- devuelve el monto máximo de las facturas.
select max(monto) maximo from facturas;
select max(monto) maximo from facturas where letra='b';
-- devuelve el monto máximo de las facturas cuya letra sea = 'b'

-- después del nombre de una función no tiene que haber espacio
-- antes de los paréntesis.

-- MAX con cadenas de caracteres
select * from clientes;
select max(nombre) from clientes;
-- trae el mayor nombre según el orden alfabético

-- MAX con fechas
select * from facturas;
select max(fecha) from facturas;
-- trae la última fecha registrada de la tabla facturas
select max(fecha) from facturas where letra='A';
-- trae la última fecha registrada de las facturas tipo 'A'

-- MIN la función MIN se utiliza con números, textos y fechas
-- MIN con números
select min(monto) from facturas;
-- trae el monto mínimo de facturas
select min(monto) from facturas where letra='C';
-- trae el monto mínimo facturado con facturas del tipo 'C'

-- MIN con cadenas de caracteres
select min(nombre) from clientes;
-- trae el primer nombre alfabeticamente

-- MIN con fechas 
select min(fecha) from facturas;
-- devuelve la fecha más antigua de facturas

-- AVG Average función de promedios para números
select avg(monto) from facturas;
select avg(monto) promedio from facturas;

-- SUM función de suma para números
select sum(monto) suma from facturas;
-- devuelve la suma total de todas las facturas

-- COUNT 
select * from facturas;
select count(*) from facturas;
-- cuenta la cantidad de facturas
select * from clientes;
select count(direccion) from clientes;
-- cuenta la cantidad de registros cuya dirección no es nula

-- agrupamiento en MySQL

select letra, count(*) as cantidad_total, 
sum(monto) as suma_total from facturas where letra = 'A';

select letra, count(*) as cantidad_total, 
sum(monto) as suma_total from facturas where letra = 'B';

select letra, count(*) as cantidad_total, 
sum(monto) as suma_total from facturas where letra = 'C';

-- group by
-- devuelve un registro por cada valor del campo agrupado
-- siempre debe ir como primer campo el campo por el cual agrupamos
select letra, count(*) as cantidad_total,
sum(monto) as suma_total from facturas group by letra;

-- uso de having, se utiliza para filtrar registros agrupados
select letra, count(*) as cantidad_total,
sum(monto) as suma_total from facturas group by letra
having suma_total > 1000;


-- subqueries
select max(monto) from facturas;
select * from facturas where monto=(select max(monto) from facturas);
-- lista todos los campos de todos los registros cuyo monto sea igual
-- al monto mayor que haya en facturas
select * from facturas where fecha=(select min(monto) from facturas);
-- lista todos los campos de todos los registros cuyo monto sea igual
-- al monto menor que haya en facturas

select * from facturas where fecha=(select min(fecha) from facturas);
select * from facturas where fecha=(select max(fecha) from facturas);


select * from facturas;

select fecha, count(*) cantidad_total, sum(monto) suma_total from facturas group by fecha;
-- cantidad y montos totales facturados por mes
select 		concat(year(fecha),'/',month(fecha)) mes, 
			count(*) cantidad_total, 
			sum(monto) suma_total 
from 		facturas 
group by 	mes;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- Basándose en la tabla articulos, realizar los siguientes puntos:
-- 1) Agregar a la tabla articulos, los campos stockMinimo y stockMaximo.
alter table articulos add stockMinimo smallint not null, 
add stockMaximo smallint not null;
describe articulos;

-- 2) Completar en los registros los valores de los campos stockMinimo
-- y stockMaximo teniendo en cuenta que el stock mínimo debe ser menor
-- que el stock máximo.
select * from articulos;
update articulos set stockMinimo=10, stockMaximo=1000;
update articulos set stockMinimo=100, stockMaximo=500 where codigo=1;

-- 3) Listar los articulos que se deben reponer y qué cantidad se debe 
-- reponer de cada artículo.
-- Tener en cuenta que se debe reponer cuando el stock es menor al 
-- stockMinimo y la cantidad de articulos a reponer es 
-- stockMaximo - stock.
select nombre, stock, stockMaximo - stock reponer from articulos
where stock<StockMinimo;

-- 4) Calcular el valor de venta de toda la mercaderia que hay en stock.
select sum(precio*stock) valor_venta_total from articulos;

-- 5) Calcular el valor de venta + IVA de toda la mercaderia que hay 
-- en stock.
select round(sum(precio*stock) * 1.21,2) valor_venta_total_con_IVA from articulos;

-- +++++++++++++++++++++
--   SEGUNDA PARTE   --
-- +++++++++++++++++++++

-- 1. Crear la tabla 'autos' dentro de la base de datos 'intro' con 
-- el siguiente detalle:

-- 	codigo	INTEGER y PK
-- 	marca	VARCHAR(255)
-- 	modelo	VARCHAR(255)
-- 	color	VARCHAR(255)
-- 	anio	INTEGER
-- 	precio	DOUBLE

create database intro;
use intro;
create table autos(
	codigo	INT primary key,
 	marca	VARCHAR(255),
 	modelo	VARCHAR(255),
 	color	VARCHAR(255),
 	anio	INTEGER,
 	precio	DOUBLE
);

-- 2. Cargar la tabla con 15 autos
insert into autos values
(1,'Ford','Fiesta','Blanco',2015,6700000),
(2,'Ford','Ka','Negro',2017,6400000),
(3,'Renault','Logan','Rojo',2023,7670000),
(4,'Mercedes Benz','Colectivo','Naranja',2003,700000),
(5,'Ford','Ecosport','Gris',2008,16700000),
(6,'Renault','Duster','Negro',2017,12000000),
(7,'Renault','Kangoo Stepway','Roja',2013,16700000),
(8,'Ford','Focus','Verde',2012,7000000),
(9,'Chevrolet','Corsa','Blanco',2001,12000000),
(10,'Ford','Kuga','Blanco',2023,67000000),
(11,'Ford','Fiesta','Blanco',2015,6700000),
(12,'Ford','Falcon','Gris',1993,40000),
(13,'Citrôen','C4','Violeta',2023,14000000),
(14,'Toyota','Corolla','Rojo',2023,16700000),
(15,'DMC','Delorean','Plata',1813,23000000);

-- 3. Realizar las siguientes consultas:
-- 	a. obtener el precio máximo.
select max(precio) precio_maximo from autos;

-- 	b. obtener el precio mínimo.
select min(precio) precio_minimo from autos;

-- 	c. obtener el precio mínimo entre los años 2010 y 2020.
select min(precio) precio_minimo from autos where anio between 2010 and 2020;

-- 	d. obtener el precio promedio.
select avg(precio) promedio_precio_de_autos from autos;

-- 	e. obtener el precio promedio del año 2023.
select anio,avg(precio) promedio_precio_de_autos from autos where anio=2023;

-- 	f. obtener la cantidad de autos.
select count(*) from autos;

-- 	g. obtener la cantidad de autos que tienen un precio 
-- entre $3.500.000 y $4.000.000
select count(*) from autos where precio between 3500000 and 4000000;

-- 	h. obtener la cantidad de autos que hay en cada año.
select anio, count(*) from autos group by anio;

-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
select anio, count(*) cantidad, avg(precio) promedio from autos group by anio;

-- 	j. obtener la suma de precios y el promedio de precios según marca.
select marca, sum(precio), avg(precio) precio_promedio from autos group by marca;

--  	k. informar los autos con el menor precio.
select * from autos where precio=(select min(precio) from autos);

--  	l. informar los autos con el menor precio entre los años 2014 y 2023
select * 
from autos 
where anio between 2014 and 2023 
and precio=(select min(precio) from autos where anio between 2014 and 2023);

-- m. listar los autos ordenados ascendentemente por marca,modelo, y el año en forma descendente.
select * from autos order by marca, modelo, anio desc;

-- n. contar cuantos autos hay de cada marca.
select marca, count(*) cantidad from autos group by marca;

--  	o. borrar los autos del siglo pasado.
select * from autos where anio < 2000;