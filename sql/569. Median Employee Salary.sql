SELECT
id,
company,
salary
FROM (
SELECT
*,
MAX(num) OVER(PARTITION BY company )/2 AS mx
FROM (
SELECT
*,
COUNT(id)OVER(PARTITION BY company) % 2 AS cnt,
ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary ASC) AS num
FROM Employee ) AS res ) AS result
WHERE (cnt = 0 AND mx = num) OR (cnt = 0 AND num = mx+1)
OR 
(cnt = 1 AND CEIL(mx) = num)


