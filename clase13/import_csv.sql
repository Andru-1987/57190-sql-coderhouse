
USE IMPORTACION;

SET GLOBAL local_infile = true;

LOAD    DATA LOCAL INFILE './categoria.csv'
        INTO TABLE  CATEGORIA 
            FIELDS TERMINATED   BY ','  ENCLOSED BY '"'
            LINES TERMINATED    BY '\n' 		 
            IGNORE 1 LINES
		(nombre, codigo_interno, estado_produccion) ;


LOAD    DATA LOCAL INFILE './producto.csv'
        INTO TABLE  PRODUCTO
            FIELDS TERMINATED   BY ','  ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
                (nombre, dimensiones, codigo, categoria_id) ;


SELECT *
FROM CATEGORIA LIMIT 10;

SELECT * 
FROM PRODUCTO LIMIT 10;
