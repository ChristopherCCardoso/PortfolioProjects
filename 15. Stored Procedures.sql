#Stored Procedures
-- Way to save sql code in order to use it over and over

select * from parks_and_recreation.employee_demographics;
select * from parks_and_recreation.employee_salary;
select * from parks_and_recreation.parks_departments;

#Simple exsample 1

select * from parks_and_recreation.employee_salary
where salary >= 50000;

use parks_and_recreation;
create procedure large_salaries()
select * from parks_and_recreation.employee_salary
where salary >= 50000;

call large_salaries();

#Exsample 2
-- Wrong
create procedure large_salaries2()
select * from parks_and_recreation.employee_salary
where salary >= 50000;
select * from parks_and_recreation.employee_salary
where salary >= 10000;

call large_salaries2();

-- Right(Best practice)

delimiter $$
create procedure large_salaries3()
begin
	select * from parks_and_recreation.employee_salary
	where salary >= 50000;
	select * from parks_and_recreation.employee_salary
	where salary >= 10000;
end $$
delimiter ;

call large_salaries3();

-- Right way2
-- right click on stored procedures and then create stored procedures

-- Parameter(variable)(past as an input into the store procedures)

delimiter $$
create procedure large_salaries4(sp_id int)
begin
	select salary from parks_and_recreation.employee_salary
    where employee_id = sp_id;
end $$
delimiter ;

call large_salaries4(1);