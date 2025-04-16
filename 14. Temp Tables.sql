#Temp Tables
-- Manipulating data
-- Most advance

select * from parks_and_recreation.employee_demographics;
select * from parks_and_recreation.employee_salary;
select * from parks_and_recreation.parks_departments;

#First way
create temporary table temp_table
(
first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

select * from temp_table;

insert into temp_table(first_name, last_name, favorite_movie)
values
('Christopher', 'Cardoso', 'Fast Furious'),
('Kirsten', 'Jonker', 'The Rookie');

select * from temp_table;

#Second way

select * from parks_and_recreation.employee_salary;

create temporary table salary_over_50k
select * from parks_and_recreation.employee_salary
where salary >= 50000;

select * from salary_over_50k;
