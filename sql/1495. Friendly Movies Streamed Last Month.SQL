# Write your MySQL query statement below
SELECT
DISTINCT title 
FROM
Content
WHERE Kids_content = 'Y'  AND content_type='Movies'
AND content_id IN 
(
  SELECT
  content_id
  FROM TVProgram
  WHERE program_date BETWEEN '2020-06-01' AND '2020-06-30'
) 
