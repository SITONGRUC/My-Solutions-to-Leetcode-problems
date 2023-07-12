SELECT
res1.customer_id,
res1.product_id,
p.product_name
FROM
(SELECT
customer_id,
product_id,
RANK() OVER(PARTITION BY customer_id ORDER BY cnt DESC ) AS rank1
FROM
(SELECT
customer_id,
product_id,
COUNT(product_id) AS cnt
FROM Orders
GROUP BY customer_id,product_id) AS res) AS res1
LEFT JOIN Products AS p
ON p.product_id = res1.product_id
WHERE rank1 = 1;
