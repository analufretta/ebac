/* Aula 5: Atualizar dados */

use informatica;

select * from clients;

update clients
set email = 'marcos_novo@email.com'
where id_client = 1;


set sql_safe_updates = 0;
update clients
set product_id = 1
where client_name = 'Thiago';
set sql_safe_updates = 1;

-- Update multiple fields
update clients
set date_of_birth = '1975-04-10', credit_limit = 1000
where id_client = 5;

-- Utilizar operadores matematicos
update clients
set id_client = id_client - 1
where id_client >= 5;

update clients
set credit_limit = credit_limit + 500
where id_client = 3;

-- Update Complex conditions
set sql_safe_updates = 0;
update clients
set active_registration = false
where credit_limit <= 1000 and date_of_birth < '1990-01-01';
set sql_safe_updates = 1;

-- Update all rows
update clients
set additional_info = 'Revisão de cadastro';

# DICA --> antes de fazer um UPDATE testar a QUERY com SELECT para nao alterar os dados antes de uma validacao!

