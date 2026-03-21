
CREATE TABLE analytics_table (
    account_id TEXT,
    industry TEXT,
    country TEXT,
    seats TEXT,
    is_trial TEXT,
    churn_flag TEXT,
    total_feature_usage TEXT,
    avg_usage_duration TEXT,
    total_errors TEXT,
    beta_feature_usage TEXT,
    total_tickets TEXT,
    avg_resolution_time TEXT,
    avg_first_response TEXT,
    avg_satisfaction TEXT,
    escalation_count TEXT,
    total_mrr TEXT,
    total_arr TEXT,
    plan_type TEXT,
    billing_frequency TEXT,
    auto_renew TEXT
);

SELECT * FROM analytics_table;

--checking industries
SELECT DISTINCT industry
FROM analytics_table;


--Which Industries Generate the Highest Revenue?

SELECT 
    industry,
    SUM(total_arr::numeric) AS total_revenue
FROM analytics_table
GROUP BY industry
ORDER BY total_revenue DESC;

--Which Subscription Plans Perform Best?
SELECT 
    plan_type,
    COUNT(*) AS total_customers,
    SUM(total_arr::numeric) AS total_revenue
FROM analytics_table
GROUP BY plan_type
ORDER BY total_revenue DESC;

SELECT 
    plan_type,
    ROUND(AVG(churn_flag::TEXT)*100,2) AS churn_rate
FROM analytics_table
GROUP BY plan_type
ORDER BY churn_rate DESC;

--How Customer Support Impacts Retention?

SELECT 
    churn_flag,
    AVG(avg_satisfaction::numeric) AS avg_satisfaction,
    AVG(total_tickets::numeric) AS avg_support_tickets
FROM analytics_table
GROUP BY churn_flag;

--Customer Segmentation by Company Size

SELECT 
    seats,
    COUNT(*) AS total_customers,
    SUM(total_arr::numeric) AS revenue
FROM analytics_table
GROUP BY seats
ORDER BY revenue DESC;

--Advance SaaS Analysis
-- Top 10 High Value Customers

SELECT 
    account_id,
    industry,
    total_arr::numeric
FROM analytics_table
ORDER BY total_arr::numeric DESC
LIMIT 10;

--Customer Lifetime Value Estimate
SELECT 
    industry,
    ROUND(AVG(total_arr::numeric),2) AS avg_customer_value
FROM analytics_table
GROUP BY industry
ORDER BY avg_customer_value DESC;

--creating numeric column to convert the ch

ALTER TABLE analytics_table
ADD COLUMN churn_numeric INT; 


UPDATE analytics_table
SET churn_numeric =
CASE
    WHEN churn_flag = 'True' THEN 1
    ELSE 0
END;

SELECT industry,
       AVG(churn_numeric)*100 AS churn_rate
FROM analytics_table
GROUP BY industry
ORDER BY churn_rate DESC;

--Churn Rate by Industry
--Which Customers Are Most Likely to Churn?
SELECT 
    industry,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn_flag = 'True' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn_flag = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM analytics_table
GROUP BY industry
ORDER BY churn_rate_percentage DESC;

--Support Escalation Impact on Churn

SELECT 
    escalation_count,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn_flag = 'True' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn_flag = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM analytics_table
GROUP BY escalation_count
ORDER BY escalation_count;

--Final business insights
--Top Revenue Industries
SELECT 
    industry,
    SUM(total_arr::numeric) AS total_revenue
FROM analytics_table
GROUP BY industry
ORDER BY total_revenue DESC;
--meaning: Which industries generate maximum annual recurring revenue (ARR).

--Best Performing Subscription Plans
SELECT 
    plan_type,
    COUNT(*) AS total_customers,
    SUM(total_arr::numeric) AS total_revenue
FROM analytics_table
GROUP BY plan_type
ORDER BY total_revenue DESC;
--Meaning: Which plan generates most customers and revenue.

--Feature Engagement Analysis
SELECT 
    industry,
    AVG(total_feature_usage::numeric) AS avg_feature_usage
FROM analytics_table
GROUP BY industry
ORDER BY avg_feature_usage DESC;
--Meaning: Which customers use the product most actively.

--Customer Satisfaction vs Churn
SELECT 
    churn_flag,
    AVG(avg_satisfaction::numeric) AS avg_satisfaction
FROM analytics_table
GROUP BY churn_flag;
--Meaning: Whether low satisfaction leads to churn.

--High Value Customers
SELECT 
    account_id,
    industry,
    total_arr::numeric
FROM analytics_table
ORDER BY total_arr::numeric DESC
LIMIT 10;
--Meaning: Identify top revenue customers.

COPY analytics_table
TO 'C:/analytics_export.csv'
DELIMITER ','
CSV HEADER;
