drop database if exists stuffy_db;
create database stuffy_db;
use stuffy_db;

-- DDL - Create Tables
create table stuffy (
	id 				int 			primary key auto_increment,
	type			varchar(255)	not null,
    color			varchar(20)		not null,
    size			varchar(2)		not null,
    limbs			int				not null
	);

/* create table INSERT TABLE (
	id 				int 			not null primary key auto_increment,
	INSERT			INSERT 			not null,
    INSERT			INSERT 			not null
    INSERT			INSERT 			not null
    INSERT			INSERT 			not null
    );
    
	FOREIGN KEY (studentID) REFERENCES student(id),
	FOREIGN KEY (courseID) REFERENCES course(id),
    CONSTRAINT std_course unique (studentID, courseID)  */
    
-- DML Insert Stuffy Data
insert into stuffy (id, type, color, size, limbs) 
	values 
		(1, 'rhino', 'red', 'xl', 5),
        (2, 'godzilla', 'blue', 's', 4),
        (3, 'liger', 'chartreuse', 'm', 4),
        (4, 'chupacabra', 'scarypink', 'xl', 666),
        (5, 'seanblessing', 'runnerred', 'm', 4),
        (6, 'lochnessmonster', 'yeller', 'L', 6),
        (7, 'bigfoot', 'red', 'xs', 4),
        (8, 'bigolfish', 'blue', 'xl', 3),
        (9, 'scarysquirrel', 'runnerred', 's', 5),
        (10, 'frog', 'green', 'm', 4);
        
CREATE USER stuffy_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON stuffy.* TO stuffy_user@localhost;    