/* Aula 15: Funcoes de Agragacao */

use loja_informatica;

select * from cliente limit 20;
select * from produto limit 20;
select * from pedido limit 20;

select count(*) from pedido;
select count(quantidade) from pedido; #conta campos que nao sao nulos
select count(id_pedido) from pedido;
select count(distinct id_cliente) from pedido;

select sum(quantidade) from pedido; #total de 500 vendas
select avg(quantidade) from pedido; # 2 a 3 produtos por pedido

select max(preco) from produto;
select min(preco) from produto;

select var_pop(preco) from produto; # variancia populacional
select var_samp(preco) from produto; # variancia amostral

select stddev(preco) from produto; #Desvio Padrao = stdev_pop; Desvio Padrao Amostral = stdev_semp;

select group_concat(distinct quantidade) from pedido; # todos os pedidos foram comprados de 1 a 9

select nome, preco, rank() over (order by preco desc) as ranking_preco from produto;
select nome, preco, row_number() over (order by preco desc) as ranking_preco from produto; # rankeia singularmente, mesmo com valores iguais
select nome, preco, dense_rank() over (order by preco desc) as ranking_preco from produto;
select distinct nome, preco, dense_rank() over (order by preco desc) as ranking_preco from produto limit 5;