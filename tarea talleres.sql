#Nombre: Santiago Rojas Rodríguez
#Ficha:2722793 
#ADSO
#Instructora: Yenny Vasquez
#Taller 1
#Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".
#1- Eliminamos la tabla, si existe y la creamos:
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

#2- Ingrese algunos registros:
insert into empleados(documento,nombre,apellido,sueldo,cantidadhijos,seccion)  
Values('41745120','Lional','Vargas Reyes',1211.90,4,'Software');

insert into empleados(documento,nombre,apellido,sueldo,cantidadhijos,seccion)  
Values('10046812','Santiago','Londoño Vargas',4278.45,2,'SSeneltrabajo');


insert into empleados(documento,nombre,apellido,sueldo,cantidadhijos,seccion)  
Values('41551245','Payton','VPerez lee',1244.10,5,'RecursosH');

insert into empleados(documento,nombre,apellido,sueldo,cantidadhijos,seccion)  
Values('41745017','Mauricio','gil montes',4144.90,6,'Coordinacion');

insert into empleados(documento,nombre,apellido,sueldo,cantidadhijos,seccion)  
Values('10245123','Horacion','Melchor Rojas',2012.9,2,'Software');

#3- Elimine el procedimiento llamado "sp_empleados_sueldo" si existe:
DROP PROCEDURE sp_empleados_sueldo;

#4- Cree un procedimiento almacenado llamado "sp_empleados_sueldo" que seleccione los nombres,
#apellidos y sueldos de los empleados que tengan un sueldo superior o igual al enviado como 
#parámetro. 
DELIMITER //
CREATE PROCEDURE sp_empleados_sueldo(IN p_sueldo decimal(6,2))
 
BEGIN
   SELECT nombre, apellido, sueldo FROM empleados
where sueldo >=p_sueldo;
END //
DELIMITER ;


#5- Ejecute el procedimiento creado anteriormente con distintos valores:
CALL sp_empleados_sueldo(1211.90);

#6- Intente ejecute el procedimiento almacenado "sp_empleados_sueldo" sin parámetros.
DELIMITER //
CREATE PROCEDURE sp_empleados_sueldo2()
 
BEGIN
   SELECT nombre, apellido, sueldo FROM empleados;
END //
DELIMITER ;
CALL sp_empleados_sueldo2();

#7- Elimine el procedimiento almacenado "sp_empleados_actualizar_sueldo" si existe:
drop procedure sp_empleados_actualizar_sueldo;

#8- Cree un procedimiento almacenado llamado "sp_empleados_actualizar_sueldo" que actualice los 
#sueldos iguales al enviado como primer parámetro con el valor enviado como segundo parámetro.
DELIMITER $$
CREATE PROCEDURE sp_empleados_actualizar_sueldo(IN Sueldo_Actual decimal(6,2), IN Nuevo_Sueldo decimal(6,2))
BEGIN
UPDATE empleados SET sueldo = Nuevo_Sueldo WHERE sueldo = Sueldo_Actual;
select * from empleados;
END $$
DELIMITER ;

#9- Ejecute el procedimiento creado anteriormente y verifique si se ha ejecutado correctamente:
CALL sp_empleados_actualizar_sueldo(1211.90, 1318.90);
CALL sp_empleados_actualizar_sueldo(4144.90, 5446.90);

#10- Ejecute el procedimiento "sa_empleados_actualizar_sueldo" enviando un solo parámetro.
DELIMITER $$
CREATE PROCEDURE sp_empleados_actualizar_sueldo2( IN Nuevo_Sueldo decimal(6,2))
BEGIN
UPDATE empleados SET sueldo = Nuevo_Sueldo;
select * from empleados;
END $$
DELIMITER ;
#llamado
CALL sp_empleados_actualizar_sueldo2( 8918.90);

SET SQL_SAFE_UPDATES = 0;


# taller 2

#Una empresa almacena los datos de sus empleados en una tabla llamada #"empleados".
#1- Eliminamos la tabla, si existe y la creamos:
 drop table if exists empleados2;

 create table empleados2(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos int,
  seccion varchar(20),
  primary key(documento)
  );
#2- Ingrese algunos registros:
insert into empleados2(documento,nombre,apellido,sueldo,cantidadhijos,seccion)  
Values('10046856','Rayan','Kelley montes',2300.90,4,'SSeneltrabajo');

insert into empleados2(documento,nombre,apellido,sueldo,cantidadhijos,seccion)  
Values('1005555','Brandon','Ramirez Ramirez',2304.14,3,'Software');

insert into empleados2(documento,nombre,apellido,sueldo,cantidadhijos,seccion)  
Values('1074544','Teresa','Chaves Martinez',4300.90,2,'Coordinacion');

insert into empleados2(documento,nombre,apellido,sueldo,cantidadhijos,seccion)  
Values('4125888','Maria camila','Cardona Cardona',9999.99,0,'Junta directiva');

insert into empleados2(documento,nombre,apellido,sueldo,cantidadhijos,seccion)  
Values('4744856','Carlos','Rojas monteiro',9987.99,1,'Junta directiva');

SELECT * FROM empleados2;

#3- Elimine el procedimiento llamado "pa_seccion" si existe:
drop procedure pa_seccion;

#4- Cree un procedimiento almacenado llamado "pa_seccion" al cual le enviamos #el nombre de una sección y que nos retorne el promedio de sueldos de todos los empleados de esa sección y el valor mayor de sueldo (de esa sección)
DELIMITER $$
CREATE PROCEDURE pa_seccion(IN seccion VARCHAR(20))
BEGIN
DECLARE Promedio decimal(6,2);
DECLARE Sueldo_Maximo decimal(6,2);

SELECT AVG(sueldo) into promedio FROM empleados2 WHERE seccion = seccion;
SELECT MAX(sueldo) into Sueldo_Maximo FROM empleados2 WHERE seccion = seccion;

SELECT Promedio AS 'Ṕromedio de Sueldos', Sueldo_Maximo AS 'Sueldo Maximo';
END $$
DELIMITER ;
#5- Ejecute el procedimiento creado anteriormente con distintos valores.
CALL pa_seccion('Software');
CALL pa_seccion('Coordinacion');
CALL pa_seccion('Junta directiva');
CALL pa_seccion('SSeneltrabajo');