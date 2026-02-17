with top_actors as (
    select 
        actor_name,
        genre,
        count(distinct movie_title) as movie_count,
        avg(movie_rating) as avg_rating,
        dense_rank() over(partition by actor_name order by count(distinct movie_title) desc, avg(movie_rating) desc) as rnk
    from top_actors_rating
    group by 1,2
    order by 1,5
    )

select *
from (
    select
        actor_name,
        genre,
        avg_rating,
        dense_rank() over(order by avg_rating desc) as actor_rnk
    from top_actors
    where rnk = 1
    group by 1,2,3
    )
where actor_rnk <= 3
