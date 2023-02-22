select type, 
sum(case when processed then 1 else 0 end) :: numeric/count(*) as rate
from facebook_complaints group by 1;
