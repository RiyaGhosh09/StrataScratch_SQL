with cte as (
    select 
        account_id,
        case when record_date between '2020-12-01' and '2020-12-31' then user_id else null end as dec_user,
        case when record_date > '2020-12-31' then user_id else null end as post_dec_user,
        case when record_date between '2021-01-01' and '2021-01-31' then user_id else null end as jan_user,
        case when record_date > '2021-01-31' then user_id else null end as post_jan_user 
    from sf_events
    group by 1,2,3,4,5
)

select 
    account_id,
    ceiling(
        (count(distinct post_jan_user)/count(distinct jan_user)::float)/
        (count(distinct post_dec_user)/count(distinct dec_user)::float)
          ) as retention_rate
from cte
group by 1
