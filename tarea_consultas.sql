create database Empresa;
use Empresa;

drop table Departamento;
CREATE TABLE Departamento (
    id_deposito int PRIMARY KEY NOT NULL,
    nom_deposito varchar(100),
    ciudad varchar(100),
    director_deposito varchar(100)
);


select * from Departamento;
INSERT INTO Departamento (id_deposito, nom_deposito, ciudad, director_deposito) VALUES
(1000, 'GERENCIA', 'CALI', '31.840.269'),
(1500, 'PRODUCCIÓN', 'CALI', '16.211.383'),
(2000, 'VENTAS', 'CALI', '31.178.144'),
(3000, 'INVESTIGACIÓN', 'CALI', '16.759.000'),
(3500, 'MERCADEO', 'CALI', '22.222.222'),
(2100, 'VENTAS', 'POPAYÁN', '31.751.219'),
(2200, 'VENTAS', 'BUGA', '768.782'),
(2300, 'VENTAS', 'CARTAGO', '737.689'),
(4000, 'MANTENIMIENTO', 'CALI', '333.333.333'),
(4100, 'MANTENIMIENTO', 'POPAYÁN', '888.888'),
(4200, 'MANTENIMIENTO', 'BUGA', '11.111.111'),
(4300, 'MANTENIMIENTO', 'CARTAGO', '444.444');


create table Cargo (
    id_cargo int primary key not null,
    nom_cargo Varchar(100)
);
drop table Cargo;
insert into Cargo(id_cargo, nom_cargo) values (1, 'Gerente');
insert into Cargo(id_cargo, nom_cargo) values (2, 'Director');
insert into Cargo(id_cargo, nom_cargo) values (3, 'Jefe Ventas');
insert into Cargo(id_cargo, nom_cargo) values (4, 'Ivenstigador');
insert into Cargo(id_cargo, nom_cargo) values (5, 'Jefe Mercadeo');
insert into Cargo(id_cargo, nom_cargo) values (6, 'Vendedor');
insert into Cargo(id_cargo, nom_cargo) values (7, 'Jefe Mecanicos');
insert into Cargo(id_cargo, nom_cargo) values (8, 'Mecanico');
insert into Cargo(id_cargo, nom_cargo) values (9, 'Asesor');
insert into Cargo(id_cargo, nom_cargo) values (10, 'Secretaria');
insert into Cargo(id_cargo, nom_cargo) values (11, 'Tecnico');



drop table Empleado;
CREATE TABLE Empleado (
    id int PRIMARY KEY NOT NULL,
    nombre varchar(100),
    sexo varchar(10),
    fecha_nacimiento date,
    fecha_incorporacion date,
    salario bigint,
    id_cargo int,
    id_jefe bigint,
    id_deposito int,
    FOREIGN KEY (id_cargo) REFERENCES Cargo(id_cargo),
    FOREIGN KEY (id_deposito) REFERENCES Departamento(id_deposito)
);
SELECT id_deposito FROM Departamento;
select * from Empleado;

INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(31840269, 'María Rojas', 'F', '1959-01-15', '1990-06-15', 6250000, 1, NULL, 1000);
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(16211383, 'Luis Pérez', 'M', '1962-02-25', '2000-01-01', 5050000, 2,31840269,  1500);
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(31178144, 'Rosa Angulo', 'F', '1957-03-15', '1990-08-16', 3250000, 3,31840269, '2000');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(16759960, 'Dario Casas', 'M', '1960-04-05', '1992-11-01', 4500000, 4,31840269, '3000');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(22222222, 'Carla López', 'F', '1975-05-11', '2005-07-16', 4500000, 5,31840269, '3500');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(175129, 'Melissa Roa', 'F', '1960-06-19', '2001-03-16', 2250000,6,31178144, '2100');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(763782, 'Joaquín Rosas', 'M', '1947-07-07', '1990-05-16', 2250000,6,31178144, '2200');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(787689, 'Mario Liano', 'M', '1945-08-30', '1990-05-16', 2250000, 6,31178144, '2300');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(333333333, 'Elisa Rojas', 'F', '1979-09-28', '2004-06-01', 2250000,7,31840269, '4000');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(888888, 'Iván Duarte', 'M', '1955-08-12', '1998-06-15', 1050000,8,33333333, '4100');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(11111111, 'Irene Díaz', 'F', '1979-09-28', '2004-06-01',1050000,8,333333333, '4200');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(444444, 'Abel Giménez', 'M', '1939-12-24', '2000-10-11',  1050000,9,333333333 ,  '4300');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(1130222, 'José Giraldo', 'M', '1985-01-20', '2000-11-01',  1200000,4,22222222, '3500');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(19709802, 'William Daza', 'M', '1982-09-10', '1999-12-16',  2250000,10,16759060, '3000');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(1178144, 'Diana Solarte', 'F', '1957-11-19', '1990-06-15', 1250000,11,31840269 , '1000');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(1130777, 'Marcos Cortez', 'M', '1986-06-23', '2000-04-16', 2550000,12 ,333333333 , '4000');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(1130782, 'Antonio Gil', 'M', '1980-01-23', '200-04-16', 850000, 12, 16211383,'1500');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(333333334, 'Marisol Pulido', 'F','1979-01-10','1990-05-16', 3250000,4,16759060, '3000');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(333333335, 'Ana Moreno', 'F', '1992-01-05', '2004-06-01', 1200000, 10,16759060, '3000');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(1130333, 'Paulo Blanco', 'M', '1987-10-28', '2000-10-01', 800000,6 , 31178144, '2000');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(1130444, 'Jesús Alisos', 'M', '1988-03-14', '2000-10-01', 800000,6 , 31178144, '2000');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(333333336, 'Carolina Rios', 'F','1992-02-15','2000-10-01',1250000,10,16211383, '1500');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(333333337, 'Edith Muñoz', 'F', '1992-03-31','2000-10-01',800000, 6,31178144 , '2100');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(1130555, 'Julianm Mora', 'M', '1989-07-03','2000-10-01' ,8000000,6,31178144 ,'2200');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(1130666, 'Manuel Millán', 'M', '1990-08-12','2004-06-04',8000000, 6,31178144 ,'2300');


#Hacer las relaciones y registrar datos en cada tabla
#1. Obtener los datos completos de los empleados.
select * from Empleado;
#2. Obtener los datos completos de los departamentos. 
select * from Departamento;
#3.Obtener los datos de los empleados con cargo 'Secretaria'.
select* from Empleado E join Cargo C on E.id_cargo = C. id_cargo where E.id_cargo = 10;

#4. Obtener el nombre y salario de los empleados.
select nombre, salario from Empleado;

#5. Obtener los datos de los empleados vendedores, ordenado por nombre.
select* from Empleado E join Cargo C on E.id_cargo = C. id_cargo where E.id_cargo = 6 order by nombre;

#6. Listar el nombre de los departamentos
select nom_deposito from Departamento;

#7. Listar el nombre de los departamentos, ordenado por nombre
select nom_deposito from Departamento order by nom_deposito;

#8. Listar el nombre de los departamentos, ordenado por ciudad
select nom_deposito, ciudad from Departamento order by ciudad;
#9. Listar el nombre de los departamentos, ordenado por ciudad, en orden inverso
select nom_deposito, ciudad from Departamento order by ciudad desc;

#10. Obtener el nombre y cargo de todos los empleados, ordenado por salario
select* from Empleado E join Cargo C on E.id_cargo = C.id_cargo order by salario;

#11. Obtener el nombre y cargo de todos los empleados, ordenado por cargo y por salario
select* from Empleado E join Cargo C on E.id_cargo = C.id_cargo order by nom_cargo asc, E.salario asc;



#12. Obtener el nombre y cargo de todos los empleados, en orden inverso por cargo
select* from Empleado E join Cargo C on E.id_cargo = C.id_cargo order by nom_cargo;

#13. Listar los salarios de los empleados del departamento 2000
select *, salario from Empleado where id_deposito = 2000;
#14. Listar los salarios de los empleados del departamento 2000, ordenado por salario de menor a mayor
select *, salario from Empleado where id_deposito = 2000 order by salario asc;

#15. Listar los cargos
select * from Cargo;
#16. Listar los cargos que sean diferentes, ordenada por valor
select * from Cargo order by nom_cargo desc;

#17. Listar los diferentes salarios
select salario  from Empleado;

#18. Obtener el valor total a pagar que resulta de sumar a los empleados del departamento 3000 una bonificación de $500.000, en orden alfabético del empleado
select nombre, salario + 500000 as bonificacion_de_salario from Empleado where id_deposito =3000 order by nombre desc;

#19. Obtener la lista de los empleados que ganan sueldo superior a 1.000.000
select nombre, salario from Empleado where salario > 1000000;

#20. Listar los empleados de sexo femenino con sueldo menor o igual 3.500.000.
select nombre, salario, sexo from  Empleado where salario <=3500000 and sexo in(select sexo from Empleado where sexo like 'f%');

#21. Elabore un listado donde para cada fila, figure ‘Nombre’ y ‘Cargo’ antes del valor respectivo para cada empleado
select nombre, C.nom_cargo,E.salario from Empleado E join Cargo C on E.id_cargo = C.id_cargo;


#22. Hallar el salario de aquellos empleados cuyo número de documento de identidad es superior al '19.709.802'
select  id, nombre, salario from Empleado where id >19709802;

#23. Listar los empleados cuyo salario es menor o igual a 1.500.000 de sexo masculino
select nombre, salario, sexo from  Empleado where salario <=1500000 and sexo in(select sexo from Empleado where sexo like 'm%');
select * from Empleado;
#24. Divida los empleados, generando un grupo cuyo nombre inicie por la letra J y termine en la letra Z. Liste estos empleados y su cargo por orden alfabético.
select E.nombre, C.nom_cargo from Empleado E join Cargo C  on E.id_cargo = C.id_cargo = C.id_cargo where E.nombre like 'J%Z' order by E.nombre;
#25. Listar el salario, documento de identidad del empleado y nombre, de aquellos empleados que tienen sueldo superior a $1.100.000, ordenar el informe por el número del documento de identidad
select id, nombre, salario from Empleado where salario > 1000000 order by id ;
#26. Obtener un listado similar al anterior, pero de aquellos empleados que ganan hasta 3.300.000
select id, nombre, salario from Empleado where salario  order by id limit 3000000;

#27. Hallar el nombre de los empleados que tienen un salario superior a $1.000.000, y tienen como jefe al empleado con documento de identidad '31.840.269'
#28. Hallar el conjunto complementario del resultado del ejercicio anterior.
#29. Hallar los empleados cuyo nombre no contiene la cadena “MA” 
#30. Obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” NI ‘MANTENIMIENTO’, ordenados por ciudad.
#31. Obtener el nombre y el departamento de los empleados con cargo 'Secretaria' o 'Vendedor', que no trabajan en el departamento de “PRODUCCION”, cuyo salario es superior a $1.000.000, ordenados por fecha de incorporación.
#32. Obtener información de los empleados cuyo nombre tiene exactamente 11 caracteres
#33. Obtener información de los empleados cuyo nombre tiene al menos 11 caracteres
#34. Listar los datos de los empleados cuyo nombre inicia por la letra 'M', su salario es mayor a $800.000 y trabajan para el departamento de 'VENTAS'
#35. Obtener los nombres, salarios de los empleados que reciben un salario promedio
#36. Suponga que la empresa va a aplicar un reajuste salarial del 7%. Listar los nombres de los empleados, su salario actual y su nuevo salario37. Obtener la información disponible del empleado cuyo número de documento de identidad sea: '31.178.144', '16.759.060', '1.751.219', '768.782', '737.689', '19.709.802', '31.174.099', '1.130.782'
#38. Entregar un listado de todos los empleados ordenado por su departamento, y alfabético dentro del departamento.
#39. Entregar el salario más alto de la empresa.
#40. Entregar el total a pagar por salario y el número de empleados que las reciben.
#41. Entregar el nombre del último empleado de la lista por orden alfabético.
#42. Hallar el salario más alto, el más bajo y la diferencia entre ellos.
#43. Conocido el resultado anterior, entregar el nombre de los empleados que reciben el salario más alto y más bajo. ¿Cuanto suman estos salarios?
#44. Entregar el número de empleados de sexo femenino y de sexo masculino, por departamento.
#45. Hallar el salario promedio por departamento.
#46. Hallar el salario promedio por departamento, considerando aquellos empleados cuyo salario supera $900.000, y aquellos con salarios inferiores a $575.000. Entregar el código y el nombre del departamento.
#47. Entregar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento.
#48. Hallar los departamentos que tienen más de tres (3) empleados. Entregar el número de empleados de esosdepartamentos.
#49. Obtener la lista de empleados jefes, que tienen al menos un empleado a su cargo. Ordene el informe inversamente por el nombre.
#50. Hallar los departamentos que no tienen empleados
#51. Entregar un reporte con el número de cargos en cada departamento y cuál es el promedio de salario de cada uno. Indique el nombre del departamento en el resultado.
#52. Entregar el nombre del departamento cuya suma de salarios sea la más alta, indicando el valor de la suma.
#53. Entregar un reporte con el código y nombre de cada jefe, junto al número de empleados que dirige. Puede haber empleados que no tengan supervisores, para esto se indicará solamente el número de ellos dejando los valores