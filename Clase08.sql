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
select max(monto) from facturas;
-- devuelve el monto máximo de las facturas.
select max(monto) maximo from facturas;
select max(monto) maximo from facturas where letra='b';
-- devuelve el monto máximo de las facturas cuya letra sea = 'b'






