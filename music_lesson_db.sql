-- create and select the database
DROP DATABASE IF EXISTS music_lesson_db;
CREATE DATABASE music_lesson_db;
USE music_lesson_db;

Create table User (
ID 				integer 		primary key auto_increment,
UserName 		varchar(20) 	not null,
Password	 	varchar(10) 	not null,
FirstName 		varchar(20) 	not null,
LastName 		varchar(20) 	not null,
PhoneNumber 	varchar(12) 	not null,
Email 			varchar(75) 	not null,
IsStudent		tinyint 		default 1 not null,
IsParent		tinyint 		default 1 not null,
IsAdmin 		tinyint 		default 1 not null,
CONSTRAINT uname unique (UserName)
);

Create table Student (
ID				integer			primary key auto_increment,
UserId			integer			not null,
LessonId		integer			not null,
School			varchar(30)		not null
);

Create table Parent (
ID				integer			primary key auto_increment,
UserId			integer			not null,
BalanceId		integer			not null,
StudentId		integer			not null
);

Create table Balance(
ID				integer			primary key auto_increment,
StudentID		integer			not null,
Balance			double			default 0.0 not null,
Status			varchar(25) 	default 'noBalance' not null
);

Create table LineAssignment (
ID				integer			primary key auto_increment,
StudentID		integer			not null,
ExerciseNumber	integer			not null,
ExerciseNotes	varchar(100)	not null
);

create table Lesson (
ID						integer			primary key auto_increment,
UserID					integer			not null,
LineAssignmentID		integer			not null,
DateAssigned			date			not null,
DateDue					date			not null,
LessonCharge			double			not null
);

INSERT INTO User (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsStudent, IsParent, IsAdmin) VALUES
	(1, 'cbeard', 'sesame', 'Caroline', 'Fitzpatric', '828-280-1255', 'fitzfluestudio@gmail.com', 0, 0, 1),
    (2, 'jbranscum', 'trombone', 'Jason', 'Branscum', '123-456-7899', 'jasonplaystrombone@gmail.com', 0, 1, 0),
    (3, 'lucyb', 'hello', 'Lucy', 'Branscum', '333-333-3333', 'lucyb@gmail.com', 1, 0, 0),
    (4, 'annab', 'world', 'Anna', 'Branscum', '222-222-2222', 'annab@gmail.comc', 1, 0, 0);
    
INSERT INTO Student (ID, UserID, LessonID, School) VALUES
    (1, 3, 1, 'A Childs Garden'),
    (4, 4, 2, 'Oak Hills HS');
    
INSERT INTO Parent (ID, UserId, BalanceId, StudentId) VALUES
	(1, 2, 1, 1);

-- create a user and grant privileges to that user
DROP USER IF EXISTS music_lesson_db_user@localhost;
CREATE USER music_lesson_db_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON music_lesson_db.* TO music_lesson_db_user@localhost;