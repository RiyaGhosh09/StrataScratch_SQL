WITH base AS (
    SELECT
        player_id,
        match_date,
        match_result,
        SUM(CASE WHEN match_result = 'L' THEN 1 ELSE 0 END) OVER (PARTITION BY player_id ORDER BY match_date) AS loss_group
    FROM players_results
),

streaks AS (
    SELECT
        player_id,
        loss_group,
        COUNT(*) AS win_streak,
        dense_rank() over(order by count(*) desc) as rnk
    FROM base
    WHERE match_result = 'W'
    GROUP BY 1,2
)

SELECT
    player_id,
    MAX(win_streak) AS longest_win_streak
FROM streaks
where rnk = 1
GROUP BY 1
