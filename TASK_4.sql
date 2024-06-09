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
        LEFT JOIN facebook_adset AS f2 ON f2.adset_id = f1.adset_id 
        LEFT JOIN facebook_campaign AS f3 ON f3.campaign_id = f1.campaign_id
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
)
SELECT 
    ad_date, 
    media_source, 
    campaign_name, 
    adset_name,
    SUM(spend) AS total_spend, 
    SUM(impressions) AS total_impressions, 
    SUM(clicks) AS total_clicks, 
    SUM(value) AS total_value
FROM 
    google_and_facebook_tables
GROUP BY 
    ad_date, 
    media_source, 
    campaign_name, 
    adset_name; 

