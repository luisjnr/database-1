CREATE DATABASE BDFUTEBOL;
USE BDFUTEBOL;

CREATE TABLE campeonato(
	nomecamp VARCHAR(80),
    temporada VARCHAR(50),
    regulamento VARCHAR(100),
    dataini DATE,
    dataterm DATE,
    PRIMARY KEY(nomecamp)
);

CREATE TABLE arbitro(
	idarb INT AUTO_INCREMENT,
    nome VARCHAR(80),
    datanasc DATE,
    PRIMARY KEY(idarb)
);

CREATE TABLE arbitragem(
	nomecamp VARCHAR(80),
    idarb INT,
    cartoes INT,
    PRIMARY KEY(nomecamp, idarb),
    FOREIGN KEY(nomecamp) REFERENCES campeonato(nomecamp),
    FOREIGN KEY(idarb) REFERENCES arbitro(idarb)
);

CREATE TABLE clube(
	codclub INT AUTO_INCREMENT,
    nome VARCHAR(80),
    cidade VARCHAR(30),
    estadio VARCHAR(30),
    presidente VARCHAR(80),
    PRIMARY KEY(codclub)
);

CREATE TABLE classificacao(
	nomecamp VARCHAR(80),
    codclub INT,
    posicao INT,
    PRIMARY KEY(nomecamp, codclub),
    FOREIGN KEY(nomecamp) REFERENCES campeonato(nomecamp),
    FOREIGN KEY(codclub) REFERENCES clube(codclub)
);

CREATE TABLE participa(
	nomecamp VARCHAR(80),
    codclub INT,
    pontuacao INT,
    vitorias INT,
    empates INT,
    derrotas INT,
    golsmarcados INT,
    golssofridos INT,
    PRIMARY KEY(nomecamp, codclub),
    FOREIGN KEY(nomecamp) REFERENCES campeonato(nomecamp),
	FOREIGN KEY(codclub) REFERENCES clube(codclub)
);

CREATE TABLE jogador(
	registrojog INT AUTO_INCREMENT,
    nome VARCHAR(80), 
    nacionalidade VARCHAR(50),
    datanasc DATE,
    posicao VARCHAR(15),
    codclub INT,
    PRIMARY KEY(registrojog),
    FOREIGN KEY(codclub) REFERENCES clube(codclub)
);

CREATE TABLE historico(
	datahistorico DATE,
    assistencias INT,
    cartoes INT,
    gols INT,
    nomecamp VARCHAR(80),
    registrojog INT,
    PRIMARY KEY(datahistorico),
	FOREIGN KEY(registrojog) REFERENCES jogador(registrojog),
    FOREIGN KEY(nomecamp) REFERENCES campeonato(nomecamp)

);

CREATE TABLE artilharia(
	nomecamp VARCHAR(80),
    registrojog INT,
    gols INT,
    PRIMARY KEY(nomecamp, registrojog),
    FOREIGN KEY(nomecamp) REFERENCES campeonato(nomecamp),
    FOREIGN KEY(registrojog) REFERENCES jogador(registrojog)
);

CREATE TABLE contrato(
	dataini DATE,
    dataterm DATE,
    salario INT,
    situacao VARCHAR(10),
    codclub INT,
    registrojog INT,
    PRIMARY KEY(codclub, registrojog),
	FOREIGN KEY(registrojog) REFERENCES jogador(registrojog),
    FOREIGN KEY(codclub) REFERENCES clube(codclub)
);

CREATE TABLE partida(
	datapartida DATE,
    horario TIME,
    estadio VARCHAR(80),
    equipemandante VARCHAR(80),
    equipevisitante VARCHAR(80),
    nomecamp VARCHAR(80),
    PRIMARY KEY(datapartida),
    FOREIGN KEY(nomecamp) REFERENCES campeonato(nomecamp)
);

CREATE TABLE registro(
	datapartida DATE,
    idarb INT, 
    gols INT,
	cartaoama INT,
    cartaoverm INT,
    substituicao VARCHAR(80),
    lesao VARCHAR(80),
    observacao VARCHAR(80),
    minuto INT,
    registrojog INT,
    PRIMARY KEY(datapartida, idarb),
    FOREIGN KEY(datapartida) REFERENCES partida(datapartida),
    FOREIGN KEY(idarb) REFERENCES arbitro(idarb)
);

CREATE TABLE torcedor(
	cpftorcedor VARCHAR(15),
    nome VARCHAR(80),
    programa VARCHAR(40),
    PRIMARY KEY(cpftorcedor)
);

CREATE TABLE ingresso(
	cpftorcedor VARCHAR(15),
    datapartida DATE,
    valor INT,
    quantidade INT,
    PRIMARY KEY(cpftorcedor, datapartida),
    FOREIGN KEY(datapartida) REFERENCES partida(datapartida),
    FOREIGN KEY(cpftorcedor) REFERENCES torcedor(cpftorcedor)
);

ALTER TABLE arbitro ADD nacionalidade VARCHAR(50);
ALTER TABLE jogador CHANGE COLUMN posicao funcao VARCHAR(20);
ALTER TABLE campeonato CHANGE COLUMN temporada anotempo VARCHAR(15);
ALTER TABLE registro CHANGE COLUMN minuto tempo INT;

INSERT INTO campeonato(nomecamp, anotempo, regulamento, dataini, dataterm) VALUES
	('Campeonato Brasileiro Série A', '2023', 'Pontos Corridos', '2023-04-15', '2023-12-06'),
	('Copa do Brasil', '2023', 'Mata-mata', '2023-02-22', '2023-09-24'),
	('Libertadores da América', '2024', 'Fase de grupos e mata-mata', '2024-04-02', '2024-11-30'),
	('UEFA Champions League', '2023/2024', 'Fase de grupos e mata-mata', '2023-09-19', '2024-06-01'),
	('Premier League', '2023/2024', 'Pontos Corridos', '2023-08-11', '2024-05-19'),
	('La Liga', '2023/2024', 'Pontos Corridos', '2023-08-11', '2024-05-26'),
	('Serie A Italiana', '2023/2024', 'Pontos Corridos', '2023-08-19', '2024-05-26'),
	('Bundesliga', '2023/2024', 'Pontos Corridos', '2023-08-18', '2024-05-18'),
	('Copa América', '2024', 'Fase de grupos e mata-mata', '2024-06-20', '2024-07-14'),
	('Copa do Mundo FIFA', '2022', 'Fase de grupos e mata-mata', '2022-11-20', '2022-12-18');

INSERT INTO arbitro(nome, datanasc, nacionalidade) VALUES
	('Wilton Pereira Sampaio', '1981-12-28', 'Brasil'),
	('Raphael Claus', '1979-09-06', 'Brasil'),
	('Anderson Daronco', '1981-01-05', 'Brasil'),
	('Bráulio da Silva Machado', '1979-07-30', 'Brasil'),
	('Ramon Abatti Abel', '1989-09-02', 'Brasil'),
	('Sávio Pereira Sampaio', '1985-04-19', 'Brasil'),
	('Flávio Rodrigues de Souza', '1980-07-13', 'Brasil'),
	('Leandro Pedro Vuaden', '1975-07-24', 'Brasil'),
	('Luiz Flávio de Oliveira', '1978-01-13', 'Brasil'),
	('Rodrigo José Pereira de Lima', '1986-05-12', 'Brasil');

INSERT INTO arbitragem(nomecamp, idarb, cartoes) VALUES
	('Libertadores da América', 7, 6),
	('Campeonato Brasileiro Série A', 3, 4),
	('UEFA Champions League', 10, 3),
	('La Liga', 2, 5),
	('Copa do Brasil', 8, 7),
	('Premier League', 5, 2),
	('Copa América', 1, 8),
	('Bundesliga', 9, 4),
	('Serie A Italiana', 6, 5),
	('Campeonato Brasileiro Série A', 10, 6);
    
INSERT INTO clube(nome, cidade, estadio, presidente) VALUES
	('Flamengo', 'Rio de Janeiro', 'Maracanã', 'Luiz Eduardo Baptista'),
	('Palmeiras', 'São Paulo', 'Allianz Parque', 'Leila Pereira'),
	('Corinthians', 'São Paulo', 'Neo Química Arena', 'Augusto Melo'),
	('São Paulo', 'São Paulo', 'MorumBIS', 'Julio Casares'),
	('Santos', 'Santos', 'Vila Belmiro', 'Marcelo Teixeira'),
	('Grêmio', 'Porto Alegre', 'Arena do Grêmio', 'Alberto Guerra'),
	('Internacional', 'Porto Alegre', 'Beira-Rio', 'Alessandro Barcellos'),
	('Atlético Mineiro', 'Belo Horizonte', 'Arena MRV', 'Sérgio Coelho'),
	('Cruzeiro', 'Belo Horizonte', 'Mineirão', 'Pedro Lourenço'),
	('Bahia', 'Salvador', 'Arena Fonte Nova', 'Emerson Ferretti');
    
INSERT INTO classificacao(nomecamp, codclub, posicao) VALUES
	('Campeonato Brasileiro Série A', 3, 1),
	('Campeonato Brasileiro Série A', 1, 2),
	('Campeonato Brasileiro Série A', 5, 3),
	('Libertadores da América', 8, 1),
	('Libertadores da América', 2, 2),
	('Premier League', 7, 1),
	('Copa do Brasil', 4, 1),
	('La Liga', 10, 1),
	('Serie A Italiana', 6, 1),
	('Copa América', 9, 1);

INSERT INTO participa(nomecamp, codclub, pontuacao, vitorias, empates, derrotas, golsmarcados, golssofridos) VALUES
	('Campeonato Brasileiro Série A', 3, 78, 24, 6, 8, 68, 31),
	('Campeonato Brasileiro Série A', 1, 74, 22, 8, 8, 64, 35),
	('Campeonato Brasileiro Série A', 5, 69, 20, 9, 9, 59, 37),
	('Libertadores da América', 8, 18, 6, 0, 0, 17, 5),
	('Libertadores da América', 2, 15, 5, 0, 1, 14, 7),
	('Premier League', 7, 91, 29, 4, 5, 86, 29),
	('Copa do Brasil', 4, 16, 5, 1, 0, 13, 4),
	('La Liga', 10, 88, 27, 7, 4, 79, 30),
	('Serie A Italiana', 6, 84, 26, 6, 6, 74, 33),
	('Copa América', 9, 10, 3, 1, 0, 8, 2);
    
INSERT INTO jogador(registrojog, nome, nacionalidade, datanasc, funcao, codclub) VALUES
	(1, 'Pedro Henrique', 'Brasil', '1998-04-15', 'Atacante', 1),
	(2, 'Carlos Sánchez', 'Uruguai', '1994-09-08', 'Meio-campista', 5),
	(3, 'João Victor', 'Brasil', '2001-01-21', 'Zagueiro', 3),
	(4, 'Miguel Rodríguez', 'Argentina', '1997-07-12', 'Goleiro', 8),
	(5, 'Lucas Fernandes', 'Brasil', '1999-11-03', 'Lateral Direito', 6),
	(6, 'Diego Gómez', 'Paraguai', '2002-02-28', 'Volante', 9),
	(7, 'Gabriel Silva', 'Brasil', '2000-06-17', 'Atacante', 2),
	(8, 'Matías López', 'Chile', '1996-12-05', 'Meio-campista', 4),
	(9, 'Rafael Costa', 'Brasil', '1995-08-30', 'Lateral Esquerdo', 7),
	(10, 'Bruno Oliveira', 'Brasil', '1998-03-26', 'Zagueiro', 10);
    
INSERT INTO historico(datahistorico, assistencias, cartoes, gols, nomecamp, registrojog) VALUES
	('2023-05-14', 2, 1, 3, 'Campeonato Brasileiro Série A', 1),
	('2023-09-27', 1, 2, 1, 'Copa do Brasil', 2),
	('2023-09-16', 0, 1, 0, 'Bundesliga', 3),
	('2024-04-18', 2, 0, 2, 'Libertadores da América', 4),
	('2023-11-11', 1, 1, 1, 'Serie A Italiana', 5),
	('2024-05-07', 3, 0, 2, 'UEFA Champions League', 6),
	('2022-12-18', 1, 1, 1, 'Copa do Mundo FIFA', 7),
	('2023-08-20', 2, 0, 1, 'La Liga', 8),
	('2023-10-22', 1, 2, 3, 'Premier League', 9),
	('2024-06-29', 0, 0, 2, 'Copa América', 10);
    
INSERT INTO artilharia(nomecamp, registrojog, gols) VALUES
	('Campeonato Brasileiro Série A', 1, 24),
	('Campeonato Brasileiro Série A', 7, 19),
	('Libertadores da América', 4, 8),
	('Libertadores da América', 2, 6),
	('Premier League', 9, 27),
	('Copa do Brasil', 8, 5),
	('La Liga', 10, 31),
	('Serie A Italiana', 5, 22),
	('Copa América', 6, 4),
	('UEFA Champions League', 3, 12);
    
INSERT INTO contrato(dataini, dataterm, salario, situacao, codclub, registrojog) VALUES
	('2023-01-10', '2026-12-31', 850000.00, 'Ativo', 1, 1),
	('2022-07-01', '2025-06-30', 620000.00, 'Ativo', 5, 2),
	('2024-01-15', '2028-12-31', 480000.00, 'Ativo', 3, 3),
	('2021-08-20', '2026-08-19', 910000.00, 'Ativo', 8, 4),
	('2023-02-01', '2027-01-31', 540000.00, 'Ativo', 6, 5),
	('2024-03-10', '2029-03-09', 390000.00, 'Ativo', 9, 6),
	('2022-01-05', '2026-12-31', 760000.00, 'Ativo', 2, 7),
	('2023-06-15', '2027-06-14', 510000.00, 'Ativo', 4, 8),
	('2021-11-01', '2025-10-31', 680000.00, 'Encerrado', 7, 9),
	('2024-02-20', '2028-02-19', 950000.00, 'Ativo', 10, 10);
    
INSERT INTO partida(datapartida, horario, estadio, equipemandante, equipevisitante, nomecamp) VALUES
	('2023-05-14', '16:00:00', 'Maracanã', 'Flamengo', 'Palmeiras', 'Campeonato Brasileiro Série A'),
	('2023-09-27', '21:30:00', 'Neo Química Arena', 'Corinthians', 'São Paulo', 'Copa do Brasil'),
	('2024-04-18', '19:00:00', 'Monumental de Núñez', 'River Plate', 'Atlético Mineiro', 'Libertadores da América'),
	('2024-05-07', '20:45:00', 'Santiago Bernabéu', 'Real Madrid', 'Manchester City', 'UEFA Champions League'),
	('2023-10-22', '17:30:00', 'Anfield', 'Liverpool', 'Arsenal', 'Premier League'),
	('2023-08-20', '16:15:00', 'Camp Nou', 'Barcelona', 'Atlético de Madrid', 'La Liga'),
	('2023-11-11', '20:45:00', 'San Siro', 'Inter de Milão', 'Juventus', 'Serie A Italiana'),
	('2024-06-29', '18:00:00', 'Hard Rock Stadium', 'Brasil', 'Argentina', 'Copa América'),
	('2023-09-16', '15:30:00', 'Allianz Arena', 'Bayern de Munique', 'Borussia Dortmund', 'Bundesliga'),
	('2022-12-18', '12:00:00', 'Lusail Stadium', 'Argentina', 'França', 'Copa do Mundo FIFA');
    
INSERT INTO registro(datapartida, idarb, gols, cartaoama, cartaoverm, substituicao, lesao, observacao, tempo, registrojog) VALUES
	('2023-05-14', 3, 2, 1, 0, 1, 0, 'Grande atuação do atacante.', 90, 1),
	('2023-09-27', 8, 1, 0, 0, 1, 0, 'Marcou o gol da vitória.', 76, 2),
	('2024-04-18', 7, 0, 1, 0, 0, 1, 'Saiu lesionado no segundo tempo.', 61, 3),
	('2024-05-07', 10, 1, 0, 0, 1, 0, 'Participação decisiva no ataque.', 84, 4),
	('2023-10-22', 5, 0, 2, 1, 0, 0, 'Expulso após falta dura.', 68, 5),
	('2023-08-20', 2, 3, 0, 0, 1, 0, 'Hat-trick e melhor em campo.', 90, 6),
	('2023-11-11', 6, 1, 1, 0, 0, 0, 'Boa atuação defensiva.', 90, 7),
	('2024-06-29', 1, 0, 1, 0, 1, 0, 'Substituído por opção tática.', 72, 8),
	('2023-09-16', 9, 2, 0, 0, 0, 0, 'Dois gols em cobranças de falta.', 90, 9),
	('2022-12-18', 4, 1, 1, 0, 0, 0, 'Gol decisivo na final.', 118, 10);
    
INSERT INTO torcedor(cpftorcedor, nome, programa) VALUES
	('123.456.789-01', 'João Silva', 'Sócio Torcedor Ouro'),
	('234.567.890-12', 'Maria Oliveira', 'Sócio Torcedor Prata'),
	('345.678.901-23', 'Pedro Santos', 'Sócio Torcedor Bronze'),
	('456.789.012-34', 'Ana Costa', 'Nação Rubro-Negra'),
	('567.890.123-45', 'Carlos Pereira', 'Avanti'),
	('678.901.234-56', 'Juliana Almeida', 'Fiel Torcedor'),
	('789.012.345-67', 'Bruno Souza', 'Sócio Gigante'),
	('890.123.456-78', 'Fernanda Lima', 'Sócio 5 Estrelas'),
	('901.234.567-89', 'Ricardo Gomes', 'Sócio Esquadrão'),
	('012.345.678-90', 'Patrícia Rocha', 'Sócio Torcedor Diamante');
    
INSERT INTO ingresso(cpftorcedor, datapartida, valor, quantidade) VALUES
	('123.456.789-01', '2023-05-14', 120.00, 2),
	('234.567.890-12', '2023-09-27', 85.50, 1),
	('345.678.901-23', '2024-04-18', 250.00, 2),
	('456.789.012-34', '2024-05-07', 320.00, 1),
	('567.890.123-45', '2023-10-22', 150.00, 3),
	('678.901.234-56', '2023-08-20', 180.00, 2),
	('789.012.345-67', '2023-11-11', 140.00, 1),
	('890.123.456-78', '2024-06-29', 275.00, 4),
	('901.234.567-89', '2023-09-16', 160.00, 2),
	('012.345.678-90', '2022-12-18', 450.00, 1);
    
-- mostrar campeonatos --
SELECT * FROM campeonato;

-- mostrar arbitros designados para determinado campeonato --
SELECT * FROM arbitragem;

-- listar jogadores --
SELECT * FROM jogador;

-- mostrar jogadores e seus clubes --
SELECT * FROM jogador JOIN clube ON jogador.registrojog = clube.codclub;

-- mostrar historico do jogador --
SELECT * FROM historico;

-- listar clubes --
SELECT * FROM clube;

-- mostrar classificacao --
SELECT * FROM classificacao;

-- mostrar artilheiros --
SELECT * FROM artilharia;

-- mostrar ingressos vendidos --
SELECT * FROM torcedor JOIN ingresso ON torcedor.cpftorcedor = ingresso.cpftorcedor;

-- mostrar torcedores cadastrados --
SELECT * FROM torcedor;
