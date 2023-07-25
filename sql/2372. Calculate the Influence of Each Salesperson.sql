SELECT
sale.salesperson_id ,
sale.name,
CASE WHEN res.total IS NULL THEN 0 ELSE res.total END AS total
FROM Salesperson AS sale
LEFT JOIN
(SELECT
salesperson_id ,
SUM(price) AS total
FROM Customer AS c
LEFT JOIN Sales AS s
ON c.customer_id  = s.customer_id 
GROUP BY salesperson_id ) AS res
ON sale.salesperson_id  = res.salesperson_id 
