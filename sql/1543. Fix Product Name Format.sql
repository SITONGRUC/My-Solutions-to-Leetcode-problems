# Write your MySQL query statement below
SELECT
DISTINCT
product_name,
sale_date,
COUNT(sale_id) OVER(PARTITION BY product_name,sale_date) AS total
FROM
(SELECT
sale_id,
REPLACE(LOWER(product_name),' ','') AS product_name,
SUBSTR(sale_date,1,7) AS sale_date
FROM Sales) AS res
ORDER BY product_name ASC,sale_date  ASC;
