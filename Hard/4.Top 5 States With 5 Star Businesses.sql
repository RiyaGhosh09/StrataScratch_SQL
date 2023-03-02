with cte as
(select state, count(business_id) as num_businessess,
dense_rank() over(order by count(business_id) desc) as rnk
from yelp_business
where stars = 5
group by 1
order by 2 desc, 1)

select state, num_businessess from cte where rnk<5;
