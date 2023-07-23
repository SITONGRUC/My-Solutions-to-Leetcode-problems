# Write your MySQL query statement below
SELECT
product_id ,
quantity,
price
FROM (
SELECT
*,
RANK() OVER(ORDER BY sm DESC,invoice_id ASC) AS rnk
FROM (
SELECT
invoice_id,
pu.product_id AS product_id ,
pu.quantity AS quantity ,
quantity*price AS price,
SUM(quantity*price) OVER(PARTITION BY invoice_id ) AS sm
FROM Purchases AS pu
LEFT JOIN Products AS pr
ON pu.product_id = pr.product_id
ORDER BY sm DESC,invoice_id ASC ) AS res ) AS res1
WHERE rnk = 1
