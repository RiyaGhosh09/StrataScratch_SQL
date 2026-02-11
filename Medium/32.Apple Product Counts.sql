select 
    language,
    count(distinct case when lower(device) in ('macbook pro', 'iphone 5s', 'ipad air') then y.user_id end) as n_apple_users,
    count(distinct y.user_id) as n_total_users
from playbook_events x
join playbook_users y
on x.user_id = y.user_id
group by 1
order by 3 desc
