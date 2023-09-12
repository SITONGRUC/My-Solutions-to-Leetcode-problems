WITH infomation AS (
SELECT calls_total.id, id_info.name, calls_total.duration 
FROM (
SELECT caller_id AS id,duration FROM Calls
UNION ALL 
SELECT callee_id AS id,duration FROM Calls ) AS calls_total
LEFT JOIN 
(
SELECT
id,
name
FROM (
    SELECT
    id,
    SUBSTR(phone_number,1,3) AS country_code FROM 
    Person
) AS Person_1
LEFT JOIN Country AS c
ON c.country_code = Person_1.country_code) AS id_info
ON id_info.id = calls_total.id)

SELECT
name AS country
FROM infomation
GROUP BY name
HAVING  AVG(duration) > (SELECT
AVG(duration)
FROM infomation)

