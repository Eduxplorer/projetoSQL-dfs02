-- Apagando banco de dados se existir

drop database dbLoja;

-- Criando banco de dados 

create database dbLoja;

-- Acessando bd

use dbLoja;

-- Vizualizando banco de dados

show databases;

-- Criando tabelas

create table tbUsuarios(
codUsu int,
nome varchar(50),
senha varchar(20)

); 

create table tbFuncionarios (
codFunc int,
nome varchar(100),
email varchar(100),
cpf char(14),
telCel char(10)

);

-- Visualizando as tabelas criadas

show tables;

--Visualizando as estruturas das tabelas

describe tbUsuarios;

desc tbFuncionarios;

-- Inserindo valores aos registros das tabelas

insert into tbUsuarios(codUsu,nome,senha) values(1,'eduardo.santos','deximbranco');

insert into tbFuncionarios(codFunc,nome,email,cpf,telCel) values(1,'Eduardo dos Santos Silva','eduardo.ssilva77@senacsp.edu.br','487.298.920-85','9878-8790');

-- Visualizando os registros nos campos das tabelas 

select * from tbUsuarios;
select * from tbFuncionarios;