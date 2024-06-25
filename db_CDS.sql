drop database db_CDS;

create database db_CDS;

use db_CDS;

-- Criação de Tabelas

create table tbArtistas(
codArt int not null auto_increment,
nome_art varchar(100) not null unique,
primary key(codArt)
);

create table tbGravadoras(
codGrav int not null auto_increment,
nome_grav varchar(50) not null unique,
primary key(codGrav)
);

create table tbCategorias(
codCat int not null auto_increment,
nome_cat varchar(50) not null unique,
primary key(codCat)
);

create table tbEstados(
sigla_est char(2) not null,
nome_est varchar(50) not null unique,
primary key(sigla_est)
);

create table tbCidades(
codCid int not null auto_increment,
nome_cid varchar(50) not null,
sigla_est char(2) not null,
primary key(codCid),
foreign key(sigla_est) references tbEstados(sigla_est)
);

create table tbClientes(
codCli int not null auto_increment,
codCid int not null,
nome_cli varchar(50) not null,
end_cli varchar(100) not null,
renda_cli decimal(9,2) not null default 0 check(renda_cli >= 0),
sexo_cli char(1) not null default 'F' check(sexo_cli in('F', 'M')),
primary key(codCli),
foreign key(codCid) references tbCidades(codCid)
);

create table tbConjuge(
codConj int not null auto_increment,
nome_conj varchar(50) not null,
renda_conj decimal(9,2) not null default 0 check(renda_conj >= 0),
sexo_conj char(1) not null default 'F' check(sexo_conj in('F', 'M')),
codCli int not null,
primary key(codConj),
foreign key(codCli) references tbClientes(codCli)
); 

create table tbFuncionarios(
codFunc int not null auto_increment,
nome_func varchar(50) not null,
end_func varchar(100) not null,
sal_func decimal(9,2) not null default 0 check(sal_func >= 0),
sexo_func char(1) not null default 'F' check(sexo_func in('F', 'M')),
primary key(codFunc)
);

create table tbDependentes(
codDep int not null auto_increment,
codFunc int not null,
nome_dep varchar(100) not null,
sexo_dep char(1) not null default 'F' check(sexo_dep in('F', 'M')),
primary key(codDep),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulos(
codTit int not null auto_increment,
codCat int not null,
codGrav int not null,
nome_cd varchar(50) not null unique,
val_cd decimal(9,2) not null check(val_cd > 0),
qtd_estq int not null check(qtd_estq >= 0),
primary key(codTit),
foreign key(codCat) references tbCategorias(codCat),
foreign key(codGrav) references tbGravadoras(codGrav)
);


create table tbPedidos(
num_ped int not null auto_increment,
codCli int not null,
codFunc int not null,
data_ped datetime not null,
val_ped decimal(9,2) not null default 0 check(val_ped >= 0),
primary key(num_ped),
foreign key(codCli) references tbClientes(codCli),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulosPedidos(
num_ped int not null,
codTit int not null,
qtd_cd int not null check(qtd_cd >= 1),
val_cd decimal(9,2) not null check(val_cd > 0),
foreign key(num_ped) references tbPedidos(num_ped),
foreign key(codTit) references tbTitulos(codTit)
);

create table tbTitulosArtistas(
codTit int not null,
codArt int not null,
primary key(num_ped, codTit)
foreign key(codTit) references tbTitulos(codTit),
foreign key(codArt) references tbArtistas(codArt)
);

-- Vizualizar estruturas das Tabelas

desc tbArtistas;
desc tbGravadoras;
desc tbCategorias;
desc tbEstados;
desc tbCidades;
desc tbClientes;
desc tbConjuge;
desc tbFuncionarios;
desc tbDependentes;
desc tbTitulos;
desc tbPedidos;
desc tbTitulosPedidos;
desc tbTitulosArtistas;

-- Lista de Inserts

-- Artistas

insert into tbArtistas(nome_art) values('Marisa Monte'), ('Gilberto Gil'), ('Caetano Veloso'), ('Milton Nascimento'), ('Legião Urbana'), ('The Beatles'), ('Rita Lee');

select codArt as 'Código', nome_art as 'Artistas' from tbArtistas order by codArt;

-- Gravadoras

insert into tbGravadoras(nome_grav) values('Polygram'), ('Emi'), ('Som Livre'), ('Som Music');

select codGrav as 'Código', nome_grav as 'Gravadora' from tbGravadoras order by codGrav;

-- Categorias

insert into tbCategorias(nome_cat) values('MPB'), ('Trilha Sonora'), ('Rock Internacional'), ('Rock Nacional');

select codCat as 'Código', nome_cat as 'Categorias' from tbCategorias order by codCat;

-- Estados

insert into tbEstados(sigla_est, nome_est) values('SP', 'São Paulo'), ('MG', 'Minas Gerais'), ('RJ', 'Rio de Janeiro'), ('ES', 'Espirito Santo');

select sigla_est as 'Sigla', nome_est as 'Estado' from tbEstados order by nome_est desc limit 3;

-- Cidades 

insert into tbCidades(sigla_est, nome_cid) values('SP','São Paulo'), ('SP','Sorocaba'), ('SP','Jundiaí'), ('SP','Americana'), ('SP', 'Araraquara'), ('MG', 'Ouro Preto'), ('ES', 'Cachoeira do Itapemirim');

select codCid as 'Código', sigla_est as 'Estado', nome_cid as 'Cidade' from tbCidades order by codCid;


-- Clientes

insert into tbClientes(codCid, nome_cli, end_cli, renda_cli, sexo_cli) values(1, 'Jóse Nogueira', 'Rua A', 1500.00, 'M'), (1, 'Ângelo Pereira', 'Rua B', 2000.00, 'M'), (1, 'Além Mar Paranhos', 'Rua C', 1500.00, 'M'), (1, 'Catarina Souza', 'Rua D', 892.00, 'F'), (1, 'Vagner Costa', 'Rua E', 950.00, 'M'), (2, 'Antenor da Costa', 'Rua F', 1582.00, 'M'), (2, 'Maria Amélia de souza', 'Rua G', 1152, 'F'), (2, 'Paulo Roberto Silva', 'Rua H', 3250.00, 'M'), (3, 'Fátima Souza', 'Rua I', 1632.00, 'F'), (3, 'Joel da Rocha', 'Rua J', 2000.00, 'M');

select codCli as 'Código do Cliente', codCid as 'Código da Cidade', nome_cli as 'Nome', end_cli as 'Endereço', renda_cli as 'Renda', sexo_cli as 'Sexo' from tbClientes order by codCli;

-- Conjuges

insert into tbConjuge(codCli, nome_conj, renda_conj, sexo_conj) values(1, 'Carla Nogueira', 2500.00, 'F'), (2, 'Emilia Pereira', 5500.00, 'F'), (6, 'Altiva da Costa', 3000.00, 'F'), (7, 'Carlos de Souza', 3250.00, 'M');

select codConj as 'Código', nome_conj as 'Nome', renda_conj as 'Renda', sexo_conj as 'Sexo' from tbConjuge order by codConj;

-- Funcionários

insert into tbFuncionarios(nome_func, end_func, sal_func, sexo_func) values('Vânia Gabriela Pereira', 'Rua A', 2500.00, 'F'), ('Norberto Pereira da Silva', 'Rua B', 300.00, 'M'), ('Olavo Linhares', 'Rua C', 580.00, 'M'), ('Paula da Silva', 'Rua D', 3000.00, 'F'), ('Rolando Rocha', 'Rua E', 2000.00, 'M'), ('Tadano Cabral', 'Rua F', 1200, 'M'), ('Kaori da Mata', 'Rua G', 11000.00, 'F');

select codFunc as 'Código', nome_func as 'Nome', end_func as 'Endereço', sal_func as 'Salário', sexo_func as 'Sexo' from tbFuncionarios order by codFunc limit 5;

-- Dependentes

insert into tbDependentes(codFunc, nome_dep, sexo_dep) values(1, 'Ana Pereira', 'F'), (1,'Roberto Pereira', 'M'), (1, 'Celso Pereira', 'M'), (3, 'Brisa Linhares', 'F'), (3, 'Mari Sol Linhares', 'F'), (4, 'Sonia da Silva', 'F');

select codDep as 'Código do Dependente', codFunc as 'Código do Funcionário', nome_dep as 'Nome', sexo_dep as 'Sexo' from tbDependentes order by codDep;

-- Titulos

insert into tbTitulos(codCat, codGrav, nome_cd, val_cd, qtd_estq) values(1, 1, 'Tribalistas', 30.00, 1500), (1, 2, 'Tropicália', 50.00, 500), (1, 1, 'Aquele Abraço', 50.00, 600), (1, 2, 'Refazenda', 60.00, 1000), (1, 3, 'Totalmente Demais', 50.00, 2000), (1, 3, 'Travessia', 55.00, 500), (1, 2, 'Courage', 30.00, 200), (4, 3, 'Legião Urbana', 20.00, 100), (3, 2, 'The Beatles', 30.00, 300), (4, 1, 'Rita lee', 30.00, 500);

select codTit as 'Titulo', codCat as 'Categoria', codGrav as 'Gravadora', nome_cd as 'Nome', val_cd as 'Valor', qtd_estq as 'Quantidade' from tbTitulos order by codTit;

-- Pedidos

insert into tbPedidos(codCli, codFunc, data_ped, val_ped) values(1, 2, '02-05-02', 1500.00), (3, 4, '02-05-02', 50.00), (4, 7, '02-06-02', 100.00), (1, 4, '02-02-03', 200.00), (7, 5, '02-03-03', 300.00), (4, 4, '02-03-03', 100.00), (5, 5, '02-03-03', 50.00), (8, 2, '02-03-03', 50.00), (2, 2, '02-03-03', 2000.00), (7, 1, '02-03-03', 3000.00);

select num_ped as 'Pedido', codCli as 'Cliente', codFunc as 'Funcionário', data_ped as 'Data', val_ped as 'Valor' from tbPedidos order by num_ped;

-- Titulos Artista

insert into tbTitulosArtistas(codTit, codArt) values(1, 1), (2, 2), (3,2), (4, 2), (5, 3), (6, 4), (7, 4), (8,5), (9, 6), (10, 7);

select codTit as 'Titulo', codArt as 'Artista' from tbTitulosArtistas order by codTit;

-- Titulos Pedido

insert into tbTitulosPedidos(num_ped, codTit, qtd_cd, val_cd) values(1, 1, 2, 30.00), (1, 2, 3, 20.00), (2, 1, 1, 50.00), (2, 2, 3, 30.00), (3, 1, 2, 40.00), (4, 2, 3, 20.00), (5, 1, 2, 25.00), (6, 2, 3, 30.00), (6, 3, 1, 35.00), (7, 4, 2, 55.00), (8, 1, 4, 60.00), (9, 2, 3, 15.00), (10, 7, 2, 15.00);

select num_ped as 'Pedido', codTit as 'Titulo', qtd_cd as 'Quantidade', val_cd as 'Valor' from tbTitulosPedidos order by num_ped;



-- Exercicios Pag 88 - Pag 89

-- 1. Selecione o nome dos CDs e o nome da gravadora de cada CD.

select tit.nome_cd as 'CD', grav.nome_grav as 'Gravadora' from tbTitulos as tit inner join tbGravadoras as grav on tit.codGrav = grav.codGrav;


-- 2. Selecione o nome dos CDs e o nome da categoria de cada CD.

select tit.nome_cd as 'CD', cat.nome_cat as 'Categoria' from tbTitulos as tit inner join tbCategorias as cat on tit.codCat = cat.codCat; 



-- 3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de cada CD

select tit.nome_cd as 'CD', grav.nome_grav as 'Gravadora', cat.nome_cat as 'Categorias' from tbTitulos as tit inner join tbGravadoras as grav on tit.codGrav = grav.codGrav inner join tbCategorias as cat on tit.codCat = cat.codCat;



-- 4. Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o cliente fez.

select cli.nome_cli as 'Cliente', tit.nome_cd as 'Titulo' from tbClientes AS cli
    INNER JOIN tbPedidos AS ped ON cli.codCli = ped.codCli
    INNER JOIN tbTitulosPedidos AS pd ON ped.num_ped = pd.num_ped
    INNER JOIN tbTitulos AS tit ON pd.codTit = tit.codTit;


-- 5. Selecione o nome do funcionário, número, data e valor dos pedidos que este funcionário registrou, além do nome do cliente que está fazendo o pedido.

select func.nome_func 'Nome do Funcionario', ped.num_ped 'Pedido', ped.data_ped as 'Data', ped.val_ped as 'Valor' from tbFuncionarios 
