/* Aula 12: NULL or IS NULL */

use informatica;

-- NULL and NOT NULL

select * from clients;

select * from clients where additional_info is null;

select * from clients where additional_info is not null;

select * from clients	 
where credit_limit > 5000 and (additional_info is null or product_id is null);

-- IFNULL or NULLIF
select client_name, credit_limit, ifnull(credit_limit, 0) as treat_credit_limit
from clients;
# ifnull (what, return value). if credit_limit is null, return zero.

select client_name, additional_info, ifnull(additional_info, 'Nada Consta') as treat_additional_info
from clients;

select client_name, additional_info, nullif(additional_info, 'Inativo') as treat_additional_info
from clients;
# return null if additional_info is 'Inativo'

select client_name, additional_info, nullif(additional_info, ' ') as treat_additional_info
from clients;

select client_name, ifnull(nullif(additional_info, ' '), 'Nada Consta') as additional_info
from clients;
#if additional_info = ' ', return null, then, if additional_info is null, return ' Nada Consta'

-- coalesce
select client_name, coalesce(additional_info, 'Nada Consta') from clients;

select id_client, client_name, coalesce(credit_limit, product_id, 'Cadastro Nulo') as info
from clients;
#run through the whole table, if credit_limit and product_id are null, return 'Cadastro Nulo' as info

-- Tratar Blank Spaces: TRIM
select * from clients
where nullif(trim(additional_info),'') is null;

#same as in

select * from clients
where nullif(additional_info,' ') is null;

select client_name, additional_info from clients
where additional_info <> trim(additional_info);