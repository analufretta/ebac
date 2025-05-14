/* Aula 16: Group */

use loja_informatica;

select * from cliente limit 20;
select * from produto limit 20;
select * from pedido limit 20;

select sum(preco) as preco_total from produto group by categoria;
select categoria, sum(preco) as preco_total 
from produto
	group by categoria;
    
select nome, categoria, sum(preco) as preco_total 
from produto
	group by categoria, nome
    order by categoria, nome;

select categoria, avg(preco) as media_preco
from produto
	group by categoria;
    
select categoria, round(avg(preco),2) as media_preco
	from produto
	group by categoria;
    
select
	distinct nome, preco, categoria,
    dense_rank() over (order by preco desc) as ranking_preco
from produto;

select
	categoria,
    sum(preco) as preco_total,
    rank() over (order by sum(preco) desc) as ranking_preco
from
	produto
group by
	categoria;

select
	distinct nome,
    categoria,
    avg(preco) as media_preco,
    rank() over (order by avg(preco) desc) as ranking_preco
from
	produto
group by
	nome, categoria
order by
	ranking_preco, categoria, nome
limit 5;