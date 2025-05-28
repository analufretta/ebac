/* Practice SQL Module */

use restaurant;

-- 1. Calcule a quantidade de pedidos
select count(*) from orders;
#or
select 
	count(id_order) as order_qtd
from orders;

-- Calcule a quantidade de clientes únicos que realizaram pedidos
select
	count(distinct id_client) as qtd_clients
from orders ;
# quatidade de clientes = 24

-- Calcule a média de preço dos produtos
select
	round(avg(price),2) as avg_price
from products;
#avager price is 23.12

-- Calcule o mínimo e máximo do preço dos produtos
select
	min(price) as min_price, #min_price = 5.00
    max(price) as max_price #maxprice = 45.00
from products;

-- Selecione o nome e o preço do produto e faça um rank dos 5 produtos mais caros
select
	product_name,
    price,
    rank() over (order by price desc) as rank_price
from products
limit 5;

-- Selecione a média dos preços dos produtos agrupados por categoria
select
	category,
    round(avg(price),2) as avg_price,
    rank() over (order by avg(price) desc) as rank_price
from products
group by category;

-- Selecionar o fornecedor e a quantidade de produtos que vieram daquele fornecedor da informações de produtos
select
	suplier,
    count(id_product) as qtd_products
from info_products
group by suplier;

-- Selecionar os fornecedores que possuem mais de um produto cadastrado
select
	suplier,
    count(id_product) as qtd_products
from info_products
group by suplier having qtd_products > 1;

-- Selecionar os clientes que realizaram apenas 1 pedido
select
	id_client,
    count(id_client) as nr_orders
from orders
group by id_client having nr_orders = 1;
