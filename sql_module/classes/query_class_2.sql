/* Aula 2 */

use informatica;

create table if not exists clients(
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