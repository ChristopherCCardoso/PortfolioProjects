# Where Clause
select * from parks_and_recreation.employee_salary;

select * from parks_and_recreation.employee_salary
WHERE first_name = 'Ron';

select * from parks_and_recreation.employee_salary
WHERE salary < 50000;

select * from parks_and_recreation.employee_salary
WHERE salary >= 50000;

select * from parks_and_recreation.employee_demographics;

select * from parks_and_recreation.employee_demographics
WHERE gender != 'female';

-- AND OR NOT -- LOGICAL OPERATORS

select * from parks_and_recreation.employee_demographics
WHERE first_name = 'April' 
or not age <= 46;

select * from parks_and_recreation.employee_demographics
WHERE first_name = 'April' 
or first_name = 'Tom';

select * from parks_and_recreation.employee_demographics
WHERE first_name = 'April' 
and last_name = 'Ludgate';

select * from parks_and_recreation.employee_demographics
WHERE (first_name = 'April' and age = 29) or age > 55;

-- Like Statement--
-- % = ANYTHING --
-- _ = SPACES--

select * from parks_and_recreation.employee_demographics
WHERE first_name like 'A%'; # MUST START WITH a

select * from parks_and_recreation.employee_demographics
WHERE first_name like '%a'; # MUST END WITH AN a

select * from parks_and_recreation.employee_demographics
WHERE first_name like '%a%'; # MUST HAVE AN a


select * from parks_and_recreation.employee_demographics
WHERE first_name like 'a__'; # START WITH AN a AND HAVE TWO LETTERS AFTER IT 

select * from parks_and_recreation.employee_demographics
WHERE first_name like '____a'; # END WITH AN a AND HAVE ___ LETTERS BEFORE IT 

select * from parks_and_recreation.employee_demographics
WHERE first_name like '_n_';

select * from parks_and_recreation.employee_demographics
WHERE first_name like '_n%'; # ONE LETTER THEN AN a AND THEN ANYTHING

select * from parks_and_recreation.employee_demographics
WHERE birth_date like '_9%'; 