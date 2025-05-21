/* Aula 21: Subconsultas*/

use loja_informatica;

select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 10;

-- Subconsulta WHERE
#nome dos clientes que realizaram pedidos
select nome
from cliente
where id_cliente in (select id_cliente from pedido);

select distinct c.nome
from cliente c
join pedido pe on c.id_cliente = pe.id_cliente;
#geralmente, joins sao mais otimizados

#nome dos clientes que realizaram pedidos com quantidade maior que 5
select distinct nome, email
from cliente
where id_cliente in (select id_cliente from pedido where quantidade >5);

-- Subconsulta SELECCT
select nome,
	(select count(*)
    from pedido
    where pedido.id_cliente = cliente.id_cliente) as total_pedidos
from cliente;

select c.nome, c.email,
	(select sum(pe.quantidade * pr.preco)
    from pedido pe
    join produto pr on pe.id_produto = pr.id_produto
    where pe.id_cliente = c.id_cliente) as total_pedido
from cliente c order by total_pedido desc;
	
-- subconsulta HAVING
select categoria, avg(preco) as media_preco
from produto
group by categoria
having avg(preco) > (select avg(preco) from produto);

-- subconsulta FROM 
select c.nome, pedidos_agregados.total_pedidos, pedidos_agregados.soma_quantidade
from cliente c
join (
	select id_cliente, count(*) as total_pedidos, sum(quantidade) as soma_quantidade
    from pedido
    group by id_cliente
    ) as pedidos_agregados on c.id_cliente = pedidos_agregados.id_cliente;

-- Subconsulta ORDER BY
select c.nome, c.email
from cliente c
order by (
	select sum(pe.quantidade * pr.preco)
    from pedido pe
    join produto pr on pe.id_produto = pr.id_produto
    where pe.id_cliente = c.id_cliente
) desc;

-- nomes dos clientes que fizeram pelo menos um pedido com quantidade maior que cinco
SELECT nome FROM cliente WHERE id_cliente IN (SELECT id_cliente FROM pedido WHERE quantidade > 5);
SELECT nome FROM cliente INNER JOIN pedido ON cliente.id_cliente = pedido.id_cliente WHERE pedido.quantidade > 5;
SELECT DISTINCT nome FROM cliente, pedido WHERE cliente.id_cliente = pedido.id_cliente AND pedido.quantidade > 5;