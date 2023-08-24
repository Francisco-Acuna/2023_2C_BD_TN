-- esto es una línea de comentarios
-- es necesario dejar un espacio luego de --

/*
esto es un bloque de comentarios
se puede escribir en varias líneas
*/

# es otro tipo de comentario, pero no es ANSI
# sólo va a funcionar en MySQL

show databases; -- muestra las bases del servidor

SHOW DATABASES; -- las instrucciones se pueden escribir en mayúsculas
-- el lenguaje es NO CASE SENSITIVE
-- el ; es el terminador de sentencias

drop database if exists cursobd; 
-- elimina la base de datos si es que existe

create database cursobd;
-- crea la base de datos

create database if not exists cursobd;
-- crea la base de datos si no existe
 
show databases;

use cursobd;
-- entramos y activamos la base

show tables;
-- muestra las tablas de la base

-- creación de tabla
create table clientes(
	codigo int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni char (8) not null,
    direccion varchar(100),
    primary key (codigo)
);

-- la coma separa los campos
-- el ; termina la sentencia
-- not null significa que no admite nulos, es decir, que es campo obligatorio
-- primary key es la llave primaria que identifica al registro.

describe clientes;
-- realiza una descripción de los campos de la tabla

select * from clientes;
-- muestra todos los registros de la tabla clientes

drop table clientes;
-- eliminamos la tabla clientes

drop table if exists clientes;
-- elimina la tabla clientes si es que existe

create table if not exists clientes(
	codigo int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni char (8) not null,
    direccion varchar(100),
    primary key (codigo)
);
-- crea la tabla si no existe. Si existe, no hace nada.

show tables;

-- Insertar registros en una tabla

insert into clientes (nombre, apellido, dni, direccion) values
('Agustín','González','22333444','Paso 1521'),
('Jorge', 'García','56359874','Lanús 2042'),
('Malena','Fernández','33568568','España 123'),
('Juan', 'Gardoni', '98999888','Lavalle 1236'),
('Fernando','Flores','12345678','Belgrano 122');

select * from clientes;



