-- How many movies star Christian Bale? ***I want to display actor name instead of ID #
select count(*) as 'Total Movies:', actorID as 'Actor:'
	from credit
	where actorID = 6;

-- List all R rated movies.
select title as 'Movie:', rating from movie
	where rating = 'R';

-- How many movies rated  PG-13?
select count(*) as 'Total Movies Rated PG-13' from movie
	where rating = 'PG-13';

-- Left join to show all movies + actors (actors should be null if there are no actors for the movie)
    
SELECT movie.title, actor.firstName, actor.LastName, credit.role
	FROM movie
	LEFT JOIN credit
		ON credit.movieID = movie.id
	LEFT JOIN actor
		ON actor.id = credit.actorID
order by firstName;