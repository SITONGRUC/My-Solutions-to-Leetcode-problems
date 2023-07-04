# Write your MySQL query statement below
SELECT 
parent.parent_id AS post_id,
COUNT(chird.sub_id) AS number_of_comments 
FROM
(SELECT 
DISTINCT sub_id AS parent_id
FROM Submissions
WHERE parent_id IS NULL ) AS parent
LEFT JOIN 
(SELECT 
  DISTINCT parent_id ,sub_id
  FROM Submissions
  WHERE parent_id IS NOT NULL) AS chird 
ON parent.parent_id = chird.parent_id
GROUP BY parent.parent_id
ORDER BY parent.parent_id ASC;
