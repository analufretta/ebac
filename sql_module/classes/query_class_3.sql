/* Aula 2 */

use informatica;

desc clients;

-- Basic alterations >> add and remove columns
alter table clients add column address varchar(255);
alter table clients add city varchar(255);
-- alter table clients drop city;

-- Altering existent clumns
alter table clients modify client_name varchar(150); -- alter column type
alter table clients change client_name full_name varchar(255);
alter table clients alter city set default 'not informed';
alter table clients change client_it client_id varchar(255); -- sintax error duriong table creation
alter table clients rename column client_id to id_client;

-- foreign keys
create table product (id_product int primary key);
alter table clients add column product_id int;
alter table clients add foreign key (product_id) references product(id_product);

-- Rename table
alter table clients rename to former_clients;

desc former_clients;

-- Delete tables
drop table if exists former_clients; #always use 'if existis'
drop table if exists product;



 