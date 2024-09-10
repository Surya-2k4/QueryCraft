create Database university;
drop database surya;

use university;

show databases;

show tables;

create table student (id int(4)primary key,name varchar(15),age int(2),gender varchar(5),location varchar(10));

alter table student modify gender varchar(6);

insert into student (id,name,age,gender,location)
values
(1,'Surya',20,'male','erode'),
(2,'raj',22,'male','salem'),
(3,'Siva',24,'female','tiruppur'),
(4,'karthi',21,'male','erode'),
(5,'sathish',20,'female','vellore');

select * from student;

create table department (dept_id int(4)primary key,dept_name varchar(15),HOD varchar(15) not null);

insert into department (dept_id,dept_name,HOD)
values 
(1,'BSC','kalaiselvi'),
(2,'EEE','Natesan'),
(3,'BTECH','Rahunathan'),
(4,'ECE','Gokul'),
(5,'IT','Kannan');

select * from department;

create table faculty (
	id int,
	name varchar(15),
	gender varchar(6) not null,
	dept_id int,
	primary key (id),
	foreign key(dept_id) references department(dept_id)
);

insert into faculty 
(id, name, gender, dept_id)
values 
(1,'kavin','male',1),
(2,'kavin','male',4),
(3,'kavin','male',3),
(4,'latha','female',2),
(5,'priya','female',5),
(6,'kaviya','female',1),
(7,'vijaykumar','male',2),
(8,'kumarii','female',3),
(9,'kannan','male',5),
(10,'pooja','female',4);

select * from faculty;

update faculty
set
name = 'senthil'
where id = 3;

delete from faculty
where id = 10;




create table courses (
	id int,
    course_name varchar(20) unique,
    credits int check(credits > 1),
    course_desc varchar(30) not null,
    course_duration int default 6,
    dept_id int,
    primary key(id),
    foreign key(dept_id) references department(dept_id)
);

create table employee (
  id int,
  emp_name varchar(15),
  emp_designation varchar(15),
  emp_salary int
);

insert into employee 
(id, emp_name, emp_designation, emp_salary )
values 
(1,'Raja','Tech assist',15000),
(1,'Rahul','Dev',30000),
(1,'Kanna','professor',25000),
(1,'Sujith','lab assist',10000),
(1,'Rani','Tester',18000);

select * from employee;

update employee
 set id = 5 
 where emp_name = 'Rani'; 

/* 
SET SQL_SAFE_UPDATES = 0;   -> for disable the safe mode   
SET SQL_SAFE_UPDATES = 1;    -> for again enable the safe mode
*/


/*
Data Definition Language (DDL) Commands

CREATE TABLE table_name (column1 datatype, column2 datatype, ...);
CREATE DATABASE database_name;

ALTER TABLE table_name ADD column_name datatype;
ALTER TABLE table_name DROP COLUMN column_name;

DROP TABLE table_name;

DROP DATABASE database_name;

TRUNCATE TABLE table_name;

RENAME TABLE old_table_name TO new_table_name;

CREATE INDEX index_name ON table_name (column_name);

DROP INDEX index_name ON table_name;

*********************************************************************
Data Manipulation Language (DML) Commands

SELECT column1, column2 FROM table_name WHERE condition;

INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);

UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;

DELETE FROM table_name WHERE condition;

REPLACE INTO table_name (column1, column2, ...) VALUES (value1, value2, ...)

DDL Commands: Manage database structure and schema (e.g., CREATE, ALTER, DROP, TRUNCATE, RENAME, CREATE INDEX, DROP INDEX).
DML Commands: Manage and manipulate data within tables (e.g., SELECT, INSERT, UPDATE, DELETE, REPLACE, CALL).
*/
    
    