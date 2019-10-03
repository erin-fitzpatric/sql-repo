-- Select all movies
 select * from movie;
 
-- Select all actors
select * from actor;

-- How Many Actors Older Than You? 
select * from actor
  where birthDate < '1991-10-29';
  
-- List all actors from Star Wars.
select * from credit
	where movieID = 1;
    
--  List all movies and associated actors (3 table join)
select m.title as 'Movie:', concat(a.firstName,  a.lastName) as 'Actor:'
FROM credit c
	JOIN movie m 
		ON m.id =movieID
	JOIN actor a 
		ON a.id = actorID;