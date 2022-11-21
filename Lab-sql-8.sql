use sakila;

-- Query 1
select title, length, rank() over (order by length asc) as 'Rank' from film
where length != '0' or length is not null
order by length, title;

-- Query 2
select title, length, rating, rank() over(partition by rating order by length desc) as "Rank"
from sakila.film
where length is not null or length <> 0;


-- Query 3
select category_id, count(film_id) as count 
from film_category
inner join category using(category_id)
group by film_category.category_id;


-- Query 4
SELECT f.actor_id, a.first_name, a.last_name, count(f.film_id) as count
FROM film_actor as f
RIGHT JOIN actor as a 
  ON a.actor_id=f.actor_id
GROUP BY f.actor_id, a.first_name, a.last_name
ORDER BY count desc
LIMIT 1;

-- Query 5
SELECT c.customer_id, c.first_name, c.last_name, count(rental_id) as count
FROM customer as c
LEFT JOIN rental as r
	ON r.customer_id=c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY count desc
LIMIT 1;
