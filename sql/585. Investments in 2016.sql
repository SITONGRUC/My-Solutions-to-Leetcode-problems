SELECT
ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM 
Insurance AS i
LEFT JOIN (SELECT
tiv_2015,
COUNT(pid) AS cnt_tiv_2015
FROM Insurance
GROUP BY tiv_2015) AS tiv_2015
ON tiv_2015.tiv_2015 = i.tiv_2015
LEFT JOIN
(SELECT
lat,
lon,
COUNT(pid) AS cnt_loc
FROM Insurance
GROUP BY lat,lon) AS loc
ON i.lat = loc.lat AND i.lon=loc.lon
WHERE cnt_loc = 1 AND cnt_tiv_2015 >= 2;
