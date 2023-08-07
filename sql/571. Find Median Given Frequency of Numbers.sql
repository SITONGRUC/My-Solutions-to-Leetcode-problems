# Write your MySQL query statement below
SELECT
ROUND(MIN(CASE WHEN num1 <= sm THEN num END )/2+ MIN(CASE WHEN num2 <= sm THEN num END )/2,2) AS median
FROM 
(SELECT
*,
CASE WHEN SUM(frequency) OVER()%2 = 0 THEN SUM(frequency) OVER()/2 ELSE CEIL(SUM(frequency) OVER()/2) END AS num1 ,
CASE WHEN SUM(frequency) OVER()%2 = 0 THEN SUM(frequency) OVER()/2 +1 ELSE CEIL(SUM(frequency) OVER()/2) END  AS num2,
SUM(frequency) OVER(ORDER BY num ASC ) AS sm
FROM Numbers) AS res
