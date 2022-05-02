use sakila;
#How many copies of the film Hunchback Impossible exist in the inventory sys
select count(inventory_id) from inventory where film_id =(
select film_id from film where title = UPPER('Hunchback Impossible')
);
#List all films whose length is longer than the average of all the films.
select title, length from film where length>(
select avg(length) from film
);
#Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name from actor where actor_id IN (
select actor_id from film_actor where film_id = 
(
select film_id from film where title = 'ALONE TRIP'
)
);
#Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select title from film where film_id in(
select film_id from film_category where category_id=8
);
#Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
select first_name, last_name from customer where address_id in (
select address_id from address where city_id in(
select city_id from city where country_id=
(select countty_id from country where country_id ='Canada'
)
)
);
select first_name, last_name from customer 
inner join address using(address_id)
inner join city using(city_id)
where country_id=20;