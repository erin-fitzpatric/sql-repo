select * from actor;

-- all Harrison's born before 1960
select * from actor
	where firstname = 'Harrison'
		and brithday < '1960-01-01';
        
-- all actors born before 1960 or after 1980
select * from actor
	where birthdate < '1960-01-01'
		or birthdate < '1979-12-31';
        
-- and / or example
select * from actor
	where firstname like 'H%' 
		and (lastname = 'Ford.'
			or lastname = 'Henry');