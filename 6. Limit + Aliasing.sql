# Limit + Aliasing


select * from parks_and_recreation.employee_salary
limit 3;

select * from parks_and_recreation.employee_salary
order by salary desc
limit 3;

select * from parks_and_recreation.employee_salary
order by salary desc
limit 2, 1;

select * from parks_and_recreation.employee_salary
order by salary desc
limit 3, 2;


select occupation, avg(salary) AS avg_s
from parks_and_recreation.employee_salary
where occupation like '%manager%'
group by occupation
having avg_s > 60000;