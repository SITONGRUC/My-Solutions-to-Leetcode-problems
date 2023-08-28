# Write your MySQL query statement below
SELECT
id.id,
CASE WHEN no_leaf.type IS NULL THEN 'Leaf' ELSE no_leaf.type END AS type
FROM 
(SELECT id FROM Tree) AS id
LEFT JOIN
(SELECT id,'Root' AS type FROM Tree WHERE p_id IS NULL
UNION 
(SELECT p_id ,'Inner' AS type FROM Tree WHERE p_id IS NOT NULL 
EXCEPT
SELECT id,'Inner' AS type FROM Tree WHERE p_id IS  NULL )) AS no_leaf
ON id.id = no_leaf.id;

#-------------------------------

# Write your MySQL query statement below
/* Write your PL/SQL query statement below */
select id,
 case when p_id is null then 'Root'
    when id in (Select p_id from tree) then 'Inner'
 else 'Leaf'
 end as Type
 from tree
