DROP DATABASE IF EXISTS joins_schema;
CREATE DATABASE joins_schema; 

USE joins_schema;

CREATE TABLE pais (
	nombre_pais VARCHAR(100) PRIMARY KEY,
    area_total INT
);

CREATE TABLE ciudad(
	nombre_ciudad VARCHAR(100) PRIMARY KEY,
    pais_pertenece VARCHAR(100)
);


INSERT INTO joins_schema.pais VALUES
("argentina" , 600),
("mexico", 12000) ;

INSERT INTO joins_schema.ciudad VALUES
("lima", "peru"),
("chaco","argentina"),
("tilcara","argentina"),
("bogota","colombia");




SELECT *
FROM joins_schema.pais ;

SELECT *
FROM joins_schema.ciudad;


SELECT 
	c.pais_pertenece
FROM joins_schema.pais  AS p -- izq
-- INNER JOIN joins_schema.ciudad AS c
-- LEFT JOIN joins_schema.ciudad AS c  -- der
RIGHT JOIN joins_schema.ciudad AS c
	ON p.nombre_pais = c.pais_pertenece
;


-- UNION

SELECT name
FROM coderhouse_gamers.GAME
WHERE name LIKE 'f%'

UNION
-- UNION ALL
SELECT name
FROM coderhouse_gamers.GAME
WHERE id_level IN (5,8);





--  SUQUERIES

SELECT
*
FROM coderhouse_gamers.GAME
WHERE name REGEXP '^[a-c].+[0-9]$';

-- TRAER TODOS LOS COMENTARIOS DONDE LOS JUEGOS EMPIECEN EN LOS RANGOS DE a-c y terminen con numeros

SELECT 
*
FROM coderhouse_gamers.COMMENTARY
WHERE id_game IN (
	SELECT
	id_game
	FROM coderhouse_gamers.GAME
	WHERE name REGEXP '^[a-c].+[0-9]$'
);


-- EXISTS
SELECT 
	*
FROM coderhouse_gamers.COMMENTARY AS c
WHERE EXISTS (
	SELECT
		1
	FROM coderhouse_gamers.GAME AS g
	WHERE name REGEXP '^[a-c].+[0-9]$'
    AND c.id_game = g.id_game
);


-- 
-- AGRUPAR PORLOS JUEGOS AFILTRADOS

SELECT
	id_game
,	 COUNT(id_game) AS TOTAL_COMENTARIOS
FROM coderhouse_gamers.COMMENTARY
WHERE id_game IN (
	SELECT
	id_game
	FROM coderhouse_gamers.GAME
	WHERE name REGEXP '^[a-c].+[0-9]$'
)
GROUP BY id_game 
HAVING TOTAL_COMENTARIOS > 8
;


