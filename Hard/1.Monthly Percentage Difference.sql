with cte as
(select to_char(created_at, 'YYYY-MM') as year_month, 
sum(value) as cur_rev,
lag(sum(value),1) over(order by to_char(created_at, 'YYYY-MM')) as prev_rev
from sf_transactions
group by 1
order by 1)

select year_month, round(((cur_rev-prev_rev)/prev_rev)*100, 2) as revenue_diff_pct from cte;
