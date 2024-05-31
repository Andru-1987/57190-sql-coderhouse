SHOW DATABASES;

-- TODOS LOS COMENTARIOS SOBRE JUEGOS DESDE EL 2019  -> 

SELECT 
	comment_date 
,	commentary 
	FROM coderhouse_gamers.COMMENTARY
WHERE 
--	YEAR(comment_date) > 2019;
	comment_date >= '2019-01-01' ;
-- LIMIT 10;


-- TODOS LOS COMENTARIOS ENTRE 2011 - 2019
SELECT 
	comment_date 
,	commentary 
	FROM coderhouse_gamers.COMMENTARY
WHERE 
--	YEAR(comment_date) > 2019;
	comment_date BETWEEN '2011-01-01' AND '2019-01-01' 
ORDER BY comment_date DESC 
	;
-- LIMIT 10;


-- JUEGOS QUE TENGAN NIVEL 15 -> 9 -> 5

SELECT 
*
FROM coderhouse_gamers.GAME
WHERE 
	-- id_level = 15
	-- OR id_level = 9
	-- OR id_level = 5;
id_level IN (15,9,5);

-- LIMIT 10; 



-- JUEGOS DONDE TENGAN: 
--	- Riders Republic
-- 	- The Dark Pictures: House Of Ashes
SELECT 
	g.*
FROM coderhouse_gamers.GAME AS g 
WHERE 
	(g.name LIKE '%Riders Republic%'
	OR g.name LIKE '%The Dark Pictures: House Of Ashes%');


-- AGG FUNCTIONS

-- QUISIERA SABER el conteo de usuarios en una tabla de juegos

-- >> VOTE

SELECT *
FROM coderhouse_gamers.VOTE LIMIT 10;

SELECT
	id_system_user 
,	COUNT(id_system_user) AS cantidad_votos

FROM coderhouse_gamers.VOTE
GROUP BY id_system_user
ORDER BY cantidad_usuarios DESC;

-- 

SELECT 
*
FROM coderhouse_gamers.PLAY ;

-- DAME LA CANTIDAD  USUARIOS COMPLETARON CADA JUEGO Y QUE CANTIDAD NO COMPLETO
-- CANTIDAD DE USUARIOS JUEGOS COMPLETADOS Y NO COMPLETADOS
 
: 1 , 1 , cant_usuarios
: 1 , 0 , cant_usuarios
.... 

SELECT 
	id_game
,	IF(completed = 1, "completado","No completado") AS status
,	count(id_system_user) AS total_usuarios
FROM coderhouse_gamers.PLAY
GROUP BY id_game , completed 
HAVING count(id_system_user) > 7
;



-- VOTE EL VALOR SUM (VALUE)


SELECT 
	*
FROM coderhouse_gamers.VOTE 
LIMIT 10
; 

-- MARKETING LE BUSQUE LOS JUEGOS MENOS RANK
-- LOS QUE TENGAN UN PROMEDIO POR DEBAJO DE 3 

SELECT 
	id_game
, 	ROUND(AVG(value),2) AS PROMEDIO_VOTACION

FROM coderhouse_gamers.VOTE
GROUP BY id_game
HAVING AVG(value) < 3 
ORDER BY PROMEDIO_VOTACION
;


-- >> NOMBRE DEL JUEGO
-- >> GAME
SELECT 
	v.id_game
,	g.name
, 	ROUND(AVG(v.value),2) AS PROMEDIO_VOTACION

FROM coderhouse_gamers.VOTE AS v
JOIN coderhouse_gamers.GAME AS g
	ON v.id_game = g.id_game 
GROUP BY v.id_game
HAVING AVG(v.value) < 3 
ORDER BY PROMEDIO_VOTACION
;























