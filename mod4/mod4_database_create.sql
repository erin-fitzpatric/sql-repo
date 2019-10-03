drop database if exists sqlbootcamp_mod4;
create database sqlbootcamp_mod4;
use sqlbootcamp_mod4;

create table customer (
	id 				int 			not null primary key auto_increment,
	name 			varchar(50) 	not null,
	city 			varchar(50) 	not null,
	state 			varchar(2) 		not null,
	isCorpAcct 		bit 			not null default 0,
	creditLimit 	int 			not null default 0,
	active 			bit 			not null default 1
);

Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Mercury LTD', 'Newport', 'KY', 0, 100000);
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Venus LLC', 'Dayton', 'OH', 0, 300000);
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Mars INC', 'Cincinnati', 'OH', 1, 1000000);
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Jupiter LPA', 'Covington', 'KY', 0, 250000);
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Saturn INC', 'Batesville', 'IN', 0, 300000);
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Uranus LPA', 'Indianapolis', 'IN', 1, 1000000);
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Neptune INC', 'Cleveland', 'OH', 1, 1000000);


create table orders (
	id 				int 			not null primary key auto_increment,
	customerID 		int 			not null,
	date			datetime 		not null,
	total 			decimal(14,2) 	not null default 0
);

ALTER TABLE orders
ADD FOREIGN KEY (customerID) REFERENCES customer(id);

Insert into orders (date, total, customerID)
values ('2017-12-31', 778, 6);
Insert into orders (date, total, customerID)
values ('2017-7-3', 156, 5);
Insert into orders (date, total, customerID)
values ('2017-6-23', 491, 7);
Insert into orders (date, total, customerID)
values ('2017-3-6', 230, 6);
Insert into orders (date, total, customerID)
values ('2017-11-21', 844, 5);
Insert into orders (date, total, customerID)
values ('2017-9-18', 849, 2);
Insert into orders (date, total, customerID)
values ('2017-4-15', 371, 2);
Insert into orders (date, total, customerID)
values ('2017-7-13', 451, 2);
Insert into orders (date, total, customerID)
values ('2017-1-7', 510, 4);
Insert into orders (date, total, customerID)
values ('2017-9-23', 612, 6);
Insert into orders (date, total, customerID)
values ('2017-10-11', 736, 5);