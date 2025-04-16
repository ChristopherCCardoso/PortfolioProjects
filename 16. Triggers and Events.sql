#Triggers and Events
-- Happens when an event takes place

select * from parks_and_recreation.employee_demographics;
select * from parks_and_recreation.employee_salary;
select * from parks_and_recreation.parks_departments;

delimiter $$
CREATE trigger employee_insert
	AfTER insert on parks_and_recreation.employee_salary
    for each row 
begin
	insert into parks_and_recreation.employee_demographics(employee_id, first_name, last_name)
    values (new.employee_id, new.first_name, new.last_name);
end $$

delimiter ;

INSERT INTO parks_and_recreation.employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(13, 'Chris','Cardoso','It and Bi', 65000, 6);

#Events
-- Takes place when it is scheduled

select * from parks_and_recreation.employee_demographics;
select * from parks_and_recreation.employee_salary;

delimiter $$
create event delete_retirees
on SCHEDULE every 30 second
do
begin
	delete  from parks_and_recreation.employee_demographics
    where age >= 60;
end $$
delimiter ;

#Possible issues

show VARIABLES like 'event%'; 