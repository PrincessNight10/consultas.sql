create database Escuela;
use Escuela;
#Problema 1:

# Un club dicta cursos de distintos deportes. Almacena la información en varias tablas.
#El director no quiere que los empleados de administración conozcan la estructura de las tablas ni 
#algunos datos de los profesores y socios, por ello se crean vistas a las cuales tendrán acceso.

#1 - Elimine las tablas y créelas nuevamente:
 drop table if exists inscriptos;
 drop table if exists socios;
 drop table if exists profesores; 
 drop table if exists cursos;

 create table socios(
  documento char(8) not null,
  nombre varchar(40),
  domicilio varchar(30),
  primary key (documento)
 );

create table profesores(
  documento char(8) not null,
  nombre varchar(40),
  domicilio varchar(30),
  primary key (documento)
 );

 create table cursos(
  numero integer auto_increment,
  deporte varchar(20),
  dia varchar(15),
  documentoprofesor char(8),
  primary key (numero)
 );

 create table inscriptos(
  documentosocio char(8) not null,
  numero integer not null,
  matricula char(1),
  primary key (documentosocio,numero)
 );


#2- Ingrese algunos registros para todas las tablas:
 insert into socios values('30000000','Fabian Fuentes','Caseros 987');
 insert into socios values('31111111','Gaston Garcia','Guemes 65');
 insert into socios values('32222222','Hector Huerta','Sucre 534');
 insert into socios values('33333333','Ines Irala','Bulnes 345');

 insert into profesores values('22222222','Ana Acosta','Avellaneda 231');
 insert into profesores values('23333333','Carlos Caseres','Colon 245');
 insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');
 insert into profesores values('25555555','Esteban Lopez','Sucre 1204');

 insert into cursos(deporte,dia,documentoprofesor) 
  values('tenis','lunes','22222222');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('tenis','martes','22222222');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('natacion','miercoles','22222222');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('natacion','jueves','23333333');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('natacion','viernes','23333333');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('futbol','sabado','24444444');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('futbol','lunes','24444444');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('basquet','martes','24444444');

 insert into inscriptos values('30000000',1,'s');
 insert into inscriptos values('30000000',3,'n');
 insert into inscriptos values('30000000',6,null);
 insert into inscriptos values('31111111',1,'s');
 insert into inscriptos values('31111111',4,'s');
 insert into inscriptos values('32222222',8,'s');

select * from inscriptos;

#3- Elimine la vista "vista_club" si existe:
 
drop view vista_club;

#4 - Cree una vista en la que aparezca el nombre y documento del socio, el deporte, el día y el nombre del profesor (no mostrar datos de los socios que no están inscriptos en deportes)
 create view vista_club as
  select s.nombre as socio,
         s.documento as docsocio,
         s.domicilio as domsocio,
         c.deporte as deporte,
         dia,
         p.nombre as profesor, 
         matricula
   from socios as s
   join inscriptos as i on s.documento=i.documentosocio
   join cursos as c on i.numero=c.numero
   join profesores as p on c.documentoprofesor=p.documento;


#5- Muestre la información contenida en la vista.
 
select * from vista_club;

#6- Realice una consulta a la vista donde muestre la cantidad de socios inscriptos en cada deporte  ordenados por cantidad.

select deporte, count(socio) as cantidad_socios from vista_club  group by deporte order by cantidad_socios asc;

#7- Muestre (consultando la vista) el nombre y documento de los socios que deben matrículas.
 select socio, docsocio, matricula from vista_club where matricula = 's';


#8- Consulte la vista y muestre los nombres de los profesores y los días en que asisten al club para  dictar sus clases.
select profesor, dia as diaClase from vista_club;

#9- Muestre todos los socios que son compañeros en tenis los lunes.

select socio, group_concat(socio separator',') as personas_compañeros_tenis_lunes , dia  from vista_club where dia = 'Lunes' group by socio ;

#10 - Cree una nueva vista llamada 'vista_inscriptos' que muestre la cantidad de inscriptos por curso, incluyendo el nombre del deporte y el día. Elimine la vista previamente si ya existe.

 drop view if exists Vista_inscriptos;
 
create view Vista_inscriptos as
select c. deporte , c.dia, count(*)  as personas_que_estan_inscriptos
from cursos c
join inscriptos i on c.numero = i.numero
group by c.deporte, c.dia;


#11- Consulte la vista 'vista_inscriptos':

select * from Vista_inscriptos;
 
# problema 2: Un profesor almacena el documento, nombre y la nota final de cada alumno de su clase en una tabla llamada "alumnos".

# 1- Elimine la tabla si existe y luego Créela  
 drop table if exists alumnos;

 create table alumnos(
  documento char(8),
  nombre varchar(30),
  nota decimal(4,2),
  primary key(documento)
 );


#2-Ingrese algunos registros:
 insert into alumnos values('30111111','Ana Algarbe',5.1);
 insert into alumnos values('30222222','Bernardo Bustamante',3.2);
 insert into alumnos values('30333333','Carolina Conte',4.5);
 insert into alumnos values('30444444','Diana Dominguez',9.7);
 insert into alumnos values('30555555','Fabian Fuentes',8.5);
 insert into alumnos values('30666666','Gaston Gonzalez',9.70);


#3-Cree una vista que recupere el nombre y la nota de todos los alumnos (borrar la vista si ya existe)
 create view Alumnos_nota as
 select nombre, nota from alumnos;
 
#4-Mostrar el resultado de llamar la vista en un comando SQL 'select'.
 
select * from Alumnos_nota;

#5-Crear una vista que retorne el nombre y la nota de todos los alumnos aprobados (notas mayores iguales a 7) a partir de la vista anterior.
 
 create view Alumnos_aprobados as
 select  nombre,nota 
 from Alumnos_nota
 where nota >= 7;
 
 
#6-Muestre la información que genera la vista.
select * from Alumnos_aprobados;

#Problema 3:
#1. Borramos las tablas si existen y luego las creamos:
 drop table if exists alumnos2;
 drop table if exists profesores2;
 CREATE TABLE alumnos2 (
  documento CHAR(8),
  nombre VARCHAR(30),
  nota DECIMAL(4,2),
  codigoprofesor INT,
  PRIMARY KEY(documento)
);

CREATE TABLE profesores2 (
  codigo INT AUTO_INCREMENT,
  nombre VARCHAR(30),
  PRIMARY KEY(codigo)
);


#2.nsertamos algunas filas en las dos tablas:
 insert into alumnos2 values('30111111','Ana Algarbe', 5.1, 1);
 insert into alumnos2 values('30222222','Bernardo Bustamante', 3.2, 1);
 insert into alumnos2 values('30333333','Carolina Conte',4.5, 1);
 insert into alumnos2 values('30444444','Diana Dominguez',9.7, 1);
 insert into alumnos2 values('30555555','Fabian Fuentes',8.5, 2);
 insert into alumnos2 values('30666666','Gaston Gonzalez',9.70, 2);


INSERT INTO profesores2 (nombre) VALUES ('Maria Luque');
INSERT INTO profesores2 (nombre) VALUES ('Jorje Dante');

#3.Borramos la vista si ya existe y luego la creamos para ver ver los añumos con sus notas y maestro:
 drop view Alumnos_nota2;
CREATE VIEW Alumnos_nota2 AS
SELECT al.documento, al.nombre, al.nota, al.codigoprofesor, pr.nombre AS nombre_profesor
FROM alumnos2 al
JOIN profesores2 pr ON al.codigoprofesor = pr.codigo;

select * from Alumnos_nota2;
 #4.-- Creamos una vista con los datos de todos los alumnos que tienen una nota mayor o igual a 7, junto con el nombre del profesor que lo calificó
 drop view vista_nota_alumnos_aprobados2;
 
CREATE VIEW vista_nota_alumnos_aprobados2 AS
SELECT documento, nombre, nota, codigoprofesor
FROM Alumnos_nota2
WHERE nota >= 7;

   
          
#5. Mostramos el resultado de la vista:
select * from vista_nota_alumnos_aprobados2;

#6.Mediante la vista insertamos un nuevo alumno calificado por el profesor con código 1:

  insert into vista_nota_alumnos_aprobados2(documento, nombre, nota, codigoprofesor)
  values('99999999','Rodriguez Pablo', 10, 1);
#7.Mostramos la vista:
select * from vista_nota_alumnos_aprobados2;
   
#8. Consultamos la tabla base: alumnos, tenemos una nueva fila con el alumno insertado:
select * from alumnos2;

#9.Modificamos la nota de un alumno aprobado mediante la vista:
   update vista_nota_alumnos_aprobados2 
   set nota = 8.20
   where documento = '30444444';















