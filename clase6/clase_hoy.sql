DROP DATABASE 
	IF EXISTS inmobiliaria_db;

CREATE DATABASE 
	IF NOT EXISTS inmobiliaria_db;
    
USE inmobiliaria_db;

-- comentario de codigo

CREATE TABLE inquilino(
	id_inquilino INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60),
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_asociado DATE DEFAULT (CURRENT_DATE) COMMENT "SE PUEDE GENERAR NULLS O CREAR DE MANERA MANUAL O DEFAULT FECHA ACTUAL"
) COMMENT "TABLA DEFINIDAD PARA EL USO DE LA INMOBILIARIA";



SHOW FULL COLUMNS FROM inmobiliaria_db.inquilino;

SELECT
	TABLE_NAME
, 	TABLE_SCHEMA
,	TABLE_COMMENT
FROM INFORMATION_SCHEMA.TABLES
	WHERE table_schema = "inmobiliaria_db";


ALTER TABLE inmobiliaria_db.inquilino
	ADD COLUMN tiene_garante BOOLEAN NOT NULL DEFAULT TRUE
    AFTER  nombre;

ALTER TABLE inmobiliaria_db.inquilino
	DROP COLUMN tiene_garante;
    
-- altera la table creada
ALTER TABLE inmobiliaria_db.inquilino
	-- agrega columna
	ADD COLUMN tiene_garante 
    -- tipo de dato
    BOOLEAN 
    -- no null
    NOT NULL 
    -- valores por defecto
    DEFAULT TRUE 
    -- comentario de columna
    COMMENT "SIEMPRE DEBERIA TENER GARANTE"
    -- posicion en la tabla
    AFTER  nombre;


DROP TABLE inmobiliaria_db.inquilino;

SHOW TABLES ;

-- TENIENDO ESTO EN CUENTA TRATEN DE AGREGAR LOS ATRIBUTOS DE 
-- LAS SIGUIENTES TABLAS

CREATE TABLE dueno();

CREATE TABLE contrato();

CREATE TABLE propiedad();



-- CLONADO DE TABLAS
CREATE TABLE inmobiliaria_db.COPY_CLASS  
LIKE coderhous
e_gamers.CLASS ;

USE inmobiliaria_db ;

SHOW TABLES ;

SELECT * 
FROM inmobiliaria_db.COPY_CLASS;


CREATE TEMPORARY TABLE inmobiliaria_db.STAGING_CLASS_TEMPORARY
	AS(
		SELECT
			description
		FROM coderhouse_gamers.CLASS
    );

SELECT *
FROM inmobiliaria_db.STAGING_CLASS_TEMPORARY;

SHOW TABLES ;