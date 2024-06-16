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
codCli int not null,
codFunc int not null,
data_ped datetime not null,
val_ped decimal(9,2) not null default 0 check(val_ped >= 0),
primary key(num_ped),
foreign key(codCli) references tbClientes(codCli),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulosArtistas(
codTit int not null,
codArt int not null,
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

insert into tbClientes(nome_cli, end_cli, renda_cli, sexo_cli) values('Jóse Nogueira', 'Rua A', 1500.00, 'M'), ('Ângelo Pereira', 'Rua B', 2000.00, 'M'), ('Além Mar Paranhos', 'Rua C', 1500.00, 'M'), ('Catarina Souza', 'Rua D', 892.00, 'F'), ('Vagner Costa', 'Rua E', 950.00, 'M'), ('Antenor da Costa', 'Rua F', 1582.00, 'M'), ('Maria Amélia de souza', 'Rua G', 1152, 'F'), ('Paulo Roberto Silva', 'Rua H', 3250.00, 'M'), ('Fátima Souza', 'Rua I', 1632.00, 'F'), ('Joel da Rocha', 'Rua J', 2000.00, 'M');