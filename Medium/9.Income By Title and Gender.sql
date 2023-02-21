with bonus as(
select worker_ref_id, sum(bonus) as total_bonus from sf_bonus group by 1
),

tot as(
select e.id, employee_title, sex, salary, total_bonus, (salary+total_bonus) as total_comp 
from sf_employee e join bonus b
on e.id = b.worker_ref_id
where e.id in (select distinct worker_ref_id from bonus)
order by 1
)

select employee_title, sex, avg(total_comp) as avg_compensation from tot
group by 1,2;
