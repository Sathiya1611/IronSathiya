# 1. Get release years
select release_year from film;

# 2. Get all films with ARMAGEDDON in the title.
select title from film
where title regexp 'ARMAGEDDON';

# 3. Get all films which title ends with APOLLO.
select title from film
where title like '%APOLLO';

# 4. Get 10 the longest films.
select title from film
order by length(title) desc
limit 10;

# 5. How many films include Behind the Scenes content?
select count(special_features) from film
where special_features regexp 'Behind the Scenes';

# 6. Drop column picture from staff.
alter table staff
drop column picture;

# 7. A new person is hired to help Jon. 
# Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
insert into customer(first_name,last_name) values(null,null,"TAMMY","SANDERS",null,null,null,null,null);

#8. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
#You can use current date for the rental_date column in the rental table. 
#Hint: Check the columns in the table rental and see what information you would need to add there. 
#You can query those pieces of information. For eg., you would notice that you need customer_id information as well.
#To get that you can use the following query:
# *********** customer_id******************
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
# *********** inventory_id*****************
select inventory_id from sakila.inventory
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#************staff_id *******************
select staff_id from sakila.staff
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
# ********** film_id************************
select film_id from sakila.film
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

# 9. Delete non-active users, but first, create a backup table deleted_users 
#to store customer_id, email, and the date for the users that would be deleted. 
#Follow these steps:
#Check if there are any non-active users
select active from customer
where active = 0;
#Create a table backup table as suggested
alter table customer add deleted_users varchar(50) NULL; 
#Insert the non active users in the table backup table
#Delete the non active users from the table customer

