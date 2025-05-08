/* Practice SQL Module */

use restaurant;

-- Selecione o nome e a categoria dos produtos que tem o preço superior a 30
select product_name, category from products where price > 30;

-- Selecione o nome, telefone e data de nascimento dos clientes que nasceram antes do ano de 1985;
select client_name, phone_nr, date_of_birth from clients where year (date_of_birth) < 1985;

-- Selecione o id do produto e os ingredientes de informações de produto para os ingredientes que contenham a palavra “carne”;
select id_product, ingredients from info_products where ingredients like '%carne%';

-- Selecione o nome e a categoria dos produtos ordenados em ordem alfabética por categoria, para cada categoria deve ser ordenada pelo nome do produto;
select product_name, category from products order by category asc, product_name asc;

-- Selecione os 5 produtos mais caros do restaurante;
select product_name, price from products order by price desc limit 5;

-- A cada dia da semana 2 pratos principais estão na promoção, hoje você deve selecionar 2 produtos da categoria ‘Prato Principal’ e pular 6 registros (offset = 5);
select product_name from products where category = 'Prato Principal' limit 2 offset 5;

-- Faça backup dos dados da tabela pedidos com o nome de backup_pedidos
create table backup_orders as select * from orders;