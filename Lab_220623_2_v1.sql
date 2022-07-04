USE sakila;


-- checking the content of the relevante tables: 

SELECT * FROM sakila.store;
SELECT * FROM sakila.inventory;
SELECT * FROM sakila.rental;

-- 1) Write a query to display for each store its store ID, city, and country.

SELECT s.store_id, c.city, co.country   
FROM sakila.store s
JOIN sakila.address ad
USING (address_id)
JOIN sakila.city c
USING (city_id)
JOIN sakila.country co
USING (country_id);


-- 2) Write a query to display how much business, in dollars, each store brought in

SELECT s.store_id, sum(p.amount) as amount
FROM sakila.store s
JOIN sakila.staff st
USING (store_id)
JOIN sakila.payment p
USING (staff_id)
GROUP BY s.store_id;


-- 3) Which film categories are longest?
SELECT c.name AS Category, AVG(f.length) as length
FROM sakila.film f
JOIN sakila.film_category fc
USING (film_id)
JOIN sakila.category c 
USING (category_id)
GROUP BY c.name
ORDER BY f.length DESC;

--- The category with the longest average length is "Foreign", foloowed by "Drama" and "Travel"

 
 
-- 4)  Display the most frequently rented movies in descending order.
SELECT f.title AS Film, count(rental_id) AS Frequency
FROM sakila.film f
JOIN sakila.inventory i
USING (film_id)
JOIN sakila.rental c 
USING (inventory_id)
GROUP BY f.title
ORDER BY Frequency DESC;



-- 5) List the top five genres in gross revenue in descending order.
SELECT c.name AS Category, sum(p.amount) as Amount
FROM sakila.category c
JOIN sakila.film_category ca
USING (category_id)
JOIN sakila.film f
USING (film_id)
JOIN sakila.inventory i
USING (film_id)
JOIN sakila.rental r
USING (inventory_id)
JOIN sakila.payment p
USING (rental_id)
GROUP BY c.name
ORDER BY Amount DESC;



-- 6) Is "Academy Dinosaur" available for rent from Store 1?



