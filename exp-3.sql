/*
Build the essential objects using 
view, sequences, indexes and synonyms 
for university database

View:     A view is a virtual table based on the result of a SELECT query.
Sequence: A sequence generates a series of unique numbers, typically used for primary key generation.  
		  (Sequence doesn't support in MYSQL)
          - > you can use AUTOINCREMENT to achieve similar functionallity.
Index:    An index is used to improve the performance of queries that search for data in a table.
Synonym:  A synonym provides an alias for another database object like a table, view, or sequence. 
		  It is useful for simplifying access or renaming objects. (Synonyms doesn't support in MYSQL)
		 - > you can use views to achieve similar functionality.
*/

create database exp3University;

use exp3University;

show tables;

create table students (
	student_id int PRIMARY KEY,
    student_name VARCHAR(15),
    department VARCHAR(15)
);

alter table students 
modify column
student_id INT auto_increment;
 
INSERT INTO students (student_name, department) VALUES 
('Alice', 'Computer'),
( 'Bob', 'Electrical'),
('Brown', 'Mechanical '),
( 'Diana', 'Mathematics'),
( 'Ethan', 'Physics');

CREATE TABLE courses (
    course_id int PRIMARY KEY,
    course_name VARCHAR(15)
);

alter table courses modify column course_name varchar(20);

INSERT INTO courses (course_id, course_name) VALUES 
(101, 'Data Structures'),
(102, 'Digital Systems'),
(103, 'Thermodynamics'),
(104, 'Linear Algebra'),
(105, 'Quantum Mechanics');



CREATE TABLE enrollments (
    student_id int,
    course_id int,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO enrollments (student_id, course_id) VALUES 
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105);


select * from students;

select * from courses;

select * from enrollments;


-- ***************************************************** --

-- SEQUENCE not work in MYSQL so we used AUTOINCREMENT

-- Index

create INDEX idx_stud_name on students (student_name);


-- Synonyms
/*
MySQL does not support synonyms directly.
You can use views as a workaround to create an alias for tables or complex queries.
you can use views to achieve similar functionality.
*/

-- VIEW

create VIEW student_info as
select * from students;

select * from students;  -- normal student table
select * from student_info;  -- in VIEW student table

create VIEW course_view as
select * from courses;

select * from course_view;