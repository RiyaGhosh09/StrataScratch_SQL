with cte as
(select date, 
sum(case when paying_customer = 'yes' then downloads end) as paying,
sum(case when paying_customer = 'no' then downloads end) as non_paying
from ms_user_dimension u
join ms_acc_dimension a on u.acc_id = a.acc_id
join ms_download_facts d on d.user_id=u.user_id
group by 1
order by 1) 

select * from cte where (non_paying-paying)>0 order by date;
