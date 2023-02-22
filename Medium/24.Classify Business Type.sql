select distinct business_name,
case
    when lower(business_name) like '%restaurant%' then 'restaurant'
    when lower(business_name) like any (array['%cafe%','%café%', '%coffee%']) then 'cafe'
    when lower(business_name) like '%school%' then 'school'
    else 'other'
end as business_type
from sf_restaurant_health_violations;
