/* 


SELECT statements

    Select all columns from the actor table.*/
show databases;
use sakila;
show tables;
select *
from actor;
    /*
    Select only the last_name column from the actor table.*/
select last_name
from actor;    
    /* 
    Select only the film_id, title, and release_year columns from the film table.*/
select * from film;
select film_id, title, release_year
from film;
/*
DISTINCT operator

    Select all distinct (different) last names from the actor table.*/
select distinct last_name
from actor;
  /*Select all distinct (different) postal codes from the address table.*/
select * from address;
select distinct postal_code
from address;
  /*Select all distinct (different) ratings from the film table.*/
select * from film;
select distinct rating
from film;
/*WHERE clause

    Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.*/
select title, description, rating, length
from film
where length >= 180;
    /*Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.*/
show tables;
select * from payment;
select payment_id, amount, payment_date
from payment
where payment_date >= 2005-05-27;

    /*Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.*/
select * from payment;
select payment_id, amount, payment_date
from payment
where payment_date like '2005-05-27%';
    /*Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.*/
select *
from customer
where last_name like 'S%' and first_name like '%N';
    /*Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".*/
select *
from customer
where active = 0 or last_name like 'M%';
    /*Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.*/
select * from category;
select *
from category
where category_id > 4 and name like 'C%' or name like 'S%' or name like 'T%';
    /*Select all columns minus the password column from the staff table for rows that contain a password.*/
select * from staff;
select *
from staff
where password is not NULL;
    /*Select all columns minus the password column from the staff table for rows that do not contain a password.*/
select *, null as password
from staff
where password is not null;

/*

IN operator

    Select the phone and district columns from the address table for addresses in California, 
	England, Taipei, or West Java.*/
select * from address;
select phone, district
from address
where district in ('California','England','Taipei','West Java');
    
    /*Select the payment id, amount, and payment date columns from the payment table 
     for payments made on 05/25/2005, 05/27/2005, and 05/29/2005.
     (Use the IN operator and the DATE function, instead of the AND operator as in previous 
     exercises.)*/
select * from payment;
select payment_id, amount, payment_date
from payment
where date(payment_date) in ('2005-05-25%','2005-05-27%','2005-05-29%');
     
     
    /*Select all columns from the film table for films rated G, PG-13 or NC-17.*/
select *
from film
where rating in ('G','PG-13','NC-17');

/*

BETWEEN operator

    Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005.*/
select * from payment;
describe payment;
select *
from payment
where payment_date between '2005-05-25 00:00:00' and '2005-05-26 23:59:00';


   /*Select the film_id, title, and descrition columns from the film table for films where the length of the description is between 100 and 120.*/
   select * from film;
   select film_id, description 
   from film
   where length(description) between 100 and 120;
   
/* 

LIKE operator

    Select the following columns from the film table for rows where the description begins with "A Thoughtful".*/
    select * from film;
    select *
    from film
    where description like "A Thoughtful%";

    /*Select the following columns from the film table for rows where the description ends with the word "Boat".*/
select *
from film
where description like '%Boat';
    /*Select the following columns from the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.*/
select *
from film
where description like '%Database%';

-- LIMIT Operator

    /*Select all columns from the payment table and only include the first 20 rows.*/
select *
from payment
limit 20;

    /*Select the payment date and amount columns from the payment table for rows where the 
    payment amount is greater than 5, and only select rows whose zero-based index in the 
    result set is between 1000-2000.*/
select payment_date, amount
from payment
where amount > 5
and payment_id between 1000 and 2000;

    /*Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200.*/
select *
from customer
where customer_id between 101 and 200;

/* 

-- ORDER BY statement

    /*Select all columns from the film table and order rows by the length field in ascending order.*/
    select *
    from film
    order by length;
    
    /*Select all distinct ratings from the film table ordered by rating in descending order.*/
    select distinct rating from film
    order by rating desc;
    
    /*Select the payment date and amount columns from the payment table for the first 20 payments 
    ordered by payment amount in descending order.*/
    select payment_date, amount
    from payment
    order by amount desc
    limit 20;
    
    /*Select the title, description, special features, length, and rental duration columns 
    from the film table for the first 10 films with behind the scenes footage under 2 hours 
    in length and a rental duration between 5 and 7 days, ordered by length in descending 
    order.*/
    select * from film;
    select title, description, special_features, rental_duration
    from film
    where length <= 120 and rental_duration between 5 and 7 and special_features like '%Deleted Scenes%'
    order by length desc
    limit 10;

-- JOINs

    /*Select customer first_name/last_name and actor first_name/last_name columns from 
    performing a left join between the customer and actor column on the last_name column 
    in each table. (i.e. customer.last_name = actor.last_name)
        Label customer first_name/last_name columns as customer_first_name/customer_last_name
        Label actor first_name/last_name columns in a similar fashion.
        returns correct number of records: 620*/

        
    /*Select the customer first_name/last_name and actor first_name/last_name columns 
    from performing a /right join between the customer and actor column on the 
    last_name column in each table. (i.e. customer.last_name = actor.last_name)
        returns correct number of records: 200*/
        
        
    /*Select the customer first_name/last_name and actor first_name/last_name columns 
    from performing an inner join between the customer and actor column on the last_name 
    column in each table. (i.e. customer.last_name = actor.last_name)
        returns correct number of records: 43*/
        
        
    /*Select the city name and country name columns from the city table, performing a left 
    join with the country table to get the country name column.
        Returns correct records: 600*/
        
        
    /*Select the title, description, release year, and language name columns from the film 
    table, performing a left join with the language table to get the "language" column.
        Label the language.name column as "language"
        Returns 1000 rows*/
        
        
    /*Select the first_name, last_name, address, address2, city name, district, and postal 
    code columns from the staff table, performing 2 left joins with the address table then 
    the city table to get the address and city related columns.
        returns correct number of rows: 2*/
