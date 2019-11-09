select * from actor;
SELECT * FROM movie;
select * from credit;

select *
	from actor a
    join credit c
		on a.id = c.actorID;
        
select FirstName, LastName, m.Title, Role
	from actor a
	join credit c
		on a.id = c.actorID
	join movie m
		on m.id = c.MovieID
	order by lastname;