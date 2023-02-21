select distinct winery 
from winemag_p1
where lower(description) ~ '\y(plum|cherry|rose|hazelnut)\y';
