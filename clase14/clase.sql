DROP DATABASE IF EXISTS clase_integridad_ref;
CREATE DATABASE clase_integridad_ref;

USE clase_integridad_ref;

CREATE TABLE pais(
	cod_pais VARCHAR(10) NOT NULL,
    nombre_pais VARCHAR(100) ,
    idioma VARCHAR(100),
    moneda VARCHAR(100),
    PRIMARY KEY(cod_pais)
) COMMENT 'TABLA RELACIONADA A LA CREACION DE PAISES';


CREATE TABLE ciudad(
	cod_ciudad VARCHAR(10) NOT NULL,
    nombre_ciudad VARCHAR(100),
    cod_area VARCHAR(20),
    longitud DECIMAL(11,8),
    latitud DECIMAL(10,8),
    PRIMARY KEY (cod_ciudad)
);

/*
CREATE TABLE `ciudad` (
  `cod_ciudad` varchar(10) NOT NULL,
  `nombre_ciudad` varchar(100) DEFAULT NULL,
  `cod_area` varchar(20) DEFAULT NULL,
  `longitud` decimal(11,8) DEFAULT NULL,
  `latitud` decimal(10,8) DEFAULT NULL,
  PRIMARY KEY (`cod_ciudad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
*/


CREATE TABLE ciudadano(
	cod_legajo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(200),
    email VARCHAR(200),
    PRIMARY KEY (cod_legajo)
);

ALTER TABLE ciudad
	ADD COLUMN pais VARCHAR(100);

-- ALTER TABLE ciudad
-- 	DROP FOREIGN KEY fk_ciudad_pais;

ALTER TABLE ciudad
	ADD CONSTRAINT fk_ciudad_pais
    FOREIGN KEY (pais) REFERENCES pais(cod_pais)
	ON UPDATE CASCADE
    ON DELETE CASCADE
    ;
    
ALTER TABLE ciudadano
	ADD COLUMN cod_ciudad VARCHAR(10);

ALTER TABLE ciudadano
	ADD CONSTRAINT fk_ciudadano_ciudad
    FOREIGN KEY (cod_ciudad) REFERENCES ciudad(cod_ciudad)
	ON UPDATE CASCADE
    ON DELETE CASCADE
    ;
    

 -- INSERCION DE DATA


INSERT INTO pais (cod_pais, nombre_pais, idioma, moneda) VALUES
('US', 'United States', 'English', 'US Dollar'),
('ES', 'Spain', 'Spanish', 'Euro'),
('FR', 'France', 'French', 'Euro'),
('JP', 'Japan', 'Japanese', 'Yen'),
('BR', 'Brazil', 'Portuguese', 'Brazilian Real'),
('IN', 'India', 'Hindi', 'Indian Rupee'),
('CN', 'China', 'Chinese', 'Renminbi'),
('DE', 'Germany', 'German', 'Euro'),
('MX', 'Mexico', 'Spanish', 'Mexican Peso'),
('IT', 'Italy', 'Italian', 'Euro');


INSERT INTO ciudad (cod_ciudad, nombre_ciudad, cod_area, longitud, latitud, pais) VALUES
('NYC', 'New York City', '212', -74.0060, 40.7128, 'US'),
('MAD', 'Madrid', '91', -3.7038, 40.4168, 'ES'),
('PAR', 'Paris', '1', 2.3522, 48.8566, 'FR'),
('TOK', 'Tokyo', '3', 139.6917, 35.6895, 'CN'),
('SAO', 'São Paulo', '11', -46.6333, -23.5505, 'BR'),
('DEL', 'Delhi', '11', 77.1025, 28.6139, 'CN'),
('BEJ', 'Beijing', '10', 116.4074, 39.9042, 'CN'),
('BER', 'Berlin', '30', 13.4050, 52.5200, 'DE'),
('MEX', 'Mexico City', '55', -99.1332, 19.4326, 'MX'),
('ROM', 'Rome', '6', 12.4964, 41.9028, 'IT');


-- Insert records into the ciudadano table
INSERT INTO ciudadano (nombre, email, cod_ciudad) VALUES
('John Doe', 'john.doe@example.com', 'NYC'),
('Jane Smith', 'jane.smith@example.com', 'MAD'),
('Alice Johnson', 'alice.johnson@example.com', 'PAR'),
('Bob Brown', 'bob.brown@example.com', 'BEJ'),
('Carlos Martinez', 'carlos.martinez@example.com', 'SAO'),
('Priya Sharma', 'priya.sharma@example.com', 'TOK'),
('Li Wei', 'li.wei@example.com', 'BEJ'),
('Klaus Müller', 'klaus.mueller@example.com', 'DEL'),
('Ana García', 'ana.garcia@example.com', 'MEX'),
('Giulia Rossi', 'giulia.rossi@example.com', 'BEJ');


-- INTEGRIDAD REFERENCIAL


UPDATE pais
	SET nombre_pais = 'MEJICO'
    WHERE cod_pais = 'MX' ;

UPDATE pais
	SET cod_pais = 'MJ'
    WHERE cod_pais = 'MX' ;


DELETE FROM pais
	WHERE cod_pais = 'CN';


SELECT 
*
FROM pais ;


SELECT * 
FROM ciudad;


DELETE FROM pais
	WHERE cod_pais = 'CN';

SELECT * 
FROM ciudadano
JOIN ciudad AS c USING(cod_ciudad)
JOIN pais AS p ON p.cod_pais = c.pais
	WHERE cod_pais = 'MJ';

