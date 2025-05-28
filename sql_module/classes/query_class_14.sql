/* Aula 14: Importacao de Dados */

create database loja_informatica;

use loja_informatica;

select * from backup_cliente;
select * from backup_produto;
select * from backup_pedido;

desc backup_cliente;

create table if not exists cliente (
	id_cliente int primary key,
    nome varchar (200),
    email varchar (100),
    cidade varchar (100)
);

desc backup_produto;

create table if not exists produto (
	id_produto int primary key,
    nome varchar (200),
    categoria varchar(100),
    preco decimal (10,2)
);

desc backup_pedido;

create table if not exists pedido (
	id_pedido int primary key,
    id_cliente int,
    foreign key (id_cliente) references cliente(id_cliente),
    id_produto int,
    foreign key (id_produto) references produto(id_produto),
    quantidade int,
    data_pedido date
);

insert into cliente select * from backup_cliente;
insert into produto select * from backup_produto;
insert into pedido select * from backup_pedido; #ERRO por causa do formato da data

alter table backup_pedido rename column Data to data_pedido;

select id_pedido, quantidade, data_pedido from backup_pedido
	where quantidade = 'NULL' or data_pedido = 'NULL';

set sql_safe_updates = 0;

update backup_pedido
	set quantidade = null, data_pedido = null
    where quantidade = 'NULL' or data_pedido = 'NULL';

set sql_safe_updates = 1;

select id_pedido, quantidade, data_pedido from backup_pedido
	where quantidade is null or data_pedido is null;

insert into pedido
	select id_pedido, id_cliente, id_produto, quantidade, str_to_date (data_pedido,'%d/%m/%Y')
    from backup_pedido;

select * from cliente;
select * from produto;
select * from pedido;
