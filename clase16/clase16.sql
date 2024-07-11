-- CLASE 16
-- STORED PROCEDURES

## Procedimientos Almacenados: Conceptos Generales

**¿Qué son?**

Los procedimientos almacenados (SP) son programas compilados y almacenados en la base de datos. Permiten ejecutar una secuencia de instrucciones SQL como una sola unidad.

**Beneficios:**

* **Modularidad:** Agrupan lógica compleja en unidades reutilizables.
* **Rendimiento:** Se ejecutan en el servidor, evitando el envío de código SQL desde el cliente.
* **Seguridad:** Se pueden controlar los permisos de acceso al código.
* **Mantenimiento:** Facilitan la gestión y actualización del código.

**Sintaxis:**

```sql
CREATE PROCEDURE nombre_sp
(
    parámetros_de_entrada,
    parámetros_de_salida
)
AS
BEGIN
    -- Instrucciones SQL
END;
```

**Ejecución:**

* `EXEC nombre_sp` (sin parámetros)
* `EXEC nombre_sp @parámetro1, @parámetro2` (con parámetros)

## Implementación

**Preparación de Statements:**

```sql
CREATE PROCEDURE generar_prepare_statement
AS
BEGIN
    DECLARE @sql nvarchar(max);
    DECLARE @stmt int;

    -- Construye la consulta SQL
    SET @sql = 'SELECT * FROM tabla WHERE columna = @valor';

    -- Prepara la consulta
    EXEC sp_prepare @stmt, @sql, @params;

    -- Ejecuta la consulta
    EXEC @stmt;

    -- Libera la memoria
    EXEC sp_unprepare @stmt;
END;
```

## Ejemplos de Procedimientos Almacenados

**Básico:**

```sql
CREATE PROCEDURE obtener_fecha_actual
AS
BEGIN
    SELECT GETDATE();
END;
```

**Con Parámetro de Entrada:**

```sql
CREATE PROCEDURE obtener_cliente
(
    @id_cliente int
)
AS
BEGIN
    SELECT * FROM clientes WHERE id_cliente = @id_cliente;
END;
```

**Con Parámetro de Salida:**

```sql
CREATE PROCEDURE calcular_impuesto
(
    @precio float,
    @impuesto float OUT
)
AS
BEGIN
    SET @impuesto = @precio * 0.21;
END;
```

**Con Parámetros de Entrada y Salida:**

```sql
CREATE PROCEDURE actualizar_cliente
(
    @id_cliente int,
    @nombre nvarchar(50),
    @telefono nvarchar(15)
)
AS
BEGIN
    UPDATE clientes
    SET nombre = @nombre,
        telefono = @telefono
    WHERE id_cliente = @id_cliente;

    SELECT @nombre AS nombre_actualizado;
END;
```

CREATE DATABASE IF NOT EXISTS store_procedure ;
USE store_procedure ;

CREATE TABLE producto(
    id_producto INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,   nombre      VARCHAR(50)
);


DROP PROCEDURE IF EXISTS insertar_producto;

DELIMITER //

CREATE PROCEDURE insertar_producto (
  IN nombre_producto VARCHAR(50)
)
BEGIN
  DECLARE resultado INT DEFAULT 0;

  IF nombre_producto = '' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: no se pudo crear el producto indicado';
  ELSE
    INSERT INTO producto (nombre) VALUES (nombre_producto);
    SET resultado = ROW_COUNT();
  END IF;

  IF resultado = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: no se insertó ningún producto';
  END IF;

  SELECT * FROM producto ORDER BY id_producto DESC LIMIT 1;

END; //

DELIMITER ;


CALL insertar_producto('Producto 1');
CALL insertar_producto(''); -- ERROR: no se pudo crear el producto indicado