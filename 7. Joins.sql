# Joins
SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT * 
FROM parks_and_recreation.employee_salary;

#Inner Joins

SELECT * 
FROM parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;


SELECT dem.employee_id, dem.first_name, occupation, gender, salary 
FROM parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
    
#Outer Joins

-- Left Outer: Takes everything from left table and matches with right table--

-- Right Outer: Takes everything from right table and matches with left table --

SELECT * 
FROM parks_and_recreation.employee_demographics as dem #left table
left outer join parks_and_recreation.employee_salary as sal #right table
	on dem.employee_id = sal.employee_id;

SELECT * 
FROM parks_and_recreation.employee_demographics as dem #left table
right outer join parks_and_recreation.employee_salary as sal #right table
	on dem.employee_id = sal.employee_id;


# Self Joins
-- Tie an table to itself --

SELECT * 
FROM parks_and_recreation.employee_salary as sal1 
join parks_and_recreation.employee_salary as sal2
	on sal1.employee_id = sal2.employee_id;
    
    SELECT * 
FROM parks_and_recreation.employee_salary as sal1 
join parks_and_recreation.employee_salary as sal2
	on sal1.employee_id + 2 = sal2.employee_id;
    
SELECT sal1.employee_id as emp_giver,
sal1.first_name as giver_fname,
sal1.last_name as giver_lname, 
sal2.employee_id as emp_receiver,
sal2.first_name as receiver_fname,
sal2.last_name as receiver_lname
FROM parks_and_recreation.employee_salary as sal1 
inner join parks_and_recreation.employee_salary as sal2
	on sal1.employee_id + 1= sal2.employee_id;


# Joining multiple tables

SELECT * 
FROM parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_and_recreation.parks_departments as dep
	on sal.dept_id = dep.department_id;
    