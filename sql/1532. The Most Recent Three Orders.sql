# Write your MySQL query statement below
SELECT
c.name AS customer_name,orders.customer_id,orders.order_id,orders.order_date
FROM
(
SELECT
*,
RANK() OVER(PARTITION BY customer_id ORDER BY order_date DESC ) AS rank1
FROM Orders) AS orders
LEFT JOIN 
 Customers AS c
ON c.customer_id = orders.customer_id
WHERE rank1 <=3
ORDER BY c.name ASC,customer_id ASC,order_date DESC;
