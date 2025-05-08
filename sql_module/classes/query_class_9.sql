/* Aula 9: Ordenar e Limitar Dados*/

use informatica;

-- Order from alphabetic order (ascendente)
select client_name from clients order by client_name; #you can put ASC

-- Order descentente
select client_name, email from clients order by client_name desc; #desc = descendente
select client_name, date_of_birth from clients order by date_of_birth desc;

-- Order by more than one field
select client_name, credit_limit from clients order by credit_limit desc, client_name asc;
select client_name, credit_limit from clients order by credit_limit /*asc*/, client_name desc; # quando nao coloca nada, ele considera asc

-- Limitação optimize
# Importante numa base de dados grande, pra nao travar o computador

select * from clients limit 1;

-- Select 3 clients with more credit limit
select client_name, email, credit_limit from clients order by credit_limit desc limit 3;

-- Skip the first 3 registros
select client_name from clients order by client_name limit 2 offset 3;
# offset skip rows

 



 