SELECT
ROUND(100*SUM(CASE WHEN order_date = customer_pref_delivery_date  THEN 1 ELSE 0 END)/COUNT(customer_id ),2) AS immediate_percentage 
FROM(
SELECT
*,
RANK() OVER(PARTITION BY customer_id  ORDER BY order_date ASC) AS rnk
FROM Delivery ) AS res
WHERE rnk = 1
