SELECT f.film_id, f.title, count(*)-1
from film as f
full join inventory as i on i.film_id = f.film_id
full join rental as r on r.inventory_id = i.inventory_id
group by f.film_id, f.title
having count(*)-1 = 0

order by f.film_id
