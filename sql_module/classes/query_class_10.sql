/* Aula 20: Conditional Formating */

use informatica;

-- AND, OR, NOT

Select * from clients
where active_registration = true and credit_limit > 6000;

Select * from clients
where active_registration = true or credit_limit > 6000;

Select * from clients
where credit_limit > 6000 and year(date_of_birth) > 1980;

Select * from clients
where active_registration = true or credit_limit > 6000 and year(date_of_birth) > 1980; 

# the function above prioritizes AND: where active_registration = true or (credit_limit > 6000 and year(date_of_birth) > 1980);

Select * from clients
where (active_registration = true or credit_limit > 6000) and year(date_of_birth) > 1980; #use () to alter the order #Test big conditionals

Select * from clients where credit_limit > 6000;
Select * from clients where not credit_limit > 6000;

Select * from clients
where not active_registration = true or credit_limit > 6000; #inverts only the 1st command

Select * from clients
where not (active_registration = true or credit_limit > 6000);#use () para abranger o comando no NOT

-- NOT é muito usado para vizualisar o que nao esta dentro da sua busca


