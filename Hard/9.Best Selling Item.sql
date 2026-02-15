with base as (
    select 
        extract(month from invoicedate) as mnth,
        description,
        sum(quantity * unitprice) as total_paid,
        dense_rank() over(partition by extract(month from invoicedate) order by sum(quantity * unitprice) desc) as rnk
    from online_retail
    where quantity > 0
        and invoiceno not like 'C%'
    group by 1,2
)

select 
    mnth,
    description,
    total_paid
from base
where rnk = 1
order by 1
