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
    dni char(8) not null,
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

-- -----------------------------------------------
-- TIPOS DE DATOS MÁS UTILIZADOS
-- -----------------------------------------------

/*
Tipos de datos de texto más utilizados

CHAR -> este tipo de datos lo utilizamos cuando sabemos cuántos caracteres se guardarán
Por ejemplo, si declaramos un tipo de dato CHAR de 20 posiciones, siempre va a guardar 20 bytes
nombre char(20); entre paréntesis indicamos la longitud
|--------------------| -> 20 bytes
|maximiliano---------| -> 20 bytes
|carlos--------------| -> 20 bytes
|ana-----------------| -> 20 bytes

VARCHAR -> este tipo de dato lo utilizamos cuando no sabemos la longitud del dato que se ingresará
nombre varchar(20);
|--------------------| -> 20 bytes
|maximiliano---------| -> 11 bytes + 1 byte de aviso de longitud
|carlos--------------| -> 6 bytes  + 1 byte de aviso de longitud
|ana-----------------| -> 3 bytes + 1 byte de aviso de longitud

*/

/*
Tipos de datos numéricos

BIT o BOOL
Guarda un entero que representa un valor de verdad.
Sirve para guardar valores lógicos.
El 0 representa el valor falso.
Y cualquier otro número distinto de 0 representa el valor de verdad.

TINYINT
almacena un entero de 1 byte
|--------|--------|
-128     0       127

TINYINT (unsigned)
|--------|--------|
0                255

SMALLINT
|--------|--------|
-32.768  0        32.767

SMALLINT (unsigned)
|--------|--------|
0				  65.535

INT (32 bits)
|--------|--------|
-2.147.483.648	  2.147.483.647

INT (unsigned)
|--------|--------|
0				  4.294.967.295

BIGINT
es el valor más grande (64 bits)	

FLOAT (son decimales de 32 bits)
almacenan hasta 8 dígitos
|--------|
Por ejemplo si quisiera hacer
10 / 3
3.333333 (el punto cuenta como un dígito más)

si hiciera
100/3
33.33333 
En este caso se desplazó el punto, por eso decimos que es punto flotante.
Se achica la precisión decimal

DOUBLE (son decimales de 64 bits)
almacena hasta 17 dígitos
si hiciera 
10 / 3
3.333333333333333 
ó
100 / 3
33.33333333333333

DECIMAL
Representa números decimales de precisión fija, es una precisión exacta.
La estructura es:
DECIMAL(m,n)
donde m es la cantidad de dígitos que tendrá el número en total
y n es la cantidad de dígitos que se utilizarán para representar los decimales
Ejemplo
DECIMAL(10,2)
xxxxxxxx.xx (en este caso el punto no se considera un dígito)
el mayor número que puedo representar es
99999999.99

En MySQL ocupa la longitud + 2 como cantidad de bytes
Siguiendo el ejemplo, ocuparía 12 bytes -> 10 + 2
*/

/*
Tipos de datos de fecha y hora

DATE
ocupa 3 bytes y almacena una fecha 
formato: YYYY-MM-DD
por ejemplo: '2023-08-30'

DATETIME
ocupa 8 bytes y guarda la fecha y la hora
formato: YYYY-MM-DD HH:MM:SS

TIME
ocupa 3 bytes y guarda la hora
formato: HH:MM:SS

YEAR (no es ANSI)
ocupa 1 byte y almacena valores de años. 
*/

-- El comando select nos sirve para traer registros de una tabla.
-- pero también lo podemos utilizar para imprimir mensajes en la consola
select 'Hola Mundo!';
-- también podemos realizar operaciones matemáticas
select 2 + 2;
-- se puede agregar un alias a las consultas select
select 2 + 2 as 'Suma';
-- el "as" ya no es obligatorio
select 2 + 2 'Suma';
-- el uso de las comillas en este caso tampoco es obligatorio
select 2 + 2 Suma;
-- si el alias fuera una palabra compuesta, tenemos que ponerla entre comillas
select 2 + 2 'resultado suma';
-- otra forma de solucionarlo es escribir en snake_case
select 2 + 2 resultado_suma;

-- devuelve la fecha actual
select curdate();

-- devuelve la hora actual
select curtime();

-- devuelve la fecha y la hora
select sysdate();

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





