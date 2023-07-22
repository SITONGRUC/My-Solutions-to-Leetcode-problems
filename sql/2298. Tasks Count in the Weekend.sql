# Write your MySQL query statement below
SELECT
SUM(CASE WHEN judge = 'Saturday' OR judge = 'Sunday' THEn 1 END) AS weekend_cnt ,
SUM(CASE WHEN judge = 'Saturday' OR judge = 'Sunday' THEn 0 ELSE 1 END) AS working_cnt 
FROM (
  SELECT *,
   DATE_FORMAT(submit_date, "%W") AS judge
   FROM Tasks
) AS res
