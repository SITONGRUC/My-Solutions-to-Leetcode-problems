# Write your MySQL query statement below
SELECT
account_id,
 day   ,
 SUM(amount) OVER(PARTITION BY account_id ORDER BY day ASC  ) AS balance
FROM
(SELECT
account_id,
day ,
CASE WHEN  type ='Deposit' THEN amount 
ELSE -amount END AS amount 
FROM Transactions) AS res



SELECT
account_id,
day,
SUM(CASE WHEN type = 'Deposit' THEN amount ELSE 0-amount END) OVER(PARTITION BY account_id ORDER BY day ASC) AS balance
FROM Transactions
ORDER BY account_id ASC,day ASC
