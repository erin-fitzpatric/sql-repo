-- select all student
select * from student;

-- select all course
select * from course;

-- select all students without middle names (null)
select * from student
	where middleInitial is null; 

-- How many students in OH? (count function)
select count(*) from student
	where state = 'OH'; 

-- How many studnets per state?
select state, count(*)
	from student
    group by state;

-- Select oldest student ???
select concat(firstName, " ", middleInitial, " ", lastName) as 'Oldest Student:', birthday as 'Birthday:'
  from student
 where birthday = (select min(birthday) from student);
 
 -- Age of oldest student
select birthday, year(birthday), CURDATE(), year(curdate()),
	(year(curdate()) - year(birthday)) as Age
    from student
    order by age;
    
     -- Age of oldest student (to the date)
select firstname, lastname, 
		(year(curdate()) - year(birthday)) as Age
	from student
    where birthday = (select min(birthday) from student);

-- Select youngest student
select concat(firstName, " ", middleInitial, " ", lastName) as 'Oldest Student:', birthday as 'Birthday:'
  from student
 where birthday = (select max(birthday) from student);
    
-- How many social studies courses ???
select count(*) as 'Social Studies' from course
where subject = 'socialStudies';

-- list all subjects starting with the letter 'm'
select * from course
where subject like 'm%';

-- How many math courses?
select count(*) as 'Math' from course
where subject = 'math';

-- Inner join of all 3 (student, enrolled, course)
select * 
	from student s
		join enrolled e
			on e.studentID = s.id
		join course c
			on e.courseID = c.id;
            
-- Another way to Inner join all 3
select *
from enrolled e
    join course c on c.ID = e.courseID
    join student s on s.ID = e.studentID;
    
-- all students plus enrollments
select s.id, firstName, lastname, e.studentID, e.courseID, e.grade, c.name
	from student s
	left join enrolled e
		on e.studentID = s.id
	left join course c
		on e.courseID = c.id;
