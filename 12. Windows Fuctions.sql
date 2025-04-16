# Windows Fuctions

SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;

SELECT gender, avg(salary) as avg_sal
FROM parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender;

SELECT dem.first_name, dem.last_name, gender, avg(salary) over(), max(salary) over()
FROM parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;

SELECT dem.first_name, dem.last_name, gender, avg(salary) over(partition by gender)
FROM parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;

SELECT dem.first_name, dem.last_name, gender, sum(salary) over()
FROM parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
SELECT dem.first_name, dem.last_name, gender, sum(salary) over(partition by gender)
FROM parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
-- Rolling total

SELECT dem.first_name, dem.last_name, gender, salary, sum(salary) over(partition by gender order by dem.employee_id) as Rolling_Total
FROM parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
-- Special things you can only do with window functions(row_number, rank, dense_rank)

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, row_number() over()
FROM parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
SELECT dem.first_name, dem.last_name, gender, salary, row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as densrank_num
FROM parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
