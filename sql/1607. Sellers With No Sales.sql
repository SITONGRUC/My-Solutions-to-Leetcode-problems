# Write your MySQL query statement below
SELECT 
DISTINCT
seller_name
FROM 
Seller AS s
LEFT JOIN
(SELECT 
seller_id,
COUNT(order_id) AS cnt
FROM  Orders
WHERE SUBSTR(sale_date,1,4) = '2020'
GROUP BY seller_id) AS sale_cnt
ON s.seller_id = sale_cnt.seller_id
WHERE cnt IS NULL
ORDER BY seller_name ASC;
