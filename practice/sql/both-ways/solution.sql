SELECT
    transaction_date,
    SUM(total_amount) AS net_revenue
FROM transactions
WHERE
      (total_amount > 0
       AND transaction_date BETWEEN '2026-04-01' AND '2026-06-30')
   OR (total_amount < 0)
GROUP BY transaction_date
ORDER BY transaction_date;
