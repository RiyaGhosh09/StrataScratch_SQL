with base as(
    select 
        extract(month from created_at) as mnth,
        country,
        sum(number_of_comments) as total_comments,
        dense_rank() over(partition by extract(month from created_at) order by sum(number_of_comments) desc) as rnk
    from fb_comments_count a
    join fb_active_users b 
    on a.user_id = b.user_id
    where created_at between '2019-12-01' and '2020-01-31'
    group by 1,2
)

select
    country
from (
    select
        country,
        max(case when mnth = 12 then rnk end) as rnk_dec,
        max(case when mnth = 1 then rnk end) as rnk_jan
    from base
    group by 1
    )
where rnk_dec > rnk_jan
