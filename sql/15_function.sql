/*
 * Use a JOIN to count the number films in each category in the specified language.
 * Use table category, film_category, film, and language.
 */
CREATE OR REPLACE FUNCTION category_counts_by_language(TEXT) RETURNS TABLE(name TEXT, count BIGINT) AS
$$
SELECT category.name, COUNT(cat.category_id) AS sum FROM film
INNER JOIN film_category AS cat ON film.film_id = cat.film_id
INNER JOIN language as lang ON film.language_id = lang.language_id
INNER JOIN category ON cat.category_id = category.category_id
WHERE lang.name ILIKE ($1||'%')
GROUP BY category.name;
$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

SELECT * FROM category_counts_by_language('English');
SELECT * FROM category_counts_by_language('Italian');
SELECT * FROM category_counts_by_language('Japanese');
SELECT * FROM category_counts_by_language('Mandarin');
SELECT * FROM category_counts_by_language('French');
SELECT * FROM category_counts_by_language('German');
SELECT * FROM category_counts_by_language('Latin');
