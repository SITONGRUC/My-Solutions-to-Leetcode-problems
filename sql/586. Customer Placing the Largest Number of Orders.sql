# Write your MySQL query statement below
SELECT customer_number
FROM (SELECT customer_number,COUNT(order_number) AS count
FROM Orders
GROUP BY customer_number
ORDER BY count DESC
LIMIT 1
) AS count_result


# Write your MySQL query statement bel
SELECT customer_number  FROM  Orders AS o
GROUP BY customer_number
HAVING COUNT(order_number) = (
SELECT MAX(cnt) FROM (
SELECT customer_number,COUNT(order_number) AS cnt FROM  Orders AS o
GROUP BY customer_number) AS cot ) ;


