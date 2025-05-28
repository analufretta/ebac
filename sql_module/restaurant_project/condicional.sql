/* Practice SQL Module */

use restaurant;

-- Pedidos com id funcionário igual a 4 e status igual a ‘Pendente’
select * from orders
	where id_employee = 4 and order_status = 'Pendente';

-- Pedidos com status diferente de ‘Concluído’
#Option 1:
select * from orders
	where not order_status = 'Concluído';

#Option 2:
select * from orders
	where order_status <> 'Concluído';
    
-- Pedidos que contenham os id produtos: 1, 3, 5, 7 ou 8
select * from orders
	where id_product in (1,3,5,7,8)
    order by id_product asc;

-- Clientes que começam com a letra c
select id_client, client_name from clients
	where client_name like 'C%';

-- Selecione as informações de produtos que contenham nos ingredientes ‘carne’ ou ‘frango’
select * from products
	where
		product_desc like '%carne%' or
        product_desc like '%frango%';
    
-- Produtos com o preço entre 20 a 30
select id_product, product_name, price from products
	where price between 20 and 30
    order by price asc;

-- Atualizar id pedido 6 da tabela pedidos para status = NULL
update orders
set order_status = null
where id_order = 6;

-- Selecione os pedidos com status nulos
select * from orders
	where order_status is null;

-- Selecionar o id pedido e o status da tabela pedidos, porém para todos os status nulos, mostrar 'Cancelado'
select id_order,
	ifnull(order_status, 'Cancelado')
    as status_treat
from orders
    order by status_treat asc, id_order asc;

-- Selecione o nome, cargo, salário dos funcionários e adicione um campo chamado media_salario, que irá mostrar ‘Acima da média’, para o salário > 3000, senão 'Abaixo da média'
#Option 1:
select
	employee_name,
    job_position,
    wage,
    if (wage > 3000, 'Acima da média', 'Abaixo da média')
		as media_salario
from employees;

#Option 2:
select
	employee_name,
    job_position,
    wage,
    case
		when wage > 3000 then 'Acima da média'
        else 'Abaixo da média'
	end as media_salario
from employees;