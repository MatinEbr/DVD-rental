select 
 extract(year from rental.rental_date),
 category.category_id,
 category.name,
 count(category.category_id) as count_category
from category
join film_category on film_category.category_id = category.category_id
join film on film_category.film_id = film.film_id
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
group by 
 category.category_id,
 category.name,
 extract(year from rental.rental_date)
order by 
 count(category.category_id) desc
 /* sport in 2005 and animation in 2006 are the favorites*/