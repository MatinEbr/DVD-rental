select 
	f.title,
	case 
		when f.length < 90 then 'short'
		when f.length > 150 then 'long'
	end as film_length,
	sum(p.amount) as total_amount
	
from 
	film as f
join inventory as i using (film_id)
join rental as r using (inventory_id)
join payment as p using (rental_id)

where
	f.length < 90 or f.length > 150
group by
	f.title,f.length
order by total_amount desc
limit 10;
