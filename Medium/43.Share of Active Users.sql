select 
    (cast(count(distinct case when (lower(country) = 'usa' and lower(status) = 'open') then user_id end) as float)/
    cast(count(distinct user_id) as float) )*100 as us_active_share
from fb_active_users
