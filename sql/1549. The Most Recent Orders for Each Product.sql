# Write your MySQL query statement below
SELECT
p.product_name AS product_name,
res1.product_id AS product_id,
res1.order_id AS order_id,
res1.order_date AS order_date
FROM
(SELECT 
*,
RANK() OVER(PARTITION BY product_id ORDER BY  order_date DESC ) AS rank1
FROM Orders) AS res1
LEFT JOIN Products AS p
ON p.product_id=res1.product_id 
WHERE rank1 = 1
ORDER BY product_name ASC, product_id ASC,order_id ASC
