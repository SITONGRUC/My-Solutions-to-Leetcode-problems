# Write your MySQL query statement below
SELECT
u.user_id,
u.user_name,
u.credit + CASE WHEN res2.sm IS NULL THEN 0 ELSE res2.sm END AS credit,
CASE WHEN (u.credit + CASE WHEN res2.sm IS NULL THEN 0 ELSE res2.sm END) < 0 THEN 'Yes' ELSE 'No' END AS credit_limit_breached
FROM 
Users AS u
LEFT JOIN 
(SELECT
user_id,
CASE WHEN SUM(amount) IS NULL THEN 0 ELSE SUM(amount) END  AS sm
FROM
(SELECT
paid_by AS user_id,
(0-amount) AS amount
FROM Transactions
UNION ALL 
SELECT
paid_to AS user_id,
amount AS amount
FROM Transactions) AS res
GROUP BY user_id) AS res2
ON u.user_id  =  res2.user_id ;
