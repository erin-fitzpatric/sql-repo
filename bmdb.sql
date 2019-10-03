drop database if exists bmdb;
create database bmdb;
use bmdb;

create table movie (
	id 				int 			not null primary key auto_increment,
	title 			varchar(100) 	not null,
	rating 			varchar(7) 		not null,
    year			int				not null,
	director 		varchar(50) 	not null
); 

 Insert into movie (title, rating, year, director)
 values 
('Star Wars: A New Hope', 'PG', 1977, 'George Lucas'),
('Step Brothers', 'Unrated', 2008, 'Adam McKay'),
('Jurassic Park', 'PG-13', 1993, 'Steven Spielberg');
 -- INSERT MORE MOVIES HERE

create table actor (
	id 				int 			not null primary key auto_increment,
	firstName		varchar(25) 	not null,
    lastName		varchar(25) 	not null,
	gender			varchar(6)		not null,
    birthDate		date			not null
);

Insert into actor (firstName, lastName, gender, birthDate)
values 
	('Harrison', 'Ford', 'Male', '1942-07-13'), -- date is YYYY-MM-DD
	('Jeff', 'Goldblum', 'Male', '1952-10-22'),
    ('Will', 'Ferrell', 'Male', '1967-07-16');
    
-- INSERT MORE ACTORS HERE

create table credit (
	id				int				not null primary key auto_increment,
    movieID			int				not null,
    actorID			int				not null,
    role			varchar(25)		not null
);

ALTER TABLE credit
ADD FOREIGN KEY (movieID) REFERENCES movie(id);

ALTER TABLE credit
ADD FOREIGN KEY (actorID) REFERENCES actor(id);

Insert into credit (movieID, actorID, role)
values 
	(1, 1, 'Han Solo'),
    (2, 3, 'Brennan Huff'),
    (3, 2, 'Dr. Ian Malcolm');
-- INSERT MORE CREDIT HERE

-- HOMEWORK
-- 1. select * from movie;
-- 2. select * from actor;
--
select * from credit; 