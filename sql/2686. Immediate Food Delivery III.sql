# Write your MySQL query statement below
SELECT
order_date,
ROUND(SUM(judge)*100/COUNT(judge),2) AS immediate_percentage
FROM (
SELECT
*,
CASE WHEN order_date =customer_pref_delivery_date THEN 1 ELSE 0 END AS judge 
FROM Delivery) AS res
GROUP BY order_date
ORDER BY order_date ASC

SELECT 
order_date,
ROUND(100*SUM(
    CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END 
)/COUNT(*),2) AS 'immediate_percentage'
FROM Delivery AS d
GROUP BY order_date
ORDER BY order_date ASC;
