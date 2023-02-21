with cte as(
select business_name, review_text, sum(cool) as tot,
dense_rank() over(order by sum(cool) desc) as rnk
from yelp_reviews 
where cool > 0 
group by 1,2
order by 3 desc)

select business_name, review_text from cte where rnk = 1;
