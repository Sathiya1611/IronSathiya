#1. In the actor table, which are the actors whose last names are not repeated? 
#For example if you would sort the data in the table actor by last_name, 
#you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
#These three actors have the same last name. So we do not want to include this last name in our output.
#Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

select *, count(last_name)  as last from actor
group by last_name 
having last = 1;

# 2. Which last names appear more than once? We would use the same logic as in the previous question
#but this time we want to include the last names of the actors where the last name was present more than once
select *, count(last_name)  as last from actor
group by last_name 
having last <> 1;

#3. Using the rental table, find out how many rentals were processed by each employee.
select *, count(staff_id) as employee from rental
group by staff_id;

# 4. Using the film table, find out how many films were released each year
select *, count(release_year) as year from film
group by release_year;

# 5. Using the film table, find out for each rating how many films were there.
select *,count(rating) as each_rate from film
group by rating;

# 6. What is the average length of films for each rating? Round off the average lengths to two decimal places.
select *, rating, round((avg(length)),2) as average from film
group by rating;

# 7. Which kind of movies (based on rating) have an average duration of two hours or more?
select *, rating, avg(length) as two_more from film
group by rating
having two_more >=120;
