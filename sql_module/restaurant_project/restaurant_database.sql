/* Practice SQL Module */

create database if not exists restaurant;

use restaurant;

	create table if not exists employees(
		id_employees int primary key auto_increment,
        employee_name varchar(255),
        cpf varchar(14),
        date_of_birth date,
        address varchar(255),
        phone_nr varchar(15),
        email varchar(100),
        job_position varchar(100), #cargo
        wage decimal (10,2),
        admission_date date
	);
    
    create table if not exists clients(
		id_client int primary key auto_increment,
        client_name varchar(255),
        cpf varchar(14),
        date_of_birth date,
        address varchar(255),
        phone_nr varchar(15),
        email varchar(100),
        registration_date date
	);
    
    create table if not exists products(
		id_product int primary key auto_increment,
        product_name varchar(255),
        product_desc text,
        price decimal(10,2),
        category varchar(100) #beverages, starters, ,main dish, desert
	);
    
    	create table if not exists orders(
		id_order int primary key auto_increment,
        id_client int,
        foreign key (id_client) references clients(id_client),
        id_employee int,
        foreign key (id_employee) references employees(id_employee),
        id_product int,
        foreign key (id_product) references products(id_product),
        quantity int,
        price decimal (10,2),
        order_date date,
        order_status varchar(50) #pendente, concluido, cancelado
	);
    
    create table if not exists info_products(
		id_info int primary key auto_increment,
        id_product int,
        foreign key (id_product) references products(id_product),
        ingredients text,
        suplier varchar(255)
	);