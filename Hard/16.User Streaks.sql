with base as (
    select 
        user_id, 
        date_visited,
        row_number() over(partition by user_id order by date_visited) as rn,
        date_visited - row_number() over(partition by user_id order by date_visited)::int as dt
    from user_streaks
    where date_visited < '2022-08-11'
    group by 1,2
    order by 1,2
),

streak as (
    select
        user_id, max(ct) as max_streak, dense_rank() over(order by max(ct) desc) as rnk
    from (
        select 
            user_id,
            count(*) as ct
        from base
        group by 1, dt
    ) 
    group by 1
)

select 
    user_id, 
    max_streak 
from streak 
where rnk < 4
