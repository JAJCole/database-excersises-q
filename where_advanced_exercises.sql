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

# Find all unique last names that start with 'E'.

# Find all unique last names that start or end with 'E'.

# Find all unique last names that end with E, but does not start with E?

# Find all unique last names that start and end with 'E'.

# Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers.

# Find all current or previous employees born on Christmas. Enter a comment with top three employee numbers.

# Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with top three employee numbers.

# Find all unique last names that have a 'q' in their last name.

# Find all unique last names that have a 'q' in their last name but not 'qu'.
