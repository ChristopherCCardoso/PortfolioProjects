#Group by + Order by
#AGREGATED FUNCTIONS
SELECT * FROM parks_and_recreation.employee_demographics;

SELECT gender FROM parks_and_recreation.employee_demographics
group by gender;

SELECT gender, age FROM parks_and_recreation.employee_demographics
group by gender, age;

SELECT gender, avg(age), max(age), min(age), count(gender) FROM parks_and_recreation.employee_demographics
group by gender;



SELECT * FROM parks_and_recreation.employee_demographics
order by first_name;

SELECT * FROM parks_and_recreation.employee_demographics
order by age asc;

SELECT * FROM parks_and_recreation.employee_demographics
order by age desc;

SELECT * FROM parks_and_recreation.employee_demographics
order by gender, age;

SELECT * FROM parks_and_recreation.employee_demographics
order by gender, age desc;