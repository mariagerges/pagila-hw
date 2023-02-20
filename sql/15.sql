/*
 * Use a JOIN to count the number of English language films in each category.
 * Use table category, film_category, film, and language.
 */
SELECT category.name, COUNT(cat.category_id) AS sum FROM film
INNER JOIN film_category AS cat ON film.film_id = cat.film_id
INNER JOIN language as lang ON film.language_id = lang.language_id
INNER JOIN category ON cat.category_id = category.category_id
WHERE lang.name = 'English'
GROUP BY category.name;
