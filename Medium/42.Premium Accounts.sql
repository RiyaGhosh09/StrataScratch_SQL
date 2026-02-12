with cte_start as(
    select 
        entry_date,
        account_id,
        (entry_date + 7) as days_7
    from premium_accounts_by_day
    where final_price != 0
    ),
  
day_7 as(  
    select 
        a.account_id,
        a.entry_date
    from cte_start a
    join premium_accounts_by_day b
        on a.account_id = b.account_id
        and a.days_7 = b.entry_date
        and b.final_price != 0
    )

select 
    a.entry_date,
    count(distinct a.account_id) as premium_acc,
    count(distinct b.account_id) as premium_acc_after_7d
from cte_start a
left join day_7 b
    on a.account_id = b.account_id
    and a.entry_date = b.entry_date
group by 1
order by 1
limit 7
