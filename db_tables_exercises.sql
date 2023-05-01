select * FROM mysql.user;
select user, host FROM mysql.user;
select * from mysql.help_topic;
select help_topic_id, help_category_id, url FROM mysql.help_topic;


# List all the databases
SHOW databases;

# Write the SQL code necessary to use the albums_db database
use albums_db;

# Show the currently selected database
SELECT database();

# List all tables in the database
SHOW tables;

# Write the SQL code to switch the employees database
use employees;

# Show the currently selected database
select database();

# List all the tables in the database
show tables;
# Explore the employees table. What different data types are present on this table?
show tables;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from employees;
select * from titles;
# strings, numeric type and datetime are found in these tables. 

# Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
# emp_no, from_date, to_date, salary and hire_date all have numeric values.


# Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
# first_name, last_name, gender, dept_no, dept_name all have string values.

# Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
# to_date, hire_date

# What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
# the relationship seems to be they are linked by emp_no and dept_no as keys.

# Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
show create table dept_manager;
    
    
