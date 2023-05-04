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


