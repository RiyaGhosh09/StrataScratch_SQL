with base as (
    select 
        city,
        id,
        amenities,
        unnest(string_to_array(amenities, ',')) as amenities_v2
    from airbnb_search_details
    group by 1,2,3,4
)

select 
    city
from (
    select 
        city,
        count(*),
        dense_rank() over(order by count(*) desc) as rnk
    from base
    group by 1
    )
where rnk = 1
