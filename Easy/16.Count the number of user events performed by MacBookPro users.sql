select event_name, count(*) as event_count from playbook_events
where device = 'macbook pro'
group by 1
order by 2 desc;
