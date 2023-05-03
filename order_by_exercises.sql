# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results?
use employees;
select * from employees;
select emp_no, first_name from employees where first_name IN ('Irena', 'Vidya', 'Maya');
# top 3 result emp_no: 10200 Vidya, 10397 Irena, 10610 Irena
    
# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. What is the employee number of the top three results? Does it match the previous question?
select emp_no, first_name from employees where first_name IN ('Irena', 'Vidya') or 'Maya';
# top 3 results emp_no: 10200 Vidya, 10397 Irena, 10610 Irena
# OR statement returns true w/o grabbing any mayas

# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results.
select emp_no, first_name from employees where first_name  in ('Irena', 'Vidya', 'Maya')
 and gender = 'M';
# emp_no of top 3: 10200, 10397, 10610

# Find all unique last names that start with 'E'.
select distinct last_name from employees where last_name like 'E%';

# Find all unique last names that start or end with 'E'.
select distinct last_name from employees where last_name like 'E%' or '%E';

# Find all unique last names that end with E, but does not start with E?
select distinct last_name from employees where last_name like '%E';

# Find all unique last names that start and end with 'E'.
select distinct last_name from employees where last_name like 'E%E';

# Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers.
select emp_no, first_name from employees where hire_date between '1990-01-01' and '1999-12-31';
# top 3 emp_no: 10008, 10011, 10012

# Find all current or previous employees born on Christmas. Enter a comment with top three employee numbers.
select * from employees;
select emp_no, first_name from employees where birth_date like '%-12-25';

# Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with top three employee numbers.
select emp_no, first_name from employees where hire_date like '199%' and birth_date like '%-12-25';
# top 3 emp_no: 10261, 10438, 10681

# Find all unique last names that have a 'q' in their last name.
select distinct emp_no, last_name from employees where last_name like '%q%';

# Find all unique last names that have a 'q' in their last name but not 'qu'.
select distinct emp_no, last_name from employees where last_name not like '%qu%' and last_name like '%q%';

------------------------------------------------------------------------------------------------------------

# Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select emp_no, first_name, last_name from employees 
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name;
# the first/last name of the first row: Irena Reutenauer
select emp_no, first_name, last_name from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name DESC;
# the first/last name of the last row: Vidya Awdeh

# Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select emp_no, first_name, last_name from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name, last_name;
# the first/last name of the first row: Irena Action
# the first/last name of the last row: Vidya Zweizig

# Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select emp_no, first_name, last_name from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by last_name, first_name;
# the first/last name of the first row: Irena Action
# the first/last name of the last row: Maya Zyda

# Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
select emp_no, first_name, last_name from employees
where last_name like 'E%E'
order by emp_no;
# 899 employees returned
# the first/last name of the first row and emp_no: Ramzi Erde 10021
# the first/last name of the last row and emp_no: Tadahiro Erde 499648


# Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
select hire_date, first_name, last_name from employees
where last_name like 'E%E'
order by hire_date DESC;
# 899 employees returned
# newest hire: Teiji Eldridge
# oldest hire: Sergi Erde

# Find all employees hired in the 90s and born on Christmas. 
# Sort the results so that the oldest employee who was hired last is 
# the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
select hire_date, first_name, last_name, birth_date from employees
where hire_date between '1990-1-1' and '1999-12-31'
and birth_date like '%-12-25'
order by hire_date DESC, birth_date DESC;

select hire_date, first_name, last_name, birth_date from employees
where hire_date between '1990-1-1' and '1999-12-31'
and birth_date like '%-12-25'
order by birth_date DESC, hire_date;

select * from employees;
# 362 employees returned. 
# Oldest hired last: Khun Bernini
# Youngest hired first: Douadi Pettis
