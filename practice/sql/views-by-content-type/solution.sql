select
  c.content_type,
  count(v.view_id) as view_count
from
  content_items c
join
  content_views v 
on 
  c.content_id = v.content_id
group by 
   c.content_type
