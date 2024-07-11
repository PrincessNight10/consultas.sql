
drop table if exists empleados;

 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos int,
  seccion varchar(20),
  primary key(documento)
 );

insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

 drop procedure if exists pa_empleados_sueldo;

 delimiter //
 create procedure pa_empleados_sueldo()
 begin
   select nombre,apellido,sueldo
     from empleados;
 end //
 delimiter ;
 
  call pa_empleados_sueldo();

 drop procedure if exists pa_empleados_hijos;
 
 delimiter //
 create procedure pa_empleados_hijos()
 begin
   select nombre,apellido,cantidadhijos
     from empleados
   where cantidadhijos>0;
 end //
 delimiter ;

call pa_empleados_hijos();

 update empleados set cantidadhijos=1 where documento='22333333';
 call pa_empleados_hijos();
 
 
 create table Selecciones (
 id_futbolista char,
 nombre varchar(55),
 posicion varchar(55), 
 pais varchar(55) 
 );
 
 create table copa (
 id int,
 cantidad_titulos varchar(12)
 );
 drop table Selecciones;
 
 
 insert into Selecciones values('1','Messi','delantero','Argentina');
  insert into Selecciones values('2','Angel','CentroCampista','Argentina');
  insert into Selecciones values('3','Falcao','Volante','Colombia');
INSERT INTO copa values (11, '21');
INSERT INTO copa values (12, '1');

CREATE VIEW vistajugadorseleccionmessi
AS SELECT nombre FROM Selecciones where nombre = 'Messi';
 
 SELECT * FROM  vistajugadorseleccionmessi;
CREATE VIEW vistacantidadtitulos AS
SELECT Selecciones.pais, COALESCE(copa.cantidad_titulos, '0') AS cantidad_titulos
FROM Selecciones
LEFT JOIN copa ON Selecciones.id_futbolista = copa.id
WHERE Selecciones.pais = 'Argentina';

 drop view vistacantidadtitulos;
  drop view vistaselecciontitulos2;
  
  
  