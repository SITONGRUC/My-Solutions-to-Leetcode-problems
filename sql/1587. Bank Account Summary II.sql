# Write your MySQL query statement below

SELECT 
name,
SUM(amount) AS balance
FROM Users AS u
LEFT JOIN Transactions AS t
ON t.account = u.account
GROUP BY name
HAVING balance > 10000;



# Write your MySQL query statement below

SELECT 
u.name,
(SELECT SUM(t.amount) FROM transactions AS t WHERE t.account = u.account ) AS balance
FROM users AS u
GROUP BY u.name
HAVING balance > 10000;
