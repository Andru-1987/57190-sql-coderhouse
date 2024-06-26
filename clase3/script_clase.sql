USE coderhouse_gamers;


-- CONCEPTOS BASICOS DE QUE ES UNA QUERY:
-- ES UNA FORMA IMPERATIVA DE OBTENER DATOS AL SERVIDOR
-- SIEMPRE SE MANEJAN BAJO SENTENCIAS IMPERATIVAS
-- NO EXISTE EL CTRL + Z  

SELECT *
    FROM
    <SCHEMA.TABLE>
;

-- FILTRADO DE DATOS
-- SENTENCIA WHERE :: AYUDA POR MEDIO DE COMPARADPRES Y OPERADORES 
-- A REALIZAR UNA OPERACION DE FILTRADO DE DATOS

SELECT [* | ...COLUMNS]
    FROM
    <SCHEMA.TABLE>

WHERE   
    COL_NAME = VALUE 
;


-- PRACTICA CON EL WHERE Y VERIFICAR QUE ES LO QUE ENTREGA EN LOS REGISTROS
-- EJEMPLOAS PARA VER EN CLASE
SELECT
    *
FROM
    SYSTEM_USER
WHERE
    FIRST_NAME = 'Gillie';

-- RECOMENDACION SOBRE IDENTACION Y TRAILING COMAS

SELECT
        FIRST_NAME
    ,   LAST_NAME
FROM
    SYSTEM_USER
WHERE
    id_user_type = 334;

SELECT
        FIRST_NAME
    ,   LAST_NAME
FROM
    SYSTEM_USER
WHERE
    id_SYSTEM_USER = 56;

SELECT
    *
FROM
    SYSTEM_USER
WHERE
    FIRST_NAME = 'Reinaldos';

-- 