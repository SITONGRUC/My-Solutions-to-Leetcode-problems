SELECT
DISTINCT num AS ConsecutiveNums
FROM
(SELECT 
num,
lag(num,1) OVER(ORDER BY id) AS lag1,
lead(num,1) OVER(ORDER BY id) AS lead1
FROM Logs) AS res
WHERE lag1 = num AND lead1 = num;
