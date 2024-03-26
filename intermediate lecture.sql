select * 
from employee_demographics ; 

select * 
from employee_salary ; 


-- INNER Joins 
select dem.employee_id , age , occupation
from parks_and_recreation.employee_demographics dem 
Join parks_and_recreation.employee_salary sal
	on dem.employee_id = sal.employee_id ; 

-- OUTER Joins
 select dem.employee_id , age , occupation
from parks_and_recreation.employee_demographics dem 
left outer Join parks_and_recreation.employee_salary sal
	on dem.employee_id = sal.employee_id ; 

 select dem.employee_id , age , occupation
from parks_and_recreation.employee_demographics dem 
right outer Join parks_and_recreation.employee_salary sal
	on dem.employee_id = sal.employee_id ; 

--  Self join 
select emp1.employee_id as emp_santa ,
emp1.first_name as santa_first_name , 
emp1.last_name as santa_last_name , 
emp2.employee_id as emp_id , 
emp2.first_name as emp_first_name , 
emp2.last_name as emp_last_name 
from employee_salary as emp1
join employee_salary as emp2 
	on emp1.employee_id+1 = emp2.employee_id ; 
    
--  joining multiple tables
select dem.employee_id , age , occupation
from parks_and_recreation.employee_demographics dem 
Join parks_and_recreation.employee_salary sal
	on dem.employee_id = sal.employee_id
join parks_and_recreation.parks_departments as pd 
	on sal.dept_id = pd.department_id ; 
    
    
--  UNIONS  (by default its distinct)
-- by using union all it can be overcame  
select first_name , last_name
from employee_demographics 
union all 
select first_name , last_name
from employee_salary ; 

select first_name , last_name , "Old man" as label
from employee_demographics 
where age > 40 and gender = "male" 
union
select first_name , last_name , "Old female" as label
from employee_demographics 
where age > 40 and gender = "female" 
union
select first_name , last_name , "Highly- aid" as label
from employee_salary 
where salary > 70000
order by first_name , last_name ;  

--  string functions 
 select length("sjeasflk") ; 
 select first_name , length(first_name) 
 from employee_demographics 
 order by 2  desc; 
 
select upper("sasdhjsf")  , lower("sasdhjsf") ; 
select first_name , upper(first_name) , lower(first_name) 
from employee_demographics 
order by 2  desc; 

select trim("           hkjlm            ")  as f; 
select ltrim("           hkjlm            ")  as f; 
select rtrim("           hkjlm            ")  as f; 

select first_name , 
left(first_name , 4) , 
right(first_name , 4) , 
substring(first_name , 3, 2) , 
birth_date , 
substring(birth_date , 6, 2) as month
from employee_demographics ; 

select first_name , replace(first_name , "a" , "z")
from employee_demographics ; 

select locate("a" , "ghaaaaasa") ; 
select first_name , locate("an" , first_name)
from employee_demographics ; 

select first_name , last_name,
concat(first_name , last_name , "1")
from employee_demographics ; 

-- case statement 
 select first_name , last_name , age  , 
 case 
	when age<=30 then "young"
    when age between 30 and 50 then "old"
    when age>= 50 then "On death bed"
end as p 
 from employee_demographics ; 
 
-- pay increase and Bonus 
-- < 50,000  = 5 %
-- > 50,000 = 7 %
--  finance = 10 %
select first_name , last_name , salary,
case
	when salary>=50000 then salary *1.05
    when salary<50000 then salary *1.07
end as New_salary , 
case 
	when dept_id = 6 then salary*1.1
end as bonus 
from employee_salary ; 

-- Subqueries
select *
from employee_demographics 
where employee_id in (select employee_id 
					from employee_salary
					where dept_id = 1 )  ; 
                    
select first_name ,salary , 
 (select avg(salary) from employee_salary)
from employee_salary 
group by first_name , salary  ; 

select gender , avg(age) , max(age) , min(age)
from employee_demographics
group by gender ; 

select avg(maxa)
from 
(select gender , 
avg(age) as avg_age , 
max(age)  as maxa, 
min(age) as mina 
from employee_demographics
group by gender ) as agg_table ; 