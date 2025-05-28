/* Aula 8: Use where */

use informatica;

-- Conditional queries

-- Filter from numeric fields
select client_name, credit_limit from clients where credit_limit > 5000;
/* Tipos de operadores de comparação:
	> maior
    < menor
    >= maior ou igual
    <= menor ou igual
    <> or != not equal / different */

-- Filter by text fields
select client_name, credit_limit from clients where client_name = 'João'; #case sensitive or not?
select client_name, credit_limit from clients where client_name like 'Jo%'; #inicia com Jo
select client_name, credit_limit from clients where client_name like '%o'; # termina com o

-- Filter by boolean
select client_name, email from clients where active_registration = true; # false = 0 | true = 1
select client_name, email from clients where active_registration is true;
select client_name, email from clients where active_registration is not true;
select client_name, email from clients where active_registration = 0; # or false

-- Filter by date
select client_name, date_of_birth from clients where date_of_birth >= '1991-01-01'; -- YYY-MM-DD
select client_name, date_of_birth from clients where year (date_of_birth) > '1990'; -- year, month, day
select client_name, date_of_birth from clients where month (date_of_birth) = 01;
select client_name, date_of_birth from clients where day (date_of_birth) > 10;