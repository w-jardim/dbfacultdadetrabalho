# Projeto de Banco de Dados – Faculdade Nova Geração

## 1. Descrição do Projeto

Este projeto consiste no desenvolvimento de um banco de dados MySQL para a instituição fictícia **Faculdade Nova Geração**. O objetivo é organizar e gerenciar informações sobre alunos, cursos, professores, disciplinas, turmas e matrículas, de acordo com as necessidades acadêmicas da instituição.

---

## 2. Modelos do Banco de Dados

### 2.1 Modelo Conceitual

O modelo conceitual foi elaborado para representar o funcionamento acadêmico da instituição, envolvendo as seguintes entidades principais:

- **Aluno**: Alunos matriculados na instituição.
- **Curso**: Cursos ofertados.
- **Professor**: Professores responsáveis pelas turmas.
- **Disciplina**: Disciplinas pertencentes aos cursos.
- **Turma**: Ofertas de disciplinas em determinado semestre.
- **Matrícula**: Registro do vínculo do aluno com a turma.

#### Cardinalidades e Relacionamentos

- Um aluno pode realizar várias matrículas.
- Uma matrícula vincula um aluno a uma turma.
- Um curso possui várias disciplinas.
- Uma disciplina pode ser ofertada em várias turmas.
- Uma turma tem um professor responsável.
- Um professor pode ministrar várias turmas.

### 2.2 Modelo Lógico

O modelo lógico converte as entidades e relacionamentos em tabelas relacionais, com definição de chaves primárias e estrangeiras. As tabelas principais são:

- **Aluno** (id_aluno, nome, email, data_nascimento)
- **Curso** (id_curso, nome, carga_horaria)
- **Professor** (id_professor, nome, titulacao)
- **Disciplina** (id_disciplina, nome, id_curso)
- **Turma** (id_turma, id_disciplina, semestre, id_professor)
- **Matricula** (id_matricula, id_aluno, id_turma, data_matricula)

### 2.3 Modelo Físico

O modelo físico é composto pelo script SQL (`estrutura_e_dados.sql`) que cria as tabelas e insere registros de exemplo, respeitando regras de integridade referencial.

---

## 3. Estrutura dos Arquivos

- `README.md`: este documento, com explicação dos modelos.
- `estrutura_e_dados.sql`: script para criação e população do banco de dados no MySQL.

---

## 4. Observações

- O projeto pode ser adaptado para outras instituições, bastando alterar nomes e dados de exemplo.
- Diagramas ER podem ser gerados em ferramentas como dbdiagram.io, draw.io ou Lucidchart.
- O banco de dados está pronto para testes em ambiente acadêmico.

---

**Desenvolvido para fins didáticos.**
