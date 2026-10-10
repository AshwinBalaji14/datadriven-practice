SELECT DISTINCT
    t1.user_id,
    t1.transaction_date
FROM transactions t1
JOIN transactions t2
    ON t1.user_id = t2.user_id
   AND DATE(t2.transaction_date) > DATE(t1.transaction_date)
   AND JULIANDAY(t2.transaction_date) - JULIANDAY(t1.transaction_date) BETWEEN 1 AND 7
ORDER BY
    t1.user_id,
    t1.transaction_date;
