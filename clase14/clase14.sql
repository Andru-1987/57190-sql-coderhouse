-- CLASE 14
-- ACTUALIZACION Y ELIMINACION DE DATOS


**Título de la Clase: Fundamentos de Bases de Datos y MySQL**

**Introducción:**
En el mundo de las bases de datos, MySQL es una de las opciones más populares y poderosas para gestionar grandes conjuntos de datos. Uno de los aspectos fundamentales de cualquier base de datos es mantener la integridad de los datos almacenados. En esta clase, exploraremos cómo MySQL aborda este desafío, centrándonos en la integridad referencial, las restricciones y las acciones en cascada.

**1. Integridad Referencial en MySQL:**

   - **Concepto de Integridad Referencial:** La integridad referencial es la garantía de que las relaciones entre las tablas de una base de datos se mantengan consistentes.
   
   - **Implementación en MySQL:** MySQL ofrece soporte completo para la integridad referencial mediante el uso de claves foráneas y restricciones.

**2. Tipos de Integridad:**

   - **Integridad Débil:** Se refiere a la garantía de que no habrá valores nulos en una relación entre tablas.
   
   - **Integridad Parcial y Completada:** La integridad parcial se refiere a garantizar la consistencia de datos en una parte específica de la base de datos, mientras que la completada asegura la consistencia en toda la base de datos.

**3. Restricciones en MySQL:**

   - **Restricción de Unicidad:** Garantiza que no haya valores duplicados en una columna específica.
   
   - **Restricción de Valor No Nulo:** Obliga a que una columna no pueda tener valores nulos.
   
   - **Restricción de Clave Primaria:** Define una columna o conjunto de columnas como clave primaria, asegurando unicidad e integridad referencial.
   
   - **Restricción de Integridad Referencial:** Define relaciones entre tablas para mantener la integridad de los datos.

**4. Acciones en Cascada:**

   - **CASCADE:** Cuando se realiza una acción (eliminar o actualizar) en una fila de una tabla, las acciones en cascada propagan esa acción a las filas relacionadas en otras tablas.
   
   - **SET NULL:** Establece los valores de las columnas relacionadas en NULL cuando se realiza una acción en cascada.
   
   - **NO ACTION y RESTRICT:** Impiden la eliminación o actualización de filas en una tabla si existen restricciones de integridad referencial que podrían violarse.

**Conclusión:**
MySQL proporciona una variedad de herramientas para garantizar la integridad de los datos almacenados en una base de datos. Comprender cómo se implementan las restricciones y las acciones en cascada es fundamental para diseñar bases de datos eficientes y fiables. En esta clase, hemos explorado los fundamentos de la integridad referencial, los tipos de integridad, las restricciones y las acciones en cascada en MySQL, sentando las bases para un diseño robusto de bases de datos relacionales.





---
-- Ejemplo en vivo 
DROP DATABASE IF EXISTS integridad_referencial;
CREATE DATABASE integridad_referencial;
USE integridad_referencial;


-- Creamos la tabla "pais"
CREATE TABLE pais (
    id INT PRIMARY KEY ,
    nombre VARCHAR(100)
);


-- Insertamos algunos países de ejemplo
INSERT INTO pais (id, nombre) VALUES
(1, 'Estados Unidos'),
(2, 'Canadá'),
(3, 'México');

-- Creamos la tabla "ciudad" que referencia a la tabla "pais"
CREATE TABLE ciudad (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    pais_id INT DEFAULT 100,
    FOREIGN KEY (pais_id) REFERENCES pais(id)
        ON DELETE SET NULL
        ON UPDATE SET NULL
) AUTO_INCREMENT = 100;


-- Insertamos algunas ciudades de ejemplo
INSERT INTO ciudad ( nombre, pais_id) VALUES
( 'Nueva York', 1),
( 'Toronto', 2),
( 'Ciudad de México', 3);

-- Creamos la tabla "ciudadanos" que referencia a la tabla "ciudad"
CREATE TABLE ciudadanos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad_id INT DEFAULT 100,
    FOREIGN KEY (ciudad_id) REFERENCES ciudad(id)
         ON DELETE SET DEFAULT
        -- ON UPDATE SET DEFAULT
         ON UPDATE CASCADE

);

-- Insertamos algunos ciudadanos de ejemplo
INSERT INTO ciudadanos (id, nombre, ciudad_id) VALUES
(1, 'John Smith', 100),
(2, 'Alice Johnson', 101),
(4, 'Luis Rey',102),
(6, 'Marcelle Tolvards',101),
(3, 'Juan García', 102);

-- Ahora, vamos a actualizar una ciudad en la tabla "ciudad"
DELETE FROM pais
   WHERE id = 1 ; 


UPDATE pais SET id = 9 WHERE id = 1

UPDATE pais SET id = DEFAULT WHERE id = 3;

UPDATE ciudad SET id = 4 WHERE id = 102;
UPDATE ciudad SET id = DEFAULT WHERE id = 4;


-- Mostramos los resultados
SELECT * FROM ciudadanos;