/* Practice SQL Module */

use restaurant;

-- View resumo_pedido
create view summary_orders as
select
	o.id_order,
    o.quantity,
    pr.product_name,
    pr.price as unit_price,
    cl.client_name,
    cl.email,
    e.employee_name
from orders o
join clients cl on cl.id_client = o.id_client
join employees e on e.id_employee = o.id_employee
join products pr on pr.id_product = o.id_product;

select * from summary_orders;

-- Selecione o id do pedido, nome do cliente e o total (quantidade * preco) de cada pedido da view resumo_pedido
select
	id_order,
    client_name,
    sum(quantity * unit_price) as total_price
from sumary_orders
group by id_order
order by id_order;

-- Atualiza o view resumo pedido, adicionando campo total
create or replace view summary_orders as
select
	o.id_order,
    o.quantity,
    pr.product_name,
    pr.price as unit_price,
	sum(quantity * pr.price) as total_price,
    cl.client_name,
    cl.email,
    e.employee_name
from orders o
join clients cl on cl.id_client = o.id_client
join employees e on e.id_employee = o.id_employee
join products pr on pr.id_product = o.id_product
group by o.id_order;

-- Repita a consulta da questão 3, utilizando o campo total adicionado
select
	id_order,
    client_name,
    total_price
from summary_orders;

-- Repita a consulta da pergunta anterior, com uso do EXPLAIN para verificar e compreender o JOIN que está oculto na nossa query
explain
select
	id_order,
    client_name,
    total_price
from summary_orders;

-- Crie uma função chamada ‘BuscaIngredientesProduto’, que irá retornar os ingredientes da tabela info produtos, quando passar o id de produto como argumento (entrada) da função.
delimiter //
create function SearchProductIngredients(idProduct int)
returns text
reads sql data
begin
	declare Components text;
    select ingredients into Components from info_products where id_product = idProduct;
    return Components;
end //
delimiter ;

-- Execute a função ‘BuscaIngredientesProduto’ com o id de produto 10
select SearchProductIngredients(10);

/* Crie uma função chamada ‘mediaPedido’ que irá retornar uma mensagem dizendo que o total do pedido é acima, abaixo ou igual a média de todos os pedidos,
quando passar o id do pedido como argumento da função*/
delimiter //
create function orderClassification(idOrder int)
returns varchar (100)
reads sql data
begin
	declare classification varchar (100);
    declare orderPrice decimal (10,2);
    declare avgPrice decimal (10,2);
    
	select
		total_price into orderPrice
    from summary_orders
    where id_order = idOrder;
    
    select
		round(avg(total_price),2) into avgPrice
    from summary_orders
    where id_order = idOrder;
    
    set classification =
    case
		when orderPrice < avgPrice then 'Below avg price'
        when orderPrice = avgPrice then 'Equal avg price'
        else 'Above avg price'
	end;
        
    return classification;
end//
delimiter ;

-- Execute a função ‘mediaPedido’ com o id de pedido 5 e depois 6.
select
	id_order,
	orderClassification(id_order)
from summary_orders
where id_order = 5 or id_order = 6;
