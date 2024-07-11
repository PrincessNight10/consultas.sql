create database actividadhoy;
use actividadhoy;


create table libros(
  codigo int auto_increment,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  primary key(codigo)
);

 insert into libros(titulo,autor,editorial,precio) 
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Siglo XXI',40.00);
 insert into libros(titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',10.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Ilusiones','Richard Bach','Planeta',15.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Planeta',20.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',30.00);
 insert into libros(titulo,autor,editorial,precio)
#subconsulta con in

select titulo, autor, precio from libros where precio = (select max(precio) from libros);



drop table if exists editoriales;
 drop table if exists libros;

 create table editoriales(
  codigo int auto_increment,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros (
  codigo int auto_increment,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial smallint,
  primary key(codigo)
 );

select nombre from editoriales
where codigo in 
(select codigoeditorial
from libros
where autor ='Richard Bach');

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Paidos');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial) values('Uno','Richard Bach',1);
 insert into libros(titulo,autor,codigoeditorial) values('Ilusiones','Richard Bach',1);
 insert into libros(titulo,autor,codigoeditorial) values('Aprenda PHP','Mario Molina',4);
 insert into libros(titulo,autor,codigoeditorial) values('El aleph','Borges',2);
 insert into libros(titulo,autor,codigoeditorial) values('Puente al infinito','Richard Bach',2);

 -- nombre de las editoriales que han publicado libros del autor "Richard Bach":
 select nombre
  from editoriales
  where codigo in
   (select codigoeditorial
     from libros
     where autor='Richard Bach');

-- probamos la subconsulta separada de la consulta exterior para verificar que retorna
-- una lista de valores de un solo campo:
 select codigoeditorial
  from libros
  where autor='Richard Bach';

 -- podemos reemplazar por un "join" la primera consulta:
 select distinct nombre
  from editoriales as e
  join libros
  on codigoeditorial=e.codigo
  where autor='Richard Bach';

 -- buscar las editoriales que no han publicado libros de "Richard Bach":
 select nombre
  from editoriales
  where codigo not in
   (select codigoeditorial
     from libros
     where autor='Richard Bach');
