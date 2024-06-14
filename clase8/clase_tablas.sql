CREATE DATABASE IF NOT EXISTS facturacion;

USE facturacion;

CREATE TABLE producto(
	id_pro INT NOT NULL AUTO_INCREMENT,
	descipcion VARCHAR(245) DEFAULT 'PRODUCTO DESCONOCIDO',
	precio 	DECIMAL(10,2) DEFAULT 1000.50,
	categoria VARCHAR(245) NOT NULL ,
    PRIMARY KEY(id_pro)
);

CREATE TABLE cliente(
	cuit	VARCHAR(11) NOT NULL ,
	nombre	VARCHAR(250),
	email VARCHAR(250) UNIQUE,
	activo BOOLEAN DEFAULT TRUE,
	fecha_alta DATETIME DEFAULT (current_timestamp),
    PRIMARY KEY(cuit)
);

CREATE TABLE factura(
	id_factura INT NOT NULL AUTO_INCREMENT,
	fecha_factura DATE DEFAULT (CURRENT_DATE),
	id_cliente_cuit VARCHAR(11), 
	pagado BOOLEAN DEFAULT TRUE,
    PRIMARY KEY(id_factura)
);


CREATE TABLE link_factura_producto(
	id_producto INT NOT NULL ,
	id_factura INT NOT NULL,
	cantidad INT NOT NULL DEFAULT 10,
    PRIMARY KEY(id_producto,id_factura)
);

ALTER TABLE factura
	ADD CONSTRAINT fk_factura_cliente
    FOREIGN KEY (id_cliente_cuit) REFERENCES cliente(cuit);

ALTER TABLE link_factura_producto
	ADD CONSTRAINT fk_link_factura_producto
    FOREIGN KEY (id_producto) REFERENCES producto(id_pro);

ALTER TABLE link_factura_producto
	ADD CONSTRAINT fk_link_producto_factura
    FOREIGN KEY (id_factura) REFERENCES factura(id_factura);

