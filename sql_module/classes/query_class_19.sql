/* Aula 19: OUTER JOIN */

use loja_informatica;

select * from cliente limit 10;
select * from produto limit 10;
select * from pedido;

-- LEFT OUTER JOIN: Visualizar todos os clientes, incluindo aqueles sem pedidos
select c.nome, pe.id_pedido
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
order by pe.id_pedido, c.nome;

-- RIGHT OUTER JOIN: Visualizar todos os pedidos, incluindo aquelas sem clientes
select c.nome, pe.id_pedido
from cliente c
right join pedido pe on c.id_cliente = pe.id_cliente;

-- LEFT JOIN: Visualizar clientes sem pedidos
select c.*
from cliente c
left join pedido pe on c.id_cliente = pe.id_cliente
where pe.id_pedido is null
order by c.nome;
