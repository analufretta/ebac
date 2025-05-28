/* Aula 23: Consultas Avançadas - Stored procedures */

#Manipulacao e controle transacional de dados

use loja_informatica;

select * from cliente limit 10;
select * from produto limit 10;
select * from pedido limit 10;

-- Procedimento armazenado para listar todos os clientes
create procedure ListarClientes()
	select * from cliente;
    

-- Chamar o procedimento armazenado
call ListarClientes();

-- Procedimento armazenado para inserir um novo pedido
DELIMITER //
create procedure AdicionarPedido(in pedidoID int, clienteID int, in produtoID int, in qtd int, in dataPedido date)
begin
	insert into pedido values (pedidoID, clienteID, produtoID, qtd, dataPedido);
	insert into backup_pedido values (pedidoID, clienteID, produtoID, qtd, dataPedido);
end //
DELIMITER ;

call AdicionarPedido(201,1,2,10,'2024-03-01');

select * from pedido where id_pedido = 201;
select * from backup_pedido where id_pedido = 201;

-- Procedimento armazenado para visualizar novos preco s sem alterar a tabela produto e visualizar a a quantidade de registros
delimiter //
create procedure PromocaoProdutos(in desconto float, out totalProdutos int)
begin
	declare fator_desconto float; #declarando uma variavel
    set fator_desconto = (1 - (desconto/100));
    
    select count(*) into totalProdutos
    from produto;
    
    select id_produto, nome, preco as preco_original, round(preco * fator_desconto, 2) as preco_desconto
    #select id_produto, nome, preco as preco_original, round(preco * 1 - (desconto/100),2) as preco_desconto --> sem variavel
    from produto;
end //
delimiter ;

call PromocaoProdutos(5, @totalProdutos); #para out e necessario usar '@'
select @totalProdutos; #as total_produtos_alterados

-- Mostrar todos os procedimentos
show procedure status;

-- Deletar procedimentos
drop procedure if exists AdicionarPedido;