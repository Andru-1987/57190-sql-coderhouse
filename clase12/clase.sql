USE coderhouse_gamers;

SELECT *
FROM LEVEL_GAME ;

SELECT * 
FROM CLASS ;


SELECT DISTINCT 
	id_level
,	'New level'
FROM new_class  -- new_class --> (tablas de staging)
WHERE id_level NOT IN (
	SELECT id_level
    FROM LEVEL_GAME
);



-- Voy a crear una tabla nueva
-- CREATE TABLE IF NOT EXISTS staging_new_class (
-- );
-- A : ESTRUCTURA CON INDICES
CREATE TABLE staging_new_class LIKE CLASS ;
SELECT 
	* 
FROM staging_new_class; 

EXPLAIN staging_new_class;

-- B : COPIA ESTRUCTURA + DATOS - INDICES - no constraints
CREATE TABLE staging_new_class_clone AS
	SELECT
    *
    FROM CLASS ;

SELECT *
FROM staging_new_class_clone; 

EXPLAIN staging_new_class_clone;

-- 


SELECT *
FROM staging_new_class_clone;
 

INSERT INTO staging_new_class_clone
VALUES 
(20, 101 , "Killer Queen"),
(21, 102, "Rol"),
(25,103, "Counter Strike");


SELECT DISTINCT 
	id_level
,	'New level' 
FROM staging_new_class_clone  -- new_class --> (tablas de staging)
WHERE id_level NOT IN (
	SELECT id_level
    FROM LEVEL_GAME
);

CREATE TABLE IF NOT EXISTS 
	coderhouse_gamers.new_level_game (
	id_level INT NOT NULL,
    description VARCHAR(255) NOT NULL
);

INSERT INTO 
	coderhouse_gamers.new_level_game (id_level, description)

    SELECT DISTINCT 
		id_level
	,	'New level' 
	FROM staging_new_class_clone  -- new_class --> (tablas de staging)
	WHERE id_level NOT IN (
		SELECT id_level
		FROM LEVEL_GAME
	);

SELECT 
	*
FROM coderhouse_gamers.new_level_game;

-- TABLA PRODUCTIVA
INSERT INTO LEVEL_GAME (id_level,description)
	SELECT 
			id_level
		,	description
	FROM coderhouse_gamers.new_level_game ;
    
SELECT 
* FROM LEVEL_GAME;


-- 
SET SQL_SAFE_UPDATES=0;

UPDATE coderhouse_gamers.new_level_game
	SET id_level = 40 
    WHERE id_level IN 
		(
        SELECT id_level
		FROM LEVEL_GAME
        WHERE description LIKE '%new level%'
        );
    
SELECT 
	*
FROM coderhouse_gamers.new_level_game;



-- CHALLENGE 
CREATE TABLE IF NOT EXISTS ADVERGAME
	SELECT *
    FROM GAME 
    LIMIT 1;

TRUNCATE TABLE ADVERGAME ; 

CREATE TABLE IF NOT EXISTS ADVERCLASS 
	SELECT *
    FROM CLASS 
    LIMIT 1;
    
TRUNCATE TABLE ADVERCLASS ; 


-- INSERT DATA NUEVA
INSERT INTO ADVERGAME(id_game,name, description,id_level,id_class)
VALUES
(301,"KOF '97","Juego de pelea", 50,400),
(302,"FIFA","Football", 51,401),
(303,"Diablo","Sci Fi", 54,403),
(305,"Worms","Strategy", 55,410),
(307,"Age of Empires","Misc", 56,411 );


INSERT INTO ADVERCLASS
	SELECT * 
    FROM CLASS; 
    
INSERT INTO ADVERCLASS
	SELECT 
			id_level
        ,	id_class
        ,	description
	FROM ADVERGAME AS ag
    WHERE NOT EXISTS (
		SELECT 
			-- id_level
            -- ,	id_class
           1
           -- NULL
		FROM GAME AS g
		WHERE (ag.id_level = g.id_level AND ag.id_class = g.id_class)
    ); 
    

SELECT * FROM ADVERCLASS;
Buenas 