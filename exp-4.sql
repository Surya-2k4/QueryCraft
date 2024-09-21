show databases;

use employee;

select * from employee;

-- 1. General Functions
/*
COUNT(): Returns the number of rows.
SUM(): Adds up values in a column.
AVG(): Returns the average value of a numeric column.
and so on..
*/

-- 2. Case Conversion Functions
/*
UPPER(): Converts a string to uppercase.
LOWER(): Converts a string to lowercase.
INITCAP(): Capitalizes the first letter of each word.
*/

select UPPER(name) from employee;

select LOWER(name) from employee;

select INITCAP(name) from employee;

-- 3. Date Functions
/*
NOW(): Returns the current date and time.
CURDATE(): Returns the current date.
CURRENT_TIME(): Returns the current time.
MONTH(): Returns the month from a date.
YEAR(): Returns the year from a date.
DAY(): Returns the day from a date.
*/

select current_date();

select current_time();

SELECT MONTH(dob) FROM employee;

SELECT YEAR(dob) FROM employee;

SELECT day(dob) FROM employee;


-- 4. Number Functions
/*
ROUND(): Rounds a number to the nearest integer or decimal places.
CEIL(): Rounds a number up to the next whole number.
FLOOR(): Rounds a number down to the nearest whole number.
ABS(): Returns the absolute value of a number.
MOD(), POWER() SQRT() ,SIGN(), EXP(), LOG()
*/

select round(salary,2) from employee;

select ceil(salary) from employee;

select floor(salary,2) from employee;

select abs(salary,2) from employee;

-- 5. Aggregate functions
/*
MIN(): Returns the smallest value in a set.
MAX(): Returns the largest value in a set.
COUNT(): Returns the number of rows that match a condition.
SUM(): Returns the sum of a numeric column.
AVG(): Returns the average value of a numeric column.
*/

select AVG(salary) from employee;

select count(gender) from employee;

select min(salary) from employee;

select max(salary) from employee 
where salary > 15000;

select sum(salary) from employee 
where gender = "male";

-- 6. Character functions
/*
LENGTH(): Returns the length of a string.
SUBSTRING(): Extracts a part of a string.
TRIM(): Removes leading and trailing spaces.
CONCAT(): Concatenates two or more strings.
*/

select length(name) from employee;

select substring(name,1,3) from employee;

select trim(name) from employee;

select concat(name, 'kumar') from employee
where empno=2;

show tables;

-- 7. Set Operations
/*
UNION :
(The UNION operator combines the result sets of two or more SELECT statements, returning only distinct values 
(i.e., it removes duplicates).)

UNION ALL :
(The UNION ALL operator is similar to UNION, but it does not remove duplicates. 
It returns all rows, including any duplicates.)

INTERSECT :
The INTERSECT operator returns only the rows that are common to both result sets 
(i.e., it returns the intersection of the two sets).

EXCEPT (or MINUS) :
The EXCEPT operator (called MINUS in some databases like Oracle) returns only the rows 
from the first result set that are not in the second result set.
*/

select * from customer;
select * from employee;

select empno,name from employee
UNION
select name,location from customer;

select empno,name from employee
UNION all
select name,location from customer;

-- Intersect 

select employee.name empname, employee.location emplocation
from employee
inner join customer
on employee.location = customer.location;


-- except

select location 
from employee 
where
location NOT IN (select location from customer);




