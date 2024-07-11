# Santiago Rojas Rodríguez
#ADSO 2722493
CREATE DATABASE Examen;
USE Examen;
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

 drop procedure sp_guardar_empleadps;
 #3.listado empleados
 delimiter //
CREATE PROCEDURE sp_lista_empleados()
BEGIN
SELECT 
*
FROM empleados;
END //
 delimiter ;

CALL sp_lista_empleados();
#4.guardar empleados
delimiter //
CREATE PROCEDURE sp_guardar_empleados(
  IN documento char(8),
  IN nombre varchar(20),
 IN apellido varchar(20),
  IN sueldo decimal(6,2),
 IN cantidadhijos int,
 IN seccion varchar(20)
)

BEGIN 
INSERT INTO
empleados(documento,nombre,apellido,Sueldo,cantidadhijos,seccion)
VALUES(documento,nombre,apellido,Sueldo,cantidadhijos,seccion);
END //
delimiter ;


CALL sp_guardar_empleados('41502889', 'Soledad', 'Rodríguez Perez', 4401.10, 4,'Recursos Humanos');

#actualizar sueldo empleado
drop procedure sp_empleados_actualizar_Sueldo;
DELIMITER $$
CREATE PROCEDURE sp_empleados_actualizar_Sueldo( IN Nuevo_Sueldo decimal(6,2))
BEGIN
UPDATE empleados SET sueldo = Nuevo_Sueldo;
select * from empleados
where seccion = 'Software';
END $$
DELIMITER ;
#llamado
CALL sp_empleados_actualizar_Sueldo( 8918.90);

SET SQL_SAFE_UPDATES = 0;

#eliminar
delimiter //
CREATE PROCEDURE sp_E_empleados(
IN documento CHAR
)
BEGIN 
DELETE FROM empleados
where documento = iddocumento; 
END //
delimiter ;
call sp_E_empleados(10245123);
