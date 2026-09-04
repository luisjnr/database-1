CREATE DATABASE BDHOSPITAL;
USE BDHOSPITAL;

CREATE TABLE paciente(
	codpac INT AUTO_INCREMENT,
    nome VARCHAR(80),
    endereco VARCHAR(80),
	telefone VARCHAR(15),
    PRIMARY KEY(codpac)
);

CREATE TABlE medico(
	crmmedico VARCHAR(7),
    nome VARCHAR(80),
    endereco VARCHAR(80),
    especialidade VARCHAR(80),
    telefone VARCHAR(15),
    PRIMARY KEY(crmmedico)
);

CREATE TABLE convenio(
	codconv INT AUTO_INCREMENT,
    nome VARCHAR(80),
    PRIMARY KEY(codconv)
);

CREATE TABLE consulta(
	codcons INT AUTO_INCREMENT,
    data_hora datetime,
    codconv INT,
    codpac INT,
    crmmedico VARCHAR(7),
    PRIMARY KEY(codcons),
    FOREIGN KEY(codpac) REFERENCES paciente(codpac),
    FOREIGN KEY(crmmedico) REFERENCES medico(crmmedico),
    FOREIGN KEY(codconv) REFERENCES convenio(codconv)
);

CREATE TABLE possui(
	codpac INT,
    codconv INT,
    vencimento DATE,
    tipo VARCHAR(80),
    PRIMARY KEY(codpac, codconv),
    FOREIGN KEY(codpac) REFERENCES paciente(codpac),
	FOREIGN KEY(codconv) REFERENCES convenio(codconv)
);

CREATE TABLE atende(
	codconv INT,
    crmmedico VARCHAR(7),
    PRIMARY KEY(codconv, crmmedico),
    FOREIGN KEY(codconv) REFERENCES convenio(codconv),
	FOREIGN KEY(crmmedico) REFERENCES medico(crmmedico)
);