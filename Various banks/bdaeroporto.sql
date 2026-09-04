CREATE DATABASE BDAEROPORTO;
USE BDAEROPORTO;

CREATE TABLE aeroporto(
	codaero INT AUTO_INCREMENT,
    nome VARCHAR(80),
    cidade VARCHAR(20),
    pais VARCHAR(20),
    PRIMARY KEY(codaero)
);

CREATE TABLE funcionario(
	matriculafunc INT AUTO_INCREMENT,
    nome VARCHAR(80),
    salario INT,
    datacontrato DATE,
    especialidade VARCHAR(15),
    codaero INT,
    PRIMARY KEY(matriculafunc),
    FOREIGN KEY(codaero) REFERENCES aeroporto(codaero)
);

CREATE TABLE aeronave(
	matriculaaero INT AUTO_INCREMENT,
    modelo VARCHAR(40),
    fabricante VARCHAR(20),
    capacidade INT,
    codaero INT,
    PRIMARY KEY(matriculaaero),
    FOREIGN KEY(codaero) REFERENCES aeroporto(codaero)
);

CREATE TABLE voo(
	codvoo INT AUTO_INCREMENT,
    origem VARCHAR(20),
    destino VARCHAR(20),
    horariopart TIME,
    horariocheg TIME,
	matriculaaero INT,
    codaero INT,
    PRIMARY KEY(codvoo),
    FOREIGN KEY(matriculaaero) REFERENCES aeronave(matriculaaero),
    FOREIGN KEY(codaero) REFERENCES aeroporto(codaero)
);

CREATE TABLE passageiro(
	codbag INT AUTO_INCREMENT,
    cpf VARCHAR(15),
    nome VARCHAR(80),
    idade INT,
    cidade VARCHAR(80),
    codvoo INT,
    matriculaaero INT,
    PRIMARY KEY(codbag, cpf),
    FOREIGN KEY(codvoo) REFERENCES voo(codvoo),
    FOREIGN KEY(matriculaaero) REFERENCES aeronave(matriculaaero)
);

CREATE TABLE embarque(
	matriculaaero INT,
    codvoo INT,
    PRIMARY KEY(matriculaaero, codvoo),
    FOREIGN KEY(codvoo) REFERENCES voo(codvoo),
    FOREIGN KEY(matriculaaero) REFERENCES aeronave(matriculaaero)
);

ALTER TABLE aeronave ADD cor VARCHAR(10);
ALTER TABLE aeroporto CHANGE COLUMN cidade cep VARCHAR(9);
ALTER TABLE passageiro CHANGE COLUMN idade datanasc DATE;
ALTER TABLE passageiro CHANGE COLUMN cidade endereco VARCHAR(80);

INSERT INTO aeroporto(nome, cep, pais) VALUES
	('luis', '39470-000', 'brasil'),
	('maria', '01000-000', 'brasil'),
	('joão', '30110-000', 'brasil'),
	('ana', '20040-000', 'brasil'),
	('carlos', '40020-000', 'brasil'),
	('juliana', '80010-000', 'brasil'),
	('pedro', '50030-000', 'brasil'),
	('camila', '60020-000', 'brasil'),
	('rafael', '69005-000', 'brasil'),
	('fernanda', '90010-000', 'brasil');
    
INSERT INTO funcionario(nome, salario, datacontrato, especialidade, codaero) VALUES
	('Bruno', 3000, '2004-03-19', 'piloto', 1),
	('Patrícia', 4200, '2008-07-15', 'comissário', 2),
	('Ricardo', 5500, '2012-11-03', 'co-piloto', 3),
	('Larissa', 3800, '2015-01-28', 'comissário', 4),
	('Gustavo', 7200, '2010-09-10', 'piloto', 5),
	('Beatriz', 4600, '2018-06-22', 'co-piloto', 6),
	('André', 3900, '2020-04-14', 'comissário', 7),
	('Natália', 6800, '2016-12-05', 'piloto', 8),
	('Diego', 5100, '2019-08-30', 'co-piloto', 9),
	('Renata', 4100, '2021-02-17', 'comissário', 10);
    
INSERT INTO aeronave(modelo, fabricante, capacidade, cor, codaero) VALUES
	('Boeing 737-800', 'Boeing', 189, 'Branco', 1),
	('Airbus A320neo', 'Airbus', 186, 'Azul', 2),
	('Embraer E195-E2', 'Embraer', 146, 'Cinza', 3),
	('Boeing 787-9', 'Boeing', 296, 'Branco', 4),
	('Airbus A330-900', 'Airbus', 287, 'Prata', 5),
	('ATR 72-600', 'ATR', 72, 'Branco', 6),
	('Cessna Grand Caravan', 'Cessna', 14, 'Vermelho', 7),
	('Bombardier CRJ900', 'Bombardier', 90, 'Azul', 8),
	('Airbus A350-900', 'Airbus', 325, 'Preto', 9),
	('Boeing 777-300ER', 'Boeing', 396, 'Branco', 10);
    
INSERT INTO voo(origem, destino, horariopart, horariocheg, matriculaaero, codaero) VALUES
	('São Paulo', 'Rio de Janeiro', '08:00:00', '09:00:00', 1, 1),
	('Brasília', 'Salvador', '10:30:00', '12:15:00', 2, 2),
	('Belo Horizonte', 'Curitiba', '07:45:00', '09:20:00', 3, 3),
	('Recife', 'Fortaleza', '13:00:00', '14:10:00', 4, 4),
	('Manaus', 'Belém', '15:20:00', '17:00:00', 5, 5),
	('Porto Alegre', 'Florianópolis', '06:30:00', '07:40:00', 6, 6),
	('Goiânia', 'Campo Grande', '11:15:00', '12:30:00', 7, 7),
	('Vitória', 'São Luís', '09:50:00', '12:40:00', 8, 8),
	('Natal', 'João Pessoa', '14:00:00', '14:50:00', 9, 9),
	('Maceió', 'Aracaju', '16:10:00', '17:00:00', 10, 10);
    
INSERT INTO passageiro(cpf, codbag, nome, datanasc, endereco, codvoo) VALUES
	('123.456.789-01', 1, 'João Silva', '1995-03-15', 'Rua das Flores, 123', 1),
	('234.567.890-12', 2, 'Maria Oliveira', '1992-07-21', 'Av. Brasil, 456', 2),
	('345.678.901-23', 3, 'Pedro Santos', '1988-11-09', 'Rua Minas Gerais, 789', 3),
	('456.789.012-34', 4, 'Ana Costa', '1999-01-30', 'Rua Rio Branco, 321', 4),
	('567.890.123-45', 5, 'Carlos Pereira', '1985-05-18', 'Av. Central, 654', 5),
	('678.901.234-56', 6, 'Juliana Almeida', '1997-09-12', 'Rua São José, 987', 6),
	('789.012.345-67', 7, 'Bruno Souza', '1993-12-03', 'Av. Independência, 147', 7),
	('890.123.456-78', 8, 'Fernanda Lima', '1990-04-26', 'Rua das Acácias, 258', 8),
	('901.234.567-89', 9, 'Ricardo Gomes', '1987-08-14', 'Rua XV de Novembro, 369', 9),
	('012.345.678-90', 10, 'Patrícia Rocha', '1996-10-07', 'Av. Amazonas, 741', 10);
    
INSERT INTO embarque(matriculaaero, codvoo) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10);

-- mostrar voos de um aeroporto --
SELECT * FROM aeroporto JOIN voo ON aeroporto.codaero = voo.codvoo; 

-- mostrar passageiros relacionados á um voo --
SELECT * FROM passageiro JOIN voo ON passageiro.cpf = voo.codvoo; 

-- mostrar funcionarios relacionados --
SELECT * FROM funcionario JOIN voo ON funcionario.matriculafunc = voo.codvoo; 

-- mostrar aeronave relacionada ao voo --
SELECT * FROM aeronave JOIN voo ON aeronave.matriculaaero = voo.codvoo; 

-- mostrar em qual aeronave o passageiro irá voar -- 
SELECT * FROM passageiro JOIN aeronave ON passageiro.cpf = aeronave.matriculaaero; 	

-- mostrar onde estão alocadas as aeronaves --
SELECT * FROM aeroporto JOIN aeronave ON aeroporto.codaero = aeronave.matriculaaero; 

-- mostrar funcionários e seus respectivos aeroportos --
SELECT * FROM funcionario JOIN aeronave ON funcionario.matriculafunc = aeronave.matriculaaero; 

-- mostrar em qual aeroporto o passageiro irá pegar seu voo --
SELECT * FROM funcionario JOIN aeroporto ON funcionario.matriculafunc = aeroporto.codaero; 

-- mostrar voos e aeronaves --
SELECT * FROM voo, aeronave;

-- mostrar a bagagem de algum passageiro --
SELECT codbag, COUNT(*) FROM passageiro WHERE cpf = '123.456.789-01' GROUP BY codbag;
