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
(3, 'Jurassic Park', 'PG-13', 1993, 'Steven Spielberg'),
(4, 'Joker', 'R', 2019, 'Todd Phillips'),
(5, 'La La Land', 'PG-13', 2016, 'Damien Chazelle'),
(6, 'The Dark Night', 'PG-13', 2008, 'Christopher Nolan'),
(7, 'Superbad', 'R', 2007, 'Greg Mottola'),
(8, 'Pulp Fiction', 'R', 1994, 'Quentin Tarantino'),
(9, 'The Godfather', 'R', 1972, 'Francis Ford Coppola'),
(10, 'The Matrix', 'R', 1999, 'Lilly Wachowski and Lana Wachowski'),
(11, 'Fight Club', 'R', 1999,'David Fincher'),
(12, 'Beauty and the Beast', 'PG', 2017, 'Bill Condon'),
(13, 'American Hustle', 'R', 2013, 'David O. Russell');

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
    (5, 'Mark', 'Hamill', 'Male', '1951-09-25'),
    (6, 'Christian', 'Bale', 'Male', '1974-01-30'),
    (7, 'Jonah', 'Hill', 'Male', '1983-12-20'),
    (8, 'John', 'Travolta', 'Male', '1954-02-18'),
    (9, 'Al', 'Pacino', 'Male', '1940-04-25'),
    (10,'Keanu', 'Reeves', 'Male', '1964-09-02'),
    (11, 'Joaquin', 'Phoenix', 'Male', '1974-10-28'),
    (12, 'Ryan', 'Gosling', 'Male', '1980-11-12'),
    (13, 'Angourie', 'Rice', 'Female', '2001-01-01'),
    (14, 'Vanessa', 'Marshall', 'Female', '1969-10-19');
    
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
    (1, 4, 'Leia Organa'),
    (6, 6, 'Batman'),
    (4, 11, 'Arthur Fleck'),
    (5, 12, 'Sebastian'),
    (7, 7, 'Seth'),
    (8, 8, 'Vincent Vega'),
    (9, 9, 'Michael Corleone'),
    (10, 10, 'Neo'),
    (13, 6, 'Irving Rosenfeld');

    
-- INSERT MORE CREDIT HERE

-- create a user and grant privileges to that user
DROP USER IF EXISTS bmdb_user@localhost;
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;

