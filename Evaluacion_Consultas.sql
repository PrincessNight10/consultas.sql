create database Evaluacion_Consultas;
use Evaluacion_Consultas;


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
    salario int,
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
(1130777, 'Marcos Cortez', 'M', '1986-06-23', '2000-04-16', 2550000,11 ,333333333 , '4000');
INSERT INTO Empleado (id, nombre, sexo, fecha_nacimiento, fecha_incorporacion, salario, id_cargo, id_jefe, id_deposito) VALUES
(1130782, 'Antonio Gil', 'M', '1980-01-23', '200-04-16', 850000, 11, 16211383,'1500');
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

select * from Empleado;
#1.listar los empleados del sexo femenino con sueldo menor o igual a 3500000;
select * from Empleado where sexo like 'F' AND salario <=3500000;
#2. obtener un listado similiar al anterior;
select * from Empleado where sexo like 'F' AND id_cargo  like 6;

#3. listar los empleadls cuyo salario  sea menor o igual a 1500000 de sexo masculino;
select * from Empleado where sexo like 'M' AND salario <=1500000;

#4. divida los empleados generando un  grupo cuyo nombre con la letra j y terine en la letra z;
select nombre as nombre_empieza_por_j from Empleado where  nombre like '%J%' ;

#5. obtener los datos de los empleados con cargo  tecnico.
SELECT * from Empleado E join Cargo C on C.id_cargo  = E.id_cargo  where  nom_cargo = 'TECNICO';

#6. obtebner el no9mbre y ccargo de todois los empleados ordenado por cargo y por salario
SELECT * from Empleado E join Cargo C on C.id_cargo  = E.id_cargo   group by id, nom_cargo order by salario asc ;

#7 Hayar el salario mas alto  y mas bajo y encontrar la diferenvua entre ellos
select max(salario ) as salario_maximo, min(salario) as salario_minimo, max(salario)- min(salario) as diferencia_salario from Empleado;  
#8.hayar los empleados cuyo nombre no contiene la cadena Ma
select nombre from Empleado where nombre not like '%Ma%';

#9. obtener la lista de los empleados qu ganan sueldo superior a un millon
select * from Empleado where salario >=1000000;
