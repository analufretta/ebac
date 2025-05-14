/* Aula 17: Having */

use loja_informatica;

select * from cliente limit 20;
select * from produto limit 20;
select * from pedido limit 20;

select categoria, count(*) from produto group by categoria;
select categoria, count(*) from produto group by categoria having count(*) > 10;

select categoria, count(*) from produto where categoria <> 'acessorios' group by categoria;

select categoria, count(*) from produto where categoria <> 'acessorios' group by categoria having count(*) > 10;
#or
select categoria, count(*) from produto group by categoria having count(*) > 10 and categoria <> 'acessorios';
# nesse caso, esse é mais lento. O que der pra remover no where, utilizar no where, porque ele vai remover as linhas antes

-- Resolucao de Problemas:
-- Identificar quais produtos foram vendidos mais de uma vez com erro (quantidade = 0)
select id_pedido, id_produto, quantidade
from pedido 
where quantidade is null
order by id_produto;

select
	id_produto,
	count(id_produto) as qtd_erro
from pedido
	where quantidade is null
	group by id_produto having qtd_erro > 1;
    
