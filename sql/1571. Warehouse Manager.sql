# Write your MySQL query statement below
SELECT 
name AS warehouse_name,
SUM(space.space*w.units) AS volume 
FROM 
Warehouse AS w
LEFT JOIN
(SELECT 
product_id ,
Width*Length*Height AS space
FROM Products) AS space
ON w.product_id = space.product_id
GROUP BY warehouse_name;


SELECT
w.name AS warehouse_name ,
SUM(w.units*space.space) AS volume
FROM Warehouse  AS w
LEFT JOIN 
(
    SELECT 
product_id ,
Width * Length  * Height AS space
FROM Products ) AS space
ON w.product_id    = space.product_id 
GROUP BY w.name
