with cte as (
    select 
        voter,
        candidate,
        round(1.0/count(*) over(partition by voter),3) as vote_value
    from voting_results
    where candidate is not null
    group by 1,2
    order by 1,2
    )

select
    candidate
from (
    select 
        candidate,
        round(sum(vote_value),3) as total_votes,
        dense_rank() over(order by round(sum(vote_value),3) desc) as rnk
    from cte
    group by 1
    )
where rnk = 1
