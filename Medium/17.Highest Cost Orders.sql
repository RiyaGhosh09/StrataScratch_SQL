with base as (
select 
    first_name, 
    order_date,
    sum(total_order_cost) as total_order_cost
from customers c 
join orders o 
on c.id = o.cust_id
where order_date between '2019-02-01' and '2019-05-01'
group by 1,2
order by 3 desc
)

select 
    first_name, 
    order_date,
    total_order_cost
from (
    select 
        first_name, 
        order_date,
        total_order_cost,
        dense_rank() over(partition by order_date order by total_order_cost desc) as rnk
    from base
    group by 1,2,3
    )
where rnk = 1;
