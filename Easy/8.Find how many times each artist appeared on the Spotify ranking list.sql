select artist, count(*) as n_occurences from spotify_worldwide_daily_song_ranking
group by 1
order by 2 desc;
