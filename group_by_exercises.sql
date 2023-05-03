/* In your script, use DISTINCT to find the unique titles in the titles table. 
How many unique titles have there ever been? Answer that in a comment in your SQL file.*/
select distinct title from titles
group by title;
# 7 unique titles

/* Write a query to to find a list of all unique last names of all employees that start and 
end with 'E' using GROUP BY.*/
select distinct last_name from employees
where last_name like 'E%E'
group by last_name;

/* Write a query to to find all unique combinations of first and last names of all employees 
whose last names start and end with 'E'. */
select distinct first_name, last_name from employees
where last_name like 'E%E'
group by first_name, last_name;


/* Write a query to find the unique last names with a 'q' but not 'qu'. 
Include those names in a comment in your sql code. */
select distinct last_name from employees
where last_name like '%q%' and last_name not like '%qu%';
# Chleq, Lindqvist, Qiwen

/* Add a COUNT() to your results (the query above) to find the number of employees 
with the same last name. */
select count(last_name) from employees
where last_name like '%q%' and last_name not like '%qu%';

/* Find all employees with first names 'Irena', 'Vidya', or 'Maya'. 
Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.*/
select count(*), first_name, last_name, gender from employees
where first_name in ('Irena', 'Vidya', 'Maya')
group by first_name, last_name, gender;

/* Using your query that generates a username for all of the employees, 
generate a count employees for each unique username. */
select count(*), lower (concat(substr(first_name, 1, 1), substr(last_name, 1,4), '_', substr(birth_date, 6,2),substr(birth_date, 3, 2))) as user_name
from employees
group by user_name;

/* From your previous query, are there any duplicate usernames? 
What is the higest number of times a username shows up? 
Bonus: How many duplicate usernames are there from your previous query? */
select count(*), lower (concat(substr(first_name, 1, 1), substr(last_name, 1,4), '_', substr(birth_date, 6,2),substr(birth_date, 3, 2))) as user_name
from employees
group by user_name
having count(*) > 1
order by count(*) DESC;
