/* Aula 2 */

use informatica;

create table clients(
	client_it int auto_increment primary key,
    client_name varchar(255) not null,
    email varchar (100) not null,
    date_of_birth date,
    credit_limit decimal(10,2),
    additional_info text,
    active_registration boolean default 1,
    product_id int,
    registration_time timestamp default current_timestamp,
    unique (email)
);

#also use 'create table if not exists'

drop table clients;