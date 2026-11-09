CREATE DATABASE IF NOT EXISTS escolafellype_dql;
USE escolafellype_dql;

CREATE TABLE alunos (
id_aluno INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
idade INT NOT NULL,
cidade VARCHAR(50) NOT NULL
);

CREATE TABLE cursos (
id_curso INT AUTO_INCREMENT PRIMARY KEY,
nome_curso VARCHAR(100) NOT NULL,
carga_horaria INT NOT NULL,
valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE matriculas (
id_matricula INT AUTO_INCREMENT PRIMARY KEY,
id_aluno INT NOT NULL,
id_curso INT NOT NULL,
data_matricula DATE NOT NULL,

CONSTRAINT fk_matricula_aluno
FOREIGN KEY (id_aluno)
REFERENCES alunos(id_aluno),

CONSTRAINT fk_matricula_curso
FOREIGN KEY (id_curso)
REFERENCES cursos(id_curso)
);

SHOW TABLES;

DESCRIBE alunos;
DESCRIBE cursos;
DESCRIBE matriculas;

INSERT INTO alunos (nome, idade, cidade)
VALUES
('Ana Souza', 17, 'Brasilia'),
('Carlos Lima', 19, 'Ceilandia'),
('Mariana Alves', 18, 'Taguatinga'),
('Pedro Santos', 20, 'Samambaia'),
('Julia Oliveira', 16, 'Brasilia'),
('Rafael Costa', 21, 'Ceilandia');

INSERT INTO cursos (nome_curso, carga_horaria, valor)
VALUES
('Informatica Basica', 40, 150.00),
('Banco de Dados', 60, 250.00),
('Programacao Web', 80, 350.00),
('Excel Avancado', 30, 180.00);

INSERT INTO matriculas
(id_aluno, id_curso, data_matricula)
VALUES
(1, 1, '2026-11-03'),
(1, 2, '2026-11-03'),
(2, 3, '2026-11-03'),
(3, 2, '2026-11-03'),
(4, 4, '2026-11-03'),
(5, 1, '2026-11-03');

SELECT * FROM alunos;

SELECT nome, cidade
FROM alunos;

SELECT
nome AS Estudante,
idade AS Idade_Aluno
FROM alunos;

SELECT
a.nome,
a.cidade
FROM alunos AS a;

SELECT
a.nome,
m.data_matricula
FROM alunos AS a
INNER JOIN matriculas AS m
ON a.id_aluno = m.id_aluno;

SELECT
a.nome AS Aluno,
c.nome_curso AS Curso,
m.data_matricula AS Data
FROM matriculas AS m
INNER JOIN alunos AS a
ON m.id_aluno = a.id_aluno
INNER JOIN cursos AS c
ON m.id_curso = c.id_curso;

SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM matriculas;