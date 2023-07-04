# Write your MySQL query statement below
SELECT
DISTINCT
p.product_id,
store1,
store2,
store3
FROM
Products AS p
LEFT JOIN
(SELECT
DISTINCT
product_id,
price AS store1
FROM Products
WHERE store = 'store1') AS store1
ON p.product_id = store1.product_id
LEFT JOIN
(SELECT
DISTINCT
product_id,
price AS store2
FROM Products
WHERE store = 'store2') AS store2
ON p.product_id = store2.product_id
LEFT JOIN
(SELECT
DISTINCT
product_id,
price AS store3
FROM Products
WHERE store = 'store3') AS store3
ON p.product_id = store3.product_id;
