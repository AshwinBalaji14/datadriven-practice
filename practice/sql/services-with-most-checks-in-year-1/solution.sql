WITH yearly_counts AS (
    SELECT
        svc_name,
        YEAR(CAST(checked AS DATE)) AS check_year,
        COUNT(*) AS check_count,
        DATE_FORMAT(MAX(CAST(checked AS DATE)), '%Y-%m') AS last_trouble_month
    FROM svc_health
    WHERE LOWER(status) <> 'healthy'
    GROUP BY
        svc_name,
        YEAR(CAST(checked AS DATE))
),
ranked AS (
    SELECT *,
           DENSE_RANK() OVER (
               PARTITION BY svc_name
               ORDER BY check_count DESC
           ) AS rnk
    FROM yearly_counts
)
SELECT
    svc_name,
    check_year,
    check_count,
    last_trouble_month
FROM ranked
WHERE rnk = 1
ORDER BY
    svc_name,
    check_year;
