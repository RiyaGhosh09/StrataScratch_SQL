with cte as (
select user_id, created_at,
    min(created_at) over (partition by user_id) as first_purchase ,
    product_id, 
    min(created_at)  over(partition by user_id, product_id) as first_purchase_by_product 
    from marketing_campaign
    order by user_id, created_at
)

select count(distinct user_id) 
from cte  
where first_purchase != first_purchase_by_product ;
