/* Aula 4 */

use informatica;

-- Selecionar tabelas
select * from clients;

-- Insert data
insert into clients (client_name, email, date_of_birth, credit_limit) values -- date (YYYY-MM-DD)
					('Marcos', 'marcos@email.com', '1991-01-05', 8000.00);
                    
-- Insert multiple data at once
insert into clients (client_name, email, date_of_birth, credit_limit) values
								('Ana', 'ana@email.com', '1990-05-28', 10000.00),
								('João', 'joao@email.com', '1995-10-14', 5500.00);
                                
-- Insert data without specifications (all fields)
insert into clients values (null, 'Thiago', 'thiago@email.com', '1995-08-20', 4600, null, true, null, null);
insert into clients values (null, 'Pedro', 'pedro@email.com', '1996-07-24', 8600, null, true, null, current_timestamp());

SET SQL_SAFE_UPDATES = 0;
delete from clients where registration_time is null; #problema: id_client 4 was deleted and cannot be returned. the system coninues
SET SQL_SAFE_UPDATES = 1;

insert into clients values (null, 'Thiago', 'thiago@email.com', '1995-08-20', 4600, null, true, null, current_timestamp());


                                





                    
