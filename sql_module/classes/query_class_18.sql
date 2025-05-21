/* Aula 18: INNER JOIN */

use loja_informatica;

select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 10;

-- INNER entre cliente e produto
select cliente.nome, cliente.email, pedido.id_pedido
from cliente
inner join pedido
on cliente.id_cliente = pedido.id_cliente;

-- INNER entre pedido e produto
select pedido.id_pedido, produto.nome, produto.preco, pedido.quantidade
from pedido
inner join produto
on produto.id_produto = pedido.id_produto;

-- INNER JOIN com cliente, produto e pedido
select cliente.nome as cliente, produto.nome as produto, pedido.quantidade, pedido.data_pedido
from cliente
inner join pedido on cliente.id_cliente = pedido.id_cliente
inner join produto on produto.id_produto = pedido.id_produto;

select c.nome as cliente, pr.nome as produto, pe.quantidade, pe.data_pedido
from cliente c #referencia nome
inner join pedido pe on c.id_cliente = pe.id_cliente
inner join produto pr on pr.id_produto = pe.id_produto;

select c.nome as cliente, pr.nome as produto, pr.preco, pe.quantidade, pe.data_pedido
from cliente c
inner join pedido pe on c.id_cliente = pe.id_cliente
inner join produto pr on pr.id_produto = pe.id_produto
where pr.preco > 1000
group by pr.nome, c.nome, pr.preco, pe.quantidade, pe.data_pedido
order by pr.preco desc;


