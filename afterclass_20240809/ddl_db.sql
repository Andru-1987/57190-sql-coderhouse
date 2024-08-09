-- DETALLE :
-- Al conectarme por terminal a el servidor
-- debo agregarle el flag (parametro) --local-infile = 1

-- mysql -u root -p --port 3306 --host 127.0.0.1 --local-infile=1

DROP  DATABASE IF EXISTS import_win;
CREATE DATABASE import_win;

USE import_win;

CREATE TABLE vehiculo_collision (
    id_crash INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    crash_date DATE,
    borough VARCHAR(200),
    zip_code VARCHAR(200),
    vehicle VARCHAR(200),
    vehicle_type VARCHAR(200)
);