/* 
 * Use a JOIN to list the number of copies of each film in the inventory system that begins with the letter h.
 * Use tables inventory and film.
 * Order by film title alphabetically.
 */

SELECT film.film_id, film.title, count(inventory.film_id)
FROM inventory, film
WHERE inventory.film_id = film.film_id
AND film.title LIKE 'H%'
GROUP BY film.film_id
ORDER BY film.title DESC;

