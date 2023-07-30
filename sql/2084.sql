# Write your MySQL query statement below
SELECT
*
FROM Orders
WHERE customer_id IN (
SELECT DISTINCT customer_id FROM Orders WHERE order_type = 0) 
AND order_type = 0 
UNION ALL
SELECT
*
FROM  Orders
WHERE customer_id NOT  IN (
SELECT DISTINCT customer_id FROM Orders WHERE order_type = 0) 
