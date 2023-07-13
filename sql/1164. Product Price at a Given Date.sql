SELECT
res.product_id AS product_id,
CASE WHEN p.new_price IS NULL THEN 10 ELSE p.new_price END AS price
FROM 
(SELECT
id_lists.product_id,
CASE WHEN mx IS NULL THEN '2019-08-16' ELSE mx END AS mx
FROM 
(SELECT
DISTINCT product_id
FROM Products) AS id_lists
LEFT JOIN
(SELECT
product_id,
MAX(change_date) AS mx
FROM Products
WHERE change_date <='2019-08-16'
GROUP BY product_id) AS max_date
ON max_date.product_id = id_lists.product_id) AS res
LEFT JOIN Products AS p
ON p.product_id = res.product_id AND p.change_date = res.mx
