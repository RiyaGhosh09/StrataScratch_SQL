select 
    salary 
from (
    select 
        salary,
        dense_rank() over(order by salary desc) as rnk
    from employee
    )
where rnk = 2
