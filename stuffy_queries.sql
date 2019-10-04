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
    
-- Add(insert) a 'dummy' stuffy
INSERT INTO stuffy (id, type, color, size, limbs)
VALUES (11, 'GODZILLA', 'green', 'm', 5);

-- Update that new record
UPDATE stuffy
SET color = 'red'
WHERE id = 11;

-- Delete that records
DELETE FROM stuffy WHERE id = 11;

-- Show all stuffy data
select * from stuffy;