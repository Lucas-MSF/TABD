create database sistema_academico;

use sistema_academico;

create table pessoa (
	cpf varchar(15),
    nome varchar(30),
    endereco text,
    sexo enum ('F','M'),
    cd_contato int,
    primary key(cpf)
);

create table aluno (
	cd_aluno int,
    cpf varchar(15),
    primary key (cd_aluno)
);

create table contato (
	cd_contato int,
    tipo varchar(15),
    contato varchar (25),
    primary key (cd_contato)
);

create table matricula (
	cd_Matricula int,
    cd_curso int,
    cd_Aluno int,
    data_matricula date,
    primary key (cd_Matricula)
);

create table matricula_disciplina (
	cd_Matdisciplina int,
    cd_disciplina int,
    cd_matricula int,
    primary key (cd_Matdisciplina)
);

create table cursos (
	cd_curso int,
    nome varchar(25),
    cd_disciplina int,
    primary key (cd_curso)
);

create table disciplina (
	cd_disciplina int,
    nome varchar(25),
    cd_professor int,
    carga_horaria int,
    primary key (cd_disciplina)
);

create table professor (
	cpf varchar(15),
    cd_professor int,
    primary key(cd_professor)
);

##     foreign key        ##

alter table aluno add foreign key (cpf) references pessoa(cpf);
alter table professor add foreign key (cpf) references pessoa(cpf);
alter table matricula add foreign key (cd_curso) references cursos(cd_curso);
alter table matricula add foreign key (cd_Aluno) references aluno(cd_aluno);
alter table cursos add foreign key (cd_disciplina) references disciplina(cd_disciplina);
alter table disciplina add foreign key (cd_professor) references professor(cd_professor);
alter table matricula_disciplina add foreign key (cd_disciplina) references disciplina(cd_disciplina);
alter table matricula_disciplina add foreign key (cd_matricula) references matricula(cd_Matricula);
