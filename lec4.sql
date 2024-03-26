--  having  VS   where
select gender , avg(age)
from employee_demographics
group by gender
having avg(age) > 41 ;

select  occupation , avg(salary)
from employee_salary
where occupation like "%manager%"
group by occupation 
having avg(salary)>66000; 

-- limit and aliasing
 select *
 from employee_demographics
 order by age desc
 limit 2 , 1; 
 
 
 select gender , avg(age) avg_age
from employee_demographics
group by gender
having avg_age > 41 ;
 