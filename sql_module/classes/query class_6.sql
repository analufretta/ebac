/* Aula 6: Deletar dados */

use informatica;

select * from clients;

-- Delete only 1
delete from clients where id_client = 3;

-- Delete data with multiple conditions
set sql_safe_updates = 0;

select * from clients # query test before deletion
where active_registration = false
and credit_limit < 2000;

delete from clients
where active_registration = false
and credit_limit < 2000;

set sql_safe_updates = 1;

-- Deletear todos os registros
delete from clients; # diferente de drop becasue you don't delere the table
	#or
truncate table clients; # Diferente do comando `DELETE`, `TRUNCATE` não registra a remoção de cada linha individualmente, tornando-o mais rápido, mas irreversível






