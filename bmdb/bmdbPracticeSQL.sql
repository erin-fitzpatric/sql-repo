-- Select all movies
 select * from movie;
 
-- Select all actors
select * from actor;

-- How Many Actors Older Than You? 
select * from actor
  where birthDate < '1991-10-29';
  
-- List all actors from Star Wars.
select * from credit -- Option #1
	where movieID = 1;
    
select * from actor a -- Option #2
	join credit c
		on c.ActorID = a.ID
     where c.movieID = 1;   
     
select * from actor a -- Option #3
	join credit c
		on c.ActorID = a.ID
     where c.movieID = 1;  
     
-- select a movie by name
		select id from movie
			where title = 'Star Wars: A New Hope';
    
select * from actor a
	join credit c
		on c.actorID = a.ID
	where c.movieID = (select id from movie where title = 'Star Wars: A New Hope'); 
    
--  List all movies and associated actors (3 table join)
select m.title as 'Movie:', concat(a.firstName, " ", a.lastName) as 'Actor:'
FROM credit c
	JOIN movie m 
		ON m.id =movieID
	JOIN actor a 
		ON a.id = actorID;
        
        
-- another way to join (not as common)
select * from actor, credit
	where actor.id = credit.ActorID;    
    
-- example of unique constraint violation
insert into movie (title, year, rating, director)
	values ('Step Brothers', 1274, 'pg', 'dkel');
    
-- example of fk violation
insert into credit (movieid, actorid, role)
	values (99, 99, 'test');
        
-- List all movie and actor fields 
select *
	FROM credit c
		JOIN movie m 
			ON m.id =movieID
		JOIN actor a 
			ON a.id = actorID;       