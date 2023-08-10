# Write your MySQL query statement below
WITH cet1 AS (
SELECT
*,
CONCAT(EXTRACT(year FROM day),
EXTRACT(month FROM day),
EXTRACT(day FROM day)) AS date

FROM Transactions)

SELECT
cet1.transaction_id
FROM (
SELECT 
date,
MAX(amount) AS amt
FROM cet1
GROUP BY date) AS res1
LEFT JOIN cet1
ON cet1.date = res1.date AND res1.amt = cet1.amount
WHERE cet1.transaction_id IS NOT NULL 
ORDER BY transaction_id ASC;
