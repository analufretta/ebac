/* Aula 22: Consultas Avançadas - View */

use loja_informatica;

select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 10;

-- View para simplificar tabela cliente
create view cliente_simples as
select id_cliente, nome, email
from cliente;

-- Consultar view
select * from cliente_simples limit 10; #tratar view como uma tabela

-- Visualizar a estrutura do view
show create view cliente_simples;
show create table cliente_simples; #mesma coisa que view
show create table cliente;
desc cliente_simples;

-- Manipular dados igual tabelas (update, insert, delete)

-- Atualizar
create or replace view cliente_simples as
select id_cliente, nome, cidade
from cliente;

select * from cliente_simples limit 10;

-- Deletar view
drop view cliente_simples;

-- View para calcular o total de pedidos feiros por cada cliente
create view cliente_pedido_total as
	select
		c.id_cliente,
        c.nome,
        count(pe.id_pedido) as total_pedidos
	from cliente c
    left join pedido pe on c.id_cliente = pe.id_cliente
    where pe.quantidade is not null
    group by c.id_cliente;
    
select * from cliente_pedido_total where total_pedidos > 3;

-- View para listar detalher do Cliente e total gasto
create view cliente_gasto_total as
	select
		c.id_cliente,
        c.nome,
        c.email,
        sum(pr.preco * pe.quantidade) as total_gasto
	from cliente c
    join pedido pe on c.id_cliente = pe.id_cliente
    join produto pr on pe.id_produto = pr.id_produto
    group by id_cliente
    order by c.nome;
    
select * from cliente_gasto_total where total_gasto > 5000;

