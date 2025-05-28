/* Practice SQL Module */

use restaurant;

-- Exercise 1
select pr.id_product, pr.product_name, pr.product_desc, inf.ingredients
from products pr
join info_products inf on inf.id_product = pr.id_product;

-- -- Exercise 2
select o.id_order, o.quantity, o.order_date, cl.client_name, cl.email
from orders o
join clients cl on o.id_client = cl.id_client;

-- Exercise 3
select o.id_order, o.quantity, o.order_date, cl.client_name, cl.email, e.employee_name as employee
from orders o
join clients cl on o.id_client = cl.id_client
join employees e on e.id_employee = o.id_employee;

-- Exercise 4
select 
	o.id_order,
    pr.product_name as product,
    pr.price as unit_price,
    o.quantity,
    sum(o.quantity * pr.price) as total_price,
    cl.client_name,
    cl.email,
    e.employee_name as employee,
    o.order_date
from orders o
join clients cl on o.id_client = cl.id_client
join employees e on e.id_employee = o.id_employee
join products pr on pr.id_product = o.id_product
group by o.id_order;

-- Exercise 5
select
	o.id_order,
    cl.id_client,
    cl.client_name,
    o.order_status,
    o.order_date
from orders o
join clients cl on cl.id_client = o.id_client
where o.order_status = 'Pendente'
order by o.id_product desc;

-- Exercise 6
/*Selecionar clientes sem pedidos*/
select
	cl.id_client,
    cl.client_name,
    cl.email
from clients cl
left join orders o on cl.id_client = o.id_client
where o.id_order is null;

-- -- Exercise 7
select
	cl.id_client,
    cl.client_name,
    count(o.id_client) as total_orders
from clients cl
left join orders o on o.id_client = cl.id_client
group by cl.id_client
order by total_orders desc;

-- Exercise 8
select 
	o.id_order,
    sum(o.quantity * pr.price) as total_price
from orders o
join products pr on pr.id_product = o.id_product
group by o.id_order;

alter table orders
	rename column unit_price to price,
    drop column total_price;
