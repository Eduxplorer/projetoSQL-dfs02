drop database dbBarbearia;

create database dbBarbearia;

use dbBarbearia;

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
marca varchar(50),
preco decimal(9,2),
primary key(codProd)
);

insert into tbProdutos(descricao,marca,preco) values('Sabonete Glicerinado', 'Granado', 5.00);
insert into tbProdutos(descricao,marca,preco) values('Shampoo Cachos Perfeitos', 'Elseve', 15.00);
insert into tbProdutos(descricao,marca,preco) values('Barbeador 3 Laminas', 'Gillete', 7.00);
insert into tbProdutos(descricao,marca,preco) values('Condicionador Longo Reparo', 'Nivea', 16.00);
insert into tbProdutos(descricao,marca,preco) values('Hidratante Corporal', 'CeRave', 25.00);

select * from tbProdutos;

delete from tbProdutos where codProd = 3;

select * from tbProdutos;

select codProd as 'Código', descricao as 'Descrição', marca as 'Marca', preco as 'Preço' from tbProdutos;