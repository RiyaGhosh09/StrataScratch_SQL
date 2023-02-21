with cte as(
select * from fb_eu_energy
union all
select * from fb_asia_energy
union all
select * from fb_na_energy
),

cte2 as(
select date, sum(consumption) as total_energy, dense_rank() over(order by sum(consumption) desc) as rnk
from cte 
group by 1 order by 2 desc)

select date, total_energy from cte2 where rnk = 1;
