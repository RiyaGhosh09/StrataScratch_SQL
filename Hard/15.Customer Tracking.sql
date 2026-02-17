select 
    cust_id,
    sum(extract(epoch from (session_end - timestamp)) / 3600) as total_hours
from 
(
    select *,
        lead(timestamp,1) over(partition by cust_id order by timestamp) as session_end
    from cust_tracking
) 
where state = 1
group by 1
order by 1
