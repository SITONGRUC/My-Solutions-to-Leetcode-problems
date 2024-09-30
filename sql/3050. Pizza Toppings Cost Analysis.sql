# Write your MySQL query statement below
SELECT CONCAT(t1.topping_name,',',t2.topping_name,',',t3.topping_name) AS pizza,
ROUND(t1.cost+t2.cost+t3.cost,2) AS total_cost
FROM Toppings AS t1,Toppings AS t2,Toppings AS t3
WHERE t1.topping_name  < t2.topping_name  AND t2.topping_name  < t3.topping_name 
GROUP BY CONCAT(t1.topping_name,',',t2.topping_name,',',t3.topping_name)
ORDER BY total_cost DESC,
CONCAT(t1.topping_name,',',t2.topping_name,',',t3.topping_name) ASC;
