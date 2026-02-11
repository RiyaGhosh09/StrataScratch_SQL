select 
    distinct first_name
from customers c
left join orders o
    on c.id = o.cust_id
    and order_date between '2019-02-01' and '2019-03-01'
where order_date is null
order by 1;

