-- create table Alunos (
-- Codigo int,
-- Nome_aluno varchar (30),
-- Idade int,
-- Sexo char);

-- create table Conta_Corrente (
-- Numero int,
-- Nome_agencia varchar (15),
-- Saldo numeric (12,2));

-- create table Alunos2 (
-- Codigo int not null,
-- Nome_aluno varchar (30) not null,
-- Idade int,
-- Sexo char);

-- create table Alunos3 (
-- Codigo int primary key,
-- Nome_aluno varchar (30) not null,
-- Idade int,
-- Sexo char);

-- create table Alunos4 (
-- Codigo serial not null,
-- Nome_aluno varchar (30) not null,
-- Idade int,
-- Sexo char);

-- alter table Alunos add Endereco varchar
-- (100);

-- alter table Alunos alter column
-- Nome_Aluno type varchar (50);

-- alter table Alunos rename column
-- Codigo to matricula;

-- alter table Alunos drop column sexo;

-- alter table Alunos add primary
-- key (Matricula);

-- alter table Alunos rename to Alunos_Uni;

-- drop table Alunos_Uni;

-- CREATE TABLE Aluno (
-- matricula int not null,
-- nome_aluno varchar (30) not null,
-- Primary key (matricula));

-- CREATE TABLE Disciplina (
-- codigo int not null,
-- nome_disciplina varchar (30) not null,
-- Primary key (codigo));

-- CREATE TABLE matricula_alunos (
-- mat_A int references Aluno (matricula),
-- cod_D int references Disciplina (codigo),
-- Data_mat Date);

-- CREATE TABLE matricula_alunos2 (
-- mat_A int references Aluno (matricula),
-- cod_D int references Disciplina (codigo),
-- Data_mat Date,
-- Primary key (mat_A, cod_D));

-- insert into Aluno values (1, 'Adriana');
-- insert into Aluno values (2, 'Alex');
-- insert into Aluno values (4, 'Pedro');
-- insert into Aluno values (3, 'Marcos');

CREATE TABLE Usuario(
IdUsuario SERIAL PRIMARY KEY,
cpf VARCHAR(14) NOT NULL,
nome VARCHAR(50) NOT NULL,
email VARCHAR(40) NOT NULL,
login VARCHAR(15) NOT NULL,
senha VARCHAR(15) NOT NULL,
tipoUsuario VARCHAR(20) NOT NULL;);

INSERT INTO Usuario (cpf, nome, email, login, senha, tipoUsuario) VALUES
('123.456.789-00', 'João Silva', 'joao.silva@email.com', 'joaos', 'senha123', 'Dono'),
('987.654.321-11', 'Maria Oliveira', 'maria.oliveira@email.com', 'mariao', 'abc@123', 'Escritor'),
('111.222.333-44', 'Carlos Souza', 'carlos.souza@email.com', 'carloss', 'qwerty12', 'Avaliador'),
('555.666.777-88', 'Ana Costa', 'ana.costa@email.com', 'anac', 'senhaAna', 'Escritor'),
('999.888.777-66', 'Bruno Lima', 'bruno.lima@email.com', 'brunol', 'limabr123', 'Avaliador'),
('321.654.987-00', 'Fernanda Rocha', 'fernanda.rocha@email.com', 'fernandar', 'pass456', 'Escritor'),
('444.333.222-11', 'Rafael Martins', 'rafael.martins@email.com', 'rafaelm', 'martins2025', 'Dono'),
('666.777.888-99', 'Luciana Mendes', 'luciana.mendes@email.com', 'lucianam', 'luc@2025', 'Avaliador'),
('112.233.344-55', 'Paulo Henrique', 'paulo.henrique@email.com', 'pauloh', 'phsenha!', 'Escritor'),
('778.899.000-11', 'Juliana Dias', 'juliana.dias@email.com', 'julianad', 'jdias1234', 'Escritor');


CREATE TABLE Livro (
    IdLivro SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    anoPublicacao INT,
    genero VARCHAR(50),
    IdEscritor INT NOT NULL,
    FOREIGN KEY (IdEscritor) REFERENCES Usuario(IdUsuario)
);

INSERT INTO Livro (titulo, isbn, anoPublicacao, genero, IdEscritor) VALUES
('Segredos da Floresta', '978-85-12345-01-1', 2022, 'Aventura', 2),
('Caminhos do Destino', '978-85-12345-02-8', 2021, 'Romance', 4),
('A Última Verdade', '978-85-12345-03-5', 2023, 'Suspense', 6),
('Luz e Sombra', '978-85-12345-04-2', 2020, 'Ficção Científica', 9),
('Histórias de Um Sonho', '978-85-12345-05-9', 2024, 'Drama', 10),
('Além da Tempestade', '978-85-12345-06-6', 2023, 'Aventura', 2),
('Sombras do Passado', '978-85-12345-07-3', 2022, 'Mistério', 4),
('Fragmentos do Amanhã', '978-85-12345-08-0', 2024, 'Ficção Científica', 6),
('O Último Sussurro', '978-85-12345-09-7', 2021, 'Terror', 9),
('Renascer', '978-85-12345-10-3', 2023, 'Autoajuda', 10);
 