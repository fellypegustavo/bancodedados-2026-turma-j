CREATE DATABASE escolafellype_join;
USE escolafellype_join;

CREATE TABLE professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL
    );

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT NOT NULL,
    nome_curso VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_curso_professor
        FOREIGN KEY (id_professor)
        REFERENCES professores(id_professor)
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

DESCRIBE professores;
DESCRIBE alunos;
DESCRIBE cursos;
DESCRIBE matriculas;

INSERT INTO professores
(nome, especialidade)
VALUES
('Roberto Alves', 'Banco de Dados'),
('Fernanda Lima', 'Programacao'),
('Marcos Silva', 'Redes'),
('Patricia Souza', 'Seguranca da Informacao');

INSERT INTO alunos
(nome, cidade)
VALUES
('Ana Souza', 'Brasilia'),
('Carlos Lima', 'Ceilandia'),
('Mariana Alves', 'Taguatinga'),
('Pedro Santos', 'Samambaia'),
('Julia Oliveira', 'Brasilia'),
('Rafael Costa', 'Ceilandia');

INSERT INTO cursos
(id_professor, nome_curso, valor)
VALUES
(1, 'Banco de Dados', 250.00),
(1, 'SQL Avancado', 300.00),
(2, 'Programacao Web', 350.00),
(3, 'Redes de Computadores', 280.00),
(3, 'Seguranca Digital', 400.00);

INSERT INTO matriculas
(id_aluno, id_curso, data_matricula)
VALUES
(1, 1, '2026-11-01'),
(1, 2, '2026-11-02'),
(2, 3, '2026-11-03'),
(3, 1, '2026-11-04'),
(4, 4, '2026-11-05'),
(5, 3, '2026-11-06');

SELECT * FROM professores;
SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM matriculas;

SELECT
a.id_aluno,
a.nome AS aluno,
m.id_matricula
FROM alunos AS a
LEFT JOIN matriculas AS m
ON a.id_aluno = m.id_aluno;
    
SELECT
a.nome AS aluno,
m.id_matricula
FROM alunos AS a
LEFT JOIN matriculas AS m
ON a.id_aluno = m.id_aluno
WHERE m.id_matricula IS NULL;

SELECT
c.nome_curso,
m.id_matricula,
m.id_aluno
FROM cursos AS c
LEFT JOIN matriculas AS m
ON c.id_curso = m.id_curso;
    
SELECT
m.id_matricula,
c.nome_curso
FROM matriculas AS m
RIGHT JOIN cursos AS c
ON m.id_curso = c.id_curso;

SELECT
c.nome_curso,
m.id_matricula
FROM matriculas AS m
RIGHT JOIN cursos AS c
ON m.id_curso = c.id_curso
WHERE m.id_matricula IS NULL;

-- LEFT JOIN

SELECT c.nome_curso, m.id_matricula
FROM cursos AS c
LEFT JOIN matriculas AS m
ON c.id_curso = m.id_curso;

-- RIGHT JOIN

SELECT c.nome_curso, m.id_matricula
FROM matriculas AS m
RIGHT JOIN cursos AS c
ON m.id_curso = c.id_curso;

SELECT
c.nome_curso,
m.id_matricula,
m.id_aluno
FROM cursos AS c
LEFT JOIN matriculas AS m
ON c.id_curso = m.id_curso
UNION ALL
SELECT
c.nome_curso,
m.id_matricula,
m.id_aluno
FROM matriculas AS m
RIGHT JOIN cursos AS c
ON m.id_curso = c.id_curso
WHERE m.id_matricula IS NULL;