-- MySQL Workbench

-- CREAR SCHEMA SI NO EXISTE CON NOMBRE DEL PROYECTO 'Gestion de Biblioteca'.
CREATE SCHEMA IF NOT EXISTS `Gestion_Biblioteca` DEFAULT CHARACTER SET utf8mb3 ;
USE `Gestion_Biblioteca` ;

-- -----------------------------------------------------------------------------

-- Tabla de libros
CREATE TABLE Libros (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(255) NOT NULL,
    Autor VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    Editorial VARCHAR(255) NOT NULL,
    Anio_Publicacion INT NOT NULL,
    Disponibilidad BOOLEAN NOT NULL
);

-- -----------------------------------------------------------------------------

-- Tabla de usuarios
CREATE TABLE Usuarios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Direccion VARCHAR(255) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

-- -----------------------------------------------------------------------------

-- Tabla de préstamos
CREATE TABLE Prestamos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Libro INT,
    ID_Usuario INT,
    Fecha_Prestamo DATE NOT NULL,
    Fecha_Devolucion DATE,
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID)
);

-- -----------------------------------------------------------------------------

-- Tabla de categorías
CREATE TABLE Categorias (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL
);

-- -----------------------------------------------------------------------------

-- Tabla de relación
CREATE TABLE Libros_Categorias (
    ID_Libro INT,
    ID_Categoria INT,
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID),
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID),
    PRIMARY KEY (ID_Libro, ID_Categoria)
);

-- -----------------------------------------------------------------------------

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Verificar funcionalidad de tablas.
-- Test

SELECT * FROM libros;
SELECT * FROM usuarios;
SELECT * FROM Prestamos;
SELECT * FROM Categorias;