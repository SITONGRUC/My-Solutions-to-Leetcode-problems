WITH data AS (  SELECT
  ROW_NUMBER() OVER() AS id_new,
  id,
  drink
  FROM CoffeeShop),
  index_build AS (
SELECT
null_id,
MAX(not_null_id) AS fill_in_id
FROM 
(SELECT
id_new AS null_id 
FROM (  SELECT
  ROW_NUMBER() OVER() AS id_new,
  id,
  drink
  FROM CoffeeShop) AS data1
WHERE drink IS NULL) AS null_id
CROSS JOIN 
(SELECT
id_new AS not_null_id 
FROM (  SELECT
  ROW_NUMBER() OVER() AS id_new,
  id,
  drink
  FROM CoffeeShop) AS data2
WHERE drink IS NOT NULL) AS not_null_id
WHERE null_id > not_null_id
GROUP BY null_id)





SELECT 
d1.id,
CASE WHEN d1.drink IS NOT NULL THEN d1.drink ELSE d2.drink END AS drink
FROM data AS d1
LEFT JOIN index_build
ON index_build.null_id = d1.id_new
LEFT JOIN data AS d2
ON index_build.fill_in_id = d2.id_new
