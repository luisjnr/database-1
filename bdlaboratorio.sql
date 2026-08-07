CREATE DATABASE BDLABORATORIO;
USE BDLABORATORIO;

CREATE TABLE ambiente(
	codamb INT AUTO_INCREMENT,
    nome VARCHAR(80),
    localizacao VARCHAR(80),
	PRIMARY KEY(codamb)
);

CREATE TABLE pesquisador(
	matriculapesquisador INT AUTO_INCREMENT,
    nome VARCHAR(80),
    titulacao VARCHAR(80),
    area VARCHAR(80),
    codamb INT,
    PRIMARY KEY(matriculapesquisador),
    FOREIGN KEY(codamb) REFERENCES ambiente(codamb)
);

CREATE TABLE dispositivo(
	iddispositivo INT AUTO_INCREMENT,
    fabricante VARCHAR(80),
    modelo VARCHAR(80),
    dataaquisicao DATE,
    PRIMARY KEY(iddispositivo)
);

CREATE TABLE experimento(
	codamb INT,
    matriculapesquisador INT,
    iddispositivo INT,
    tarefa VARCHAR(80),
    horarioini TIME,
    horarioterm TIME, 
    resultado VARCHAR(80),
    dataexp DATE,
    tipo VARCHAR(80),
    prioridade VARCHAR(10),
    PRIMARY KEY(codamb, matriculapesquisador, iddispositivo),
    FOREIGN KEY(codamb) REFERENCES ambiente(codamb),
    FOREIGN KEY(matriculapesquisador) REFERENCES pesquisador(matriculapesquisador),
    FOREIGN KEY(iddispositivo) REFERENCES dispositivo(iddispositivo)
);

ALTER TABLE ambiente ADD descricao VARCHAR(100);
ALTER TABLE dispositivo CHANGE COLUMN modelo anomodelo VARCHAR(40);
ALTER TABLE pesquisador CHANGE COLUMN titulacao qualificacao VARCHAR(80);
ALTER TABLE pesquisador CHANGE COLUMN area especializacao VARCHAR(80);

INSERT INTO ambiente(nome, localizacao, descricao) VALUES
	('Laboratório de Informática 1', 'Bloco A - Sala 101', 'Laboratório destinado às aulas de programação e desenvolvimento de software.'),
	('Laboratório de Redes', 'Bloco A - Sala 102', 'Espaço equipado para estudos e práticas de redes de computadores.'),
	('Laboratório de Hardware', 'Bloco B - Sala 201', 'Ambiente para montagem, manutenção e testes de equipamentos computacionais.'),
	('Laboratório de Eletrônica', 'Bloco B - Sala 202', 'Laboratório voltado para experimentos com circuitos e dispositivos eletrônicos.'),
	('Laboratório de Química', 'Bloco C - Sala 301', 'Espaço para realização de análises e experimentos químicos.'),
	('Laboratório de Física', 'Bloco C - Sala 302', 'Laboratório destinado a experimentos de mecânica, óptica e eletricidade.'),
	('Laboratório de Biologia', 'Bloco D - Sala 401', 'Ambiente equipado para pesquisas em biologia e microbiologia.'),
	('Laboratório de Robótica', 'Bloco D - Sala 402', 'Espaço destinado ao desenvolvimento e programação de robôs.'),
	('Laboratório de Pesquisa', 'Bloco E - Sala 501', 'Laboratório para projetos científicos e pesquisas multidisciplinares.'),
	('Laboratório Multidisciplinar', 'Bloco E - Sala 502', 'Ambiente compartilhado para atividades práticas de diferentes áreas do conhecimento.');
    
INSERT INTO pesquisador(nome, qualificacao, especializacao, codamb) VALUES
	('Ana Paula Costa', 'Doutorado', 'Inteligência Artificial', 1),
	('Bruno Henrique Silva', 'Mestrado', 'Redes de Computadores', 2),
	('Carla Mendes', 'Doutorado', 'Arquitetura de Computadores', 3),
	('Diego Almeida', 'Especialização', 'Eletrônica Digital', 4),
	('Fernanda Rocha', 'Doutorado', 'Química Orgânica', 5),
	('Gustavo Oliveira', 'Mestrado', 'Física Experimental', 6),
	('Helena Martins', 'Doutorado', 'Biologia Molecular', 7),
	('Igor Souza', 'Mestrado', 'Robótica', 8),
	('Juliana Ferreira', 'Pós-Doutorado', 'Ciência de Dados', 9),
	('Lucas Pereira', 'Especialização', 'Sistemas Embarcados', 10);
    
INSERT INTO dispositivo(fabricante, anomodelo, dataaquisicao) VALUES
	('Dell', 'OptiPlex 7010', '2022-03-15'),
	('HP', 'ProDesk 400 G7', '2021-08-22'),
	('Lenovo', 'ThinkCentre M720', '2023-01-10'),
	('Apple', 'Mac Mini M2', '2024-02-05'),
	('Asus', 'ExpertCenter D5', '2022-11-18'),
	('Acer', 'Veriton X2660G', '2021-06-30'),
	('Samsung', 'Galaxy Book4', '2024-04-12'),
	('Intel', 'NUC 13 Pro', '2023-09-27'),
	('LG', 'UltraPC 17', '2022-12-08'),
	('Positivo', 'Master C6400', '2021-10-14');
    
INSERT INTO experimento(codamb, matriculapesquisador, iddispositivo, tarefa, horarioini, horarioterm, resultado, dataexp, tipo, prioridade) VALUES
	(7, 3, 9, 'Treinamento de modelo de IA', '08:00:00', '11:30:00', 'Concluído com sucesso', '2026-03-10', 'Pesquisa', 'Alta'),
	(2, 8, 1, 'Configuração de servidores', '09:00:00', '12:00:00', 'Infraestrutura validada', '2026-03-12', 'Desenvolvimento', 'Média'),
	(10, 5, 6, 'Teste de desempenho de hardware', '13:30:00', '16:00:00', 'Desempenho satisfatório', '2026-03-15', 'Teste', 'Alta'),
	(4, 1, 8, 'Análise de circuitos eletrônicos', '10:00:00', '12:30:00', 'Falhas identificadas', '2026-03-18', 'Análise', 'Alta'),
	(9, 10, 2, 'Síntese de compostos químicos', '14:00:00', '17:00:00', 'Reação concluída', '2026-03-20', 'Pesquisa', 'Média'),
	(1, 6, 5, 'Experimento de ondas mecânicas', '08:30:00', '10:30:00', 'Resultados compatíveis', '2026-03-22', 'Experimento', 'Baixa'),
	(8, 2, 10, 'Cultivo de microrganismos', '09:15:00', '15:00:00', 'Crescimento observado', '2026-03-25', 'Pesquisa', 'Alta'),
	(5, 9, 4, 'Programação de robô autônomo', '13:00:00', '17:30:00', 'Objetivos alcançados', '2026-03-27', 'Desenvolvimento', 'Alta'),
	(3, 7, 3, 'Análise estatística de dados', '10:00:00', '12:45:00', 'Relatório gerado', '2026-03-29', 'Análise', 'Média'),
	(6, 4, 7, 'Validação de sistema embarcado', '15:00:00', '18:00:00', 'Sistema aprovado', '2026-03-31', 'Validação', 'Baixa');
    
-- mostrar pesquisadores --    
SELECT * FROM pesquisador;

-- mostrar ambiente --
SELECT * FROM ambiente;

-- mostrar experimentos --
SELECT * FROM experimento;

-- mostrar dispositivos --
SELECT * FROM dispositivo;

-- mostrar pesquisador e dispositivo --
SELECT * FROM pesquisador JOIN dispositivo ON pesquisador.matriculapesquisador = dispositivo.iddispositivo;

-- mostrar pesquisador e ambiente --
SELECT * FROM pesquisador JOIN ambiente ON pesquisador.matriculapesquisador = ambiente.codamb;

-- mostrar pesquisador e experimento --
SELECT * FROM pesquisador JOIN experimento ON pesquisador.matriculapesquisador = experimento.codamb;

-- mostrar o pesquisador e o dispositivo --
SELECT * FROM pesquisador JOIN dispositivo ON pesquisador.matriculapesquisador = dispositivo.iddispositivo;

-- mostrar dispositivo e seu ambiente --
SELECT * FROM dispositivo JOIN ambiente ON dispositivo.iddispositivo = ambiente.codamb;

-- mostrar dispositivo e experimento --
SELECT * FROM dispositivo JOIN experimento ON dispositivo.iddispositivo = experimento.codamb;