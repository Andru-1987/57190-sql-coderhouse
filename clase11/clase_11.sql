DROP DATABASE IF EXISTS CLASE11;
CREATE DATABASE CLASE11;
USE CLASE11;

CREATE TABLE empleado (
    id_empleado INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60) DEFAULT 'EMPLEADO SIN NOMBRE',
    email  VARCHAR(100) UNIQUE NOT NULL,
    status_empleado BOOLEAN DEFAULT TRUE,
    salario DECIMAL(10,2) DEFAULT 6500000.99,
    fecha_alta DATE DEFAULT (CURRENT_DATE), -- 'yyyy-mm-dd'
    observacion TEXT ,
    -- PRIMARY KEY
    PRIMARY KEY(id_empleado)
);


-- INSERT INTO

INSERT INTO CLASE11.empleado
(id_empleado,
nombre,
status_empleado,
salario,
fecha_alta,
observacion,
email)
VALUES
(1,
"Guille Chiantore",
True,
100000,
'2024-10-10',
"Es un buen amigo",
"guille_chian@mail.com");

-- 
INSERT INTO CLASE11.empleado
(id_empleado,
nombre,
email,
status_empleado,
salario,
fecha_alta,
observacion
)
VALUES
(NULL,"pepe-sanki","pepe@mail.com",False,900000,current_date,"delantero");


INSERT INTO CLASE11.empleado
(nombre,
email,
status_empleado,
salario,
fecha_alta,
observacion
)
VALUES
("miyagi","mayagi@mail.com",True,800000,current_date,"maestro"),
("totoro","totoro@mail.com",False,700000,current_date,"dios de la muerte"),
("banana pueyrredon","cesar@mail.com",True,7000000,current_date,"gran cantante");


INSERT INTO CLASE11.empleado
(nombre,
email,
status_empleado,
salario,
fecha_alta,
observacion
)
VALUES
("miyagi-san","mayagi@mail.com",True,800000,current_date,"maestro");

SELECT
    *
FROM CLASE11.empleado;


INSERT INTO CLASE11.empleado
(nombre,
email,
status_empleado,
salario,
fecha_alta,
observacion
)
VALUES (DEFAULT,"usuario_x@mail.com",DEFAULT,DEFAULT,DEFAULT,"este es un empleado nuevo");

INSERT INTO CLASE11.empleado
(email,observacion)
VALUES
("nuevo_mail@mail.com","registro sin los otros campos");


-- insercion masiva con datos default

INSERT INTO CLASE11.empleado
(nombre, email, observacion) 
VALUES 
('Whitby', 'wsurby0@miitbeian.gov.cn', 'Malagasy'),
('Hyacinth', 'hstentiford1@craigslist.org', 'Khmer'),
('Murial', 'mbidwell2@skyrock.com', 'Tajik'),
('Nolan', 'nasken3@taobao.com', 'Tswana'),
('Gavan', 'gandreasson4@yelp.com', 'Chinese'),
('Koressa', 'kluce5@intel.com', 'French'),
('Dorian', 'dfergie6@eventbrite.com', 'Mongolian'),
('Bernard', 'balsobrook7@webnode.com', 'Gujarati'),
('Luca', 'lmawby8@51.la', 'Fijian'),
('Gay', 'gcockshutt9@time.com', 'Punjabi'),
('Brett', 'beilhermanna@yolasite.com', 'Tajik'),
('Horten', 'hheeranb@mapquest.com', 'Catalan'),
('Daniel', 'dbonusc@pagesperso-orange.fr', 'Oriya'),
('Arthur', 'aprendergrassd@hostgator.com', 'Korean'),
('Neils', 'nscoggine@forbes.com', 'Dhivehi'),
('Daniele', 'dosuairdf@joomla.org', 'Norwegian'),
('Merell', 'mkornelg@admin.ch', 'Bengali'),
('Jozef', 'jwallh@google.cn', 'German'),
('Wilhelm', 'wfeirni@state.tx.us', 'Moldovan'),
('Zarla', 'zkealeyj@mit.edu', 'Dutch'),
('Sandy', 'sphettek@businesswire.com', 'Icelandic'),
('Forester', 'ftalmanl@flickr.com', 'Kazakh'),
('Frankie', 'fvannim@posterous.com', 'Chinese'),
('Venus', 'vbendixn@state.gov', 'Pashto'),
('Celle', 'cvaneedeno@illinois.edu', 'Somali'),
('Marlo', 'mbebisp@umn.edu', 'Swati'),
('Eugenie', 'ecaponq@forbes.com', 'Hungarian'),
('Lillis', 'ltappr@mayoclinic.com', 'Luxembourgish'),
('Dagmar', 'ddys@cnet.com', 'Ndebele'),
('Buiron', 'bewlest@altervista.org', 'Malayalam'),
('Aurthur', 'alangeu@ibm.com', 'Maltese'),
('Blinny', 'bskipperv@un.org', 'Croatian'),
('Zulema', 'zdiruggerow@squidoo.com', 'Italian'),
('Francine', 'fgoodreadx@harvard.edu', 'Persian'),
('Eldon', 'edalescoy@nbcnews.com', 'Fijian'),
('Shela', 'stownsendz@qq.com', 'Gagauz'),
('Felix', 'fsheaf10@vinaora.com', 'Bosnian'),
('Mindy', 'mgetcliffe11@last.fm', 'Albanian'),
('Blaine', 'byerrington12@usgs.gov', 'Quechua'),
('Wilton', 'wrosenau13@psu.edu', 'Malay'),
('Rolfe', 'rbeade14@twitter.com', 'Afrikaans'),
('Yancy', 'ygeary15@bbc.co.uk', 'Portuguese'),
('Agnes', 'awilliam16@nih.gov', 'Polish'),
('Madeline', 'mhawkridge17@a8.net', 'Tsonga'),
('Sinclare', 'sconduit18@google.co.jp', 'Latvian'),
('Alfons', 'aprahl19@wired.com', 'Assamese'),
('Alexa', 'alotherington1a@wordpress.org', 'Pashto'),
('Glynda', 'ggallant1b@cloudflare.com', 'Spanish'),
('Humfrey', 'hglanvill1c@ed.gov', 'Czech'),
('Bren', 'bflaune1d@ezinearticles.com', 'Nepali'),
('Crichton', 'ckonrad1e@senate.gov', 'Malagasy'),
('Madeleine', 'mgorham1f@utexas.edu', 'Malayalam'),
('Brunhilde', 'bbrayshaw1g@xinhuanet.com', 'Georgian'),
('Trumann', 'tbooton1h@weibo.com', 'Tamil'),
('Deidre', 'dfelipe1i@vinaora.com', 'Oriya'),
('Natassia', 'nstovine1j@angelfire.com', 'Kashmiri'),
('Myca', 'mragless1k@cargocollective.com', 'Finnish'),
('Dore', 'dwimlett1l@xinhuanet.com', 'Zulu'),
('Rosa', 'rcromblehome1m@newyorker.com', 'Belarusian'),
('Darrin', 'dpoon1n@yahoo.co.jp', 'Tajik'),
('Kristin', 'kduggen1o@umich.edu', 'Luxembourgish'),
('Joyce', 'jdulinty1p@phoca.cz', 'Japanese'),
('Phylis', 'psenogles1q@tripod.com', 'Hebrew'),
('Tonnie', 'tladdle1r@npr.org', 'Afrikaans'),
('Radcliffe', 'rleeb1s@yale.edu', 'Luxembourgish'),
('Dani', 'dmcmillan1t@mapquest.com', 'Maltese'),
('Tobias', 'tbullene1u@ca.gov', 'Bulgarian'),
('Kylie', 'kwheildon1v@blogspot.com', 'Czech'),
('Kamilah', 'ksaville1w@census.gov', 'Hindi'),
('Ximenes', 'xmurthwaite1x@ted.com', 'Oriya'),
('Krysta', 'kcarbett1y@mapy.cz', 'Quechua'),
('Egon', 'ewyrall1z@vinaora.com', 'Papiamento'),
('Margalo', 'mmerrill20@washingtonpost.com', 'Macedonian'),
('Dani', 'dbeddow21@t-online.de', 'Italian'),
('Lil', 'lchaulk22@ed.gov', 'Bosnian'),
('Jennifer', 'jprendergast23@gnu.org', 'Tok Pisin'),
('Liliane', 'lmacalester24@sina.com.cn', 'Sotho'),
('Thorn', 'twildman25@eventbrite.com', 'Bulgarian'),
('Priscella', 'pfilippozzi26@oracle.com', 'Catalan'),
('Silvain', 'smunks27@github.io', 'Maltese'),
('Silvana', 'sblose28@yelp.com', 'Romanian'),
('Vale', 'vwhopples29@sourceforge.net', 'Arabic'),
('Maiga', 'mkinrade2a@vimeo.com', 'Maltese'),
('Ashli', 'agreensmith2b@drupal.org', 'Italian'),
('Immanuel', 'imecchi2c@domainmarket.com', 'Telugu'),
('Mar', 'mhaffner2d@cmu.edu', 'Latvian'),
('Jonathon', 'jbonar2e@deliciousdays.com', 'Czech'),
('Cherilynn', 'cputterill2f@ucoz.ru', 'Hindi'),
('Perrine', 'pgarahan2g@wikipedia.org', 'Hiri Motu');


-- 
-- UPDATE
UPDATE CLASE11.empleado
	SET 
		salario = 4000000 ,
        observacion = "ya sos un tipo que tiene status senior"
    WHERE email LIKE "guille_chian@mail.com";


SET SQL_SAFE_UPDATES = FALSE;


UPDATE CLASE11.empleado
	SET
		salario = 2000
	WHERE
		email LIKE '%.com';

-- DELETE
DELETE FROM CLASE11.empleado
WHERE nombre LIKE 'm%';


TRUNCATE TABLE CLASE11.empleado;






