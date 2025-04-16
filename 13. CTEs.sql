#CTEs
-- Common Table Exspressions --
-- Naming your sub query --
-- for more advance calculations --
-- can only use it just after you created it and below ; it--

# Subquirie

select avg(a2)
from(
select gender, avg(age) as a1 , max(age) as a2, min(age) as a3, count(age) as a4
from parks_and_recreation.employee_demographics
group by gender) as Agg_table;

#cte

with cte_example as 
(
select gender, avg(salary) as avg_salary, max(salary) as max_salary, min(salary) as min_salary, count(salary) as count_salary
from parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_salary)
from cte_example
;

# Multiple CTEs

with dem_cte as
(
select employee_id, gender, birth_date from parks_and_recreation.employee_demographics
where birth_date > '1985-01-01'
),
sal_cte as
(
select employee_id, salary from parks_and_recreation.employee_salary
where salary > 50000
)
select * from dem_cte
inner join sal_cte
	on dem_cte.employee_id = sal_cte.employee_id;