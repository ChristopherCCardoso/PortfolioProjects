#Having vs Where
#HAVING USED FOR AGREGATED FUNCTIONS

select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender;

select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender
having avg(age) > 40;

select *
from parks_and_recreation.employee_salary;

select occupation, avg(salary)
from parks_and_recreation.employee_salary
group by occupation
having avg(salary) > 50000;

select occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like '%Manager%'
group by occupation
having avg(salary) > 50000;


