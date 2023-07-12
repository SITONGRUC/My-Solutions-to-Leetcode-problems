# Write your MySQL query statement below
SELECT
DISTINCT user_id
FROM
(SELECT
user_id,
DATEDIFF(purchase_date, LAG(purchase_date,1) OVER(PARTITION BY user_id ORDER BY purchase_date)) AS diff
FROM Purchases) AS res
WHERE diff <= 7
