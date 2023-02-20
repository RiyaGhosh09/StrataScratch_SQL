with cte as(
select user_id, created_at as cur_orderdate,  
lead(created_at, 1) over (partition by user_id order by user_id,created_at) as next_orderdate
from amazon_transactions 
order by user_id, created_at)

select distinct user_id from(
select *, (next_orderdate-cur_orderdate) as diff from cte 
where (next_orderdate-cur_orderdate) != null or (next_orderdate-cur_orderdate)<=7)
as s
order by user_id;
