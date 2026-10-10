select
  p.category,
  sum(t.quantity * p.price) as total_revenue
from
  products p
join
  transactions t
on 
  t.product_id = p.product_id 
group by 
  p.category
