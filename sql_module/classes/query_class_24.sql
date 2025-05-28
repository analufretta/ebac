/* Aula 24: Consultas Avançadas - Functions */

#Calculos e Visualizacoes

use loja_informatica;

select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 10;

-- Funcao para retornar o nome de um cliente com base no seu id
delimiter //
create function BuscaClienteNome(idCliente int)
returns varchar (200) #a funcao tem um retorno
reads sql data #leitura de dados
begin
	declare nomeCliente varchar (200);
    select nome into nomeCliente from cliente where id_cliente = idCliente;
    return nomeCliente;
end//
delimiter ;

-- user a funcao em uma consulta
select BuscaClienteNome(76);

-- Funcao para calcular o total de vendas de um produto
delimiter //
create function TotalVendas(produtoID int)
returns decimal (10, 2)
reads sql data
begin
	declare total decimal (10,2);
    select sum(preco * quantidade) into total
    from pedido
    join produto on produto.id_produto = pedido.id_produto
    where produto.id_produto = produtoID;
    return total;
end //
delimiter ;

select nome, TotalVendas(id_produto) as total_vendas from produto;

-- Funcao para classificar o desempenho de vendas de um produto
delimiter //
create function ClassificacaoDesempenhoVendas(produtoID int)
returns varchar (100)
reads sql data
begin
	declare totalVendas decimal (10,2);
    declare desempenho varchar (100);
    
    select coalesce(sum(pr.preco * pe.quantidade),0) into totalVendas
    from produto pr
    left join pedido pe on pr.id_produto = pe.id_produto
    where pr.id_produto = produtoID;
    
    set desempenho =
    case
		when totalVendas = 0 then 'Sem Vendas'
        when totalVendas <= 1000 then 'Baixo'
        when totalVendas <= 5000 then 'Médio'
        else 'Alto'
	end;
    
    return desempenho;
end//
delimiter ;

select nome, ClassificacaoDesempenhoVendas(id_produto) as desempenho_vendas from produto;

-- funcao para calcular desconto
delimiter //
create function CalculoDesconto(valor decimal(10,2), percentualDesconto decimal(5,2))
returns decimal (10,2)
no sql
begin
	declare resultado decimal (10,2);
    set resultado = valor - (valor *(percentualDesconto/100));
    return resultado;
end//
delimiter ;

select CalculoDesconto (150.00, 5) as ValorComDesconto;

-- Mostrar todas as funcoes
show function status;

-- Deletar funcao
drop function CalculoDesconto;