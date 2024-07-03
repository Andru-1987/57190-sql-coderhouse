-- CLASE 12
-- SUBLENGUAJE DML2

-- Creacion de tablas en coderhouse_gamers

USE coderhouse_gamers;


CREATE 	TABLE coderhouse_gamers.COMMENT_STAGING
		LIKE coderhouse_gamers.COMMENT;

ALTER 	TABLE coderhouse_gamers.COMMENT_STAGING 
		ADD COLUMN DEVICE VARCHAR(50) DEFAULT "MOBILE";

INSERT 	INTO coderhouse_gamers.COMMENT_STAGING
		VALUES
		(24,1001, '2020-10-10', '2024-10-10' , DEFAULT ),
		(21,2000, '2021-10-05', '2024-02-02' , "DESKTOP"),
		(20,49, '2020-01-01', '2024-04-04' , NULL );

	
SELECT 
	* 
FROM coderhouse_gamers.COMMENT_STAGING;
	
-- <CUSTOMER SERVICE: INDGESTA A LA TABLA COMMENT SOLAMENTE LOS REGISTRO DE MOBILE> -- 


INSERT INTO COMMENT 
	(
	
	SELECT 
		id_game 
	,	id_system_user 
	,	first_date 
	,	last_date 
	FROM coderhouse_gamers.COMMENT_STAGING AS CS
	
	WHERE EXISTS (
	
		SELECT 
			DISTINCT 
			id_system_user
		FROM coderhouse_gamers.SYSTEM_USER AS SU
		WHERE CS.id_system_user =  SU.id_system_user
		
		) 

	AND CS.DEVICE LIKE "MOBILE"
	)
	;
			


-- UPDATE WITH SUBQUERY

UPDATE 	COMMENT_STAGING AS CS
		SET id_system_user = 10

WHERE NOT EXISTS (
	SELECT 
		DISTINCT 
		id_system_user
	FROM coderhouse_gamers.SYSTEM_USER AS SU
	WHERE CS.id_system_user =  SU.id_system_user
);


DELETE FROM COMMENT_STAGING AS CS
WHERE EXISTS 
(	SELECT 
		id_game 
	,	id_system_user 
	FROM coderhouse_gamers.COMMENT AS C

	WHERE (CS.id_game = C.id_game AND CS.id_system_user = C.id_system_user)	
);


-- <DESDE LAS FILMINAS> --
	
SELECT 
	* 
FROM coderhouse_gamers.CLASS
ORDER BY id_class DESC
LIMIT 10;

-- -- 

SELECT 
	*
FROM coderhouse_gamers.LEVEL_GAME
ORDER BY id_level DESC
LIMIT 10 ;

-- <CREAR NEW_CLASS_TABLE STRUCTURE> --

CREATE 	TABLE coderhouse_gamers.CLASS_NEW 
		LIKE coderhouse_gamers.CLASS;  

	
CREATE 	TABLE coderhouse_gamers.LEVEL_GAME_NEW 
		LIKE coderhouse_gamers.LEVEL_GAME;  
	

ALTER TABLE coderhouse_gamers.CLASS_NEW 
		MODIFY COLUMN description VARCHAR(100) ;

SELECT 
*
FROM coderhouse_gamers.CLASS_NEW ;


-- INSERTION OF RECORDS

INSERT INTO coderhouse_gamers.CLASS_NEW 
	VALUES
	(17,10,'ADVENTURE TIME'),
	(15,1, NULL),
	(17,20,'LOCALLY TIME DATA'),
	(17,30,'DATA STORY TIME'),
	(14,1,NULL),
	(18,1,'NO DATA');



-- COALSCE

SELECT 
	id_level
,	id_class
,	COALESCE(description,"NOP DESCRIPTION") AS description
FROM coderhouse_gamers.CLASS_NEW;


INSERT 	INTO coderhouse_gamers.LEVEL_GAME_NEW
	(
		SELECT
			DISTINCT 
				id_level
			,	'new level element'
		FROM coderhouse_gamers.CLASS_NEW AS CN
		WHERE NOT EXISTS 
			(
				SELECT id_level
				FROM coderhouse_gamers.LEVEL_GAME LG
				WHERE CN.id_level = LG.id_level
			)
		);

-- <VERIFICAMOS LA CREACION DE DADOS REGISTROS>--
SELECT 	*
FROM coderhouse_gamers.LEVEL_GAME_NEW;


-- <CREACION DE TABLAS CON EL COMANDO CREATE TABLE> --

CREATE TABLE coderhouse_gamers.USERS_COMPANY_SPOTIFY
(
	SELECT
		first_name 	AS nombre
	,	last_name	AS apellido
	,	email		AS correo_electronico
	,	COALESCE(password ,'NOT PASSWORD') AS clave
	,	TRUE 		AS status
	FROM coderhouse_gamers.SYSTEM_USER
	WHERE email LIKE '%spotify%'
);


SELECT 
	'pepe'  AS nombre
,	COALESCE(NULL,0) AS hijos
FROM DUAL;






/*

CREAMOS UNA NUEVA TABLA DE JUEGO DENOMINADA ADVERGAME
DONDE AGREGAREMOS JUEGOS DE PROPAGANDA DE EMPRESA

CREAREMOS 5 JUEGOS NUEVOS EN LA TABLA ADVERGAME

INSERTAREMOS REGITROS CORRESPONDIENTES EN LA TABLA ADVERCLASS 
OBTENIENDO MEDIANTE 
UNA SUBCONSULTA LOS ID DE LAS CLASE Y NIVELES NUEVO INSERTADOS
*/

DROP TABLE ADVERGAME; 


CREATE TABLE ADVERGAME
	AS
		SELECT
			*
		FROM 
		coderhouse_gamers.GAME
		LIMIT 5;



INSERT INTO  ADVERGAME 
	(
	SELECT 
		*	
	FROM coderhouse_gamers.GAME 
	LIMIT 5
	) ;
	

SELECT 
*
FROM coderhouse_gamers.ADVERGAME;

RENAME TABLE CLASS_NEW TO ADVERCLASS;


INSERT INTO ADVERCLASS
	(SELECT
		id_level 
	,	id_class 
	,	'NEW DESCRIPTION'
	FROM coderhouse_gamers.ADVERGAME
	);



SELECT 
	*
FROM coderhouse_gamers.ADVERCLASS;

