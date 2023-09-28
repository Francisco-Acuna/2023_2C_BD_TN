drop database if exists cursobd;
create database cursobd;
use cursobd;
create table clientes(
	codigo int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni char (8) not null,
    direccion varchar(100),
    primary key (codigo)
);

insert into clientes (nombre, apellido, dni, direccion) values
('Agustín','González','22333444','Paso 1521'),
('Jorge', 'García','56359874','Lanús 2042'),
('Malena','Fernández','33568568','España 123'),
('Juan', 'Gardoni', '98999888','Lavalle 1236'),
('Fernando','Flores','12345678','Belgrano 122');

-- Crear la tabla facturas dentro de la base de datos, con el siguiente detalle:
/*
letra		char y PK
numero 		int y PK
fecha		date
monto		double

 PK significa Primary Key 
 en este caso la clave es compuesta
 es decir (letra,codigo)
 cada campo por si solo no es clave, ni tampoco identifica al registro
 pero la suma de los dos, forman la clave
*/
drop table if exists facturas;
create table facturas (
	letra char(1),
    numero int,
    fecha date not null,
    monto double not null,
    check(letra in('A','B','C')),
    primary key(letra,numero)
);

describe facturas;

-- insertamos registros en la tabla facturas
insert into facturas (letra, numero, fecha, monto) values 
('A', 1, '1993-07-27',200);
insert into facturas (letra, numero, fecha, monto) values
('B', 1, '1993-01-09',300);
-- si guardamos los datos de todos los campos y en el mismo orden, no se declaran
insert into facturas values ('A', 2, '2003-08-05',550);
-- insert into facturas values ('J', 1, '2023-09-06', 12500);
insert into facturas values ('C',1,curdate(),1700);
insert into facturas values ('A',3,curdate(),13000);


-- Crear la tabla articulos con el siguiente detalle:
/*
	codigo		int y PK
    nombre		varchar(50)
    precio		double
    stock 		int
*/
create table articulos(
	codigo int primary key,
    nombre varchar(50) not null,
    precio double not null,
    stock int not null
);


-- insertar registros en la tabla articulos
insert into articulos values (1,'destornillador',1500,100);
insert into articulos values (2, 'tornillo', 100, 2000);
insert into articulos values (500, 'pinza amperométrica', 30000,20);
insert into articulos values (200, 'martillo Hammer', 15000,200);
insert into articulos values (550, 'cable x mt', 500,5000);

select * from articulos;

-- insertar más registros de clientes
insert into clientes (nombre, apellido, dni, direccion) values
('Juan', 'Novoa', '12334443','Belgrano 2033'),
('Marcelo','Galván', '88999888', 'Salta 242'),
('María', 'Guerra', '78787877', 'Bragado 777'),
('Marcela', 'Nuñez', '98765432', 'Azul 232'),
('Analía', 'Ponce', '55000222', 'Lavalle 82');

-- --------------------------------------------
-- COMANDO DE RECUPERACIÓN SELECT
-- --------------------------------------------

select * from clientes;
-- trae todos los campos de todos los registros de la tabla clientes
-- (el * es un comodín)

select nombre, apellido from clientes;
-- trae los campos de nombre y apellido de todos los registros

select nombre from clientes;
-- trae todos los nombres de todos los registros de clientes

select distinct nombre from clientes;
-- lista los nombres omitiendo los valores duplicados

/*
Operadores relacionales
	= igual
    != no igual
    <> distinto (es igual al anterior)
    > mayor
    < menor
    >= mayor o igual
    <= menor o igual
*/

insert into clientes (nombre, apellido, dni, direccion) values
('Juan Pablo', 'López','11000333','Salta 789');

-- Filtrado con where
select * from clientes where nombre = 'juan';
-- trae todos los registros cuyo nombre sea igual a 'juan'
select * from clientes where nombre = 'Juan';
select * from clientes where nombre = 'JUAN';
-- siempre va a traer a todos los registros sin tener en cuenta las mayúsculas
-- ni minúsculas
select * from clientes where codigo = 3;
-- trae los registros cuyo código es igual a 3
select * from clientes where codigo > 3;
-- trae todos los registros cuyo codigo sea mayor a 3
select * from clientes where codigo <= 3;
-- trae todos los registros cuyo codigo sea menor o igual a 3

-- Operadores AND y OR
select * from clientes where codigo < 3 or codigo > 5;
-- trae todos los registros cuyo codigo sea menor a 3 o mayor a 5
-- en el or basta con que se cumpla una solo condición
select * from clientes where codigo >= 3 and codigo <= 5;
-- trae todos los registros cuyo codigo sea mayor o igual a 3 y menor o igual a 5
-- en el and debe cumplir ambas condiciones

-- Valores NULL
-- insertamos registros en la tabla clientes
insert into clientes (nombre, apellido, dni, direccion) values
('Marcelo', 'Peña','66444555','');     
insert into clientes (nombre, apellido, dni, direccion) values
('Juan Pablo', 'Nuñez','77666555',null);   

-- null significa desconocido y no debe interpretarse como vacío o 0
-- los valores nulos no ocupan espacio y son distintos al 0 y al espacio en blanco
-- debemos tener cuidado con los valores nulos en las operaciones, ya que
-- 1 * NULL es igual a NULL

select * from clientes where direccion = '';
-- trae todos los clientes cuya direccion sea vacía 
select * from clientes where direccion is null;
-- trae todos los clientes cuya direccion sea nula (NULL)
select * from clientes where direccion is not null;
-- trae todos los registros de clientes cuya direccion no sea nula

-- los valores nulos se consultan con "is null" o "is not null"
-- select * from clientes where direccion = null;
-- no utilizamos el = para buscar nulos

-- columnas calculadas y alias
select 2 + 2;
select 2 + 2 suma;
select letra, numero, monto, monto*.21 from facturas;
select letra, numero, monto, monto*.21 IVA from facturas;

-- parámetros between y not between
select * from facturas;
select * from facturas where monto between 1500 and 10000;
select * from facturas where monto not between 1500 and 10000;
-- la sentencia between nos trae todos los registros que estén
-- entre los dos parámetros, incluyendo los extremos
-- la sentencia not between no incluye los valores extremos

-- parámetros IN y NOT IN
select * from clientes where codigo in (2,4,6);
-- trae los registros cuyo codigo esté dentro de los declarados entre los ()
select * from clientes where codigo=2 or codigo=4 or codigo=6;
select * from clientes where codigo not in (2,4,6);
-- trae todos los registros menos aquellos cuyo codigo sea igual a alguno de
-- los declarados dentro de los ()
select * from clientes where codigo<>2 and codigo<>4 and codigo<>6;
select * from clientes;
-- parámetro like y operadores % _
-- el operador % significa nada o cualquier cosa
-- el operador _ significa un caracter cualquiera
select * from clientes where nombre like '%mar%';
select * from clientes where nombre like 'marcel_';
select * from clientes where apellido like 'ga%';
select * from clientes where apellido like '%z';
select * from clientes where apellido like 'p%a';
select * from clientes where nombre like 'ma%a';
select * from clientes where nombre like '%juan%';

-- parámetros ORDER BY ASC y DESC
select * from clientes order by nombre asc;
-- lista todos los campos de todos los registros ordenados alfabéticamente por nombre
-- no es obligatorio poner asc
select * from clientes order by nombre;
-- sí es obligatorio poner desc cuando es descendente
select * from clientes order by nombre desc;
select * from clientes order by nombre, apellido desc;

-- claúsula limit
-- limita la cantidad de registros de salida
select * from clientes limit 3;
-- limita la salida a 3 registros

select * from clientes limit 3,4;
-- luego del registro 3, muestra 4 registros

-- insertamos registros en la tabla artículos
insert into articulos values (551,'pinza', 2000,500);
insert into articulos values (552, 'soldador', 5000, 200);
insert into articulos values (553, 'pala', 1500, 400);
insert into articulos values (554, 'tijera', 500, 10);
insert into articulos values (555, 'foco de luz', 1700, 50);
insert into articulos values (556, 'maza', 8000, 1000);
insert into articulos values (557, 'cinta métrica', 3001, 2);
select * from articulos;
-- Ejercicio
/*
Basándose en la tabla artículos, obtener los siguientes listados.
1- articulos con precio mayor a 1000
2- articulos con precio entre 2000 y 4000 (usar < y >)
3- articulos con precio entre 400 y 6000 (usar between)
4- articulos con precio = 2000 y stock mayor a 300
5- articulos con precio (1200,2000,3000) no usar in
6- articulos con precio (1200,2000,3000) usar in
7- articulos que su precio no sea (1200,2000,3000)
8- listar los articulos ordenados por precio de mayor a menor, y si hubiera
precios iguales deben quedar ordenados por nombre
9- listar todos los articulos incluyendo una columna denominada "precio con IVA", 
la cual deberá tener el monto con el iva del producto
10- listar todos los articulos incluyendo una columna denominada "cantidad de 
cuotas" y otra "valor de cuota", la cantidad es fija y es 3, el valor de cuota
corresponde a 1/3 del monto con un 5% de interés
*/

-- 1- articulos con precio mayor a 1000
select * from articulos where precio > 1000;
-- 2- articulos con precio entre 2000 y 4000 (usar < y >)
select * from articulos where precio > 2000 and precio < 4000;
-- 3- articulos con precio entre 400 y 6000 (usar between)
select * from articulos where precio between 400 and 6000;
-- 4- articulos con precio = 2000 y stock mayor a 300
select * from articulos where precio = 2000 and stock > 300;
-- 5- articulos con precio (1200,2000,3000) no usar in
select * from articulos where precio=1200 or precio=2000 or precio=3000;
-- 6- articulos con precio (1200,2000,3000) usar in
select * from articulos where precio in (1200,2000,3000);
-- 7- articulos que su precio no sea (1200,2000,3000)
select * from articulos where precio not in (1200,2000,3000);
-- 8- listar los articulos ordenados por precio de mayor a menor, y si hubiera
-- precios iguales deben quedar ordenados por nombre
select * from articulos order by precio desc, nombre;
-- 9- listar todos los articulos incluyendo una columna denominada 
-- "precio con IVA", la cual deberá tener el monto con el iva del producto
select codigo, nombre, precio, precio*1.21 "precio con IVA", stock from articulos;
select *, precio * 1.21 'precio con IVA', stock from articulos;   
-- 10- listar todos los articulos incluyendo una columna denominada "cantidad 
-- de cuotas" y otra "valor de cuota", la cantidad es fija y es 3, el valor de 
-- cuota corresponde a 1/3 del monto con un 5% de interés
select codigo, nombre, precio, 3 as 'cantidad de cuotas', precio / 3 * 5/100 + 
precio / 3 'valor de las cuotas', stock from articulos;

select codigo, nombre, precio, 3 as 'cantidad de cuotas', precio/3 * 1.05 
'valor de las cuotas', stock from articulos;

select codigo, nombre, precio, precio * 1.05 / 3 'valor de cuota', 3 'cantidad
de cuotas', stock from articulos;

-- cargar registros usando la claúsula select
create table amigos(
	nombre varchar(50),
    apellido varchar(50)
);

insert into amigos select nombre, apellido from clientes;

select * from amigos;

-- crear una tabla a partir de la información de otra tabla
create table nombres select distinct nombre from clientes;
select * from nombres;

-- clon de una tabla
create table clientes2 select * from clientes;
select * from clientes2;


-- insertar registros en la tabla amigos
insert into amigos values ('Pedro','Sanchez') ;
insert into amigos values ('Juan','Lopez'), ('Tomás','Pepsi'), ('María','Picapiedra');

-- Tablas temporales
-- Las tablas temporales son tablas alojadas en RAM y desaparecen al cortar la
-- conexión con el servidor. Se la usa para obtener consultas muy veloces para datos
-- temporarios

create temporary table clientes_copia select * from clientes;

show tables;

select * from clientes_copia;

-- comando delete
select * from clientes;
delete from clientes where codigo = 5;
-- borra un único registro

delete from clientes where nombre = 'Juan';
-- elimina los clientes cuyo nombre sea igual a 'Juan';

delete from clientes where codigo > 11;
-- elimina todos los registros cuyo código sea mayor a 11

delete from clientes;
-- Ojo! elimina todos los registros de la tabla clientes

-- el editor de MySQL Workbench trae configurada por default una configuración de
-- protección para evitar ejecutar comandos de borrado o actualización masiva.
-- se puede desactivar desde el menú -> Edit -> Preferences -> SQL Editor -> safe updates
-- luego hay que reiniciar Workbench.
-- otra forma de bloquear o liberar la protección es por medio de código
set sql_safe_updates = 0; -- deshabilita la protección
set sql_safe_updates = 1; -- habilita la protección

select * from clientes;

insert into clientes (nombre, apellido, dni, direccion) values
('Pepe','Grillo','11334466',null);

truncate clientes;
-- también vacía toda la tabla clientes, borrando todos los registros simultáneamente
-- no lo hace uno por uno como delete, por lo tanto es más veloz.
-- También reinicia la secuencia de los auto_incrementables a cero.

-- truncate clientes where codigo = 1;
-- no se puede filtrar el borrado con truncate

insert into clientes select * from clientes2 where codigo <> 1;

-- actualizar valores de registros de una tabla
select * from clientes;
-- update
update clientes set nombre = 'Mariana' where codigo = 2;
-- actualiza el valor del nombre del registro de codigo 2

update clientes set nombre = 'Facundo' where nombre = 'Fernando';
-- actualiza el valor del nombre de la tabla clientes de todos aquellos cuyo nombre
-- sea Fernando

update clientes set nombre = 'Marcelina' where nombre = 'Marcelino' and apellido like '%p%';
-- actualiza el valor del nombre de la tabla clientes de todos aquellos registros
-- cuyo nombre sea Marcelino y su apellido contenga una p

update clientes set nombre = 'Lorena';
-- OJO!! cambia el nombre de todos los registros a "Lorena"

