use join_example_db;
select * from users;
select * from roles;

/* Use join, left join, and right join to combine results from the users and roles tables 
as we did in the lesson. Before you run each query, guess the expected number of results.*/

select *
from users as u
join roles as r on u.role_id = r.id;

select *
from users as u
right join roles as r on u.role_id = r.id;

select *
from users as u
left join roles as r on u.role_id = r.id;


/* Although not explicitly covered in the lesson, aggregate functions like count can be used
with join queries. Use count and the appropriate join type to get a list of roles along with
the number of users that has the role. Hint: You will also need to use group by in the query.*/

select r.name, count(*)
from users as u
right join roles as r on u.role_id = r.id
group by r.name;


# Use the employees database.
use employees;
show databases;
/* Using the example in the Associative Table Joins section as a guide, write a query that 
shows each department along with the name of the current manager for that department.*/
show tables;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

# departments: dept_no, dept_name |dept_emp: emp_no, dept_no| dept_manager: emp_no, dept_no

select e.first_name, d.dept_name
from employees as e
join dept_manager as dm on e.emp_no = dm.emp_no
join departments as d on dm.dept_no = d.dept_no
join dept_emp as de on dm.emp_no = de.emp_no
where dm.to_date = '9999-01-01'
group by d.dept_name, e.first_name;

# Find the name of all departments currently managed by women.
select e.first_name, d.dept_name
from employees as e
join dept_manager as dm on e.emp_no = dm.emp_no
join departments as d on dm.dept_no = d.dept_no
where dm.to_date = '9999-01-01' and e.gender = 'F'
group by e.first_name, d.dept_name;

# Find the current titles of employees currently working in the Customer Service department.
select t.title, count(*)
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
join titles as t on e.emp_no = t.emp_no
where de.to_date = '9999-01-01' and d.dept_no = 'd009' and t.to_date = '9999-01-01'
group by t.title;

# Find the current salary of all current managers

# departments: dept_no, dept_name |dept_emp: emp_no, dept_no| dept_manager: emp_no, dept_no
# salaries: emp_no, salary |
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

select s.salary, dm.dept_no, e.first_name
from salaries as s
join dept_manager as dm on s.emp_no = dm.emp_no
join employees as e on dm.emp_no = e.emp_no
where s.to_date = '9999-01-01' and dm.to_date = '9999-01-01'
;

# Find the number of current employees in each department.
select d.dept_no, count(*)
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
where de.to_date = '9999-01-01'
group by d.dept_no
;

# Which department has the highest average salary? Hint: Use current not historic information.
select avg(round(salary,2)) as avg_sal, d.dept_no
from salaries as s
join dept_emp as de on s.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
where s.to_date > now() and de.to_date > now()
group by d.dept_no
order by avg_sal DESC
limit 1
;

# Who is the highest paid employee in the Marketing department?
select concat(e.first_name,' ',e.last_name) as name, s.salary
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join salaries as s on e.emp_no = s.emp_no
join departments as d on de.dept_no = d.dept_no
where d.dept_no = 'd001' and de.to_date > now() and s.to_date > now()
order by s.salary DESC
limit 1;

# Which current department manager has the highest salary?
select concat(e.first_name,' ',e.last_name), s.salary
from dept_emp as de
join salaries as s on de.emp_no = s.emp_no
join employees as e on de.emp_no = e.emp_no
join dept_manager as dm on de.emp_no = dm.emp_no
where s.to_date > now() and dm.to_date > now()
limit 1
;

# Determine the average salary for each department. 
# Use all salary information and round your results.
select d.dept_name, round(avg(s.salary),2) as avg_sal
from dept_emp as de
join salaries as s on de.emp_no = s.emp_no
join departments as d on de.dept_no = d.dept_no
group by d.dept_no
;


