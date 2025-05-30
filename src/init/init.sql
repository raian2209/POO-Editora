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