select
  user_id,
  count(*) as total_views
from
  page_views
WHERE viewed_at >= '2025-01-01'
  AND viewed_at < '2025-12-29'
GROUP BY user_id
ORDER BY user_id;
