# Write your MySQL query statement below
SELECT
DISTINCT
user_id
FROM
(SELECT
user_id,
time_stamp-LAG(time_stamp,1) OVER(PARTITION BY user_id ORDER BY user_id,time_stamp) AS time_gap
FROM Confirmations) AS res
WHERE  time_gap<=1000000
