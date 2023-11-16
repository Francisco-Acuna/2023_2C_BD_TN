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

select nombre, edad from hombres
union
select nombre, edad from mujeres;

-- actualizamos la edad de la Cris mujer para ver cómo sale la query anterior 
-- sin duplicados
update mujeres set edad=20 where nombre='Cris' and edad=61;


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
-- DER Diagrama de Entidad Relacional
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
-- manipulación de bases de datos relacionales. Se basa en principios
-- tomados de la teoría de los conjuntos.

-- creamos una nueva base de datos
drop database if exists negocio_noche;
create database negocio_noche; 
use negocio_noche;

create table clientes(
	codigo int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni char(8) not null,
    direccion varchar(100),
    primary key(codigo)
);

create table facturas(
	letra char(1),
    numero int,
    codigoCliente int not null,
    fecha date not null,
    monto double not null,
    check(letra in('A','B','C')),
    primary key(letra,numero)
);

insert into clientes (nombre, apellido, dni, direccion) values
('Juan', 'Perez', 32456789, 'Lope de Vega 243'),
('Marcelo', 'Cándido', 85462135, 'Medrano 162'),
('Mirna', 'Freire', 98657421, 'Julián Álvarez 1300'),
('Florencia', 'Flores', 32365987, 'Lavalle 50'),
('Jana', 'Furtado', 36985632, 'Av. Corrientes 12.325'),
('Melisa', 'Pico', 31265498, 'Callao 3568'),
('Roberto', 'Fernandez', 87465532, 'Casullo 102'),
('Julián', 'Spataro', 32326598, 'Juan B. Justo 987'),
('Marcos', 'Perez', 39564125, 'Zeballos 98'),
('Diego', 'Gonzalez', 32652222, 'Azul 2032');

insert into facturas values 
('A', 1, 1, curdate(), 125000),
('A', 2, 2, '2023-10-31', 250000),
('B', 1, 1, '2023-10-30', 25000),
('C', 1, 3, '2023-10-06', 2000),
('A', 3, 6, '2023-10-03', 125000),
('C', 2, 10, '2023-02-01', 248000),
('C', 3, 7, curdate(), 100000),
('C', 4, 9, curdate(), 12000),
('B', 2, 2, '2022-12-17', 70000),
('B', 3, 1, '1982-05-22', 5000);

-- el producto cartesiano es la unión de todos los registros
select * from clientes, facturas; -- producto cartesiano
-- en este caso devuelve 100 registros porque es la combinación de ambas tablas
-- cada tabla tiene 10 registros, por lo tanto 10 x 10 = 100

-- el producto relacionado es la representación de las relaciones reales entre las tablas
select * from clientes, facturas where codigo=codigoCliente;
select * from clientes;
select * from facturas;

insert into facturas values ('A', 4, 25,curdate(), 12600);

select count(*) from clientes; -- 10
select count(*) from facturas; -- 11
select count(*) from clientes, facturas; -- cantidad de clientes * cantidad de facturas

-- uso de alias para tablas
select * from clientes c, facturas f where c.codigo=f.codigoCliente;


-- claúsulas JOIN
select * from clientes c join facturas f on c.codigo=f.codigoCliente;
-- el join que utilizamos recién se lo conoce también como INNER JOIN, une las dos
-- tablas por medio de un campo en común. Compara los valores, y si encuentra coincidencia
-- los selecciona.
-- comparado con la teoría de los conjuntos, vendría a ser la intersección de 2 conjuntos.

 -- cualquiera de las últimas 3 formas vistas es válida
 -- pero se sugiere el uso del join como buena práctica
 
 -- left join es similar al inner join, solo que en este caso, además de las 
 -- coincidencias, va a traer todos los valores de la tabla de la izquierda. 
 -- Por más que no se crucen con la tabla de la derecha. Comparado con la teoría
 -- de los conjuntos, trae todos los registros de A.
 -- Cuando hablamos de tablas de la derecha e izquierda, nos referimos a la 
 -- posición en que las hayamos ubicado en la query.
 select 	c.nombre, 
			c.apellido, 
            f.* 
from 		clientes c 
left join 	facturas f 
on 			c.codigo=f.codigoCliente;
 
-- right join es igual a left join, solo que en este caso trae todos los 
-- registros de la derecha
select 		c.codigo,
			c.nombre, 	
			c.apellido, 
            f.* 
from 		clientes c 
right join 	facturas f 
on 			c.codigo=f.codigoCliente;

-- restricción de foreign key
-- agregamos la restricción para cuidar la integridad referencial de la base
alter table facturas 
add constraint FK_facturas_codigoCliente
foreign key(codigoCliente)
references clientes(codigo);

delete from facturas where codigoCliente=25;

select * from facturas;
-- insert into facturas values ('A', 4, 300, curdate(), 56400);
-- no funciona el insert anterior porque no existe el cliente de código 300


insert into facturas values ('A', 4, 3, curdate(), 56400);

-- consultas con join
-- Quiénes compraron hoy? (nombre, apellido)
select 	c.nombre,
		c.apellido
from	clientes c
join	facturas f 
on 		c.codigo=f.codigoCliente
where 	fecha=curdate();

-- Qué compras (facturas) realizó Juan Perez?
select 	f.* 
from	facturas f
join	clientes c 
on 		c.codigo=f.codigoCliente
where 	c.nombre='Juan' and c.apellido='Perez';

-- Cuánto (total) se le facturó a Juan Perez?
select 	sum(monto) total_facturado
from 	facturas 
join	clientes
on 		codigo=codigoCliente
where 	nombre='Juan' and apellido='Perez';

-- Cuánto se le facturó a cada cliente?
select 		codigo, nombre, apellido, sum(monto)
from 		clientes c
join 		facturas f
on			c.codigo=f.codigoCliente
group by	codigo;


-- creamos la tabla articulos
create table articulos(
	codigo int primary key,
    nombre varchar(50) not null,
    precio double not null,
    stock int not null
);


-- creamos la tabla detalles
create table detalles(
	letra char(1),
    numero int,
    codigo int,
    primary key(letra, numero, codigo)
);

-- creamos la restricción de clave foránea
alter table detalles
add constraint FK_detalles_facturas
foreign key(letra, numero)
references facturas(letra, numero);

alter table detalles
add constraint FK_detalles_articulos
foreign key(codigo)
references articulos(codigo);

