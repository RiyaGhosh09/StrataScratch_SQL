with cte as
(select distinct *,
case
    when number_of_reviews=0 then 'New'
    when number_of_reviews>0 and number_of_reviews<6 then 'Rising'
    when number_of_reviews>5 and number_of_reviews<16 then 'Trending Up'
    when number_of_reviews>15 and number_of_reviews<41 then 'Popular'
    when number_of_reviews>40 then 'Hot'
end as host_popularity_rating
from
(
select 
price, room_type, host_since,zipcode, number_of_reviews,
concat(price, room_type, host_since,zipcode, number_of_reviews) as host_id
from airbnb_host_searches
)
as a
order by host_id)

select host_popularity_rating, min(price) as min_price, avg(price) as avg_price, max(price) as max_price from cte group by 1;
