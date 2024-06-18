drop database dbConsultorioResolucao;

create database dbConsultorioResolucao;

use dbConsultorioResolucao;

create table tbMedicos(
 idMedico int not null auto_increment,
 nome varchar(100),
 telefone char(11) unique,
 primary key(idMedico)
);


create table tbPacientes(
idPaciente int not null auto_increment,
nome varchar(100),
telefone char(9) unique,
convenio varchar(100),
primary key(idPaciente)
);

create table tbReceitaMedica(
idReceitaMedica int not null auto_increment,
descricao varchar(100),
primary key(idReceitaMedica)
);

create table tbConsultas(
idConsulta int not null auto_increment,
data datetime,
idMedico int not null,
idPaciente int not null,
idReceitaMedica int not null,
primary key(idConsulta),
foreign key(idMedico) references tbMedicos(idMedico),
foreign key(idPaciente) references tbPacientes(idPaciente),
foreign key(idReceitaMedica) references tbReceitaMedica(idReceitaMedica)
);

desc tbMedicos;
desc tbPacientes;
desc tbReceitaMedica;
desc tbConsultas;

insert into tbMedicos(nome, telefone) values('Arthur Gustavo', '1194756-4783'), ('Gabriella Lima', '1199864-9748'),  ('Abner Felizardo', '1198275-8374');


insert into tbPacientes(nome, telefone, convenio) values('Ichigo da Silva', '1198765-8767', 'Almas Sociais'), ('Tanjiro Souza', '1198074-0876', 'Respire Bem'), ('Rukia Fernandes', '1198786-9878', 'Almas Sociais'), ('Reidner Armin', '1195678-9846', 'Posto Exploração'), ('Roger Tennison', '1198768-3457', 'Terra Saúde');


insert into tbReceitaMedica(descricao) values('Praticar exercicios de respiração'), ('Tomar vitaminas'), ('Fazer caminhada'), ('Fazer alongamentos'), ('Tomar dipirona monoidratada');


insert into tbConsultas(data, idMedico, idPaciente, idReceitaMedica) values('2024/05/18', 1, 2, 1), ('2024/06/18', 2, 1, 3), ('2024/06/18', 3, 3, 2), ('2024/06/18', 2, 5, 4), ('2024/07/02', 1, 4, 5);

select med.nome as 'Medico', pac.nome as 'Paciente', rec.descricao as 'Receita' from tbConsultas as con inner join tbMedicos as med on con.idMedico = med.idMedico inner join tbPacientes as pac on con.idPaciente = pac.idPaciente inner join tbReceitaMedica as rec on con.idReceitaMedica = rec.idReceitaMedica where med.nome like '%Z';

select med.nome as 'Medico', pac.nome as 'Paciente' from tbMedicos as med inner join tbPacientes as pac on med.idMedico = pac.idPaciente;