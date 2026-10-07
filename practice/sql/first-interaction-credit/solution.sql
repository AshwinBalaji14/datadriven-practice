WITH first_impression AS (
    SELECT
        user_id,
        ad_campaign,
        impression_time,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY impression_time
        ) AS rn
    FROM ad_impressions
)

SELECT
    fi.user_id,
    fi.ad_campaign,
    fi.impression_time
FROM first_impression fi
JOIN (
    SELECT DISTINCT user_id
    FROM transactions
) t
    ON fi.user_id = t.user_id
WHERE fi.rn = 1
ORDER BY fi.user_id;
