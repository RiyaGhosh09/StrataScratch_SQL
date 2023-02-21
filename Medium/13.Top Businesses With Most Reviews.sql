select name, sum(review_count) from yelp_business
group by 1
order by 2 desc
limit 5;
