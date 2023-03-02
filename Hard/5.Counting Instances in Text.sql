select words, count(*) as occurrences from (
  select unnest(string_to_array(contents, ' ')) as words from google_file_store ) as a
where words = 'bull' or words = 'bear'
group by 1;
