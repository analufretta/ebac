create database informatica;
use informatica;
create table clients(
	id int,
    nome varchar(50)
);
show tables;

alter table clients add date_of_birth DATE;

drop table clients;