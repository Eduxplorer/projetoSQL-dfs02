drop database dbLivraria;

create database dbLivraria;

use dbLivraria;

create table tbCliente(
idCliente int not null auto_increment,
nome varchar(100),
telefone varchar(45),
primary key(idCliente)
);

create table tbAutor(
idAutor int not null auto_increment,
nome varchar(100),
email varchar(100),
primary key(idAutor)
);

create table tbGenero(
idGenero int not null auto_increment,
descricao varchar(100),
primary key(idGenero)
);

create table tbLivro(
idLivro int not null auto_increment,
titulo varchar(100),
preco float,
estoque int,
idGenero int not null,
primary key(idLivro),
foreign key(idGenero) references tbGenero(idGenero)
);
	
create table tbVenda(
idVenda int not null auto_increment,
data date,
total float,
idCliente int not null,
primary key(idVenda),
foreign key(idCliente) references tbCliente(idCliente)
); 

create table tbEscreve(
idEscreve int not null auto_increment,
idLivro int not null,
idAutor int not null,
primary key(idEscreve),
foreign key(idLivro) references tbLivro(idLivro),
foreign key(idAutor) references tbAutor(idAutor)
);

create table tbItens_da_Venda(
idItens_da_Venda int not null auto_increment,
qtd int not null,
subtotal varchar(45),
idVenda int not null,
idLivro int not null,
primary key(idItens_da_Venda),
foreign key(idVenda) references tbVenda(idVenda),
foreign key(idLivro) references tbLivro(idLivro)
);

desc tbCliente;
desc tbAutor;
desc tbGenero;
desc tbLivro;
desc tbVenda;
desc tbEscreve;
desc tbItens_da_Venda;
