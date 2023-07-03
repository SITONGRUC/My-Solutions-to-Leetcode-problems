# Write your MySQL query statement below
 SELECT 
 seat_id
 FROM Cinema
 WHERE 
 free = 1
 AND(
  seat_id-1 IN (SELECT seat_id FROM Cinema WHERE free = 1)
OR
 seat_id+1 IN (SELECT seat_id FROM Cinema WHERE free = 1)
 )
# Another solution
SELECT
    seat_id
FROM
    (SELECT
        seat_id,
        free,
        LAG(free,1) OVER (ORDER BY seat_id) as free_lag,
        LEAD(free,1) OVER (ORDER BY seat_id) as free_lead
    FROM cinema ) as t
WHERE (free=1 AND free_lag=1)
OR (free=1 AND free_lead=1)
ORDER BY seat_id;
