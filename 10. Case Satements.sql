# Case Satements(like a if else)

select first_name, 
last_name,
age,
case
	when age <=35 then 'Young'
    when age between 35 and 60 then 'old'
    when age >= 60 then 'very old'
end as age_bracket
from parks_and_recreation.employee_demographics;

-- Payment increase and bonus
-- < 50000 5% increase
-- > 50000 7% increase
-- Finance 10% Bonus

select first_name, last_name, occupation, salary,
case
	when salary < 50000 then salary + salary * 0.05
    when salary > 50000 then salary + salary * 0.07
end as Increase,
case
	when dept_id = 6 then salary * 0.1
end as Bonus
from parks_and_recreation.employee_salary;

