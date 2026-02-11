select 
    from_user,
    count(*) as total_emails,
    row_number() over(order by count(*) desc, from_user) as rn
from google_gmail_emails
group by 1;
