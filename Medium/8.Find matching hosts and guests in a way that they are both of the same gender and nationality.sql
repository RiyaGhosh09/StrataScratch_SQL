select distinct host_id, guest_id 
from airbnb_hosts h join airbnb_guests g 
on h.gender = g.gender and h.nationality = g.nationality;
