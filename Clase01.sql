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

