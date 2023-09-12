# Write your MySQL query statement below
WITH cet AS (
SELECT
product_id,
SUBSTR(purchase_date,1,4) AS year,
COUNT(product_id) AS cnt 
FROM Orders
GROUP BY product_id,SUBSTR(purchase_date,1,4)
HAVING COUNT(product_id) >= 3 ) 

SELECT 
DISTINCT
c1.product_id 
FROM cet AS c1
LEFT JOIN cet AS c2
ON c1.product_id = c2.product_id
WHERE c1.year - c2.year = 1
