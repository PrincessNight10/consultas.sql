CREATE DATABASE biblioteca;
USE biblioteca;

DROP TABLE editorial;
CREATE TABLE editorial (
    ClaveEditorial INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(50),
    Direccion VARCHAR(50),
    Telefono VARCHAR(50)
) ENGINE=InnoDB;

ALTER TABLE Tema DROP FOREIGN KEY Tema_ibfk_1;


DROP TABLE IF EXISTS libro;
CREATE TABLE libro (
    ClaveLibro SMALLINT PRIMARY KEY NOT NULL,
    Titulo VARCHAR(60),
    Idioma VARCHAR(15),
    Formato VARCHAR(15),
    ClaveTema SMALLINT,
    Nombre_Tema VARCHAR(40),
    ClaveAutor INT,
    Nombre_Autor VARCHAR(40),
    ClaveEditorial INT,
    Nombre_Editorial VARCHAR(60),
    Direccion_Editorial VARCHAR(60),
    Telefono_Editorial VARCHAR(15),
    Clave_Ejemplar INT,
    Numero_Orden SMALLINT,
    Edicion SMALLINT,
    Ubicacion VARCHAR(52),
    Categoria_Libro CHAR,
    ClaveSocio INT,
    Nombre_Socio VARCHAR(60),
    Direccion_Socio VARCHAR(60),
    Telefono_Socio VARCHAR(15),
    Categoria_Socio CHAR,
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    Notas BLOB,
    FOREIGN KEY (ClaveEditorial) REFERENCES editorial(ClaveEditorial) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ClaveAutor) REFERENCES Autor(ClaveAutor)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    UNIQUE KEY (ClaveTema)
);

drop table if exists Autor;
CREATE TABLE Autor (
    ClaveAutor INT PRIMARY KEY NOT NULL,
    Nombre_Autor VARCHAR(40),
    FOREIGN KEY (ClaveAutor) REFERENCES libro(ClaveAutor) 
    ON DELETE RESTRICT ON UPDATE CASCADE
);



CREATE TABLE Tema (
    ClaveTema SMALLINT NOT NULL,
    Nombre_Tema VARCHAR(40),
    FOREIGN KEY (ClaveTema) REFERENCES libro(ClaveTema) 
    ON DELETE RESTRICT ON UPDATE CASCADE
);

drop table if exists Ejemplar;
CREATE TABLE Ejemplar (
    Clave_Ejemplar INT PRIMARY KEY NOT NULL,
    Numero_Orden SMALLINT,
    Edicion SMALLINT,
    Ubicacion VARCHAR(52),
    Categoria_Libro CHAR, 
    ClaveLibro SMALLINT,  -- 
    FOREIGN KEY (ClaveLibro) REFERENCES libro(ClaveLibro) 
    ON DELETE RESTRICT ON UPDATE CASCADE
);
drop table if exists Socio;
CREATE TABLE Socio (
    ClaveSocio INT PRIMARY KEY NOT NULL,
    Nombre_Socio VARCHAR(60),
    Direccion_Socio VARCHAR(60),
    Telefono_Socio VARCHAR(15),
    Categoria_Socio CHAR,
    ClaveLibro SMALLINT, 
    FOREIGN KEY (ClaveLibro) REFERENCES libro(ClaveLibro) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);
drop table if exists Préstamo;

CREATE TABLE Prestamo (
    ClavePrestamo INT PRIMARY KEY NOT NULL,
    ClaveSocio INT, --
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    FOREIGN KEY (ClaveSocio) REFERENCES Socio(ClaveSocio) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

drop table if exists  Escrito_por;

CREATE TABLE Trata_sobre (
    ClaveLibro SMALLINT,
    ClaveTema SMALLINT,
    FOREIGN KEY (ClaveLibro) REFERENCES libro(ClaveLibro) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (ClaveLibro)
);




create table Escrito_por (
ClaveLibro  INT PRIMARY KEY NOT NULL,
ClaveAutor int,
 FOREIGN KEY (ClaveAutor) REFERENCES libro(ClaveAutor) 
    ON DELETE RESTRICT ON UPDATE CASCADE);