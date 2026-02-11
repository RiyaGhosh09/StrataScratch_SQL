select 
    (cast(count(distinct case when address is not null then o.id end) as float)/count(distinct o.id))*100 as total_orders
from orders o
join customers c
on o.cust_id = c.id;
