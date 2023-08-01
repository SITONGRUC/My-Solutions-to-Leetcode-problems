# Write your MySQL query statement below
SELECT
username   ,
activity     ,
 startDate   ,
  endDate 
FROM (
SELECT
*,
COUNT(startDate) OVER(PARTITION BY username) AS cnt,
RANK() OVER(PARTITION BY username ORDER BY startDate DESC ) AS rnk
FROM UserActivity ) AS res
WHERE CASE WHEN cnt = 1 OR (cnt > 1 AND rnk = 2) THEN 1 ELSE 0 END = 1

