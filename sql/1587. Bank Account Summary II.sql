# Write your MySQL query statement below

SELECT 
name,
SUM(amount) AS balance
FROM Users AS u
LEFT JOIN Transactions AS t
ON t.account = u.account
GROUP BY name
HAVING balance > 10000;
