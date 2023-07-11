# Write your MySQL query statement below
SELECT
cnt.win AS player_id ,
p.player_name AS player_name,
COUNT(cnt.win) AS grand_slams_count 
FROM
(SELECT year,Wimbledon AS win FROM Championships
UNION ALL 
SELECT year,Fr_open AS win FROM Championships
UNION ALL 
SELECT year,US_open AS win FROM Championships
UNION ALL 
SELECT year,Au_open AS win FROM Championships) AS cnt
LEFT JOIN Players AS p
ON p.player_id  = cnt.win
GROUP BY win;
