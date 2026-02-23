with base as (
    select 
        2*(row_number() over() -1) lt,
        2*(row_number() over() -1)+1 rt
    from cookbook_titles
)

select * from
(
    select
        lt as left_page_num,
        (select title from cookbook_titles where page_number = lt) left_title,
        (select title from cookbook_titles where page_number = rt) right_title
    from base
)
where left_title is not null or right_title is not null

