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

#3- Elimine el procedimiento llamado "sp_empleados_sueldo" si existe:
#4- Cree un procedimiento almacenado llamado "sp_empleados_sueldo" que seleccione los nombres, 
#apellidos y sueldos de los empleados que tengan un sueldo superior o igual al enviado como 
#parámetro.
#5- Ejecute el procedimiento creado anteriormente con distintos valores:
#6- Intente ejecute el procedimiento almacenado "sp_empleados_sueldo" sin parámetros.
#7- Elimine el procedimiento almacenado "sa_empleados_actualizar_sueldo" si existe:
#8- Cree un procedimiento almacenado llamado "sp_empleados_actualizar_sueldo" que actualice los 
#sueldos iguales al enviado como primer parámetro con el valor enviado como segundo parámetro.
#9- Ejecute el procedimiento creado anteriormente y verifique si se ha ejecutado correctamente:
#10- Ejecute el procedimiento "sa_empleados_actualizar_sueldo" enviando un solo parámetro.
