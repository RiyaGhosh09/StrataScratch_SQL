select 
    business_postal_code,
    count(distinct case
        when left(business_address, 1) ~ '^[0-9]' THEN lower(split_part(business_address, ' ', 2))
        else lower(split_part(business_address, ' ', 1))
    end) as unique_streets
from sf_restaurant_health_violations
where business_postal_code is not null
group by 1
order by 2 desc, 1;
