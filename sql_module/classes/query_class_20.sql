/* Aula 20: FULL and SELF JOIN*/

use loja_informatica;

-- recap left join
select c.id_cliente, c.nome, pe.id_pedido
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente;
#retorna todos os clientes, mesmo se nao tiver pedido

-- recap left join
select c.id_cliente, c.nome, pe.id_pedido
from cliente c
right join pedido pe on c.id_cliente = pe.id_cliente;
#retorna todos os pedidos, mesmo que nao tenha cliente

-- full join
select c.id_cliente, c.nome, pe.id_pedido
from cliente c
	left join pedido pe on c.id_cliente = pe.id_cliente
	where pe.id_pedido is null
union 
select c.id_cliente, c.nome, pe.id_pedido
from cliente c
	right join pedido pe on c.id_cliente = pe.id_cliente
	where c.id_cliente is null;

select  c.nome as cliente, pr.nome as produto, pe.quantidade
from cliente c
	left join pedido pe on c.id_cliente = pe.id_cliente
    left join produto pr on pe.id_produto = pr.id_produto
union
select  c.nome as cliente, pr.nome as produto, pe.quantidade
from cliente c
	right join pedido pe on c.id_cliente = pe.id_cliente
    right join produto pr on pe.id_produto = pr.id_produto;
    
-- Natural join -- NAO RECOMENDADO
select *
from pedido
natural join produto;

-- self join

	-- Comparar clientes dentro da mesma cidade
select
	c1.nome as cliente1,
    c2.nome as cliente2,
    c1.cidade as cidade_comum
from cliente c1
join cliente c2 on c1.cidade = c2.cidade and c1.id_cliente != c2.id_cliente
order by c1.cidade, c1.nome, c2.nome;
