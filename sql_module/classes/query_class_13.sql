/* Aula 13: IF and CASE */

use informatica;

select * from clients;

select client_name, credit_limit,
if(credit_limit > 6000, 'Alto', 'Baixo') as category_limit
from clients;

select client_name, credit_limit,
case
	when credit_limit > 6000 then 'Alto'
    else 'Baixo'
end as category_limit
from clients;

select id_client, client_name, credit_limit,
	if(credit_limit > 9000, 'Premium', if (credit_limit between 5000 and 9000, 'Gold', 'Silver')) as category_limit
from clients;

select id_client, client_name, credit_limit,
case
	when credit_limit > 9000 then 'Premium'
    when credit_limit between 5000 and 9000 then 'Gold'
    else 'Silver'
end as category_limit
from clients;

#if is more for direct and simple conditional structures
#case is more used for more complex conditional structures


