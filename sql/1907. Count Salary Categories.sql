# Write your MySQL query statement below
SELECT
category,
CASE WHEN accounts_count IS NULL THEN 0 ELSE accounts_count END AS accounts_count
FROM
(SELECT'Low Salary' AS category,(SELECT SUM(CASE WHEN income<20000 THEN 1 END ) FROM Accounts) AS accounts_count
UNION ALL 
SELECT'Average Salary' AS category,(SELECT SUM(CASE WHEN income>=20000  AND income <= 50000 THEN 1 END ) FROM Accounts) AS accounts_count
UNION ALL 
SELECT'High Salary' AS category,(SELECT SUM(CASE WHEN income>50000 THEN 1 END ) FROM Accounts) AS accounts_count) AS res;
