select nationality, count(distinct unit_id) as apartment_count
from airbnb_hosts a
join airbnb_units b on a.host_id = b.host_id
where age<30 and unit_type='Apartment'
group by 1;
