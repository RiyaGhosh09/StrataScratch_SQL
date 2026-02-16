with base as (
    select 
        actor_name,
        film_title, 
        release_date,
        film_rating,
        row_number() over(partition by actor_name order by release_date desc) as rn
    from actor_rating_shift
    )
    
select
    a.actor_name,
    max(case when a.rn = 1 then a.film_rating end) as latest_rating,
    round(
        coalesce(avg(b.film_rating)::numeric, 
        max(case when a.rn = 1 then a.film_rating end)::numeric)
        ,2) as avg_rating,
    round(
        max(case when a.rn = 1 then a.film_rating end)::numeric - 
        coalesce(avg(b.film_rating), max(case when a.rn = 1 then a.film_rating end))::numeric
        ,2) as rating_diff
from base a
left join base b
on a.actor_name = b.actor_name
and b.rn > 1
group by 1
order by 1
