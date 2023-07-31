# Write your MySQL query statement below
SELECT
RANK() OVER(ORDER BY id+CASE WHEN id%2 = 1 THEN 1 ELSE -1 END) AS id,
student
FROM Seat
ORDER BY id
