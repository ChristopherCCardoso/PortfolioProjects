# Unions

select first_name, last_name
from parks_and_recreation.employee_demographics
union
select first_name, last_name 
from parks_and_recreation.employee_salary;

select first_name, last_name
from parks_and_recreation.employee_demographics
union all
select first_name, last_name 
from parks_and_recreation.employee_salary;

select first_name, last_name, 'Old man' as Label
from parks_and_recreation.employee_demographics
where age > 40 and gender = 'male'
union
select first_name, last_name , 'Old female' as Label
from parks_and_recreation.employee_demographics
where age > 40 and gender = 'female' 
union 
select first_name, last_name, 'Paid to much' as Label 
from parks_and_recreation.employee_salary
where salary > 70000
order by first_name, last_name;