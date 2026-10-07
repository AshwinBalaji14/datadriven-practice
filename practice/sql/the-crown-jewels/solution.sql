select 
  p.product_name,
  SUM(t.total_amount) as total_revenue
from
  products p
join 
  transactions t
on 
  p.product_id = t.product_id
group by
  p.product_id
order by 
  total_revenue desc
limit 5
