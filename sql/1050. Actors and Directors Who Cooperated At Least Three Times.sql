# Write your MySQL query statement below
SELECT 
actor_id,
director_id
FROM (
SELECT 
actor_id,
director_id,
COUNT(timestamp) AS count
FROM ActorDirector
GROUP BY actor_id,director_id
HAVING count >=3) AS c

# Write your MySQL query statement below
SELECT
DISTINCT
actor_id ,
director_id
FROM ActorDirector
GROUP BY actor_id,director_id
HAVING COUNT(timestamp) >= 3;
