# Write your MySQL query statement below
SELECT name AS Customers
FROM Customers
LEFT JOIN Orders
ON Orders.customerId = Customers.id
WHERE  Orders.id IS NULL;

# Write your MySQL query statement below
SELECT
name AS Customers
FROM Customers
WHERE Customers.id NOT IN (
  SELECT customerId FROM Orders
)
