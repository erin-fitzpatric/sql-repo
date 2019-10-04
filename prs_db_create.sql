-- CONNECT TO 
drop database if exists prs_db_create;
create database prs_db_create;
use prs_db_create;

-- CREATE TABLE
create table user
(
	ID 				INT 			not null primary key auto_increment,
    UserName		VARCHAR(20)		not null,
    Password		VARCHAR(10)		not null,
    FirstName		VARCHAR(20)		not null,
	LastName		VARCHAR(20)		not null,
	PhoneNumber		VARCHAR(12)		not null,
	Email			VARCHAR(75)		not null,
    IsReviewer		TinyInt(1)		not null,
    IsAdmin			TinyInt(1)		not null,
    
    -- ENTER CONSTRAINT HERE
    constraint uname unique (Username)
    
);

create table vendor
(
	ID 				INT 				not null primary key auto_increment,
    Code			VARCHAR(10) 		not null,
    Name			VARCHAR(255)		not null,
    Address			VARCHAR(255)		not null,
    City			VARCHAR(255)		not null,
    State			VARCHAR(2)			not null,
    Zip				VARCHAR(5)			not null,
    PhoneNumber 	VARCHAR(12)			not null,
    Email			VARCHAR(100)		not null,
    
    -- ENTER CONSTRAINT HERE
    constraint vcode unique (Code)
);

create table request
(
	ID 					INT					not null primary key auto_increment,
    UserID				INT					not null,
    Description			VARCHAR(100)		not null,
    Justification		VARCHAR(255)		not null,
    DataNeeded			DATE				not null,
    DeliveryMode		VARCHAR(25)			not null,
    Status				VARCHAR(20)			not null,
    Total				DECIMAL(10,2)		not null,
    SubmittedDate		DATETIME			not null,
    ReasonFroRejection	VARCHAR(100)				,	
    
     -- DEFINE FOREIGN KEY HERE
     FOREIGN KEY (UserID) REFERENCES user(ID)
);

create table product
(
	ID					INT					not null primary key auto_increment,
    VendorID			INT					not null,
    PartNumber			VARCHAR(50)			not null,
    Name				VARCHAR(150)		not null,
    Price				DECIMAL(10,2)		not null,
    Unit				VARCHAR(255)  				,
    PhotoPath			VARCHAR(255)				,
    
	 -- DEFINE FOREIGN KEY HERE
     FOREIGN KEY (VendorID) REFERENCES vendor(ID),
     
     -- ENTER CONSTRAINT HERE
     constraint vendor_part unique (VendorID, PartNumber)
);
 
Insert into user (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin)
 values 
(1, 'jsmith', 'password1', 'Joe', 'Smith', '513-867-5309', 'jsmith@gmail.com', 0, 1),
(2, 'skay', 'password2', 'Sean', 'Kay', '345-235-6754', 'skay@gmail.com', 1, 0);												

Insert into vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email)
 values 
(1, 'ki-25', 'Kings Island', '1 Kings Island Drive', 'Mason', 'OH', '45069', '514-568-3574', 'kingisland@gmail.com');

Insert into product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
 values 
(1, 1, 'bl-02', 'balloon', 9.99, '6 per box', 'C:\Users\MAX-Student\Pictures'),
(2, 1, 'tk-007', 'tank', 999.99, '1 per shipment', 'C:\Users\MAX-Student\Pictures');

-- CREATE USER
DROP USER IF EXISTS prs_db_create_user@localhost;
CREATE USER prs_db_create_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs_db_create.* TO prs_db_create_user@localhost;