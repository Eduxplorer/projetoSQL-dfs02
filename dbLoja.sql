-- Apagando banco de dados se existir

drop database dbLoja;

-- Criando banco de dados 

create database dbLoja;

-- Acessando bd

use dbLoja;

-- Vizualizando banco de dados

show databases;

-- Criando tabelas


create table tbFuncionarios (
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cpf char(14) not null unique,
telCel char(10),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado char(2),
primary key(codFunc)
); 

create table tbFornecedores (
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
cnpj char(16) not null unique,
primary key(codForn)
);

create table tbClientes (
codCli int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
primary key(codCli)
);

create table tbUsuarios(
codUsu int auto_increment,
nome varchar(50),
senha varchar(20),
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
); 

create table tbProdutos (
codProd int not null auto_increment,
descricao varchar(100),
valor decimal(9,2),
quantidade int,
data date,
hora time,
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn)
);


-- Visualizando as tabelas criadas

show tables;

--Visualizando as estruturas das tabelas

describe tbUsuarios;

desc tbFuncionarios;

-- Inserindo valores aos registros das tabelas


insert into tbFuncionarios(nome,email,cpf,telCel, logradouro, numero, cep, bairro, cidade, estado) values('Eduardo dos Santos Silva','eduardo.ssilva77@senacsp.edu.br','487.298.920-85','9878-8790', 'Rua Doutor Antônio', '355', '04750-000', 'Santo Amaro', 'Sao Paulo', 'SP');

insert into tbFuncionarios(nome,email,cpf,telCel, logradouro, numero, cep, bairro, cidade, estado) values('Gabriella Lima Fernandes','gabe.lima77@senacsp.edu.br','487.298.820-85','97078-8720', 'Rua são franscisco', '355', '04750-000', 'Borda do Campo', 'São José dos pinhais', 'PR');

insert into tbUsuarios(nome,senha,codFunc) values('eduardo.santos','deximbranco', 1);

insert into tbUsuarios(nome,senha,codFunc) values('gabriella.lima','ilovechopper', 2);

-- Visualizando os registros nos campos das tabelas 

select * from tbFuncionarios;

select * from tbUsuarios;
