with cte as
(select user1, count(user2) as tot from
(select user1, user2 from facebook_friends
union
select user2, user1 from facebook_friends) as a
group by 1
)

select user1,
tot::float / count(tot) over ()*100 as popularity_percentage
from cte order by 1;
