with base as (
    select
        user_id, record_date
    from sf_events
    order by 1,2
),

consecutive_days as (
    select
        user_id,
        record_date - row_number() over(partition by user_id order by record_date)::int as dt
    from base
)

select 
    user_id
from consecutive_days
group by 1, dt
having count(*) >= 3
