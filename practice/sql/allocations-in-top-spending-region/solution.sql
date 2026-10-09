SELECT
    ca.*
FROM cost_allocs AS ca
WHERE ca.region = (
    SELECT region
    FROM cloud_costs
    GROUP BY region
    ORDER BY SUM(amount) DESC
    LIMIT 1
)
ORDER BY
    ca.period ASC,
    ca.alloc_id ASC;
