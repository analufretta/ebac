create database informatica;

use informatica;

create table clients(
	id_clients int,
    client_name varchar(255) not null
);

alter table clients add date_of_birth DATE;

show tables;

drop table clients;
