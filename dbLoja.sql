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
nome varchar(50) not null,
senha varchar(20) not null,
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

create table tbVendas (
codVend int not null auto_increment,
valor decimal(9,2),
data date,
hora time,
quantidade int,
codUsu int not null,
codProd int not null,
codCli int not null,
primary key(codVend),
foreign key(codUsu) references tbUsuarios(codUsu),
foreign key(codProd) references tbProdutos(codProd),
foreign key(codCli) references tbClientes(codCli)
);

-- Visualizando as tabelas criadas

show tables;

--Visualizando as estruturas das tabelas


desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
describe tbUsuarios;
desc tbProdutos;
desc tbVendas;

-- Inserindo valores aos registros das tabelas


insert into tbFuncionarios(nome,email,cpf,telCel, logradouro, numero, cep, bairro, cidade, estado) values('Eduardo dos Santos Silva','eduardo.ssilva77@senacsp.edu.br','487.298.920-85','9878-8790', 'Rua Doutor Antonio', '355', '04750-000', 'Santo Amaro', 'Sao Paulo', 'SP');

insert into tbFuncionarios(nome,email,cpf,telCel, logradouro, numero, cep, bairro, cidade, estado) values('Gabriella Lima Fernandes','gabe.lima77@senacsp.edu.br','597.208.820-85','97078-8720', 'Rua sao franscisco', '425', '02050-001', 'Borda do Campo', 'Sao Jose dos pinhais', 'PR');

insert into tbUsuarios(nome,senha,codFunc) values('eduardo.santos','deximbranco', 1);

insert into tbUsuarios(nome,senha,codFunc) values('gabriella.lima','ilovechopper', 2);

-- Visualizando os registros nos campos das tabelas 

select * from tbFuncionarios;

select * from tbUsuarios;

