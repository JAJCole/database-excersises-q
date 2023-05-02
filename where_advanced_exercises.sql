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