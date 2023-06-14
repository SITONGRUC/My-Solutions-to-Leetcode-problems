SELECT 
UnitsSold.product_id,
ROUND(SUM(price*units)/SUM(units),2) AS average_price
FROM 
Prices 
INNER JOIN UnitsSold
ON UnitsSold.product_id = Prices.product_id
WHERE (CASE WHEN  purchase_date BETWEEN start_date AND end_date THEN 1
ELSE 0 END) = 1
GROUP BY product_id;
