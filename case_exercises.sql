/* Write a query that returns all employees, their department number, 
their start date, their end date, and a new column 'is_current_employee' 
that is a 1 if the employee is still with the company and 0 if not. */

use employees;
select * from employees;
select * from departments;
select * from dept_emp;
-- NEED: 1. All employees 2. dept # 3. start date 4. end date
-- 5. new column titled 'is_current_employee'
-- use 1 and 0 for t/f

# BELOW IS WORKING QUERY
select emp_no, dept_no, from_date, to_date,
CASE
	WHEN to_date <curdate() THEN 0
    ELSE 1
END AS 'is_current_employee'
FROM dept_emp
order by is_current_employee DESC
;

# BELOW IS REMOVING THE DUPLICATES FROM THE ABOVE QUERY
# MARVEL AND WONDER AT ITS UTILITY
select emp_no, dept_no, from_date, to_date,
if (max_date > now(), TRUE, FALSE) as is_current_employee
from employees
join
(
select emp_no, max(to_date) as max_date
from dept_emp
group by emp_no
) as current_hire_date using(emp_no)
join dept_emp on dept_emp.to_date = current_hire_date.max_date
and dept_emp.emp_no = current_hire_date.emp_no
;

-- BELOW IS AN EVEN SHORT VERSION, AUTHORED AND DEMO'D BY WILSON (GG)
-- EDIT TO ABOVE: not entirely correct by wilson but corrected by instructor
SELECT emp_no, dept_no, hire_date, to_date,
	to_date > NOW() AS 'is_current_employee'
    FROM dept_emp
	WHERE (emp_no, to_date) IN (SELECT emp_no, MAX(to_date) 
    FROM dept_emp
		JOIN employees using(emp_no)
    GROUP BY emp_no) 
    ORDER by is_current_employee desc;

/* Write a query that returns all employee names 
(previous and current), and a new column 'alpha_group' that returns 
'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name. */

select last_name,
CASE
	WHEN substr(last_name, 1) <= 'H%' THEN 'A-H'
    WHEN substr(last_name,1) <= 'Q%' THEN 'I-Q'
    WHEN substr(last_name,1) <= 'Z%' then 'R-Z'
    ELSE 'R-Z'
END AS 'Alpha_Group'
from employees
order by 'Alpha_Group'
;

-- How many employees (current or previous) were born in each decade?
select birth_date
from employees
order by birth_date DESC
;

select birth_decade,count(*)
from
(
select birth_date,
CASE
	WHEN birth_date like '194%' then '40s'
    WHEN birth_date like '195%' then '50s'
    WHEN birth_date like '196%' then '60s'
    WHEN birth_date like '197%' then '70s'
    WHEN birth_date like '198%' then '80s'
    WHEN birth_date like '199%' then '90s'
    WHEN birth_date like '20%%' then '00s'
END AS 'Birth_Decade'
from employees
) as birth_decade
group by Birth_Decade
;
# the above can be re-done by checking the max/min of birth days as
-- select min(birth_date), max(birth_date) from employees


/* What is the current average salary for each of the following department
 groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service? */
 show tables;
 select * from salaries;
 select * from departments;
 select * from dept_emp;

select dept_name,
CASE
	when dept_no = 'd009' then 'Customer Service'
    when dept_no = 'd005' then 'R&D'
    when dept_no = 'd002' then 'Finance & HR'
    when dept_no = 'd003' then 'Finance & HR'
    when dept_no = 'd001' then 'Sales & Marketing'
    when dept_no = 'd004' then 'Production & QM'
    when dept_no = 'd006' then 'Production & QM'
    when dept_no = 'd008' then 'R&D'
    when dept_no = 'd007' then 'Sales & Marketing'
END AS 'Department'
from departments
;
use employees;
-- select dem.emp_no, avg(s.salary) as avg_sal, d.dept_no
-- need join to link departments and salaries, dept_emp as intermediary
-- create CASE to pair the respective departments
-- once dept and salaries on same output, find avg salary by dept.
-- filter for only current
-- group by the case statement alias
-- suggest starting with dept_emp to grab dept_no and emp_no, leading to salary

-- BELOW IS THE WORKING QUERY
select Department_Group, avg(salary)
from dept_emp as dem
join departments as d on dem.dept_no = d.dept_no
join salaries as s using(emp_no)
join (
select dept_name,
CASE
	when dept_no = 'd009' then 'Customer Service'
    when dept_no = 'd005' then 'R&D'
    when dept_no = 'd002' then 'Finance & HR'
    when dept_no = 'd003' then 'Finance & HR'
    when dept_no = 'd001' then 'Sales & Marketing'
    when dept_no = 'd004' then 'Production & QM'
    when dept_no = 'd006' then 'Production & QM'
    when dept_no = 'd008' then 'R&D'
    when dept_no = 'd007' then 'Sales & Marketing'
END AS Department_Group
from departments
) as dep_group using(dept_name)
where dem.to_date > curdate() and s.to_date > curdate()
group by Department_Group
;

