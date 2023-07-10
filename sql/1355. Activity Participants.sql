SELECT
a.name AS activity
FROM 
Activities AS a
LEFT JOIN 
(SELECT 
activity ,
COUNT(id) AS cnt
FROM Friends
GROUP BY activity) AS res
ON res.activity = a.name
WHERE cnt != (SELECT MIN(cnt) FROM Activities AS a
LEFT JOIN 
(SELECT 
activity ,
COUNT(id) AS cnt
FROM Friends
GROUP BY activity) AS res
ON res.activity = a.name)
AND 
cnt != (SELECT MAX(cnt) FROM Activities AS a
LEFT JOIN 
(SELECT 
activity ,
COUNT(id) AS cnt
FROM Friends
GROUP BY activity) AS res
ON res.activity = a.name)
