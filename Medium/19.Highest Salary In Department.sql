with cte as
(select first_name, department, salary,
dense_rank() over(partition by department order by salary desc) as rnk
from employee)

select department, first_name as employee_name, salary from cte where rnk = 1;
