-- < SQL theory> --

## Funciones Personalizadas en SQL

**¿Qué es una función personalizada?**

Una función personalizada, también llamada función definida por el usuario (UDF), es un bloque de código SQL que se puede reutilizar en diferentes consultas. Es similar a una función predefinida de SQL, pero está definida por el usuario para realizar tareas específicas.

**¿Dónde se guarda una función personalizada?**

La ubicación de las funciones personalizadas depende del sistema de gestión de bases de datos (SGBD) que se utilice:

* **MySQL:** Se guardan en el diccionario de datos de la base de datos actual.
* **SQL Server:** Se pueden almacenar en la base de datos actual o en una base de datos maestra.
* **PostgreSQL:** Se guardan en el esquema actual.

**Ventajas de las funciones personalizadas:**

* **Reutilización de código:** Permiten evitar la duplicación de código en diferentes consultas.
* **Modularidad:** Dividen el código en bloques más pequeños y fáciles de manejar.
* **Encapsulamiento:** Ocultan la complejidad de la lógica de la consulta.
* **Mejora del rendimiento:** Pueden mejorar el rendimiento al evitar la ejecución repetida de cálculos complejos.

**Sintaxis para crear y mantener funciones:**

**Creación:**

```sql
CREATE FUNCTION nombre_funcion (parametro1 tipo, parametro2 tipo, ...)
RETURNS tipo_retorno
BEGIN
    -- Cuerpo de la función
    -- Instrucciones SQL
    RETURN valor_retorno;
END;

```


nombre_funcion: Es el nombre que le das a la función.
parametro1, parametro2, ...: Son los parámetros que la función puede aceptar.
tipo: Es el tipo de datos de los parámetros y del valor de retorno.
tipo_retorno: Es el tipo de datos que devuelve la función.
valor_retorno: Es el valor que devuelve la función.

**Mantenimiento:**

* **ALTER FUNCTION:** Modifica la definición de una función existente.
* **DROP FUNCTION:** Elimina una función.

**Estructura de una función personalizada en MySQL:**

```sql
DELIMITER //

CREATE FUNCTION nombre_funcion (parámetros) RETURNS tipo_de_dato
BEGIN
    -- Declaración de variables
    -- Código de la función
    RETURN valor;
END;

//

DELIMITER ;
```

**Implementación de una función personalizada:**

```sql
DELIMITER //

CREATE FUNCTION obtener_edad (fecha_nacimiento DATE) RETURNS INT
BEGIN
    DECLARE edad INT;

    SET edad = YEAR(CURDATE()) - YEAR(fecha_nacimiento);

    RETURN edad;
END;

//

DELIMITER ;

SELECT obtener_edad('1980-01-01'); -- Devuelve 43
```

**Implementación de una función con un warning:**

```sql
DELIMITER //

CREATE FUNCTION obtener_saldo (cuenta_id INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE saldo DECIMAL(10,2);

    SELECT saldo INTO saldo
    FROM cuentas
    WHERE cuenta_id = cuenta_id;

    IF saldo IS NULL THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT 'Cuenta no encontrada';
    END IF;

    RETURN saldo;
END;

//

DELIMITER ;

SELECT obtener_saldo(123); -- Devuelve el saldo o muestra un error si la cuenta no existe
```

**Recursos adicionales:**

* MySQL Functions: [https://dev.mysql.com/doc/refman/8.0/en/functions.html](https://dev.mysql.com/doc/refman/8.0/en/functions.html)
-- <  OPCIONES  DE LAS FUNCIONES > --

## Opciones de las funciones SQL: DETERMINISTIC, NO DETERMINISTIC y READS SQL DATA

**DETERMINISTIC:**

* Indica que la función siempre devuelve el mismo resultado para los mismos valores de entrada.
* Es útil para funciones que realizan cálculos matemáticos o de comparación.
* **Ejemplo:**

```sql
CREATE FUNCTION obtener_area_cuadrado (lado INT) RETURNS INT
DETERMINISTIC
BEGIN
    RETURN lado * lado;
END;
```

**NO DETERMINISTIC:**

* Indica que la función puede devolver diferentes resultados para los mismos valores de entrada.
* Es útil para funciones que dependen de valores externos o aleatorios.
* **Ejemplo:**

```sql
CREATE FUNCTION obtener_fecha_aleatoria () RETURNS DATE
NO DETERMINISTIC
BEGIN
    RETURN CURRENT_DATE() + INTERVAL RAND() DAY;
END;
```

**READS SQL DATA:**

* Indica que la función lee datos de la base de datos.
* Es útil para funciones que necesitan información de las tablas.
* **Ejemplo:**

```sql
CREATE FUNCTION obtener_nombre_cliente (cliente_id INT) RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
    DECLARE nombre VARCHAR(255);

    SELECT nombre INTO nombre
    FROM clientes
    WHERE cliente_id = cliente_id;

    RETURN nombre;
END;
```

**Consideraciones:**

* **DETERMINISTIC vs NO DETERMINISTIC:**

    * Las funciones deterministas son más eficientes y se pueden usar en expresiones WHERE y GROUP BY.
    * Las funciones no deterministas no se pueden usar en expresiones WHERE y GROUP BY.

* **READS SQL DATA:**

    * Las funciones que no leen datos de la base de datos se pueden ejecutar más rápido.
    * Las funciones que leen datos de la base de datos pueden verse afectadas por el estado de la base de datos.

**Resumen:**

* **DETERMINISTIC:** asegura el mismo resultado para los mismos valores de entrada.
* **NO DETERMINISTIC:** permite diferentes resultados para los mismos valores de entrada.
* **READS SQL DATA:** indica que la función lee datos de la base de datos.

**Elejir la opción correcta:**

* La elección de la opción adecuada depende de la lógica de la función y de cómo se va a usar.
* Se recomienda usar DETERMINISTIC siempre que sea posible.
* Se recomienda usar NO DETERMINISTIC solo cuando sea necesario.
* Se recomienda usar READS SQL DATA solo cuando la función necesite leer datos de la base de datos.



-- CLASE 15

USE clase_integridad ;

-- CREATE a FUNCTION DETERMINISTIC SIMPLE

DROP FUNCTION IF EXISTS area_circulo;

DELIMITER //
CREATE FUNCTION area_circulo (radio DECIMAL(12,2))
	RETURNS DECIMAL(16,2)
    
    COMMENT 'Esta funcion esta destinada para el area de un circulo'
    DETERMINISTIC
    BEGIN
		DECLARE VALOR_PI DECIMAL(12,2);
        SET VALOR_PI = 3.14 ;
        RETURN VALOR_PI * radio * radio;
    END//
    
DELIMITER ;



SELECT 
	area_circulo( 10 ) AS area_circular
FROM DUAL; 


SELECT 
    *
FROM
    information_schema.routines
WHERE
    routine_type = 'FUNCTION'
        AND routine_schema = 'clase_integridad';

SET GLOBAL log_bin_trust_function_creators = 1;

-- FUNCTION NOT DETERMINISTIC 
DELIMITER //
CREATE FUNCTION dame_una_fecha() RETURNS DATE
    NOT DETERMINISTIC
    BEGIN
		RETURN CURRENT_DATE() + INTERVAL RAND() DAY ;
    END//
DELIMITER ;
    
    
SELECT 
CURRENT_DATE() + INTERVAL RAND() DAY 
FROM DUAL
;



-- NO SQL Y VARIABLE
SELECT *
FROM clase_integridad.venta;


DROP FUNCTION IVA ;
-- FUNCTION NOT DETERMINISTIC  Y NO SQL
DELIMITER //
CREATE FUNCTION IVA(monto DECIMAL(12,4)) RETURNS DECIMAL(12,4)
	COMMENT 'FUNCION PARA OTORGAR EL IVA DE ACUERDO AL VALOR DEL PRODUCTO'
    NO SQL
    BEGIN
		
        DECLARE IVA_COMUN 	DECIMAL(3,2);
        DECLARE IVA_1_15	DECIMAL(3,2);
		
        SET IVA_COMUN 	= 	1.21;
        SET IVA_1_15	= 	1.15;
    
    
		IF monto BETWEEN 0 AND 46 THEN 
			RETURN monto * IVA_COMUN; 
		ELSEIF monto BETWEEN 47 AND 59 THEN
			RETURN monto * IVA_1_15 ;
		ELSE
			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT  = 'SUPERA EL VALOR MAXIMO', MYSQL_ERRNO = 1000;
            RETURN NULL;
		END IF;
   
    END//
DELIMITER ;


SELECT 
	v.*
,	IVA(v.monto_total) AS IVA
FROM clase_integridad.venta AS v ;






DROP FUNCTION IF EXISTS ponderacion_total ;
-- FUNCTION READS SQL DATA

DELIMITER //
CREATE FUNCTION ponderacion_total(monto_parcial DECIMAL(12,4)) RETURNS VARCHAR(50)
	COMMENT 'FUNCTION QUE ME OTORGA EL PORCENTAJE PONDERADO DE CADA VENTA'
    READS SQL DATA
    BEGIN
		
        DECLARE TOTAL_VENTA 	DECIMAL(12,2);
        DECLARE monto_ponderado DECIMAL(12,2);
        
		SELECT 
			SUM(monto_total) INTO TOTAL_VENTA
        FROM clase_integridad.venta;
        
        
		SET monto_ponderado = (monto_parcial * 100 ) / TOTAL_VENTA ;
        
		RETURN CONCAT( monto_ponderado ," %");
   
    END//
DELIMITER ;



SELECT 
	v.*
,	IVA(v.monto_total) AS IVA
,	ponderacion_total(v.monto_total) AS  `ponderacion del total`
FROM clase_integridad.venta AS v ;


-- CREAR UNA FUNCION QUE AL PASAR EL ID NOS RETORNE EL NOMBRE DEL JUEGO

USE coderhouse_gamers ;


DROP FUNCTION IF EXISTS get_game; 

DELIMITER //
CREATE FUNCTION get_name (id INT) RETURNS VARCHAR(100)
	COMMENT 'Funcion dedicada a retornar el nombre del juego'
	READS SQL DATA
BEGIN
	DECLARE name_return VARCHAR(100) ;

	SELECT name INTO name_return
    FROM coderhouse_gamers.GAME
	WHERE id_game = id 
    LIMIT 1
    ;
	
    RETURN name_return ;

END//
DELIMITER ;


SELECT get_name(id_game) AS nombre_juego
FROM GAME;
