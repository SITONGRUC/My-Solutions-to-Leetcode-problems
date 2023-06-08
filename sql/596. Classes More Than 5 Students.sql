# Write your MySQL query statement below
SELECT c.class
FROM (SELECT class,
COUNT(student) AS count
FROM Courses 
GROUP BY class
HAVING COUNT(student) >= 5) AS c;
#Pay attetnion to 'HAVING'
