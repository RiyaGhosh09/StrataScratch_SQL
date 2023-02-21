select games, count(distinct id) as count_of_athletes 
from olympics_athletes_events
group by 1
order by 2 desc
limit 1;
