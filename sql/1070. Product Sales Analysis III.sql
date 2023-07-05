# Write your MySQL query statement below
SELECT
first_year.product_id,
first_year.first_year,
quantity, price
FROM 
(SELECT
product_id,
MIN(year) AS first_year
FROM Sales
GROUP BY product_id) AS first_year
LEFT JOIN 
(
  SELECT product_id,year ,quantity, price FROM  Sales
) AS s
ON first_year.product_id = s.product_id AND first_year.first_year = s.year
