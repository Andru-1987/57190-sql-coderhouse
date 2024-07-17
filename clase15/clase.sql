DROP DATABASE IF EXISTS functions;
CREATE DATABASE functions ;

USE functions;


CREATE TABLE categorias(
	id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY 
,	nombre_categoria VARCHAR(100)
,	descuento FLOAT(6,2) DEFAULT 10.00
);

INSERT INTO categorias (
		nombre_categoria
    ,	descuento
) VALUES
("smart TV",DEFAULT),
("verduleria", 50.00),
("misc", 20.00);


CREATE TABLE productos(
	id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY 
,   nombre_producto VARCHAR(100)
,   precio_producto FLOAT(6,2) DEFAULT 100.88
,	categoria INT DEFAULT 2
);

INSERT INTO productos 
(nombre_producto,categoria)
VALUES
('televisor',1),
('remolacha',DEFAULT),
('brocoli',DEFAULT),
('caballo', 3);

INSERT INTO productos 
(nombre_producto,categoria)
VALUES
('fantasma', NULL);

SELECT
* FROM productos;

SELECT 
* FROM categorias;

--

SELECT 
	id_producto
,	nombre_producto
,	CONCAT(
		"$ ",
        REPLACE(CAST(precio_producto AS CHAR(6)),'.',',' ) ,
        " (15% Discount)") AS precio_display
FROM productos;


DROP FUNCTION IF EXISTS functions.ventas_template_discount;
ventas_template_discount
DELIMITER //
CREATE FUNCTION functions.ventas_template_discount 
(precio FLOAT(6,2), descuento VARCHAR(100))
	RETURNS VARCHAR(50)
    DETERMINISTIC
    NO SQL
BEGIN
	DECLARE remplazo VARCHAR(20);
    DECLARE valor_retorno VARCHAR(50);
    
    SET remplazo = REPLACE(CAST(precio AS CHAR(6)),'.',',' ) ;
	SET valor_retorno = CONCAT("$ ", remplazo," (", descuento,")");
    
    RETURN valor_retorno;
END; //

DELIMITER ;

    
    
SELECT 
	id_producto
,	nombre_producto
,	functions.ventas_template_discount(precio_producto, '15% Descuento')
FROM productos;

--  

DROP FUNCTION IF EXISTS functions.discount_per_category;
ventas_template_discount
DELIMITER //
CREATE FUNCTION functions.discount_per_category
(precio FLOAT(6,2), categoria INT)
	RETURNS VARCHAR(50)
    DETERMINISTIC
    READS SQL DATA
BEGIN
	DECLARE remplazo VARCHAR(20);
    DECLARE valor_retorno VARCHAR(50);
        
	IF categoria IS NULL THEN
		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT  = 'NO TENGO CATEGORIA :P', MYSQL_ERRNO = 1000;
        RETURN "NO DISCOUNT";
    END IF;
    
	SET remplazo = REPLACE(CAST(precio AS CHAR(6)),'.',',' ) ;
	
    SELECT 
		ROUND(precio * (1 - descuento/100),2) INTO @descuento
    FROM functions.categorias
    WHERE id_categoria = categoria ;
    
	SET valor_retorno = CONCAT("$ ",
		@descuento,
		" con descuento",
		", precio de lista:",
        "$ ",
        remplazo
        );
    RETURN valor_retorno;
END; //

DELIMITER ;


SELECT 
	id_producto
,	nombre_producto
,	functions.discount_per_category(precio_producto, categoria) AS descuento
FROM productos;




    
    
 



