# Write your MySQL query statement below
SELECT
total.month,
total.country,
trans_count,
CASE WHEN approved_count IS NULL THEN 0 ELSE approved_count END AS approved_count,
trans_total_amount ,
CASE WHEN approved_total_amount  IS NULL THEN 0 ELSE approved_total_amount  END AS approved_total_amount 
FROM
(SELECT
SUBSTR(trans_date,1,7) AS month,
country AS country,
COUNT(amount) AS trans_count,
SUM(amount) AS trans_total_amount 
FROM Transactions
GROUP BY SUBSTR(trans_date,1,7),country) AS total 
LEFT JOIN 
(SELECT
SUBSTR(trans_date,1,7) AS month,
country AS country,
COUNT(amount) AS approved_count,
SUM(amount) AS approved_total_amount
FROM Transactions
WHERE state = 'approved'
GROUP BY SUBSTR(trans_date,1,7),country) AS approved
ON total.month = approved.month AND total.country = approved.country
