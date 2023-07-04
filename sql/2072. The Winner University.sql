SELECT
(CASE
WHEN SUM(NY) > SUM(C) THEN 'New York University'
WHEN SUM(NY) < SUM(C) THEN 'California University'
ELSE 'No Winner' END ) AS winner 
FROM 
(SELECT COUNT(*) AS NY FROM NewYork WHERE score >=90) AS ny
CROSS JOIN 
(SELECT COUNT(*) AS C FROM California WHERE score >=90) AS C
