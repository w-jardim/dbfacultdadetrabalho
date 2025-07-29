-- Criação das tabelas

CREATE DATABASE IF NOT EXISTS faculdade_nova_geracao;
USE faculdade_nova_geracao;

CREATE TABLE Curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    data_nascimento DATE
);

CREATE TABLE Professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    titulacao VARCHAR(50)
);

CREATE TABLE Disciplina (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_disciplina INT,
    semestre VARCHAR(20),
    id_professor INT,
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

CREATE TABLE Matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_turma INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);

-- Inserção de dados

INSERT INTO Curso (nome, carga_horaria) VALUES
('Ciência da Computação', 3200),
('Administração', 3000),
('Engenharia Civil', 3600),
('Psicologia', 3200);

INSERT INTO Aluno (nome, email, data_nascimento) VALUES
('Ana Souza', 'ana.souza@email.com', '2002-04-15'),
('Bruno Lima', 'bruno.lima@email.com', '2001-10-12'),
('Carla Mendes', 'carla.mendes@email.com', '2003-01-22'),
('Daniel Castro', 'daniel.castro@email.com', '2000-07-30'),
('Eduarda Paiva', 'eduarda.paiva@email.com', '2002-12-19'),
('Felipe Torres', 'felipe.torres@email.com', '2001-05-28'),
('Gabriel Silva', 'gabriel.silva@email.com', '2002-09-10'),
('Helena Costa', 'helena.costa@email.com', '2003-03-03'),
('Igor Martins', 'igor.martins@email.com', '2001-11-09'),
('Julia Ferreira', 'julia.ferreira@email.com', '2002-06-16');

INSERT INTO Professor (nome, titulacao) VALUES
('Marcos Pereira', 'Doutor'),
('Luciana Alves', 'Mestre'),
('Fernanda Ramos', 'Doutor'),
('Carlos Oliveira', 'Especialista');

INSERT INTO Disciplina (nome, id_curso) VALUES
('Algoritmos', 1),
('Banco de Dados', 1),
('Gestão Financeira', 2),
('Materiais de Construção', 3),
('Psicologia Social', 4),
('Estruturas de Dados', 1),
('Empreendedorismo', 2),
('Ética Profissional', 4),
('Cálculo', 1),
('Técnicas de Construção', 3);

INSERT INTO Turma (id_disciplina, semestre, id_professor) VALUES
(1, '2023.1', 1),
(2, '2023.1', 2),
(3, '2023.1', 2),
(4, '2023.1', 3),
(5, '2023.1', 4),
(6, '2023.2', 1),
(7, '2023.2', 2),
(8, '2023.2', 4),
(9, '2023.2', 3),
(10, '2023.2', 3);

INSERT INTO Matricula (id_aluno, id_turma, data_matricula) VALUES
(1, 1, '2023-01-10'),
(2, 1, '2023-01-11'),
(3, 2, '2023-01-12'),
(4, 2, '2023-01-13'),
(5, 3, '2023-01-14'),
(6, 3, '2023-01-15'),
(7, 4, '2023-01-16'),
(8, 4, '2023-01-17'),
(9, 5, '2023-01-18'),
(10, 5, '2023-01-19');