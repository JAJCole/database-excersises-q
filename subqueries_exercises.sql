use employees;

/* Find all the current employees with the same hire date
 as employee 101010 using a subquery.*/
 select * from employees;
 show tables;
 select * from dept_emp;
 
 select first_name, last_name, birth_date
from employees as e, dept_emp as dem
where hire_date =
    (
    select hire_date
    from employees
    where emp_no = '101010'
    )
and dem.to_date > curdate()
;

/* Find all the titles ever held by all current employees 
with the first name Aamod*/
 select * from employees;
 show tables;
 select * from dept_emp;
 select * from titles;
 
 -- employ has emp_no, f_name
 -- dept_emp has emp_no, to_date
 -- titles has emp_no, title, to_date
 
 -- below is subquery (note only looking for 1 thing when as filter)
 /* select emp_no
 from employees
 where first_name = 'Aamod'*/
 ;
 select t.title, e.emp_no
 from titles as t, employees as e
 where t.to_date > curtime() 
 in
 (
select emp_no
from employees
where first_name in ('Aamod')
 )
 ;
 
 /* How many people in the employees table are no longer working 
 for the company? Give the answer in a comment in your code.*/

select count(emp_no)
from employees
where emp_no not in (
select emp_no
from dept_emp
where to_date > now()
)
;


 /* Find all the current department managers that are female. 
 List their names in a comment in your code.*/
 
select e.first_name, e.last_name, d.dept_name
from employees as e
join dept_manager as dm
on dm.emp_no = e.emp_no
join departments as d
on d.dept_no = dm.dept_no
where dm.to_date > curtime()
and gender = 'F'
;

/* Find all the employees who currently have a higher salary 
than the companies overall, historical average salary.*/
select *
from employees
where emp_no in (
select emp_no
from salaries
where to_date > now()
and salary > (
select avg(salary)
from salaries
)
)
;
/* How many current salaries are within 1 standard deviation of the
 current highest salary? (Hint: you can use a built in function 
 to calculate the standard deviation.) What percentage of all salaries is this?*/
 select count(salary) as stdv_max,
 concat(round((count(salary) /
 (select count(salary)
 from salaries
 ) * 100), 4),'%') as percentile
 from salaries
 where salary > (
 select max(salary) - std(salary)
 from salaries
 where to_date > now()
 )
 and to_date > now()
 ;
