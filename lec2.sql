select * 
from parks_and_recreation.employee_salary
where salary <=50000 ; 

select* 
from parks_and_recreation.employee_demographics
where gender = "female";

select* 
from parks_and_recreation.employee_demographics
where gender != "female";

select *
from parks_and_recreation.employee_demographics
where birth_date > 1962-11-11 ; 

-- !!! logical operator!!!!!!!
select *
from parks_and_recreation.employee_demographics
where birth_date > 1962-11-11
or not gender = "male" ;

 select *
from parks_and_recreation.employee_demographics
where (first_name = "Leslie" and age = "44") 
OR age>55 ;
-- !!!!! like statement!!!!!!!!!!!!!!!!!!!
select *
from parks_and_recreation.employee_demographics
where first_name like "%a%" 
or first_name like "J_%"
or birth_date like "1989";
