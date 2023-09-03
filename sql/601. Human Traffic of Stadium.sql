WITH id AS (
SELECT
id
FROM (
SELECT
*,
LAG(id,1) OVER(ORDER BY id)+1 AS lg,
LEAD(id,1) OVER(ORDER BY id)-1 AS ld
FROM (
    SELECT
    *
    FROM Stadium
    WHERE people >= 100) AS result) AS res
WHERE lg  = id AND ld = id)

SELECT
DISTINCT
*
FROM Stadium
WHERE id IN (
SELECT id FROM id
UNION 
SELECT id-1 FROM id
UNION 
SELECT id+1 FROM id)
ORDER BY visit_date ASC
