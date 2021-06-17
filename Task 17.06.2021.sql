#*********************************** 1 ******************************************
#Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, and the rank.

select title,length, dense_rank() over(partition by length order by length desc) as 'rank'
from film
order by length;

#************************************* 2 ************************************************
#Build on top of the previous query and rank films by length within the rating category
#(filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, rating and the rank.
select title,length,rating, dense_rank() over(partition by length order by rating desc) as 'rank'
from film
order by length;

#************************************ 3 ****************************************************
# How many films are there for each of the categories? 
#Inspect the database structure and use appropriate join to write this query.
select category, count(category) as cat
from film_list
group by category;


#********************************* 4 *****************************************************
# Which actor has appeared in the most films?
create view most_actor as
select film_actor.actor_id,film_actor.film_id,actor.first_name,actor.last_name
from film_actor
join actor
on film_actor.actor_id = actor.actor_id;
select *,count(film_id) as list_actor
from most_actor
group by actor_id
having list_actor >41;

#********************************* 5 *******************************************
# Most active customer (the customer that has rented the most number of films)
create view act_cus as
select customer.customer_id,customer.first_name,customer.last_name,payment.rental_id
from customer
join payment
on customer.customer_id = payment.customer_id;
select *,count(customer_id) as most_cus
from act_cus
group by customer_id
having most_cus >45



