select 
    cast(count(distinct case when status='closed' then acc_id end) as float)/count(distinct acc_id) as closed_ratio
from fb_account_status
where status_date = '2020-01-10';
