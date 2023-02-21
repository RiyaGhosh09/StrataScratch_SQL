with cte as
(select unnest(string_to_array(categories, ';')) AS category, review_count
   FROM yelp_business)
   
select category, sum(review_count) as reviews
from cte
group by 1
order by 2 desc;
