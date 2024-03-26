-- GROUP BY

select gender   , avg(age) , max(age) , min(age) , count(age)
from parks_and_recreation.employee_demographics
group by gender;


--   Order by (here order in which the arguement appears is important ) 
select * 
from parks_and_recreation.employee_demographics 
order by first_name  desc; 

select * 
from parks_and_recreation.employee_demographics 
order by gender , age ; 
