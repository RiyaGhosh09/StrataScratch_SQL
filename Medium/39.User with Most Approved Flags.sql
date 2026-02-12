with cte as (
    select 
        concat(user_firstname, ' ', user_lastname) as user_name,
        count(distinct video_id) as videos,
        dense_rank() over(order by count(distinct video_id) desc) as rnk
    from user_flags x
    join flag_review y
    on x.flag_id = y.flag_id
    where lower(reviewed_outcome) = 'approved'
    group by 1 
    )
    
select user_name from cte where rnk = 1
