USE subtes ;

SELECT * FROM lineas ;

INSERT INTO lineas
VALUES
(10,'Z');


SELECT @@autocommit FROM DUAL;
SET @@autocommit = FALSE ;

INSERT INTO lineas
VALUES
(13,'AC-REJE');

COMMIT;

CREATE USER 'llama'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON *.* TO 'llama'@'%' WITH GRANT OPTION;

SET SQL_SAFE_UPDATES = FALSE;
DELETE FROM subtes.lineas;



CREATE TABLE subtes.lineas_oficialismo(
	id_linea INT,
    linea VARCHAR(10)
);

INSERT INTO subtes.lineas_oficialismo
SELECT * FROM subtes.lineas ;

SELECT * FROM subtes.lineas_oficialismo;
COMMIT;

DELETE FROM subtes.lineas_oficialismo;

ROLLBACK ;

DELIMITER //
CREATE TRIGGER after_insert_linea
AFTER INSERT ON subtes.lineas
FOR EACH ROW
BEGIN
	INSERT INTO subtes.lineas_oficialismo
    VALUES
    (NEW.id_linea,NEW.linea);

END //

DELIMITER ;


INSERT INTO lineas
VALUES
(15,'AC-DC'),
(16,'Mozart'),
(17,'Pearl Jam');

SAVEPOINT primer_gobierno;

INSERT INTO lineas
VALUES
(18, 'Xuxa'),
(19, 'La mona');

DROP TABLE subtes.lineas_oficialismo;

SELECT * FROM subtes.lineas;
SELECT * FROM subtes.lineas_oficialismo;

ROLLBACK TO primer_gobierno;
ROLLBACK;




-- POSTA POSTA

-- PROCEDURE --> 
	-- AL ALMACENAR LA CANTIDAD DE VIAJES DE UN USUARIO 
    -- verifique si la linea existe , no vayas a crear ninguna linea
    -- si no existe, creame esa linea  -->  AA - CC - 123ve
    -- almacene la cantidad de viajes
    -- tabla que almacene la coincidencia de viajes con el usuario

CREATE TABLE usuario (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mail VARCHAR(100)
);


CREATE TABLE viajes_de_usuario (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	mail VARCHAR(100),
    fecha_transaccion DATETIME,
    linea VARCHAR(10)
);
    
    
DROP PROCEDURE IF EXISTS ingreso_usuario_viaje ;
DELIMITER //
CREATE PROCEDURE ingreso_usuario_viaje (
	IN mail_ VARCHAR(100),
    IN linea_ VARCHAR(10) 
) BEGIN
    DECLARE existencia INT ;
    DECLARE id_linea_ INT;
    DECLARE id_row INT;
    
	START TRANSACTION ;

    SELECT 
		COUNT(id_linea) INTO existencia
    FROM subtes.lineas
    WHERE linea = linea_ ;
	
    IF existencia = 0 THEN
		SELECT
			id_linea INTO id_row
        FROM subtes.lineas
        ORDER BY id_linea DESC
        LIMIT 1;
        
        INSERT INTO subtes.lineas VALUES(id_row + 1 , linea_);
	END IF ;
    
	SELECT 
		id_linea , linea INTO id_linea_ , linea_
	FROM subtes.lineas
	WHERE linea = linea_ ;
	
	INSERT INTO usuario (mail) 
	VALUES (mail_) ;
	
	INSERT INTO viajes_de_usuario
	(mail, fecha_transaccion,linea)
	VALUES
	(mail_ , NOW(), linea_);
    
    IF linea_ REGEXP '^[a-zA-Z]$' THEN
		COMMIT;
	ELSE
		ROLLBACK;
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'SE HIZO UN ROLLBACK';
	END IF;
END //
DELIMITER  ;


CALL ingreso_usuario_viaje( 'leonardo@aol.com.es', 'G');
    
SELECT * FROM  usuario; 
SELECT * FROM  viajes_de_usuario; 
SELECT * FROM  lineas;
