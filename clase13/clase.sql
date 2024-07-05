DROP DATABASE IF EXISTS IMPORTACION;
CREATE DATABASE IMPORTACION;
USE IMPORTACION;



CREATE TABLE PRODUCTO(
	producto_id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(200),
    dimensiones VARCHAR(20) NOT NULL DEFAULT "100X100",
    codigo VARCHAR(12),
    categoria_id INT,
    PRIMARY KEY (producto_id)
);


CREATE TABLE CATEGORIA(
	categoria_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    codigo_interno VARCHAR(12),
    estado_produccion BOOL DEFAULT TRUE,
    PRIMARY KEY(categoria_id)
);

ALTER TABLE PRODUCTO
	ADD CONSTRAINT fk_producto_cagegoria
    FOREIGN KEY (categoria_id) REFERENCES CATEGORIA(categoria_id);
    
    
    

-- INSERCION 
USE IMPORTACION;

INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Painting & Vinyl Wall Covering', '888-uuuh', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('EIFS', 'xx-129-92', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Soft Flooring and Base', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Granite Surfaces', 'xx-129-92', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Epoxy Flooring', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Plumbing & Medical Gas', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Roofing (Asphalt)', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Roofing (Asphalt)', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Hard Tile & Stone', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Framing (Steel)', 'xx-129-92', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Hard Tile & Stone', '888-uuuh', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Drywall & Acoustical (MOB)', 'xx-129-92', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Asphalt Paving', '888-uuuh', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Doors, Frames & Hardware', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Glass & Glazing', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Structural and Misc Steel (Fabrication)', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Masonry', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Electrical and Fire Alarm', '228-kdbc', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Waterproofing & Caulking', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Epoxy Flooring', '228-kdbc', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Overhead Doors', '228-kdbc', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Roofing (Asphalt)', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Painting & Vinyl Wall Covering', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Soft Flooring and Base', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Rebar & Wire Mesh Install', '888-uuuh', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Landscaping & Irrigation', 'xx-129-92', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Granite Surfaces', 'xx-129-92', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Fire Protection', 'xx-129-92', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Masonry & Precast', 'xx-129-92', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Prefabricated Aluminum Metal Canopies', '228-kdbc', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Termite Control', 'xx-129-92', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Electrical and Fire Alarm', '888-uuuh', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Prefabricated Aluminum Metal Canopies', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Framing (Wood)', '888-uuuh', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Framing (Steel)', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Electrical and Fire Alarm', 'xx-129-92', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Site Furnishings', '228-kdbc', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Exterior Signage', '888-uuuh', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Construction Clean and Final Clean', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Plumbing & Medical Gas', '888-uuuh', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Landscaping & Irrigation', 'xx-129-92', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Overhead Doors', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Temp Fencing, Decorative Fencing and Gates', 'xx-129-92', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Structural and Misc Steel (Fabrication)', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Fire Sprinkler System', '228-kdbc', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Retaining Wall and Brick Pavers', '228-kdbc', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Painting & Vinyl Wall Covering', 'xx-129-92', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Fire Sprinkler System', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Electrical', 'xx-129-92', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Drywall & Acoustical (MOB)', 'xx-129-92', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Structural and Misc Steel (Fabrication)', '228-kdbc', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Retaining Wall and Brick Pavers', '888-uuuh', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Landscaping & Irrigation', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Granite Surfaces', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Exterior Signage', '228-kdbc', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('HVAC', '888-uuuh', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Roofing (Metal)', 'xx-129-92', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Masonry & Precast', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Elevator', '888-uuuh', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Wall Protection', '888-uuuh', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Landscaping & Irrigation', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Electrical', '228-kdbc', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Fire Sprinkler System', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('RF Shielding', 'xx-129-92', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Ornamental Railings', '228-kdbc', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Waterproofing & Caulking', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Fire Protection', 'xx-129-92', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Construction Clean and Final Clean', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Ornamental Railings', 'xx-129-92', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Drywall & Acoustical (MOB)', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Roofing (Metal)', '228-kdbc', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Drilled Shafts', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Granite Surfaces', 'xx-129-92', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Painting & Vinyl Wall Covering', 'xx-129-92', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Epoxy Flooring', '888-uuuh', true);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Site Furnishings', '228-kdbc', false);
INSERT INTO CATEGORIA (nombre, codigo_interno, estado_produccion) VALUES ('Roofing (Metal)', '228-kdbc', false);



-- -->

INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Beer - Sleemans Honey Brown', '50x79', '1202347290', 15);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cherries - Bing, Canned', '50x79', '5275795254', 47);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Worcestershire Sauce', '50x79', '8972608343', 47);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cheese - Mix', '200x50', '8932075840', 21);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cucumber - English', '50x79', '2720514500', 63);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Broom - Corn', '100x100', '7600393212', 25);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('External Supplier', '100x100', '6680482208', 77);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Bar Bran Honey Nut', 'out', '2856084451', 38);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Soup - Cream Of Broccoli', '50x79', '2228146927', 10);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Pork - Belly Fresh', '100x100', '4190640050', 61);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Coriander - Ground', '50x79', '2815386364', 23);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cheese - Camembert', '50x79', '1871918111', 59);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Pastry - Cherry Danish - Mini', '50x79', '6535545199', 16);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Halibut - Fletches', 'out', '3444792492', 72);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Pork - Kidney', 'out', '2374907600', 12);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Stock - Beef, Brown', '50x79', '7162793339', 35);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Langers - Cranberry Cocktail', 'out', '3648272624', 57);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cake - Lemon Chiffon', '200x50', '1206087757', 32);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Olives - Green, Pitted', '50x79', '3841349064', 47);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cheese - Marble', '200x50', '3558113802', 73);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cream Of Tartar', '100x100', '2402200790', 36);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Tea - English Breakfast', '100x100', '0401342859', 55);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cheese - Grie Des Champ', 'out', '8645781484', 35);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Chickensplit Half', '200x50', '4115303336', 68);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Beer - Fruli', '100x100', '9432090310', 6);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Oregano - Fresh', '100x100', '0005845696', 54);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Flour - Pastry', '200x50', '2568776307', 51);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Beans - Fine', 'out', '1083466232', 41);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Relish', 'out', '6845800901', 73);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Sauerkraut', '100x100', '1102802050', 60);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Beans - Long, Chinese', '50x79', '3252072467', 71);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Vol Au Vents', '50x79', '7382352234', 45);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cup Translucent 9 Oz', 'out', '5707570314', 28);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Ham - Virginia', '50x79', '9173510696', 56);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Wine - Mondavi Coastal Private', 'out', '3478447755', 35);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Sauce - Cranberry', '50x79', '8008467495', 31);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Oregano - Dry, Rubbed', '100x100', '4917998840', 28);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Coffee - Hazelnut Cream', '100x100', '8338982865', 24);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Rum - Cream, Amarula', '100x100', '4365370154', 11);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Plate Pie Foil', 'out', '4526415715', 13);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Rum - Coconut, Malibu', '50x79', '3788955716', 52);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Fennel - Seeds', 'out', '7048530863', 11);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Fireball Whisky', '50x79', '4724443278', 64);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Carbonated Water - Blackberry', 'out', '0280179022', 69);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Pasta - Fettuccine, Dry', '50x79', '0740886495', 58);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Bread Crumbs - Japanese Style', '100x100', '4510903030', 77);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Fudge - Chocolate Fudge', '200x50', '7778011395', 44);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Soap - Mr.clean Floor Soap', '200x50', '1605825409', 25);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Pepper - Pablano', '200x50', '9669149452', 10);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Pepper - Red Chili', 'out', '5911149826', 31);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Wine - Red, Gallo, Merlot', 'out', '3696428337', 69);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Dehydrated Kelp Kombo', '100x100', '0358682738', 43);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Wine - Riesling Dr. Pauly', 'out', '7867286462', 26);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Oil - Food, Lacquer Spray', '100x100', '5389962087', 28);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cheese - Feta', 'out', '3061672486', 17);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cheese - Marble', 'out', '9974948630', 29);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Pepsi - Diet, 355 Ml', '100x100', '4126917373', 6);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cheese - Swiss Sliced', 'out', '4087794296', 77);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Flour - Strong', '100x100', '8006360014', 11);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Wine - Cotes Du Rhone Parallele', 'out', '0041532945', 16);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Pork - Smoked Back Bacon', '200x50', '9221067084', 30);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Tea - Herbal Sweet Dreams', '100x100', '4247761641', 15);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Oil - Safflower', 'out', '8109960189', 30);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Oven Mitts 17 Inch', 'out', '0362751188', 37);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Garbage Bags - Black', 'out', '6733451816', 19);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Nectarines', '100x100', '7033413378', 13);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Grand Marnier', 'out', '1659365147', 20);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Raisin - Golden', '200x50', '5060710548', 30);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Seedlings - Buckwheat, Organic', '100x100', '7798552693', 75);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Wine - Red, Cabernet Sauvignon', '100x100', '7634395021', 21);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Lamb - Shoulder, Boneless', '50x79', '9797594009', 20);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Veal - Heart', 'out', '8561396466', 45);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Swordfish Loin Portions', '50x79', '7775678380', 29);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Jam - Blackberry, 20 Ml Jar', '100x100', '9913422051', 19);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Beer - Blue', 'out', '7186956882', 60);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Lobster - Tail 6 Oz', 'out', '0546237614', 35);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Wine - Sogrape Mateus Rose', '100x100', '8070152850', 62);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Wine - Pinot Noir Stoneleigh', '200x50', '8399848700', 35);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Rosemary - Primerba, Paste', '100x100', '6014016945', 68);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Chips - Doritos', '200x50', '3353825045', 76);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cumin - Ground', '100x100', '5254344377', 23);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Stock - Beef, Brown', '50x79', '4599939579', 64);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Chicken - Livers', '200x50', '9583481106', 11);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Beef - Bones, Cut - Up', '50x79', '3543243608', 28);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Toamtoes 6x7 Select', '200x50', '6677131114', 2);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Squid Ink', '100x100', '5353638689', 40);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Temperature Recording Station', '50x79', '6032375749', 73);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Wine - Chablis 2003 Champs', '100x100', '8199767073', 3);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Appetizer - Southwestern', '100x100', '4354713535', 13);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Pan Grease', '100x100', '7653478905', 4);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Soup - Campbells, Cream Of', '50x79', '1474687156', 22);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Carroway Seed', '200x50', '8315722859', 71);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Cheese - Colby', 'out', '5158423148', 32);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Persimmons', 'out', '3752761210', 19);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('The Pop Shoppe - Cream Soda', 'out', '3937664513', 39);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Muffin - Banana Nut Individual', '50x79', '9324642391', 1);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Lambcasing', 'out', '2278717413', 59);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Wine - Chardonnay Mondavi', '50x79', '4740620790', 44);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Bread - White, Unsliced', 'out', '5423245265', 64);
INSERT INTO PRODUCTO (nombre, dimensiones, codigo, categoria_id) VALUES ('Chinese Foods - Chicken', '200x50', '8488150296', 44);


