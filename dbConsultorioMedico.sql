drop database dbConsultorioMedico;

create database dbConsultorioMedico;

use dbConsultorioMedico;

create table Medico(
idMedico INT not null auto_increment,
nmMedico VARCHAR(45) not null,
telefoneMedico VARCHAR(9) not null,
primary key(idMedico)
);

create table Paciente (
idPaciente INT not null auto_increment,
nmPaciente VARCHAR(45) not null,
telefonePaciente VARCHAR(9) not null,
convenio VARCHAR(45),
primary key(idPaciente)
);



create table ReceitaMedica(
idReceitaMedica INT not null auto_increment,
descricao VARCHAR(500),
primary key(idReceitaMedica)
);


create table Consulta(
idConsulta INT not null auto_increment,
dt_consulta DATETIME,
Medico_idMedico INT not null,
Paciente_idPaciente int not null,
ReceitaMedica_idReceitaMedica int not null,
primary key(idConsulta),
foreign key(Medico_idMedico) references Medico(idMedico),
foreign key(Paciente_idPaciente) references Paciente(idPaciente),
foreign key(ReceitaMedica_idReceitaMedica) references ReceitaMedica(idReceitaMedica)
);

show tables;

desc Medico;
desc Paciente;
desc ReceitaMedica;
desc Consulta;