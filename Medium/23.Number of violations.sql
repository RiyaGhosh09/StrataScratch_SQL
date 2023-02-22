select extract('year' from inspection_date) as year, 
count(violation_id) as count_violation 
from sf_restaurant_health_violations
where business_name='Roxanne Cafe'
group by 1
order by 1;
