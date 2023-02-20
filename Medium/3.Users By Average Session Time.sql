with load_cte as
(select user_id, max(timestamp) as t1 from facebook_web_log where action='page_load' group by user_id, extract(day from timestamp)),

exit_cte as
(select user_id, min(timestamp) as t2 from facebook_web_log where action='page_exit' group by user_id, extract(day from timestamp))

select l.user_id, avg(t2-t1) from load_cte l join exit_cte e on l.user_id=e.user_id group by 1;
