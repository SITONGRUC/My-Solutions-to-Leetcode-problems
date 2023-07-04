SELECT
p.name,
CASE WHEN res.rest IS NULL THEN 0 ELSE res.rest END AS rest,
CASE WHEN res.paid IS NULL THEN 0 ELSE res.paid END AS paid,
CASE WHEN res.canceled IS NULL THEN 0 ELSE res.canceled END AS canceled,
CASE WHEN res.refunded IS NULL THEN 0 ELSE res.refunded END AS refunded
FROM
Product AS p
LEFT JOIN
(SELECT
product_id,
SUM(rest) AS rest,
SUM(paid) AS paid,
SUM(canceled) AS canceled,
SUM(refunded) AS refunded
FROM Invoice
GROUP BY product_id) AS res
ON p.product_id = res.product_id
ORDER BY p.name ASC;
