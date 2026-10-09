WITH combined AS (
    SELECT
        region,
        svc_name,
        amount
    FROM cloud_costs

    UNION ALL

    SELECT
        region,
        svc_name,
        amount
    FROM cost_allocs
),
ranked AS (
    SELECT
        region,
        svc_name,
        amount,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY amount DESC
        ) AS rn_max,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY amount ASC
        ) AS rn_min
    FROM combined
)
SELECT
    region,
    MAX(CASE WHEN rn_max = 1 THEN svc_name END) AS most_expensive,
    MAX(CASE WHEN rn_min = 1 THEN svc_name END) AS cheapest
FROM ranked
GROUP BY region
ORDER BY region;
