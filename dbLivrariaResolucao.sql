drop database dbLivrariaResolucao;

create database dbLivrariaResolucao;

use dbLivrariaResolucao;

create table tbGeneros(
idGenero int not null auto_increment,
descricao varchar(100),
primary key(idGenero)
);

create table tbAutores(
idAutor int not null auto_increment,
nome varchar(100),
email varchar(100),
primary key(idAutor)
);


create table tbClientes(
idCliente int not null auto_increment,
nome varchar(100),
telefone char(9),
primary key(idCliente)
);

create table tbLivros(
idLivro int not null auto_increment,
titulo varchar(100),
preco decimal(9,2),
estoque int, 
idGenero int not null,
primary key(idLivro),
foreign key(idGenero) references tbGeneros(idGenero)
);


create table tbVendas(
idVenda int not null auto_increment,
data date,
total decimal(9,2),
idCliente int not null,
primary key(idVenda),
foreign key(idCliente) references tbClientes(idCliente)
);

create table tbItens_Vendas(
idVenda int not null,
idLivro int not null,
quantidade int,
subtotal decimal(9,2),
foreign key(idVenda) references tbVendas(idVenda),
foreign key(idLivro) references tbLivros(idLivro)
);


create table tbEscreve(
idLivro int not null,
idAutor int not null,
foreign key(idLivro) references tbLivros(idLivro),
foreign key(idAutor) references tbAutores(idAutor)
);

desc tbGeneros;
desc tbAutores;
desc tbClientes;
desc tbLivros;
desc tbVendas;
desc tbItens_Vendas;
desc tbEscreve;

-- Cadastrando os registros nas tabelas

insert into tbGeneros(descricao) values('Tecnologia');
insert into tbGeneros(descricao) values('Ficcao');
insert into tbGeneros(descricao) values('Historia');
insert into tbGeneros(descricao) values('Terror');
insert into tbGeneros(descricao) values('Comedia');
insert into tbGeneros(descricao) values('Romance');
insert into tbGeneros(descricao) values('Documentario');

insert into tbAutores(nome, email) values('José Augusto N. G. Manzano', 'augustomanzano@hotmail.com');
insert into tbAutores(nome, email) values('C.S. Lewis', 'clivesstaples@hotmail.com');
insert into tbAutores(nome, email) values('Regine Pernoud', 'regine.ecclesiae@contact.com');
insert into tbAutores(nome, email) values('Stephen King', 'edwinking@gmail.com');
insert into tbAutores(nome, email) values('William Shakespeare', 'williamdrama@shakespeare.com');
insert into tbAutores(nome, email) values('Matt Haig', 'hello@matthaig.com');
insert into tbAutores(nome, email) values('Andrew leatherbarrow', 'andrewleat@contact.com');

insert into tbClientes(nome, telefone) values('Gabriella Lima', '973645708');
insert into tbClientes(nome, telefone) values('Abner Felizardo', '924693933');
insert into tbClientes(nome, telefone) values('Alisson Samuel', '932476503');

insert into tbLivros(titulo, preco, estoque, idGenero) values('Joana dArc', 144.32, 2, 3);
insert into tbLivros(titulo, preco, estoque, idGenero) values('Algoritmos', 57.32, 10, 1);
insert into tbLivros(titulo, preco, estoque, idGenero) values('A Anatomia de um Luto', 24.99, 5, 2);
insert into tbLivros(titulo, preco, estoque, idGenero) values('A Comedia dos Erros', 20.30, 23, 5);
insert into tbLivros(titulo, preco, estoque, idGenero) values('O Iluminado', 58.99, 6, 4);
insert into tbLivros(titulo, preco, estoque, idGenero) values('Os Humanos', 41.68, 15, 6);
insert into tbLivros(titulo, preco, estoque, idGenero) values('Chernobyl', 26.70, 30, 7);

insert into tbVendas(data, total, idCliente) values('2024-05-16', 44.29, 1);
insert into tbVendas(data, total, idCliente) values('2019-07-20', 20.30, 2);
insert into tbVendas(data, total, idCliente) values('2020-02-22', 85.69, 3);

insert into tbItens_Vendas(idVenda, idLivro, quantidade, subtotal) values(1, 3, 2, 44.29);
insert into tbItens_Vendas(idVenda, idLivro, quantidade, subtotal) values(3, 7, 2, 85.69);
insert into tbItens_Vendas(idVenda, idLivro, quantidade, subtotal) values(2, 4, 1, 20.30);


insert into tbEscreve(idLivro, idAutor) values();

-- Pesquisar os campos da tabela

select * from tbGeneros;
select * from tbAutores;
select * from tbClientes;
select * from tbLivros;
select * from tbVendas;
select * from tbItens_Vendas;