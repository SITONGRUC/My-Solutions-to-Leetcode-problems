SELECT
ad_id,
CASE WHEN Clicked+Viewed = 0 THEN ROUND(0,2)
ELSE ROUND(Clicked*100/(Viewed+Clicked),2) END AS ctr 
FROM
(select 
DISTINCT
ad_id,
SUM(CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END) OVER(PARTITION BY ad_id) AS Clicked,
SUM(CASE WHEN action = 'Viewed' THEN 1 ELSE 0 END) OVER(PARTITION BY ad_id) AS Viewed,
SUM(CASE WHEN action = 'Ignored' THEN 1 ELSE 0 END) OVER(PARTITION BY ad_id) AS Ignored
from Ads) AS res
ORDER BY ctr DESC,ad_id ASC;

SELECT
ad_id,
if(Clicked+Viewed = 0, ROUND(0,2), ROUND(Clicked*100/(Viewed+Clicked),2)) AS ctr
FROM
(select 
DISTINCT
ad_id,
SUM(if(action = 'Clicked', 1, 0)) OVER(PARTITION BY ad_id) AS Clicked,
SUM(if(action = 'Viewed', 1, 0)) OVER(PARTITION BY ad_id) AS Viewed,
SUM(if(action = 'Ignored', 1, 0)) OVER(PARTITION BY ad_id) AS Ignored
from Ads) AS res
ORDER BY ctr DESC,ad_id ASC;

#if is slow


#Write your MySQL query statement below
SELECT
ad_id,
CASE WHEN Clicked+Viewed = 0 THEN ROUND(0,2)
ELSE ROUND(Clicked*100/(Viewed+Clicked),2) END AS ctr 
FROM
(SELECT
DISTINCT 
Ads.ad_id,
CASE WHEN Clicked IS NULL THEN 0 ELSE Clicked END AS Clicked,
CASE WHEN Ignored IS NULL THEN 0 ELSE Ignored END AS Ignored ,
CASE WHEN Viewed  IS NULL THEN 0 ELSE Viewed END AS  Viewed 
FROM
Ads
LEFT JOIN
(SELECT
ad_id,
COUNT(action) AS Clicked
FROM Ads 
WHERE action = 'Clicked'
GROUP BY ad_id) AS Clicked
ON Ads.ad_id = Clicked.ad_id
LEFT JOIN
(SELECT
ad_id,
COUNT(action) AS Ignored
FROM Ads 
WHERE action = 'Ignored'
GROUP BY ad_id) AS Ignored
ON Ads.ad_id = Ignored.ad_id
LEFT JOIN
(SELECT
ad_id,
COUNT(action) AS Viewed
FROM Ads 
WHERE action = 'Viewed'
GROUP BY ad_id) AS Viewed
ON Ads.ad_id = Viewed.ad_id) AS res
ORDER BY ctr DESC,ad_id ASC;
Console
