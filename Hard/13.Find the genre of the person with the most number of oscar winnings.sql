select
    top_genre
from (
    select 
        nominee,
        top_genre,
        sum(case when winner = 'TRUE' then 1 else 0 end) as oscars
    from oscar_nominees x
    join nominee_information y
    on x.nominee = y.name
    group by 1,2
    order by 3 desc, 1
    limit 1
    )

