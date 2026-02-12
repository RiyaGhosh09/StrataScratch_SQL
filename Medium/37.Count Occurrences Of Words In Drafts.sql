select 
    word,
    count(*) as frequency
from google_file_store,
    regexp_split_to_table(lower(contents),'\W+') as word
where word <> ''
group by 1;


-- Option 2: Use unnest instead of regexp
-- unnest(string_to_array(lower(contents), ' ')) as unnest
