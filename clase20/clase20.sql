-- DATA EXTRA :  https://dev.mysql.com/doc/refman/8.0/en/savepoint.html
-- COMMIT :  https://dev.mysql.com/doc/refman/8.0/en/commit.html

## Fundamentos de TCL en MySQL
**Donde se suele aplicar estos comandos**
Siempre que se encuentra una acción del tipo DML

- INSERT
- UPDATE
- DELETE


**TCL** o **Lenguaje de Control Transaccional** es un subconjunto del lenguaje SQL que se utiliza para controlar el flujo de las transacciones dentro de una base de datos MySQL. Permite garantizar la integridad de los datos al agrupar operaciones en unidades de trabajo que se pueden confirmar o deshacer.

**Implementación:**

Los comandos TCL se implementan directamente en el lenguaje SQL y se ejecutan de la misma manera que cualquier otra consulta SQL. Puedes usarlos en el cliente MySQL, en scripts SQL o dentro de procedimientos almacenados.

**Cuándo implementarlo:**

Es recomendable usar TCL en las siguientes situaciones:

* **Para garantizar la integridad de los datos:** Cuando se realizan varias operaciones que deben ejecutarse como un todo o no ejecutarse en absoluto.
* **Para controlar el flujo de las transacciones:** Cuando necesitas deshacer algunos cambios realizados en caso de error.
* **Para mejorar el rendimiento:** Al agrupar operaciones en unidades de trabajo, se puede optimizar el acceso a la base de datos.

**Comandos reservados:**

* **COMMIT:** Se utiliza para confirmar una transacción y hacer que los cambios realizados sean permanentes.
* **ROLLBACK:** Se utiliza para deshacer una transacción y restaurar la base de datos al estado anterior a la transacción.
* **SAVEPOINT:** Se utiliza para crear un punto de guardado dentro de una transacción, al que se puede volver en caso de error.

**Caso de uso con un Stored Procedure:**

El siguiente ejemplo muestra un procedimiento almacenado que utiliza TCL para realizar una transferencia bancaria:

```sql
DELIMITER //

CREATE PROCEDURE TransferenciaBancaria(
    IN  Origen INT,
    IN  Destino INT,
    IN  Monto DECIMAL(10,2)
)
BEGIN
    -- Inicio de la transacción
    START TRANSACTION;

    -- Actualizar el saldo de la cuenta de origen
    UPDATE Cuentas SET Saldo = Saldo - Monto WHERE Id = Origen;

    -- Actualizar el saldo de la cuenta de destino
    UPDATE Cuentas SET Saldo = Saldo + Monto WHERE Id = Destino;

    -- Si no hay errores, confirmar la transacción
    IF @@ERROR = 0 THEN
        COMMIT;
    ELSE
        -- Si hay errores, deshacer la transacción
        ROLLBACK;
    END IF;
END //

DELIMITER ;
```


-- RETIRAR EL AUTOCOMMIT DE LA BASE DE DATOS

SET AUTOCOMMIT = 0 ;

-- SE PUEDE REALIZAR POR MEDIO DE LA  INTERFAZ GRÁFICA, SIN EMBARGO COMO BUENA PRACTICA SE RECOMIENDA REALIZAR POR MEDIO DE ESTA OPCIÓN



-- EJEMPLOS DE CLASE
START TRANSACTION ;

UPDATE CLASS 
    SET 
        description = "TrackPad BT"

    WHERE
        1 = 1
        AND id_level = 10
        AND id_class = 1 ;


-- SALGAMOS O VEAMOSLO EN OTRA TERMINAL, Y OBSERVAREMOS QUE NO SE REALIZÓ EL COMMIT DEBIDO A QUE ESTA EN EL AUTOCOMMIT OFF



START TRANSACTION ;

DELETE FROM 
    USER_TYPE
WHERE
    id_user_type = 2 ;


SELECT 
    *
FROM USER_TYPE 
ORDER BY id_user_type LIMIT 10 ;


-- ROLLBACK ;  -->> PERMITE REALIZAR LA TRANSACCION UN STEP ATRAS, QUE PASARÍA SI ESTO ESTUVIERA LIGADO CON OTROS ELEMENTOS ??


-- EJEMPLO ADICIONAL 

CREATE DATABASE  test_tcl ;
USE test_tcl ; 


CREATE TABLE pais (
    id INT PRIMARY KEY NOT NULL  AUTO_INCREMENT,
    nombre VARCHAR(100)
) ; 


INSERT INTO  pais VALUES 
(1, "MEXICO") ,
(2, "ARGENTINA") ; 


CREATE TABLE ciudad (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) ,
    pais_id  INT
);

INSERT INTO ciudad (id, nombre, pais_id) VALUES
(1, 'Ciudad 1', 1),
(2, 'Ciudad 2', 1),
(3, 'Ciudad 3', 1),
(4, 'Ciudad 4', 1),
(5, 'Ciudad 5', 1),
(6, 'Ciudad 6', 2),
(7, 'Ciudad 7', 2),
(8, 'Ciudad 8', 2),
(9, 'Ciudad 9', 2),
(10, 'Ciudad 10', 2);


ALTER TABLE 
    ciudad 
    ADD CONSTRAINT __FK_CIUDAD_PAIS
    FOREIGN KEY (pais_id) REFERENCES pais(id) 
    ON DELETE CASCADE ; 




START TRANSACTION ;

DELETE FROM 
    pais
WHERE
    id = 1 ;


-- COMO ESTO ESTA EN CASCADA, DEBERIA BORRARSE TODOS LOS DEMAS , SIN EMBARGO CUANDO HAGAMOS EL ROLLBACK DEBERIA ENCONTRAR EL PUNTO DE RESTAURACION PUES NO TIENE COMMIT

SELECT 
    *
FROM ciudad


ROLLBACK ; 

SELECT 
    *
FROM ciudad




-- SAVEPOINTS


-- Insertar ciudades para México

SAVEPOINT __restauration_point_null;


INSERT INTO ciudad (nombre, pais_id) VALUES
('Ciudad de México', 1),
('Guadalajara', 1),
('Monterrey', 1),
('Puebla', 1),
('Tijuana', 1),
('León', 1),
('Juárez', 1),
('Torreón', 1),
('San Luis Potosí', 1),
('Hermosillo', 1);

SAVEPOINT __restauration_point_mexico;

-- Insertar ciudades para Argentina

INSERT INTO ciudad (nombre, pais_id) VALUES
('Buenos Aires', 2),
('Córdoba', 2),
('Rosario', 2),
('Mendoza', 2),
('La Plata', 2),
('Tucumán', 2),
('Mar del Plata', 2),
('Salta', 2),
('Santa Fe', 2),
('Corrientes', 2);


SAVEPOINT __restauration_point_argentina;


ROLLBACK TO __restauration_point_mexico;
RELEASE SAVEPOINT 
COMMIT ;



ACTIVIDAD DE CLASE 

# Podemos crear una base de datos pura y exclusivamente para este accionar. 


- Abrir una nueva pestaña script y elimina tres pagos de los que insertamos en la filmina 49,  iniciando una transacción.
- Validar en otra pestaña script, los registros eliminados.
- A continuación, en la primera pestaña de script, revertir la eliminación de pagos.
- En la tabla pagos, insertar un lote de 15 pagos, iniciando previamente la transacción y estableciendo un savepoint luego del registro #5, y otro luego del registro #10
- Validar en otra pestaña script, los registros insertados
- Eliminar el segundo savepoint
- Confirmar la transacción y vuelve a validar en otra pestaña script los registros insertados.


-- Crear la tabla de pagos
CREATE TABLE PAY (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    monto DECIMAL(10, 2),
    fecha DATE ,
    id_game INT 
);

INSERT INTO PAY (monto, fecha, id_game) VALUES
(100.50, '2023-11-14', 1),
(200.25, '2023-11-15', 2),
(300.75, '2023-11-16', 3),
(400.00, '2023-11-17', 4);


-- Iniciar una transacción
START TRANSACTION;

-- Eliminar tres pagos (asumiendo que conocemos los IDs de los pagos)
DELETE FROM PAY 
    WHERE id_game > 3;



-- ROLLBACK




INSERT INTO PAY (monto, fecha, id_game) VALUES
(100.50, '2023-10-14', 1),
(200.25, '2023-01-15', 2),
(300.75, '2023-12-16', 3),
(400.00, '2023-12-17', 4),
(500.50, '2023-11-18', 5),
(600.25, '2023-11-19', 1),
(700.75, '2023-11-20', 2);

SAVEPOINT __first_savepoint ;

INSERT INTO PAY (monto, fecha, id_game) VALUES
(800.00, '2023-11-21', 3),
(900.50, '2023-11-22', 4),
(1000.25, '2023-11-23', 5),
(1100.75, '2023-11-24', 1),
(1200.00, '2023-11-25', 2),
(1300.50, '2023-11-26', 3),
(1400.25, '2023-11-27', 4),
(1500.75, '2023-11-28', 5),
(1600.00, '2023-11-29', 1),
(1700.50, '2023-11-30', 2),
(1800.25, '2023-12-01', 3),
(1900.75, '2023-12-02', 4),
(2000.00, '2023-12-03', 5);

SAVEPOINT __second_savepoint; 
