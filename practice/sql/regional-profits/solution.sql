select
  region,
  Sum(profit) as total_profit	,
  count(order_id) as order_count
from 
  orders
WHERE region IS NOT NULL
group by 
  region
order by 
  total_profit	desc
