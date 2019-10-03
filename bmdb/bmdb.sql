drop database if exists bmdb;
create database bmdb;
use bmdb;

create table movie (
	id 				int 			not null primary key auto_increment,
	title 			varchar(100) 	not null unique,
	rating 			varchar(7) 		not null,
    year			int				not null,
	director 		varchar(50) 	not null
); 

 Insert into movie (id, title, rating, year, director)
 values 
(1, 'Star Wars: A New Hope', 'PG', 1977, 'George Lucas'),
(2, 'Step Brothers', 'Unrated', 2008, 'Adam McKay'),
(3, 'Jurassic Park', 'PG-13', 1993, 'Steven Spielberg');
 -- INSERT MORE MOVIES HERE

create table actor (
	id 				int 			not null primary key auto_increment,
	firstName		varchar(25) 	not null,
    lastName		varchar(25) 	not null,
	gender			varchar(6)		not null,
    birthDate		date			not null,
    constraint unq_actor unique (FirstName, LastName, BirthDate)
);

Insert into actor (id, firstName, lastName, gender, birthDate)
values 
	(1, 'Harrison', 'Ford', 'Male', '1942-07-13'), -- date is YYYY-MM-DD
	(2, 'Jeff', 'Goldblum', 'Male', '1952-10-22'),
    (3, 'Will', 'Ferrell', 'Male', '1967-07-16'),
    (4, 'Carrie', 'Fisher', 'Female', '1956-12-27'),
    (5, 'Mark', 'Hamill', 'Male', '1951-09-25');
    
-- INSERT MORE ACTORS HERE

create table credit (
	id				int				not null primary key auto_increment,
    movieID			int				not null,
    actorID			int				not null,
    role			varchar(25)		not null,
    
    constraint act_mov unique (ActorID, MovieID)
);

ALTER TABLE credit -- these can also be inside the table!
ADD FOREIGN KEY (movieID) REFERENCES movie(id);

ALTER TABLE credit
ADD FOREIGN KEY (actorID) REFERENCES actor(id);

Insert into credit (movieID, actorID, role)
values 
	(1, 1, 'Han Solo'),
    (2, 3, 'Brennan Huff'),
    (3, 2, 'Dr. Ian Malcolm'),
    (1, 5, 'Luke Skywalker'),
    (1, 4, 'Leia Organa');
    
-- INSERT MORE CREDIT HERE

-- create a user and grant privileges to that user
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;

