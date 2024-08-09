USE import_win;

DROP ROLE IF EXISTS	dev, sales;
CREATE ROLE dev, sales;

GRANT SELECT ON import_win.vw_zip_car TO dev;
GRANT SELECT, INSERT ON import_win.* TO sales;

-- create user to validate
DROP USER IF EXISTS 'max'@'%';
CREATE USER 'max'@'%' IDENTIFIED BY '123';
GRANT dev TO 'max'@'%' ;

SET DEFAULT ROLE dev TO 'max'@'%';
FLUSH PRIVILEGES ;


REVOKE dev FROM 'max'@'%' ;

GRANT sales TO 'max'@'%' ;
SET DEFAULT ROLE sales TO 'max'@'%';
FLUSH PRIVILEGES ;