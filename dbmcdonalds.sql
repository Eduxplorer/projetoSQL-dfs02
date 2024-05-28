drop database dbmcdonalds;

create database dbmcdonalds;

use dbmcdonalds;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
telefone char(11),
endereco varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado char(2),
primary key(codFunc)
); 

insert into tbFuncionarios(nome, email, telefone, endereco, numero, cep, bairro, cidade, estado) values('Abner felizardo', 'zettirules86@gmail.com', '11987349735', 'Rua Vila Alegre', '425', '08090-001', 'Vista alegre', 'Sao Paulo', 'SP');

insert into tbFuncionarios(nome, email, telefone, endereco, numero, cep, bairro, cidade, estado) values('Arthur dos Santos Cabral', 'ronaldinhosoccer77@hotmail.com', '41983640274', 'Santo Antonio', '678', '09857-489', 'Renan Pinheiros', 'Rio de Janeiro', 'RJ');

insert into tbFuncionarios(nome, email, telefone, endereco, numero, cep, bairro, cidade, estado) values('Gabriella Lima Fernandes', 'gabe.koelha20@gmail.com', '11938475309', 'Rua Sao Jose da Mata', '2094', '10495-007', 'Distrito Rodrigues', 'Curitiba', 'PR');

insert into tbFuncionarios(nome, email, telefone, endereco, numero, cep, bairro, cidade, estado) values('Gustavo Pereira da Mata', 'gupereira50@gmail.com', '11983903942', 'Vila Nova do Campo', '987', '09383-002', 'Rodolfo Alberto', 'Sao Paulo', 'SP');

insert into tbFuncionarios(nome, email, telefone, endereco, numero, cep, bairro, cidade, estado) values('Beatriz dos Santos Rodrigues', 'swifttaylorbia01@gmail.com', '8345936784', 'Rua Albuarque', '265', '00293-008', 'Maria dos Altos', 'Joao Pessoa', 'PB');

select * from tbFuncionarios;

UPDATE tbFuncionarios SET nome = 'Alisson Samuel', email = 'alissu155@gmail.com', telefone = '11983746934', endereco = 'Vila Mariana', numero = '459', cep = '02036-001', bairro = 'Santos dos Pinhais', cidade = 'Sao Paulo', estado = 'SP' where codFunc = 2;

UPDATE tbFuncionarios SET nome = 'Ana Gabriella', email = 'anajoestar677@gmail.com', telefone = '11983746593', endereco = 'Santa Cruz', numero = '570', cep = '90122-003', bairro = 'Junior Silveiro', cidade = 'Sao Paulo', estado = 'SP' where codFunc = 5;

UPDATE tbFuncionarios SET nome = 'Simam Ferreira', email = 'heavenswar101@hotmail.com', telefone = '92902387495', endereco = 'Santa Cecilia', numero = '110', cep = '50234-002', bairro = 'Bairro da União', cidade = 'Manaus', estado = 'AM' where codFunc = 4;

select * from tbFuncionarios;

delete from tbFuncionarios where codFunc = 5;

select * from tbFuncionarios;

select codFunc as 'Código', nome as 'Nome', email as 'Email', telefone as 'Celular', endereco as 'Endereço', numero as 'Número', cep as 'CEP', bairro as 'Bairro', cidade as 'Cidade', estado as 'Estado' from tbFuncionarios;

select codFunc as 'Código', nome as 'Nome', email as 'Email', telefone as 'Celular', endereco as 'Endereço', numero as 'Número', cep as 'CEP', bairro as 'Bairro', cidade as 'Cidade', estado as 'Estado', 'Demitido' as 'Demissões' from tbFuncionarios;

select email from tbFuncionarios;

select estado, cidade, email from tbFuncionarios;

select codFunc * 1000 as 'Implementando Funcionários' from tbFuncionarios;