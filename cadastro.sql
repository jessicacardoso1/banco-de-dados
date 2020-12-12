create database cadastro
default character SET utf8
default collate utf8_general_ci;


use cadastro;
create table pessoa(
id int not null auto_increment,
nome varchar(30) not null,
nacimento date,
sexo ENUM('M', 'F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(30) DEFAULT 'Brasil',
primary key(id)
)DEFAULT CHARSET = utf8;
