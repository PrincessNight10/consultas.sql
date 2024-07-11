drop table if exists libros;
create table libros (
codigo int auto_increment,
titulo VARCHAR(40),
autor VARCHAR(30),
editorial VARCHAR(20),
precio decimal(5,2),
stock int,
primary key (codigo)
);
SELECT * from libros; 

insert into libros(codigo,titulo,autor,editorial, precio,stock )
values (1, 'Rio2 junior novel', 'blueskye studios','Fox', 222.12, 11);

insert into libros(codigo,titulo,autor,editorial, precio,stock )
values (2, 'Rio junior novel', 'blueskye studios','Fox', 210.12, 12);

insert into libros(codigo,titulo,autor,editorial ,precio,stock )
values (3, 'Dragon ball', 'Akira Toriyama','Shueshia', 122.12, 13);

insert into libros(codigo,titulo,autor,editorial, precio,stock )
values (4, 'One piece', 'Echiro Oda','Shueshia', 225.12, 14);

insert into libros(codigo,titulo,autor,editorial, precio,stock )
values (5, 'go dog go', 'P.D. Eastman', 'RHBYR', 120.12, 15);

DROP PROCEDURE IF EXISTS sp_limiter_stock;

delimiter $
CREATE PROCEDURE sp_limite_stock()
BEGIN 
SELECT * FROM libros
WHERE  stock >= 10;
END $
delimiter ;

CALL sp_limite_stock();
 
CALL Autor();

delimiter $
CREATE PROCEDURE  pa_libros_autor(in  p_autor VARCHAR(30))
BEGIN
 SELECT titulo, editorial, precio FROM libros
 where autor = p_autor;
END $
delimiter ;
call pa_libros_autor('P.D. Eastman');

DROP PROCEDURE IF EXISTS pa_libros_autor_editorial; 
DELIMITER //
CREATE PROCEDURE pa_libros_autor_editorial(
    IN p_autor VARCHAR(30),
    IN p_editorial VARCHAR(20)
)
BEGIN
    SELECT titulo, precio FROM libros
    WHERE autor = p_autor AND editorial = p_editorial;
END //
DELIMITER ;

CALL pa_libros_autor_editorial('Akira Toriyama', 'Shueshia');
CALL pa_libros_autor_editorial('P.D. Eastman', 'RHBYR');

#provcedimiento entrada y salida
drop procedure  pa_autor_sumaypromedio;

 delimiter //
CREATE PROCEDURE pa_autor_sumaypromedio(
   IN p_autor VARCHAR(30),
   OUT suma DECIMAL(5,2),
   OUT promedio DECIMAL(5,2)
)
BEGIN
   SELECT titulo, editorial, precio
   FROM libros
   WHERE autor = p_autor;

   SELECT SUM(precio) INTO suma
   FROM libros
   WHERE autor = p_autor;

   SELECT AVG(precio) INTO promedio
   FROM libros
   WHERE autor = p_autor;
END//
delimiter ;

CALL pa_autor_sumaypromedio('Akira Toriyama', @suma, @promedio);
SELECT @suma, @promedio;


CREATE TABLE Productos (
IdProducto INT PRIMARY KEY AUTO_INCREMENT,
CodigoBarra VARCHAR(50) UNIQUE,
Nombre VARCHAR(50),
Marca VARCHAR(50),
Categoria VARCHAR(100),
Precio DECIMAL(10, 2)
);

 INSERT INTO Productos(CodigoBarra,Nombre,Marca,Categoria,Precio) VALUES('4512278', 'Luck','Netflix', 'Peliculas', 41.45 );
 INSERT INTO Productos(CodigoBarra,Nombre,Marca,Categoria,Precio) VALUES('120457', 'Papel-Higienico','Scott', 'Aseo', 11.45 );
 INSERT INTO Productos(CodigoBarra,Nombre,Marca,Categoria,Precio) VALUES('1227833', 'Lapicero','Kilometrico', 'Escolar', 2.45 );
 INSERT INTO Productos(CodigoBarra,Nombre,Marca,Categoria,Precio) VALUES('0001233', 'Leo','Netflix', 'Peliculas', 01.45 );
 INSERT INTO Productos(CodigoBarra,Nombre,Marca,Categoria,Precio) VALUES('1000782', 'Lasaña','Rapipiza', 'Comidas', 21.45 );
 INSERT INTO Productos(CodigoBarra,Nombre,Marca,Categoria,Precio) VALUES('3512273', 'Gokumui','Bandai', 'Juguetes', 09.45 );
 INSERT INTO Productos(CodigoBarra,Nombre,Marca,Categoria,Precio) VALUES('1512218', 'Telefono','Samsung', 'Tecnologia', 101.45 );
 INSERT INTO Productos(CodigoBarra,Nombre,Marca,Categoria,Precio) VALUES('2512448', 'Tv','Challenger', 'Tecnologia', 200.45 );
 
 
 #listado productos
 delimiter //
CREATE PROCEDURE sp_lista_produtos()
BEGIN
SELECT 
IdProducto,CodigoBarra,Nombre,Marca,Categoria,Precio
FROM Productos;
END //
 delimiter ;

CALL sp_lista_produtos();

#guardar
drop procedure  sp_guardar_productos;
delimiter //
CREATE PROCEDURE sp_guardar_productos(
IN CodigoBarra VARCHAR(50),
IN Nombre VARCHAR(50),
IN Marca VARCHAR(50),
IN Categoria VARCHAR(100),
IN Precio DECIMAL(10,2)
)

BEGIN 
INSERT INTO
Productos(CodigoBarra,Nombre,Marca,Categoria,Precio)
VALUES(CodigoBarra,Nombre,Marca,Categoria,Precio);
END //
delimiter ;


CALL sp_guardar_productos('110255', 'Computador','Lenovo', 'Tecnologia', 12.89);
#Actualizar

delimiter //
CREATE PROCEDURE sp_Editar_productos(
IN Cod VARCHAR(50),
IN Nom VARCHAR(50),
IN Mar VARCHAR(50),
IN Cat VARCHAR(100),
IN Pre DECIMAL(10,2)
)

BEGIN 
UPDATE Productos SET
CodigoBarra = Cod,
Nombre = Nom,
Marca = Mar,
Categoria = Cat,
Precio = Pre
WHERE IdProducto = Id;
END //
delimiter ;

CALL sp_Editar_productos('12','110255', 'COMPUTADOR','Asus', 'Tecnologia', '62.89');


#Eliminar
drop procedure  sp_Eliminar_productos;
delimiter //
CREATE PROCEDURE sp_Eliminar_productos(
IN Producto INT 
)

BEGIN 
DELETE FROM Productos 
where IdProducto = Id; 
END //
delimiter ;
call sp_eliminar_productos(1);



CREATE TABLE Empleados (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Edad INT,
    Departamento VARCHAR(50)
);

CREATE TABLE Productos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Precio DECIMAL(10, 2),
    Stock INT
);
INSERT INTO Empleados (ID, Nombre, Apellido, Edad, Departamento) VALUES
(1, 'Juan', 'Pérez', 30, 'Ventas'),
(2, 'María', 'García', 25, 'Marketing'),
(3, 'Carlos', 'López', 35, 'Finanzas'),
(4, 'Ana', 'Martínez', 28, 'Recursos Humanos'),
(5, 'Luis', 'Rodríguez', 32, 'IT');

#inner join
CREATE VIEW empleadosVista_InnerJoin AS
SELECT e.ID AS EmpleadoID, e.Nombre AS EmpleadoNombre, p.ID AS ProductoID, p.Nombre AS ProductoNombre
FROM Empleados e
INNER JOIN Productos p ON e.ID = p.ID;

select * from empleadosVista_InnerJoin;

#left join
CREATE VIEW EmpleadosVista_LeftJoin AS
SELECT e.ID AS EmpleadoID, e.Nombre AS EmpleadoNombre, p.ID AS ProductoID, p.Nombre AS ProductoNombre
FROM Empleados e
LEFT JOIN Productos p ON e.ID = p.ID;

select * from  EmpleadosVista_LeftJoin;

#right join
CREATE VIEW empleadosVista_RightJoin AS
SELECT e.ID AS EmpleadoID, e.Nombre AS EmpleadoNombre, p.ID AS ProductoID, p.Nombre AS ProductoNombre
FROM Empleados e
RIGHT JOIN Productos p ON e.ID = p.ID;

select * from empleadosVista_RightJoin;
