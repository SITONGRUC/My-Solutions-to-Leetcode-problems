# Write your MySQL query statement below
SELECT
DISTINCT
user_id ,
product_id 
FROM 
(SELECT
*,
RANK() OVER(PARTITION BY user_id ORDER BY sm DESC ) AS rnk
FROM
(SELECT
s.product_id ,
s.user_id ,
SUM(s.quantity * p.price) AS sm
FROM Sales AS s
LEFT JOIN Product AS p
ON s.product_id = p.product_id 
GROUP BY s.product_id ,
s.user_id) AS res) AS res2
WHERE rnk=1
