WITH cet1 AS (
SELECT 'both' AS platform 
UNION 
SELECT 'mobile' AS platform
UNION 
SELECT 'desktop' AS platform ),
cet2 AS (
SELECT
spend_date,
cnt AS platform,
SUM(amount) AS total_amount,
COUNT(DISTINCT user_id) AS total_users
FROM (
SELECT
*,
CASE WHEN COUNT(platform) OVER(PARTITION BY user_id , spend_date) = 2 THEN 'both' ELSE platform END AS cnt
FROM Spending ) AS RES
GROUP BY spend_date,
cnt) 

SELECT
date.spend_date,
cet1.platform,
CASE WHEN total_amount IS NULL THEN 0 ELSE total_amount END AS total_amount,
CASE WHEN total_users IS NULL THEN 0 ELSE total_users END AS
total_users
FROM 
(SELECT DISTINCT spend_date  FROM cet2) AS date
CROSS JOIN 
cet1
LEFT JOIN cet2 
ON date.spend_date = cet2.spend_date AND cet1.platform = cet2.platform
