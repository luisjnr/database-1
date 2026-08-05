CREATE DATABASE BDTAXI;
USE BDTAXI;

CREATE TABLE cliente(
	id INT AUTO_INCREMENT,
	nome VARCHAR(80),
	PRIMARY KEY(id)
);

CREATE TABLE cliente_particular(
	id INT,
    cpf VARCHAR(14),
    PRIMARY KEY(id),
    FOREIGN KEY(id) REFERENCES cliente(id)
);

CREATE TABLE cliente_empresa(
	id INT,
	cnpj VARCHAR(18),
	PRIMARY KEY(id),
    FOREIGN KEY(id) REFERENCES cliente(id)
);

CREATE TABLE taxi(
	placa VARCHAR(7),
    marca VARCHAR(30),
    modelo VARCHAR(30),
    anofab INTEGER,
    PRIMARY KEY(placa)
);

CREATE TABLE corrida(
	cliid INT,
    placa VARCHAR(7),
    dataPedido DATE,
    PRIMARY KEY(cliid, placa, dataPedido),
    FOREIGN KEY(cliid) REFERENCES cliente(id),
    FOREIGN KEY(placa) REFERENCES taxi(placa)
);

INSERT INTO cliente(nome) VALUES
	('Dorina'),
    ('DinoTech'),
    ('Asdrúbal'),
    ('Quincas'),
    ('Proj');
    
INSERT INTO cliente_particular VALUES
	(1, '567.387.387-44'),
    (3, '448.754.253-44'),
    (4, '576.456.123-55');
    
INSERT INTO cliente_empresa VALUES
	(2, '58.442.828/0001-02'),
    (5, '44.876.234/7789-10');
    
INSERT INTO taxi VALUES
	('DAE6534', 'Ford', 'Fiesta', 1999),
    ('DKL4598', 'Wolksvagen', 'Gol', 2001),
    ('DKL7878', 'Ford', 'Fiesta', 2001),
    ('JDM8776', 'Wolksvagen', 'Santana', 2002),
    ('JJM3692', 'Chevrolet', 'Corsa', 1999);
    
INSERT INTO corrida VALUES
	(1, 'DAE6534', '2003-02-15'),
    (5, 'JDM8776', '2003-02-18');
