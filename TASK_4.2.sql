WITH facebook_tables AS (
    SELECT 
        f1.ad_date, 
        f3.campaign_name, 
        f2.adset_name, 
        f1.spend, 
        f1.impressions, 
        f1.reach, 
        f1.clicks, 
        f1.leads, 
        f1.value 
    FROM 
        facebook_ads_basic_daily AS f1
        FULL JOIN facebook_adset AS f2 ON f2.adset_id = f1.adset_id 
        FULL JOIN facebook_campaign AS f3 ON f3.campaign_id = f1.campaign_id
), 
google_and_facebook_tables AS (
    SELECT 
        ad_date, 
        'Facebook Ads' AS media_source, 
        campaign_name, 
        adset_name, 
        spend, 
        impressions, 
        reach, 
        clicks, 
        leads, 
        value
    FROM 
        facebook_tables
    UNION ALL 
    SELECT 
        ad_date, 
        'Google Ads' AS media_source, 
        campaign_name, 
        adset_name, 
        spend, 
        impressions, 
        reach, 
        clicks, 
        leads, 
        value
    FROM 
        google_ads_basic_daily 
),
romi_table AS (
    SELECT  
        ad_date, 
        media_source, 
        campaign_name, 
        adset_name, 
        spend, 
        impressions, 
        reach, 
        clicks, 
        leads, 
        value,
        CASE 
            WHEN spend > 0 THEN value::numeric - spend:: numeric / spend::numeric * 100-- ROMI (Return On Marketing Investment)
            ELSE NULL
        END AS romi
    FROM 
        google_and_facebook_tables
)
SELECT 
    romi AS max_romi,
    adset_name -- specify which adset_name you want to select, assuming it's from google_and_facebook_tables
FROM 
    romi_table
WHERE 
    spend > 50000
ORDER BY 
    romi DESC
LIMIT 1;



