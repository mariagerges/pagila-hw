/*
 * Use a JOIN to list all films in the "Family" category.
 * Use table category, film_category, and film.
 */

SELECT film.title
FROM film
INNER JOIN film_category AS film_cat ON film.film_id = film_cat.film_id
INNER JOIN category AS cat ON film_cat.category_id = cat.category_id
WHERE cat.name = 'Family';

