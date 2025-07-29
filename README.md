# Projeto de Banco de Dados – Faculdade Nova Geração

## Sumário

1. [Introdução](#introdução)
2. [Escopo do Projeto](#escopo-do-projeto)
3. [Modelagem do Banco de Dados](#modelagem-do-banco-de-dados)
    - [Modelo Conceitual](#modelo-conceitual)
    - [Modelo Lógico](#modelo-lógico)
    - [Modelo Físico](#modelo-físico)
4. [Justificativa das Escolhas](#justificativa-das-escolhas)
5. [Execução do Banco de Dados](#execução-do-banco-de-dados)
6. [Estrutura de Arquivos](#estrutura-de-arquivos)
7. [Ferramentas Utilizadas](#ferramentas-utilizadas)
8. [Autores](#autores)
9. [Licença](#licença)

---

## Introdução

Este projeto tem como objetivo o desenvolvimento de um sistema de banco de dados relacional para a instituição fictícia **Faculdade Nova Geração**. A modelagem foi baseada em necessidades identificadas para o gerenciamento acadêmico, incluindo informações sobre alunos, professores, cursos, disciplinas, turmas e matrículas.

---

## Escopo do Projeto

O banco de dados foi projetado para atender as seguintes necessidades:
- Cadastro e gerenciamento de alunos, professores, cursos, disciplinas, turmas e matrículas.
- Controle de quais disciplinas são ofertadas em cada curso.
- Registro de quais professores são responsáveis por cada turma.
- Histórico de matrículas dos alunos em turmas distintas.

---

## Modelagem do Banco de Dados

### Modelo Conceitual

O modelo conceitual foi elaborado a partir da identificação das principais entidades do sistema e seus relacionamentos. As entidades identificadas são: **Aluno**, **Curso**, **Professor**, **Disciplina**, **Turma** e **Matrícula**.

#### Diagrama Entidade-Relacionamento (ER)

```
[Aluno] 1---N [Matrícula] N---1 [Turma] N---1 [Disciplina] N---1 [Curso]
                          |                  |
                          |                  N
                          |                  |
                          N                  |
                      [Professor] <---N--- [Turma]
```

**Legenda:**
- Um **Aluno** pode ter várias **Matrículas**.
- Uma **Matrícula** é referente a um único **Aluno** e a uma única **Turma**.
- Uma **Turma** corresponde a uma única **Disciplina** e a um único **Professor**.
- Uma **Disciplina** pode pertencer a um **Curso**.

##### Entidades e Principais Atributos

- **Aluno**
    - id_aluno (PK)
    - nome
    - email
    - data_nascimento

- **Curso**
    - id_curso (PK)
    - nome
    - carga_horaria

- **Professor**
    - id_professor (PK)
    - nome
    - titulacao

- **Disciplina**
    - id_disciplina (PK)
    - nome
    - id_curso (FK)

- **Turma**
    - id_turma (PK)
    - id_disciplina (FK)
    - semestre
    - id_professor (FK)

- **Matrícula**
    - id_matricula (PK)
    - id_aluno (FK)
    - id_turma (FK)
    - data_matricula

#### Cardinalidades

- Aluno x Matrícula: 1:N
- Matrícula x Turma: N:1
- Turma x Disciplina: N:1
- Disciplina x Curso: N:1
- Turma x Professor: N:1

---

### Modelo Lógico

Transformação das entidades e relacionamentos do modelo conceitual para o modelo relacional, com tabelas, colunas, chaves primárias e estrangeiras:

```sql
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
```

---

### Modelo Físico

O modelo físico é implementado no arquivo [`estrutura_e_dados.sql`](./estrutura_e_dados.sql). Esse arquivo contém todos os comandos SQL para:

- Criação do banco de dados e tabelas.
- Definição das chaves primárias e estrangeiras para garantir a integridade referencial.
- Inserção de pelo menos 10 registros em cada tabela, simulando dados reais.

**Exemplo de inserção para a tabela Aluno**:

```sql
INSERT INTO Aluno (nome, email, data_nascimento) VALUES
('Ana Souza', 'ana.souza@email.com', '2002-04-15'),
('Bruno Lima', 'bruno.lima@email.com', '2001-10-12'),
...
;
```

O script completo está disponível no arquivo citado acima.

---

## Justificativa das Escolhas

O modelo foi projetado com base em boas práticas de modelagem relacional, priorizando a normalização, integridade dos dados e flexibilidade para os processos acadêmicos. Utilizou-se uma entidade associativa (**Matrícula**) para representar a relação muitos-para-muitos entre **Aluno** e **Turma**. A entidade **Turma** permite a oferta de uma mesma disciplina em diferentes semestres e sob responsabilidade de diferentes professores.

---

## Execução do Banco de Dados

1. **Instale o MySQL Server** em sua máquina.
2. **Abra o MySQL Workbench** ou outro cliente de banco de dados.
3. **Execute o script** `estrutura_e_dados.sql` para criar o banco, as tabelas e inserir os dados.
4. **Faça consultas** e testes conforme desejado.

---

## Estrutura de Arquivos

- `README.md` — documentação completa do projeto.
- `estrutura_e_dados.sql` — script SQL para criação e alimentação do banco de dados.

---

## Ferramentas Utilizadas

- [MySQL Server](https://dev.mysql.com/)
- [MySQL Workbench](https://www.mysql.com/products/workbench/)
- [dbdiagram.io](https://dbdiagram.io/) (para modelagem visual)
- [Markdown](https://daringfireball.net/projects/markdown/) (documentação)

---

## Autores

- Wallace jardim
- Projeto acadêmico — Faculdade Nova Geração

---

## Licença

Uso livre para fins acadêmicos e educacionais.
