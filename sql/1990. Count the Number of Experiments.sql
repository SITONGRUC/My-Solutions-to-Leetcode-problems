# Write your MySQL query statement below
SELECT
list.platform,
list.experiment_name,
CASE WHEN res.num_experiments IS NULL THEN 0 ELSE res.num_experiments  END AS num_experiments
FROM 
(SELECT
*
FROM
(SELECT 'Android' AS 'platform' UNION SELECT 'IOS' AS 'platform' UNION SELECT 'Web' AS 'platform') AS p
CROSS JOIN 
(SELECT 'Reading' AS 'experiment_name' UNION SELECT 'Sports' AS 'experiment_name' UNION SELECT 'Programming' AS 'experiment_name') AS e) AS list
LEFT JOIN 
(
  SELECT
   platform,
   experiment_name,
  COUNT(experiment_id) AS num_experiments 
  FROM Experiments
  GROUP BY platform,experiment_name
) AS res
ON res.platform = list.platform AND res.experiment_name = list.experiment_name
