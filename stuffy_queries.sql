-- How many total stuffies
select count(*) as 'Total Stuffies:' from stuffy;

-- How many red stuffies
select count(*) as 'Total Red Stuffies:' from stuffy
	where color = 'red';

-- How many stuffies per color?
select color as 'Stuffy Color:', count(*) as 'Total Stuffies:'
	from stuffy
group by color;

-- How many total limbs?
select sum(limbs) as 'Total Limbs:' from stuffy;

-- What stuffy has the most limbs?
select type as 'Stuffy With Most Limbs:', limbs as 'Total Limbs' from stuffy
	where limbs = (select max(limbs) from stuffy);