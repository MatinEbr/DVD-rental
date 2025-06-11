SELECT 
    st.store_id,
    TO_CHAR(p.payment_date , 'fmday') AS weekday,
    SUM(p.amount) AS total_amount
FROM
    payment AS p 
JOIN staff AS s ON p.staff_id = s.staff_id
JOIN store AS st ON s.store_id = st.store_id 

where TO_CHAR(p.payment_date , 'fmday') in ('saturday' , 'sunday')

GROUP BY 
    st.store_id,
    TO_CHAR(p.payment_date , 'fmday')
ORDER BY 
	 weekday,
	 total_amount desc
 /* store_id = 2 on saturday and sunday had 8730.79 amount*/