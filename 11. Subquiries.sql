# Subquiries (query within a query)

-- Where 1) 'Parks and Recreation'

select * from parks_and_recreation.employee_demographics
where employee_id IN  
(
	select employee_id
    from parks_and_recreation.employee_salary
    where dept_id = 1
);

-- In select

select first_name, salary, 
(select avg(salary) from parks_and_recreation.employee_salary)
from parks_and_recreation.employee_salary;


-- In from

select gender, avg(age), max(age), min(age), count(age)
from parks_and_recreation.employee_demographics
group by gender;

select avg(a2)
from(
select gender, avg(age) as a1 , max(age) as a2, min(age) as a3, count(age) as a4
from parks_and_recreation.employee_demographics
group by gender) as Agg_table;
