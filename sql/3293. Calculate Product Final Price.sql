
# Write your MySQL query statement below
SELECT 
p.product_id,
CASE WHEN d.category IS NULL THEN p.price
ELSE p.price * (1-d.discount/100) END AS final_price,
p.category
FROM products AS p
LEFT JOIN Discounts AS d
ON p.category = d.category
ORDER BY p.product_id ASC;
