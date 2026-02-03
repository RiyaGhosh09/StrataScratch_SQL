with cte as(
select 
    *
from (
    select 
        user_id,
        created_at as cur_orderdate,  
        lead(created_at, 1) over (partition by user_id order by created_at) as next_orderdate,
        row_number() over(partition by user_id order by created_at) as rn
    from amazon_transactions 
    )
where rn = 1
)

select 
    distinct user_id 
from(
    select 
        *, 
        (next_orderdate-cur_orderdate) as diff 
    from cte 
    )
where diff != null or (diff between 1 and 7)
order by user_id
