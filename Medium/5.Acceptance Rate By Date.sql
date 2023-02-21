with cte as
(select user_id_sender, user_id_receiver, 
    (case 
    when action = 'sent' then date end) as sent_date ,
    lead(date,1) over (partition by user_id_sender, user_id_receiver) as accepted_date
    from fb_friend_requests)

select sent_date, 
count(accepted_date)/count(sent_date)::float as percentage_acceptance
from cte 
where sent_date is not null
group by 1;
