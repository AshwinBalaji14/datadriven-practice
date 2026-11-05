WITH ranked_calls AS (
    SELECT
        endpoint,
        latency,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY call_time
        ) AS rn
    FROM api_calls
)

SELECT
    endpoint,
    FLOOR(AVG(latency)) AS avg_repeat_latency_ms
FROM ranked_calls
WHERE rn > 1
GROUP BY endpoint
ORDER BY avg_repeat_latency_ms DESC;
