SELECT 
buyer_id
FROM 
Sales AS s
LEFT JOIN Product AS p
ON s.product_id  = p.product_id 
WHERE product_name = 'S8'
EXCEPT
SELECT 
buyer_id
FROM 
Sales AS s
LEFT JOIN Product AS p
ON s.product_id  = p.product_id 
WHERE product_name = 'iPhone '
