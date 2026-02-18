with base as (
    select 
        state,
        percentile_cont(0.95) within group (order by fraud_score) as pr
    from fraud_score
    group by 1
    )

select 
    policy_num, b.state, claim_cost, fraud_score
from fraud_score a
join base b 
on a.state = b.state
where a.fraud_score >= b.pr
order by 2,1

