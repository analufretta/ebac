/* Aula 11: IN, BETWEEN */

use informatica;

-- in

# more precision than < or > 
#used for specific values

Select * from clients;

select * from clients
where id_client in (1,2,4,6);

select * from clients
where year(date_of_birth) in (1991, 1995);

-- between

# more precision and delimitation; more performance in the search

select * from clients
where year(date_of_birth) between 1991 and 2000;

select * from clients
where credit_limit between 8000 and 10000;

-- like

insert into clients (client_name, email, date_of_birth, additional_info) values
					('A', 'a@a.com', '1990-10-10', ' '); #Cadastro Incorreto

select * from clients
where email like '%@%.com';

select * from clients
where email like '__%@__%.com';
#underscore represents a character, I put 2 underscores, so __%@__% = min2 characteres or more@min2 characteres or more

select * from clients
where not email like '__%@__%.com'; #not para ver cadastros incorretos

select * from clients
where email like '___%@email.com'; #padrao de emails

select * from clients
where email like '__%@%mail.com';

select * from clients
where (client_name like 'A%' or 'B%' or 'C%') and active_registration = true;

#ATENÇÃO: cuidado com o uso de '%', pois a busca fica muito abrangente!
