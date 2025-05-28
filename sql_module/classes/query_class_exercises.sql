/* Exercicios de SQl*/

use loja_informatica;

-- Calcule o preco dos pedidos
select pe.id_pedido, c.nome, pr.nome, pr.preco as preco_unidade, pe.quantidade, sum(pr.preco * pe.quantidade) as total_gasto
from pedido pe
inner join cliente c on pe.id_cliente = c.id_cliente
inner join produto pr on pe.id_produto = pr.id_produto
group by pe.id_pedido
order by total_gasto asc;

#versao simplificada
select pe.id_pedido, sum(pr.preco * pe.quantidade) as total_gasto
from pedido pe
inner join cliente c on pe.id_cliente = c.id_cliente
inner join produto pr on pe.id_produto = pr.id_produto
group by pe.id_pedido;

-- Calcule a quantidade de pedidos por cliente, incluindo pedidos com erro e clientes que nao realizaram pedidos
select
	cl.id_cliente,
    cl.nome,
    count(pe.id_cliente) as total_pedidos
from cliente cl
left join pedido pe on pe.id_cliente = cl.id_cliente
group by cl.id_cliente
order by total_pedidos;

-- Calcule o total gasto por cada cliente em seus pedidos
-- Calcule o avg price de cada cliente, exluindo pedidos com erro e clientes sem pedido
select
	cl.id_cliente,
    cl.nome,
    count(pe.id_cliente) as total_pedidos,
    sum(pr.preco * pe.quantidade) as total_gasto,
    round(sum((pr.preco * pe.quantidade))/(count(pe.id_cliente)), 2) as avg_preco_pe,
    dense_rank () over (order by sum(pr.preco * pe.quantidade) desc) as rank_total,
    dense_rank () over (order by round(sum((pr.preco * pe.quantidade))/(count(pe.id_cliente)), 2) desc) as rank_avg
from cliente cl
left join pedido pe on pe.id_cliente = cl.id_cliente
left join produto pr on pe.id_produto = pr.id_produto
where pe.quantidade is not null
group by cl.id_cliente
order by rank_avg, rank_total;

-- Calcular valor e quantidade de vendas de cada mes de 2023
select
	month(data_pedido) as mes_qtd,
	sum(pr.preco * pe.quantidade) as total_gasto,
    count(pe.id_pedido) as total_pedidos
from pedido pe
join produto pr on pe.id_produto = pr.id_produto
where quantidade is not null
group by month(data_pedido)
order by total_gasto;

-- Calcular qtd de venda de cada produto da loja no ano e ordenar por mais vendidos
select
	pr.id_produto,
    pr.nome,
    pr.categoria,
	count(pe.id_produto) as year_qtd
from produto pr
left join pedido pe on pr.id_produto = pe.id_produto
group by pr.id_produto
order by year_qtd desc;