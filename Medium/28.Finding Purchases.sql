with base as (
select 
    user_id,
    created_at,
    lag(created_at,1) over(partition by user_id order by created_at) as prev_dt
from amazon_transactions
)

select 
    distinct user_id
from base
group by 1, created_at, prev_dt
having (created_at - prev_dt) between 1 and 7 
order by 1
