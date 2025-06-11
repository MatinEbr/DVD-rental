select
	case 		
		when extract(month from r.rental_date) in (12,1,2) then 'winter'
		when extract(month from r.rental_date) in (3,4,5) then 'spring'
		when extract(month from r.rental_date) in (6,7,8) then 'summer'
		when extract(month from r.rental_date) in (9,10,11) then 'fall'
	end as season,
	sum(rental_rate) as season_amount
from film as f
join inventory as i on i.film_id = f.film_id
join rental as r on r.inventory_id = i.inventory_id
group by season
order by season
/* Income increased by 44,608.36 from spring to winter */