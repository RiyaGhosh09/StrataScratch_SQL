select trackname, count(position) as top1_numOftimes 
from spotify_worldwide_daily_song_ranking
where position = 1
group by 1
order by 2 desc;
