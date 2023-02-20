with cte as(
select department, avg(salary) as avg_salary from employee group by 1
)

select e.department, first_name, last_name, salary, avg_salary from employee e
join cte on e.department = cte.department;
