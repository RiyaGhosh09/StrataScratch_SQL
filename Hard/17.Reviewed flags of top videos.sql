select
    video_id,
    reviewed
from (
    select 
        video_id,
        count(distinct x.flag_id) as flags,
        sum(case when reviewed_by_yt = 'TRUE' then 1 else 0 end) as reviewed,
        dense_rank() over(order by count(distinct x.flag_id) desc) as rnk
    from user_flags x
    join flag_review y
    on x.flag_id = y.flag_id
    where x.flag_id is not null
    group by 1
)
where rnk = 1
