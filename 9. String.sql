# String functions

#Length

select LENGTH('Hunger');

select * from parks_and_recreation.employee_demographics;

select first_name, LENGTH(first_name) as n_length
from parks_and_recreation.employee_demographics
order by n_length;

#Upper and lower

select UPPER('chris');

select first_name, upper(first_name), last_name, lower(last_name)
from parks_and_recreation.employee_demographics;

select lower('Chris');

#Trim

select trim('          Hunger         ');

-- Left trim
select ltrim('          Hunger         ');


-- Right trim
select rtrim('          Hunger         ');

#Substring

select first_name, LEFT(first_name, 1) from parks_and_recreation.employee_demographics;

select first_name, right(first_name, 3) from parks_and_recreation.employee_demographics;

select first_name, 
LEFT(first_name, 1), 
right(first_name, 3),
substring(first_name, 3, 2),
birth_date,
substring(birth_date, 6, 2)
from parks_and_recreation.employee_demographics;

#Replace

select first_name, replace(first_name, 'a', 'z') 
from parks_and_recreation.employee_demographics;

select first_name, replace(first_name, 'A', 'z') 
from parks_and_recreation.employee_demographics;

#Locate

select locate('h', 'Christopher');

select locate('An', first_name) 
from parks_and_recreation.employee_demographics;

#Concatenation

select first_name, last_name, 
CONCAT(first_name,' ' , last_name) as full_name
from parks_and_recreation.employee_demographics;