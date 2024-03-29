WITH RECURSIVE seq AS (
    SELECT 1 AS value UNION ALL SELECT value + 1 FROM seq WHERE value < 100
    )

SELECT 
value AS ids 
FROM seq 

WHERE value NOT IN 
(SELECT customer_id FROM Customers)
AND value <= (SELECT MAX(customer_id) FROM Customers)
