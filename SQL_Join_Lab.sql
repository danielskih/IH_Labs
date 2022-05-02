USE sakila;
# Which actor has appeared in the most films?
select  count(actor_id) as c, first_name, last_name from actor as a
inner join film_actor as f
using(actor_id) group by actor_id order by c desc limit 1;
# Most active customer (the customer that has rented the most number of films)
select count(customer_id) as c, first_name, last_name from customer as n
inner join rental as r using(customer_id) group by customer_id order by c desc limit 1;
# List number of films per category.
select count(category_id),`name` from category as c inner join film_category as f using (category_id) 
group by category_id;
# Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address, address2 from staff left join address using (address_id);
# Display the total amount rung up by each staff member in August of 2005.
select count(staff_id), first_name, last_name  from rental left join staff using(staff_id) where rental_date like '2005-08%' group by staff_id;
# List each film and the number of actors who are listed for that film.
select count(actor_id), title from film_actor left join film using(film_id) group by film_id ; 
# Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select sum(amount), last_name, first_name from payment inner join customer using(customer_id) group by customer_id order by last_name;
#Optional: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try.
select  count(film_id) as count_f,  title from rental left join inventory using(inventory_id) 
left join film using(film_id) group by film_id order by count_f desc;




