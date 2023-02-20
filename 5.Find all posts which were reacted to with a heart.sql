select distinct p.* from facebook_posts p join facebook_reactions r on p.post_id = r.post_id where reaction = 'heart';
