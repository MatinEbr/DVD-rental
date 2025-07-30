select 
	c.category_id,
	c.name,
	sum(p.amount) as total_amount
from 
	category as c
join film_category as fc on c.category_id = fc.category_id
join film as f on fc.film_id = f.film_id
join inventory as i on f.film_id = i.film_id
join rental as r on i.inventory_id = r.inventory_id
join payment as p on r.rental_id = p.rental_id
group by 
	c.category_id,
	c.name
order by total_amount desc
/*  Although there is no title that belongs to two or more categories, this table 
shows the total income from each category */

/*WITH film_categories AS (
    SELECT
        f.film_id,
        STRING_AGG(c.name, ', ' ORDER BY c.name) AS categories
    FROM
        film f
        JOIN film_category fc ON f.film_id = fc.film_id
        JOIN category c ON fc.category_id = c.category_id
    GROUP BY
        f.film_id
),
film_revenue AS (
    SELECT
        i.film_id,
        SUM(p.amount) AS revenue
    FROM
        payment p
        JOIN rental r ON p.rental_id = r.rental_id
        JOIN inventory i ON r.inventory_id = i.inventory_id
    GROUP BY
        i.film_id
)
SELECT
    fc.categories,
    SUM(fr.revenue) AS total_revenue
FROM
    film_categories fc
    JOIN film_revenue fr ON fc.film_id = fr.film_id
GROUP BY
    fc.categories
ORDER BY
    total_revenue DESC
LIMIT 1;
*/
