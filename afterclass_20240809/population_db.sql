USE import_win;

SET GLOBAL local_infile = true;

LOAD DATA LOCAL INFILE '/data/dataset.csv' 
INTO TABLE import_win.vehiculo_collision 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS
(   @crash_date
,   @borough
,   @zip_code
,   @vehicle
,   @vehicle_type)
SET 
    crash_date = NULLIF(@crash_date,'')
,   borough = NULLIF(@borough,'')
,   zip_code = NULLIF(@zip_code,'')
,   vehicle = NULLIF(@vehicle,'')
,   vehicle_type = NULLIF(@vehicle_type,'')
;


SELECT
    crash_date
,   borough
,   zip_code
,   vehicle
,   vehicle_type
FROM import_win.vehiculo_collision LIMIT 100;



CREATE VIEW import_win.vw_zip_car 
    AS
        SELECT
            crash_date
        ,   zip_code
        ,   vehicle
       
        FROM import_win.vehiculo_collision;





