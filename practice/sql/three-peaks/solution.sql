WITH monthly_costs AS (
    SELECT
        LOWER(team_name) AS team_name,
        period,
        SUM(amount) AS monthly_cost
    FROM cost_allocs
    GROUP BY LOWER(team_name), period
),

ranked_costs AS (
    SELECT
        team_name,
        monthly_cost,
        DENSE_RANK() OVER (
            PARTITION BY team_name
            ORDER BY monthly_cost DESC
        ) AS rnk
    FROM monthly_costs
)

SELECT
    team_name,
    monthly_cost
FROM ranked_costs
WHERE rnk <= 3
ORDER BY team_name, monthly_cost DESC;
