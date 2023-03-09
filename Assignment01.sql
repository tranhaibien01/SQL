


IF EXISTS (SELECT * FROM sys.databases WHERE Name='DMLStudent')
DROP DATABASE DMLStudent
GO

CREATE DATABASE DMLStudent
GO
USE DMLStudent
go
create table student(
	SID INT primary key,
	S_FName varchar(20) not null,
	S_LName varchar(30) not null
)
go

create table Course(
	CID int primary key,
	C_Name varchar(30) not null,
)
go

create table Course_grades(
	CGID int primary key,
	Semester char(4) not null,
	CID int not null,
	SID int not null,
	Grade char(2) not null,
FOREIGN KEY (CID) REFERENCES Course (CID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (SID) REFERENCES student (SID) ON DELETE CASCADE ON UPDATE CASCADE,
)
go
--them du lieu
INSERT INTO student VALUES (12345, 'Chris', 'Rock')
INSERT INTO student VALUES (23456, 'Chris', 'Farley')
INSERT INTO student VALUES (34567, 'David', 'Spade')
INSERT INTO student VALUES (45678, 'Liz', 'Lemon')
INSERT INTO student VALUES (56789, 'Jack', 'Donaghy')

INSERT INTO Course_grades VALUES (2010101, 'SP10', 101005,34567, 'D+')
INSERT INTO Course_grades VALUES (2010308, 'FA10', 101005, 34567,'A-')
INSERT INTO Course_grades VALUES (2010109, 'FA10', 101001, 45678, 'B+')
INSERT INTO Course_grades VALUES (2011308, 'FA11', 101003, 23456,'B-')
INSERT INTO Course_grades VALUES (2012206, 'SU12', 101002, 56789,'A+')

INSERT INTO Course VALUES (101001, 'Intro to Computers')
INSERT INTO Course VALUES (101002, 'Programming')
INSERT INTO Course VALUES (101003, 'Databases')
INSERT INTO Course VALUES (101004, 'Websites')
INSERT INTO Course VALUES (101005, 'IS Management')
--them value cho fname
alter table student 
alter column S_FName varchar(30)
go
--them dong Lname va set default 
ALTER TABLE Course
ADD Faculty_LName varchar(30) NOT NULL DEFAULT 'TBD'
--cap nhat ten va mon hoc
UPDATE Course
SET Faculty_Lname = 'Potter', C_Name= 'Intro to Wizardry'
WHERE CID = 101001

--doi ten C_name
EXEC sp_RENAME 'course.C_Name', 'Course_Name','column'
--delete website
DELETE FROM Course WHERE Course_Name='Websites';
delete from student

delete from Course
drop table student

alter table Course
drop constraint DF__Course__Faculty___5535A963
SELECT
  *
FROM
 Course_grades
