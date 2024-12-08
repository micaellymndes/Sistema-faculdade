create database Faculdade_federal;
use faculdade_federal;

create table tbl_aluno (
id int auto_increment not null primary key,
nome_aluno varchar(100) not null,
cpf varchar(18) not null, 
data_nascimento date not null,
turno varchar(20) not null,
unique index (id)
);

create table tbl_telefone_aluno(
id int auto_increment not null primary key,
numero int not null,
id_aluno int,

constraint FK_aluno_telefone 
foreign key (id_aluno)
references tbl_aluno (id),
unique index (id) 
); 

create table tbl_email_aluno (
id int auto_increment not null primary key,
email_aluno varchar (255) not null,
id_aluno int,

constraint FK_aluno_email 
foreign key (id_aluno)
references tbl_aluno (id),
unique index (id)
); 

create table tbl_professores (
id int auto_increment not null primary key,
nome_professor varchar(100) not null,
cpf varchar(18) not null,
unique index (id)
);

create table tbl_telefone_professores (
id int auto_increment not null primary key,
numero int not null,
id_professores int,

constraint FK_professor_telefone 
foreign key (id_professores)
references tbl_professores (id),
unique index (id)
);

create table tbl_email_professores (
id int auto_increment not null primary key,
email varchar (255) not null,
id_professores int,

constraint FK_professor_email
foreign key (id_professores)
references tbl_professores (id),
unique index (id)

);

create table tbl_cursos (
id int auto_increment not null primary key,
nome_curso varchar (300) not null,
descricao varchar(300) not null,
carga_horaria varchar(18) not null,
unique index (id) 
);

create table tbl_disciplinas ( 
id int auto_increment not null primary key,
nome_disciplina varchar(100) not null,
id_professores int,
id_cursos int,

constraint FK_professor_disciplina
foreign key (id_professores) 
references tbl_professores (id),

constraint FK_curso_disciplina
foreign key (id_cursos) 
references tbl_cursos (id),
 unique index (id) 
 );

create table tbl_turma (
id int auto_increment not null primary key,
nome_turma varchar(100) not null,
id_cursos int,

constraint FK_curso_turma 
foreign key (id_cursos)
references tbl_cursos (id),
unique index (id)
);

create table tbl_aluno_turma (
id int auto_increment not null primary key, 
data_entrada date not null,
id_aluno int,
id_turma int,

constraint FK_aluno_na_turma
foreign key (id_aluno) 
references tbl_aluno (id),

constraint FK_turma_do_aluno
foreign key (id_turma)
references tbl_turma (id),
unique index (id) 
);
create table tbl_matricula (
id int auto_increment not null primary key,
data_matricula date not null,
id_aluno int,

constraint FK_aluno_matricula
foreign key (id_aluno) 
references tbl_aluno (id),
unique index (id)
);

create table tbl_nota (
id int auto_increment not null primary key,
nota_aluno decimal not null,
id_aluno int,

constraint FK_nota_aluno
foreign key (id_aluno) 
references tbl_aluno (id),
unique index (id) 
);

