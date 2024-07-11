create database actividadsubconsultas;
use actividadsubconsultas;

create table ciudades(
  codigo int auto_increment,
  nombre varchar(20),
  primary key (codigo)
 );
 create table clientes (
  codigo int auto_increment,
  nombre varchar(30),
  domicilio varchar(30),
  codigociudad smallint not null,
  primary key(codigo)
 );
#2- Ingrese algunos registros para ambas tablas:
 insert into ciudades (nombre) values('Cordoba');
 insert into ciudades (nombre) values('Cruz del Eje');
 insert into ciudades (nombre) values('Carlos Paz');
 insert into ciudades (nombre) values('La Falda');
 insert into ciudades (nombre) values('Villa Maria');
 insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Marcos','Colon 111',1);
 insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Hector','San Martin 222',1);
 insert into clientes(nombre,domicilio,codigociudad) values ('Perez Ana','San Martin 333',2);
 insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Juan','Rivadavia 444',3);
 insert into clientes(nombre,domicilio,codigociudad) values ('Perez Luis','Sarmiento 555',3);
 insert into clientes(nombre,domicilio,codigociudad) values ('Gomez Ines','San Martin 666',4);
 insert into clientes(nombre,domicilio,codigociudad) values ('Torres Fabiola','Alem 777',5);
 insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Luis','Sucre 888',5);
#solucion 
#1-Necesitamos conocer los nombres de las ciudades de aquellos clientes cuyo domicilio es en calle  "San Martin", empleando subconsulta.
select nombre from ciudades where codigo in(select codigociudad from clientes where domicilio like '%San Martin%');

#2-Obtenga la misma salida anterior pero empleando join.
SELECT ciudades.nombre
FROM clientes
JOIN ciudades ON clientes.codigociudad = ciudades.codigo
WHERE clientes.domicilio LIKE '%San Martin %';

#3-Obtenga los nombre de las ciudades de los clientes cuyo apellido no comienza con una letra  específica, empleando subconsulta.
select nombre from ciudades where codigo in ( select codigociudad nombre from clientes where nombre not like 'l%');

#4-Pruebe la subconsulta del punto 3 separada de la consulta exterior para verificar que retorna una lista de valores de un solo campo.
select codigociudad nombre from clientes  where nombre not like 'l%';
