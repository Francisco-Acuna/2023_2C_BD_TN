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





    
    



