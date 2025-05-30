create table Alunos (
Codigo int,
Nome_aluno varchar (30),
Idade int,
Sexo char);

create table Conta_Corrente (
Numero int,
Nome_agencia varchar (15),
Saldo numeric (12,2));

create table Alunos2 (
Codigo int not null,
Nome_aluno varchar (30) not null,
Idade int,
Sexo char);

create table Alunos3 (
Codigo int primary key,
Nome_aluno varchar (30) not null,
Idade int,
Sexo char);

create table Alunos4 (
Codigo serial not null,
Nome_aluno varchar (30) not null,
Idade int,
Sexo char);

alter table Alunos add Endereco varchar
(100);

alter table Alunos alter column
Nome_Aluno type varchar (50);

alter table Alunos rename column
Codigo to matricula;

alter table Alunos drop column sexo;

alter table Alunos add primary
key (Matricula);

alter table Alunos rename to Alunos_Uni;

drop table Alunos_Uni;

CREATE TABLE Aluno (
matricula int not null,
nome_aluno varchar (30) not null,
Primary key (matricula));

CREATE TABLE Disciplina (
codigo int not null,
nome_disciplina varchar (30) not null,
Primary key (codigo));

CREATE TABLE matricula_alunos (
mat_A int references Aluno (matricula),
cod_D int references Disciplina (codigo),
Data_mat Date);

CREATE TABLE matricula_alunos2 (
mat_A int references Aluno (matricula),
cod_D int references Disciplina (codigo),
Data_mat Date,
Primary key (mat_A, cod_D));

insert into Aluno values (1, 'Adriana');
insert into Aluno values (2, 'Alex');
insert into Aluno values (4, 'Pedro');
insert into Aluno values (3, 'Marcos');