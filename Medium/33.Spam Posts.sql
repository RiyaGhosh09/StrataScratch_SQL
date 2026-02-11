select 
    post_date,
    (cast(
      count(distinct case when lower(post_keywords) like '%spam%' then viewer_id end) as float)/
      sum(case when viewer_id is not null then 1 else 0 end)
    )*100 as spam_share
from facebook_posts x
join facebook_post_views y
on x.post_id = y.post_id
group by 1
