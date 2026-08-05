CREATE DATABASE BDACADEMIA;
USE BDACADEMIA;

CREATE TABLE unidade(
	codUni INT AUTO_INCREMENT,
    nome VARCHAR(80),
    endereco VARCHAR(80),
    PRIMARY KEY(codUni)
);

CREATE TABLE funcionario(
	matriFunc INT AUTO_INCREMENT,
    nome VARCHAR(80),
    endereco VARCHAR(80),
    telefone VARCHAR(15),
    tarefa VARCHAR(50),
    dataAdm DATE,
    especialidade VARCHAR(20),
    codUni INT,
    PRIMARY KEY(matriFunc),
	FOREIGN KEY(codUni) REFERENCES unidade(codUni)
);

CREATE TABLE gerente(
	codGer INT AUTO_INCREMENT,
    experiencia VARCHAR(80),
    matriFunc INT,
    codUni INT,
    PRIMARY KEY(codGer),
    FOREIGN KEY(matriFunc) REFERENCES funcionario(matriFunc),
    FOREIGN KEY(codUni) REFERENCES unidade(coduni)
);

CREATE TABLE aluno(
	codAlu INT AUTO_INCREMENT,
    nome VARCHAR(80), 
    dataNasc DATE,
    telefone VARCHAR(15),
    endereco VARCHAR(80),
    dataIngre Date,
    codUni INT,
    PRIMARY KEY(codAlu),
    FOREIGN KEY(codUni) REFERENCES unidade(codUni)
);

CREATE TABLE plano(
	codPlan INT AUTO_INCREMENT,
    nome VARCHAR(80),
    valor FLOAT,
    duracao VARCHAR(10),
    beneficios VARCHAR(150),
    PRIMARY KEY(codPlan, nome)
);

CREATE TABLE contrata(
	codAlu INT,
    codPlan INT,
    historico VARCHAR(100),
    PRIMARY KEY(codAlu, codPlan),
    FOREIGN KEY(codAlu) REFERENCES aluno(codAlu),
    FOREIGN KEY(codPlan) REFERENCES plano(codPlan)
);

CREATE TABLE instrutor(
	codIns INT AUTO_INCREMENT,
    turno VARCHAR(10),
    experiencia VARCHAR(80),
    matriFunc INT,
    PRIMARY KEY(codIns),
    FOREIGN KEY(matriFunc) REFERENCES funcionario(matriFunc)
);

CREATE TABLE avaliacao(
	codIns INT,
    codAlu INT,
    peso FLOAT,
    altura FLOAT,
	gordura FLOAT,
	massa FLOAT,
    obs VARCHAR(100),
    PRIMARY KEY(codIns, codAlu),
    FOREIGN KEY(codIns) REFERENCES instrutor(codIns),
    FOREIGN KEY(codAlu) REFERENCES aluno(codAlu)
);

CREATE TABLE exercicio(
	codExe INT AUTO_INCREMENT,
    nome VARCHAR(80),
    modalidade VARCHAR(80),
    PRIMARY KEY(codExe)
);

CREATE TABLE ministra(
	codIns INT,
    codExe INT,
    dia VARCHAR(20),
    hora TIME,
    PRIMARY KEY(codIns, codExe),
    FOREIGN KEY(codIns) REFERENCES instrutor(codIns),
    FOREIGN KEY(codExe) REFERENCES exercicio(codExe)
);

CREATE TABLE ficha(
	codFich INT AUTO_INCREMENT,
    dataFich DATE,
    numSeries INT,
    repeticoes INT,
    carga INT,
    tempoDescans TIME,
    codAlu INT,
    codExe INT,
    PRIMARY KEY(codFich),
    FOREIGN KEY(codAlu) REFERENCES aluno(codAlu),
    FOREIGN KEY(codExe) REFERENCES exercicio(codExe)
);

ALTER TABLE ficha ADD tipoTreino VARCHAR(80);
ALTER TABLE avaliacao CHANGE COLUMN gordura massaGord INT;
ALTER TABLE avaliacao CHANGE COLUMN massa massaMagr INT;
ALTER TABLE instrutor CHANGE COLUMN experiencia historico VARCHAR(150);

INSERT INTO unidade(nome, endereco) VALUES
	('Academia PowerFit Centro', 'Av. Brasil, 1250 - Centro'),
	('Academia Life Fitness', 'Rua das Palmeiras, 87 - Jardim América'),
	('Academia Max Performance', 'Av. Paulista, 1500 - Bela Vista'),
	('Academia Corpo em Ação', 'Rua XV de Novembro, 320 - Centro'),
	('Academia Energy Gym', 'Av. Atlântica, 980 - Copacabana'),
	('Academia Evolution Fitness', 'Rua Minas Gerais, 210 - Funcionários'),
	('Academia Iron Club', 'Av. Independência, 745 - Centro'),
	('Academia Prime Fitness', 'Rua Goiás, 415 - Setor Central'),
	('Academia Fitness House', 'Av. Santos Dumont, 1680 - Aldeota'),
	('Academia Strong Life', 'Rua das Acácias, 560 - Jardim Europa');

INSERT INTO funcionario(nome, endereco, telefone, tarefa, dataAdm, especialidade, codUni) VALUES
	('Ana Paula Silva', 'Rua das Flores, 120', '(31) 99876-1234', 'Acompanhar treinos dos alunos', '2022-03-15', 'Instrutor', 3),
	('Bruno Henrique Costa', 'Av. Brasil, 450', '(11) 98765-2345', 'Elaborar planos alimentares', '2021-08-20', 'Nutricionista', 1),
	('Carla Mendes Oliveira', 'Rua Goiás, 89', '(21) 99654-3456', 'Realizar reabilitação física', '2023-01-10', 'Fisioterapeuta', 8),
	('Diego Souza Lima', 'Av. Independência, 560', '(62) 99543-4567', 'Recepcionar alunos e visitantes', '2024-02-01', 'Recepcionista', 5),
	('Fernanda Rocha Alves', 'Rua Bahia, 310', '(71) 99432-5678', 'Orientar exercícios físicos', '2020-11-05', 'Instrutor', 10),
	('Gustavo Pereira Santos', 'Av. Amazonas, 1470', '(41) 99321-6789', 'Avaliar estado nutricional', '2022-07-18', 'Nutricionista', 6),
	('Helena Martins Souza', 'Rua São José, 225', '(85) 99210-7890', 'Aplicar terapias de recuperação', '2021-05-12', 'Fisioterapeuta', 2),
	('Igor Almeida Ferreira', 'Av. Central, 980', '(51) 99109-8901', 'Controlar atendimento da recepção', '2023-09-25', 'Recepcionista', 9),
	('Juliana Costa Ribeiro', 'Rua Paraná, 640', '(27) 99098-9012', 'Montar fichas de treinamento', '2022-12-03', 'Instrutor', 4),
	('Lucas Henrique Gomes', 'Av. Rio Branco, 875', '(61) 98987-0123', 'Orientar alimentação esportiva', '2024-01-15', 'Nutricionista', 7);
    
INSERT INTO gerente(experiencia, matriFunc, codUni) VALUES
	('8 anos em gestão de academias', 2, 1),
	('12 anos em administração esportiva', 5, 5),
	('6 anos em coordenação de equipes', 7, 2),
	('10 anos em gestão operacional', 10, 7),
	('9 anos em liderança de unidades fitness', 3, 8),
	('7 anos em administração de academias', 1, 3),
	('11 anos em gestão de pessoas', 9, 9),
	('5 anos em supervisão de atendimento', 4, 4),
	('13 anos em gerenciamento esportivo', 6, 6),
	('8 anos em gestão de unidades', 8, 10);

INSERT INTO aluno(nome, dataNasc, telefone, endereco, dataIngre, codUni) VALUES
	('João Silva', '1998-05-14', '(31) 99876-1111', 'Rua das Flores, 120', '2024-01-10', 1),
	('Maria Oliveira', '1995-09-22', '(11) 98765-2222', 'Av. Brasil, 450', '2023-08-15', 3),
	('Pedro Santos', '2000-03-08', '(21) 99654-3333', 'Rua Goiás, 89', '2024-03-20', 5),
	('Ana Costa', '1997-11-30', '(62) 99543-4444', 'Av. Independência, 560', '2022-06-12', 2),
	('Carlos Pereira', '1994-07-19', '(71) 99432-5555', 'Rua Bahia, 310', '2023-10-05', 7),
	('Juliana Almeida', '1999-02-17', '(41) 99321-6666', 'Av. Amazonas, 1470', '2024-02-01', 4),
	('Bruno Souza', '2001-08-11', '(85) 99210-7777', 'Rua São José, 225', '2025-01-18', 10),
	('Fernanda Lima', '1996-12-03', '(51) 99109-8888', 'Av. Central, 980', '2023-04-25', 6),
	('Ricardo Gomes', '1993-04-27', '(27) 99098-9999', 'Rua Paraná, 640', '2022-11-14', 9),
	('Patrícia Rocha', '2002-10-06', '(61) 98987-0000', 'Av. Rio Branco, 875', '2025-03-10', 8);
    
INSERT INTO plano(nome, valor, duracao, beneficios) VALUES
	('Básico', 89.90, 1, 'Acesso à Musculação'),
	('Fitness', 119.90, 1, 'Musculação e Treinamento Funcional'),
	('Premium', 149.90, 1, 'Musculação, Pilates e Treinamento Funcional'),
	('Fit Trimestral', 329.90, 3, 'Musculação e Spinning'),
	('Premium Trimestral', 399.90, 3, 'Musculação, Pilates, Spinning e Treinamento Funcional'),
	('Fit Semestral', 699.90, 6, 'Musculação, Spinning e Natação'),
	('Gold Semestral', 899.90, 6, 'Acesso a todas as modalidades'),
	('Anual', 1599.90, 12, 'Acesso ilimitado a Musculação, Pilates, Spinning, Natação e Treinamento Funcional'),
	('Anual VIP', 1999.90, 12, 'Acesso a todas as modalidades com avaliação física inclusa'),
	('Estudante', 69.90, 1, 'Acesso à Musculação em horário promocional');
    
INSERT INTO contrata(codAlu, codPlan, historico) VALUES
	(1, 8, 'Plano anual contratado na matrícula.'),
	(2, 3, 'Upgrade do plano Básico para Premium.'),
	(3, 10, 'Plano estudantil ativo.'),
	(4, 1, 'Primeira contratação da academia.'),
	(5, 7, 'Renovação do plano semestral.'),
	(6, 5, 'Plano trimestral contratado com desconto.'),
	(7, 2, 'Plano Fitness contratado na promoção.'),
	(8, 9, 'Plano VIP contratado com avaliação física inclusa.'),
	(9, 6, 'Plano semestral renovado após vencimento.'),
	(10, 4, 'Plano trimestral contratado no ato da matrícula.');
    
INSERT INTO instrutor(turno, historico, matriFunc) VALUES
	('Manhã', 'Instrutor responsável pelas aulas de Musculação.', 1),
	('Tarde', 'Instrutor responsável pelas aulas de Pilates.', 2),
	('Noite', 'Instrutor responsável pelas aulas de Spinning.', 3),
	('Manhã', 'Instrutor responsável pelas aulas de Natação.', 4),
	('Tarde', 'Instrutor responsável pelas aulas de Treinamento Funcional.', 5),
	('Noite', 'Instrutor responsável pelo treinamento de hipertrofia.', 6),
	('Manhã', 'Instrutor responsável pelas aulas de condicionamento físico.', 7),
	('Tarde', 'Instrutor responsável pelas aulas de natação para iniciantes.', 8),
	('Noite', 'Instrutor responsável pelas aulas avançadas de Spinning.', 9),
	('Manhã', 'Instrutor responsável pelas aulas de Musculação para iniciantes.', 10);

INSERT INTO avaliacao(codIns, codAlu, peso, altura, massaGord, massaMagr, obs) VALUES
	(1, 1, 78.5, 1.78, 15.2, 66.6, 'Bom condicionamento físico.'),
	(2, 2, 62.0, 1.65, 22.5, 48.1, 'Objetivo de ganho de massa muscular.'),
	(3, 3, 85.3, 1.82, 18.0, 69.9, 'Evolução satisfatória no desempenho.'),
	(4, 4, 70.8, 1.70, 20.1, 56.6, 'Necessita melhorar a flexibilidade.'),
	(5, 5, 91.4, 1.85, 24.8, 68.7, 'Recomendado intensificar exercícios aeróbicos.'),
	(6, 6, 67.2, 1.73, 17.6, 55.4, 'Ótima evolução desde a última avaliação.'),
	(7, 7, 74.9, 1.76, 16.9, 62.2, 'Bom ganho de massa magra.'),
	(8, 8, 59.6, 1.62, 21.3, 46.9, 'Manter rotina de treinamento atual.'),
	(9, 9, 88.1, 1.80, 19.7, 70.7, 'Condicionamento cardiovascular adequado.'),
	(10, 10, 65.5, 1.68, 18.4, 53.4, 'Recomendada reavaliação em 60 dias.');
    
INSERT INTO exercicio(nome, modalidade) VALUES
	('Supino Reto', 'Musculação'),
	('Agachamento Livre', 'Musculação'),
	('Pilates Solo', 'Pilates'),
	('Reformer', 'Pilates'),
	('Bike de Resistência', 'Spinning'),
	('Sprint Intervalado', 'Spinning'),
	('Nado Livre', 'Natação'),
	('Nado Costas', 'Natação'),
	('Burpees', 'Treinamento Funcional'),
	('Kettlebell Swing', 'Treinamento Funcional');

INSERT INTO ministra(codIns, codExe, dia, hora) VALUES
	(1, 1, 'Segunda-feira', '08:00:00'),
	(2, 3, 'Terça-feira', '09:30:00'),
	(3, 5, 'Quarta-feira', '18:00:00'),
	(4, 7, 'Quinta-feira', '10:00:00'),
	(5, 9, 'Sexta-feira', '17:30:00'),
	(6, 2, 'Segunda-feira', '19:00:00'),
	(7, 4, 'Terça-feira', '07:30:00'),
	(8, 8, 'Quarta-feira', '15:00:00'),
	(9, 6, 'Quinta-feira', '20:00:00'),
	(10, 10, 'Sábado', '09:00:00');

INSERT INTO ficha(codFich, dataFich, numSeries, repeticoes, carga, tempoDescans, codAlu, codExe, tipoTreino) VALUES
	(1, '2026-01-10', 4, 12, 40, '00:01:30', 1, 1, 'Hipertrofia'),
	(2, '2026-01-12', 3, 15, 0, '00:01:00', 2, 3, 'Flexibilidade'),
	(3, '2026-01-15', 5, 10, 60, '00:02:00', 3, 2, 'Força'),
	(4, '2026-01-18', 3, 20, 0, '00:00:45', 4, 9, 'Condicionamento'),
	(5, '2026-01-20', 4, 15, 0, '00:01:30', 5, 7, 'Resistência'),
	(6, '2026-01-22', 5, 8, 80, '00:02:30', 6, 1, 'Hipertrofia'),
	(7, '2026-01-25', 3, 12, 0, '00:01:00', 7, 4, 'Reabilitação'),
	(8, '2026-01-27', 4, 18, 0, '00:00:45', 8, 6, 'Cardiovascular'),
	(9, '2026-01-29', 4, 10, 50, '00:01:30', 9, 10, 'Emagrecimento'),
	(10, '2026-02-01', 5, 12, 35, '00:02:00', 10, 5, 'Resistência');

-- mostrar funcionarios --
SELECT * FROM funcionario;

-- mostrar gerentes --
SELECT * FROM gerente;

-- mostrar alunos --
SELECT * FROM aluno;

--  mostrar unidades --
SELECT * FROM unidade;

-- mostrar alunos e seus planos --
SELECT * FROM contrata;

-- mostrar planos --
SELECT * FROM plano;

-- mostrar instrutores --
SELECT * FROM instrutor;

-- mostrar avaliações --
SELECT * FROM avaliacao;

-- mostrar exercicios --
SELECT * FROM exercicio;

-- mostrar aulas ministradas por instrutores --
SELECT * FROM ministra;

-- mostrar fichas dos alunos --
SELECT * FROM ficha;

