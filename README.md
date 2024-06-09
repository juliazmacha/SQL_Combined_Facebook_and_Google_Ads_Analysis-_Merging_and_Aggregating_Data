# Combined Facebook and Google Ads Analysis: Merging and Aggregating Data
This project involves merging and analyzing data from Facebook and Google ad campaigns using CTE (Common Table Expressions). The following steps outline the process of combining data, aggregating key metrics, and identifying top-performing campaigns and ad sets.

## Steps Undertaken

### Step 1: SQL Query with CTE to Merge Facebook Data
A SQL query was written using CTE to merge data from the `facebook_ads_basic_daily`, `facebook_adset`, and `facebook_campaign` tables, resulting in a table with the following columns:
- **ad_date**: The date the ad was displayed on Facebook.
- **campaign_name**: The name of the Facebook campaign.
- **adset_name**: The name of the Facebook ad set.
- **spend, impressions, reach, clicks, leads, value**: Campaign and ad set metrics for each day.

### Step 2: SQL Query with CTE to Merge Facebook and Google Data
Using a second CTE, the data from the `google_ads_basic_daily` table was merged with the first CTE, resulting in a combined table with data from both Facebook and Google marketing campaigns.

### Step 3: Aggregate Data Using CTE
Based on the combined table from the second CTE, an aggregated dataset was created with the following columns:
- **ad_date**: The date the ad was displayed.
- **media_source**: The source of the click (Google Ads / Facebook Ads). This column was created manually.
- **campaign_name**: The name of the campaign.
- **adset_name**: The name of the ad set.
- Aggregated values by date, campaign name, and ad set name for the following metrics:
  - **Total Spend**
  - **Number of Impressions**
  - **Number of Clicks**
  - **Total Conversion Value**

The table was grouped by `ad_date`, `media_source`, `campaign_name`, and `adset_name`.

### Step 4: Identify Top Campaign and Ad Set by ROMI (TASK 4.2)
1. Among all campaigns with total spending exceeding 500,000, the campaign with the highest ROMI was identified.
2. Within the top campaign, the ad set (`adset_name`) with the highest ROMI was identified.

## Final Product
The resulting analysis provides a comprehensive view of ad performance across Facebook and Google. By merging and aggregating key metrics, this project enables detailed evaluation of cross-platform ad effectiveness, helping to identify the most cost-efficient and high-performing campaigns and ad sets.
