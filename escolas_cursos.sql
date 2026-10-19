CREATE SCHEMA escolas_cursos; 
USE escolas_cursos; 

CREATE TABLE alunos ( 
    id_aluno INT AUTO_INCREMENT, 
    nome VARCHAR (100) NOT NULL, 
    email VARCHAR (100) NOT NULL, 
    idade INT NOT NULL, 
    PRIMARY KEY (id_aluno)
); 

CREATE TABLE cursos ( 
    id_curso INT AUTO_INCREMENT, 
    nome_curso VARCHAR (100) NOT NULL, 
    carga_horaria INT NOT NULL, 
    valor DECIMAL (10,2) NOT NULL,             
    PRIMARY KEY (id_curso) 
);

CREATE TABLE matriculas ( 
    id_matricula INT NOT NULL AUTO_INCREMENT, 
    id_aluno INT NOT NULL, 
    id_curso INT NOT NULL, 
    data_matricula DATE NOT NULL, 
    situacao VARCHAR (20) NOT NULL,                   
    PRIMARY KEY (id_matricula) 
    
    CONSTRAINT fk_matricula_aluno
			   FOREIGN KEY (id_aluno)
               REFERENCES alunos (id_aluno) .
	
    
);