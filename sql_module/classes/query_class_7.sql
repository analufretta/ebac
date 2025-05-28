/* Aula 7: Consulta dados */

use informatica;

select * from clients;

update clients
set email = 'marcos@email.com', product_id = 2, additional_info = null
where id_client = 1;

update clients
set product_id = 1
where id_client = 2;

update clients
set date_of_birth = '2001-08-20', additional_info = null, product_id = 1
where id_client = 5;

insert into clients values
(null, 'Carol', 'carol@gmail.com', '1998-02-26', 5500, null, true, 1, current_timestamp()),
(null, 'João', 'joao@email.com', '1995-10-14', 5500, 'Inativo', false, null, current_timestamp());

-- Comandos de Consulta

select * from clients;
select client_name, email from clients;

-- create table from data selection
create table backup_client as select * from clients;
alter table backup_client rename to backup_clients; 

	# Ou criar table com as especificacoes e depois passar os dados
create table backup_clients_2(
	id_client int auto_increment primary key,
    client_name varchar(255) not null,
    email varchar (100) unique,
    date_of_birth date,
    credit_limit decimal(10,2),
    additional_info text,
    active_registration boolean default true,
    product_id int,
    registration_time timestamp default current_timestamp
);

insert into backup_clients_2 select * from clients; #cuidado com o auto increment --> better to do the first option;

desc clients;
desc backup_clients;
desc backup_clients_2;
select * from backup_clients;

-- Tests
# "resetting" autoincrement, as long as the deletion follows an order. The best practice is to ignore the order, since the function of autoincrement is to provide an unique key.
alter table clients auto_increment = 1;
insert into clients values
(null, 'Luiza', 'luiza@email.com', '1996-03-28', 60000, null, true, 4, current_timestamp());

alter table clients rename to clients_tests;
alter table backup_clients_2 rename to clients;

-- Select into --> mysql does not suport this
Select * into backup_clients
from clients_tests
where client_name = 'Luiza';

-- mysql version
insert into backup_clients
select * from clients_tests
where client_name = 'Luiza';