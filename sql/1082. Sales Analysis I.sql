# Write your MySQL query statement below


SELECT 
seller_id
FROM (SELECT 
seller_id,
SUM(price) AS sum_p
FROM Sales
GROUP BY seller_id) AS res
WHERE  sum_p = (
  SELECT 
  MAX(sum_p)
  FROM 
  (SELECT 
seller_id,
SUM(price) AS sum_p
FROM Sales
GROUP BY seller_id) AS res
)
