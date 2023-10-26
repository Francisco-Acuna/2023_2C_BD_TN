-- ---------------------------------
-- COMBINACIÓN DE CONSULTAS
-- ---------------------------------

/*
Para comparar los resultados de varias consultas y combinarlas en un único
resultado, existe el operador UNION.
Para que funcione correctamente, tenemos que tener en cuenta:
- en cada resultado tiene que haber la misma cantidad de campos
-- los campos tienen que tener el mismo tipo de dato
-- la primer consulta se escribe sin el ; final
-- los registros duplicados se eliminan
Si queremos conservar los registros duplicados, se utiliza 'UNION ALL'
*/

create database personas;
use personas;

-- creamos 2 tablas, una para hombres y otra para mujeres

create table hombres(
	nombre varchar(50) not null,
    provincia varchar(50) not null,
    edad int not null
);

create table mujeres(
	nombre varchar(50) not null,
    provincia varchar(50) not null,
    edad int not null
);

insert into hombres values
('Juan', 'Buenos Aires', 32),
('Mariano', 'Córdoba', 24),
('Luis', 'Mendoza', 40),
('Cris', 'Córdoba', 20),
('Raúl', 'San Juan', 35);

insert into mujeres values
('Malena', 'Catamarca', 22),
('Luisa', 'Formosa', 30),
('Cris', 'Buenos Aires', 61),
('Alejandra', 'Córdoba', 19),
('Mariela', 'Misiones', 50);

-- obtenemos listado de todos:
select * from hombres
union
select * from mujeres;

-- obtenemos el listado del nombre de todos los hombres y mujeres
-- sin incluir los duplicados
select nombre from hombres
union
select nombre from mujeres;

-- obtenemos lo mismo pero incluyendo los duplicados
select nombre from hombres
union all
select nombre from mujeres;

-- obtenemos lo mismo, pero que sean de Córdoba
select nombre from hombres where provincia='Córdoba'
union
select nombre from mujeres where provincia='Córdoba';

-- ahora queremos que los hombres sean de Córdoba y las mujeres de Misiones
select nombre, provincia from hombres where provincia='Córdoba'
union
select nombre, provincia from mujeres where provincia='Misiones';

-- --------------------------------------
-- DER Diagrama de Entidad Reacional
-- --------------------------------------
/*
Es la representación gráfica de la estructura de la base de datos.
Muestra las entidades, atributos y relaciones.

Hay 3 conceptos claves que figuran en el DER_
1- Entidades -> son las representaciones de los objetos o conceptos
				del mundo real. Por ejemplo: clientes, facturas, articulos, etc.
2- Atributos -> son las características o propiedades de las entidades.
				Por ejemplo: nombre, apellido, monto, stock, etc.
3- Relaciones -> son las relaciones entre las tablas. Cómo se relacionan
				 entre sí. Tiene que ver con la cardinalidad.
*/

-- Álgebra relacional. 
-- Son un conjunto de operaciones que se utilizan para el diseño y 
-- manipulación de bases de datos relacionales. Se base en principios
-- tomados de la teoría de los conjuntos.

-- creamos una nueva base de datos
create database negocio_noche; 

use cursobd;
show tables;
select * from clientes;









