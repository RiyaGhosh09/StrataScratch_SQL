with cte as
(select 
id_guest, sum(n_messages) as num from airbnb_contacts
group by 1
order by 2 desc)

select dense_rank() over(order by num desc) as ranking, id_guest, num as sum_n_messages from cte;
