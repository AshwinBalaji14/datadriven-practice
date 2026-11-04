SELECT
    a.ad_campaign,
    ROUND(
        COUNT(
            CASE
                WHEN a.clicked = 1 THEN 1
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS clicked_pct
FROM ad_impressions a
JOIN page_views p
    ON p.user_id = a.user_id
GROUP BY a.ad_campaign
ORDER BY clicked_pct DESC,
         a.ad_campaign;
