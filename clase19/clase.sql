SHOW DATABASES ;

USE mysql;

SHOW TABLES FROM mysql;

-- ESTA TABLA NOS OTORGA LA INFORMACION DE TODOS LO SUSUARIOS EN ESTE SISTEMA GESTOR
SELECT * 
FROM mysql.user;

-- HOST  --> 
-- % --> es de cualquier host habilitado --> cualquier ip
-- localhost --> tu compu
-- 127.0.0.1 --> ip que es parecido al localhost --> pero NO!

DROP USER 
		'leonardo'@'%'
    ,	'leonardo'@'localhost' ;


CREATE USER 
	-- nombre de usuario
    -- @ --> indicador
	'leonardo'@'%' IDENTIFIED BY '1234' ;
    
    
CREATE USER 'leonardo'@'localhost' IDENTIFIED BY '1234' ;


CREATE USER 'jessica'@'%' IDENTIFIED BY 'abcd' 
PASSWORD EXPIRE INTERVAL 180 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;


ALTER USER 'jessica'@'%' IDENTIFIED BY 'dcba';

RENAME USER 'jessica'@'%' TO 'bas_jes'@'%' ;

FLUSH PRIVILEGES;

DROP USER 'bas_jes'@'%' ;


-- 
DROP USER 'adriana'@'%';
CREATE USER 'adriana'@'%' IDENTIFIED BY '1234' ;
GRANT ALL PRIVILEGES ON *.* TO 'adriana'@'%' WITH GRANT OPTION;

CREATE USER 'adriana'@'%' IDENTIFIED BY '1234' ;


CREATE USER 'gabriel'@'%' IDENTIFIED BY '123' ;
GRANT ALL PRIVILEGES ON las_carmelitas.* TO 'gabriel'@'%';

REVOKE ALL PRIVILEGES ON *.* FROM 'gabriel'@'%';


CREATE USER 'matias'@'%' IDENTIFIED BY '123' ;
GRANT SELECT ON coderhouse_gamers.LEVEL_GAME TO 'matias'@'%' ;
GRANT INSERT ON coderhouse_gamers.LEVEL_GAME TO 'matias'@'%' ;
REVOKE SELECT,INSERT ON coderhouse_gamers.LEVEL_GAME FROM 'matias'@'%' ;


CREATE VIEW coderhouse_gamers.test_view AS SELECT * FROM coderhouse_gamers.LEVEL_GAME;
GRANT SELECT ON coderhouse_gamers.test_view TO 'matias'@'%' ;
GRANT SELECT (first_name,email) ON coderhouse_gamers.SYSTEM_USER TO 'matias'@'%' ;



SHOW PROCESSLIST;

SELECT * FROM information_schema.processlist;


