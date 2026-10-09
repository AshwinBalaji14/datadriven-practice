WITH campaign_dates AS (
    SELECT
        ad_campaign,
        MIN(DATE(impression_time)) AS first_day,
        MAX(DATE(impression_time)) AS last_day
    FROM ad_impressions
    GROUP BY ad_campaign
),

campaign_totals AS (
    SELECT
        ad_campaign,
        COUNT(*) AS total_impressions
    FROM ad_impressions
    GROUP BY ad_campaign
),

campaign_counts AS (
    SELECT
        ai.ad_campaign,
        SUM(
            CASE
                WHEN DATE(ai.impression_time) = cd.first_day THEN 1
                ELSE 0
            END
        ) AS first_day_count,
        SUM(
            CASE
                WHEN DATE(ai.impression_time) = cd.last_day THEN 1
                ELSE 0
            END
        ) AS last_day_count
    FROM ad_impressions ai
    JOIN campaign_dates cd
      ON ai.ad_campaign = cd.ad_campaign
    GROUP BY ai.ad_campaign
)

SELECT
    cc.ad_campaign,
    ROUND(100.0 * cc.first_day_count / ct.total_impressions, 3) AS first_day_pct,
    ROUND(100.0 * cc.last_day_count / ct.total_impressions, 3) AS last_day_pct
FROM campaign_counts cc
JOIN campaign_totals ct
  ON cc.ad_campaign = ct.ad_campaign
ORDER BY cc.ad_campaign;
