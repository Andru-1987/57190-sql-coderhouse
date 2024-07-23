-- TRIGGERS
-- Link : https://docs.google.com/presentation/d/e/2PACX-1vQpQSNAPVD2IaMqn_mEFfgZs3VQviS9_SgmMTYsJj0A2Sj9gWTn7QKo7nwhCWtBxg/pub?start=false&loop=false&delayms=3000

/*
Triggers

## Triggers en MySQL

**Casos de uso:**

* **Auditoria:** Registrar cambios en la base de datos, como quién modificó un registro o cuándo se eliminó.
* **Validación de datos:** Asegurar que los datos ingresados sean correctos antes de almacenarlos.
* **Implementación de reglas de negocio:** Automatizar tareas como enviar notificaciones o calcular valores derivados.
* **Replicación de datos:** Mantener sincronizadas dos o más bases de datos.

**Sintaxis:**

```sql
CREATE TRIGGER nombre_trigger
BEFORE/AFTER INSERT/UPDATE/DELETE ON nombre_tabla
FOR EACH ROW
BEGIN
  -- Sentencias SQL que se ejecutarán
END;
```

**Triggers de auditoría:**

```sql
CREATE TRIGGER auditoria_modificacion
AFTER UPDATE ON usuarios
FOR EACH ROW
BEGIN
  INSERT INTO auditoria (usuario, fecha, accion, tabla, columna, valor_anterior, valor_nuevo)
  VALUES (CURRENT_USER, NOW(), 'UPDATE', 'usuarios', OLD.columna, NEW.columna);
END;
```

**Tipos de triggers:**

* **BEFORE:** Se ejecuta antes de la operación que lo activa.
* **AFTER:** Se ejecuta después de la operación que lo activa.
* **INSTEAD OF:** Reemplaza la operación que lo activa.

**FOR EACH ROW:**

Indica que el trigger se ejecutará para cada fila afectada por la operación.

**Integración con funciones:**

Los triggers pueden llamar a funciones para realizar tareas complejas.

**Ejemplos en MySQL:**

* **Validar que el email sea único:**

```sql
CREATE TRIGGER validar_email
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
  IF EXISTS (SELECT * FROM usuarios WHERE email = NEW.email) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE 'El email ya está registrado';
  END IF;
END;
```

* **Enviar una notificación cuando se crea un nuevo usuario:**

```sql
CREATE TRIGGER notificacion_nuevo_usuario
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
  -- almacenamiento de una tabla temporal
END;
```

**Recursos adicionales:**

* Documentación oficial de MySQL sobre triggers: [https://dev.mysql.com/doc/refman/8.0/en/triggers.html](https://dev.mysql.com/doc/refman/8.0/en/triggers.html)

Es importante tener en cuenta que los triggers pueden afectar el rendimiento de la base de datos. Se recomienda usarlos con moderación y solo cuando sean realmente necesarios.


*/



USE coderhouse_gamers;

SELECT * FROM PAY 
LIMIT 10; 

-- TRIGGER
-- CADA VEZ QUE SE INGRESE UN 
-- PAGO -> NOMBRE DEL JUEGO
-- + MONTO | FECHA
-- A QUE TABLA LE TENGO QUE DECIR QUE OBSERVE? -> table: PAY
-- NAME Y CUANDO -> insert_after_pay  : AFTER INSERT
-- A QUE TABLA TIENE QUE AFECTAR: 
-- STAGE_LOG_INSERTION_PAY

DROP TABLE IF EXISTS coderhouse_gamers.STAGE_LOG_INSERTION_PAY ;
CREATE TABLE coderhouse_gamers.STAGE_LOG_INSERTION_PAY (
	ID_LOG INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,	NOMBRE_JUEGO VARCHAR(200)
,	MONTO_PAGO	DECIMAL(10,2)
,	FECHA_INSERTION DATE
,	USER_INSERTION VARCHAR(100)
);


SHOW TRIGGERS
FROM coderhouse_gamers;

-- borrado de trigger si es que existe
DROP TRIGGER IF EXISTS insert_after_pay;

DELIMITER //
-- encabezado de trigger
CREATE TRIGGER insert_after_pay
-- cuando se realiza y a que tabla
AFTER INSERT ON PAY 
-- por cuantas filas se dispara
FOR EACH ROW
BEGIN
	-- se declara una variable para almacenar 
    -- el nombre del juego
	DECLARE nombre VARCHAR(200) ;
	
    -- busqueda del nombre del juego
    -- con el id ingresado
    SELECT name INTO nombre
    FROM coderhouse_gamers.GAME
    WHERE id_game = NEW.id_game ;
	
    -- insercion del nuevo registor en la nueva tabla de logs
    INSERT INTO coderhouse_gamers.STAGE_LOG_INSERTION_PAY
    VALUES
    (	NULL
    ,	nombre
    ,	NEW.monto
    ,	NEW.fecha
    ,	USER()
    );
    
END //
-- volvemos a colocar el delimiter en su lugar
DELIMITER ;

INSERT INTO PAY
(monto,fecha,id_game)
VALUES
(1000,'1985-06-30',10);

SELECT *
FROM coderhouse_gamers.PAY; 

SELECT *
FROM coderhouse_gamers.STAGE_LOG_INSERTION_PAY; 


-- fn 
-- PARAMS IN id
-- RETURNS TinyInt 0-1

DROP FUNCTION IF EXISTS fn_exists_game;
DELIMITER //
CREATE FUNCTION fn_exists_game(id_game_in INT)
RETURNS TINYINT
DETERMINISTIC
BEGIN 
	DECLARE existe TINYINT ;
	
    SELECT COUNT(1) INTO existe
	FROM coderhouse_gamers.GAME
    WHERE id_game = id_game_in;
    
    IF existe > 0 THEN 
		RETURN 1;
	ELSE
		RETURN 0 ;
	END IF;
    
END//
DELIMITER ;


-- TRIGGERS
-- Si existe el id_game dejame ingresar el registro de pago

DROP TRIGGER IF EXISTS insert_check_pay;

DELIMITER //
CREATE TRIGGER insert_check_pay
BEFORE INSERT ON PAY 
FOR EACH ROW
BEGIN
    IF fn_exists_game(NEW.id_game) = 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El GAME no existe en la base de datos';
        
	ELSEIF NEW.monto > 3000 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El valor supera el monto de compra';
        
	END IF;
END//
DELIMITER ;

INSERT INTO PAY
(monto,fecha,id_game)
VALUES
(5000,'1985-10-30',100);



DROP TABLE IF EXISTS coderhouse_gamers.STAGE_LOG_UPDATE_PAY ;
CREATE TABLE coderhouse_gamers.STAGE_LOG_UPDATE_PAY (
	ID_LOG INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,	NOMBRE_JUEGO_VIEJO VARCHAR(200)
,	NOMBRE_JUEGO_NUEVO VARCHAR(200)
,	MONTO_PAGO_VIEJO	DECIMAL(10,2)
,	MONTO_PAGO_NUEVO	DECIMAL(10,2)
,	FECHA_VIEJA DATE
,	FECHA_NUEVA DATE
,	USER_UPDATE VARCHAR(100)
);


-- borrado de trigger si es que existe
DROP TRIGGER IF EXISTS update_after_pay;

DELIMITER //
-- encabezado de trigger
CREATE TRIGGER update_after_pay
-- cuando se realiza y a que tabla
AFTER UPDATE ON PAY 
-- por cuantas filas se dispara
FOR EACH ROW
BEGIN
	-- se declara una variable para almacenar 
    -- el nombre del juego
	DECLARE nombre VARCHAR(200) ;
	
    -- busqueda del nombre del juego
    -- con el id ingresado
    SELECT name INTO nombre
    FROM coderhouse_gamers.GAME
    WHERE id_game = OLD.id_game ;
	
    -- insercion del nuevo registor en la nueva tabla de logs
    INSERT INTO coderhouse_gamers.STAGE_LOG_UPDATE_PAY
    VALUES
    (	NULL
    ,	nombre
    ,	CONCAT(nombre," Sigue SIENDO EL MISMO")
    ,	OLD.monto
    ,	NEW.monto
    ,	OLD.fecha
    ,	NEW.fecha
    ,	USER()
    );
    
END //
-- volvemos a colocar el delimiter en su lugar
DELIMITER ;

SET sql_safe_updates=0;

UPDATE PAY
SET 
	monto = 750
,	fecha = "2050-11-11"
WHERE id_game = 100;


SELECT 
	*
FROM STAGE_LOG_UPDATE_PAY;






