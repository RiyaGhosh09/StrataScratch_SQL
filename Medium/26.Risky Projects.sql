with base as(
    select 
        a.project_id,
        ceiling((c.end_date - c.start_date)*(sum(salary)/365)) as prorated_cost
    from linkedin_emp_projects a
    join linkedin_employees b
        on a.emp_id = b.id
    join linkedin_projects c
        on a.project_id = c.id
    group by 1, end_date, start_date
),

projects as (
    select 
        id, title, sum(budget) budget 
    from linkedin_projects 
    group by 1,2
)

select 
    title,
    budget,
    prorated_cost
from base 
join projects
    on base.project_id = projects.id
where budget < prorated_cost
order by 1
