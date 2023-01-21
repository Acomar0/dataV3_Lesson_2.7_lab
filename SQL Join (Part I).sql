Use sakila;
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT d.category_id , COUNT(distinct c.film_id) as film_amount
FROM sakila.film c
JOIN sakila.film_category d
ON c.film_id = d.film_id
GROUP BY d.category_id
ORDER BY film_amount desc;

-- Display the total amount rung up by each staff member in August of 2005
select staff_id, sum(amount) from payment
GROUP BY staff_id;

-- Which actor has appeared in the most films?
select actor_id, count(distinct film_id) as number_of_films from film_actor
GROUP BY actor_id
ORDER BY number_of_films desc;

-- Most active customer (the customer that has rented the most number of films)
select customer_id, count(distinct rental_id) as number_of_films from rental
GROUP BY customer_id
ORDER BY number_of_films desc;

-- Display the first and last names, as well as the address, of each staff member.
select s.staff_id, s.first_name, s.last_name, a.address FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id
GROUP BY s.staff_id;

-- List each film and the number of actors who are listed for that film.
select f.title, count(distinct a.actor_id) as number_of_actors FROM sakila.film f
JOIN sakila.film_actor a
ON f.film_id = a.film_id
GROUP BY f.title;


-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.customer_id, sum(p.amount), c.last_name as total_paid FROM sakila.payment p
JOIN sakila.customer c
ON p.customer_id = c.customer_id
GROUP BY c.customer_id
order by c.last_name asc;

-- List number of films per category
SELECT f.name,  COUNT(distinct c.film_id) as film_amount
FROM sakila.film c
JOIN sakila.film_category d
ON c.film_id = d.film_id
JOIN sakila.category f
ON d.category_id = f.category_id
GROUP BY f.name
ORDER BY film_amount desc;
