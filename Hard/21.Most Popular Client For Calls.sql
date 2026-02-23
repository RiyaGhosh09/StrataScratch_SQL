with base as (
    select 
        client_id,
        user_id,
        sum(event_id) as events,
        sum(case when lower(event_type) in ('video call received', 'video call sent', 'voice call received', 'voice call sent') then event_id else 0 end) as n_event
    from fact_events
    group by 1,2
    )

select 
    client_id
from base
where n_event/events >= 0.5
group by 1
order by count(user_id) desc
limit 1
