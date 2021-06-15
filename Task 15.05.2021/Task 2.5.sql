# 1. Select all the actors with the first name ‘Scarlett’.
select * from actor
where first_name like 'Scarlett%';
#using regex
select * from actor
where first_name regexp '^Scarlett';


# 2. How many films (movies) are available for rent
# and how many films have been rented?


# 3. What are the shortest and longest movie duration? 
# Name the values max_duration and min_duration.
select min(length) as min_duration from film;
select max(length) as max_duration from film;


# 4. What's the average movie duration expressed in 
#format (hours, minutes)?
select floor(avg(length))/60 as hours from film;


# 5. How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from actor;


# 6. Since how many days has the company been operating (check DATEDIFF() function)?
select Max(DATEDIFF(return_date, rental_date)) as num_day
from rental;


# 7. Show rental info with additional columns month and weekday. Get 20 results.
# (I was not able to add multiple columns in the same line)
alter table rental add month int null;
alter table rental add weekday int null;


# 8. Add an additional column day_type with values 'weekend' and 'workday' 
# depending on the rental day of the week.
alter table rental 
add
day_type varchar(20) null;
SELECT *, dayname(rental_date) as day_type from rental;
insert into rental (day_type) values(dayname(rental_date));


# 9. How many rentals were in the last month of activity?

     
     






