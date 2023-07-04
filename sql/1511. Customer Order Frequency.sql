SELECT
c.customer_id,
c.name
FROM (SELECT
DISTINCT
customer_id,
SUM(CASE WHEN order_date BETWEEN '2020-06-01' AND '2020-06-30' THEN quantity*price
ELSE 0 END) OVER(PARTITION BY customer_id ) AS jun,
SUM(CASE WHEN order_date BETWEEN '2020-07-01' AND '2020-07-31' THEN quantity*price
ELSE 0 END) OVER(PARTITION BY customer_id ) AS july
FROM
Orders AS o
LEFT JOIN Product AS p
ON o.product_id  = p.product_id ) AS res
LEFT JOIN Customers AS c
ON c.customer_id = res.customer_id
WHERE jun>=100 AND july >= 100;
