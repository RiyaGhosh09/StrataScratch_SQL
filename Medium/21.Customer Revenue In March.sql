select cust_id, sum(total_order_cost) as revenue
from orders 
where extract(month from order_date)=3
group by 1
order by 2 desc;
