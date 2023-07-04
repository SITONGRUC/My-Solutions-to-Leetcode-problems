# Write your MySQL query statement below
SELECT
q.id,
q.year,
CASE WHEN n.npv IS NULL THEN 0
ELSE n.npv END AS npv
FROM
Queries AS q
LEFT JOIN NPV AS n
ON q.id= n.id AND n.year = q.year
