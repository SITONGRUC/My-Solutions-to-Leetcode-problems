# Write your MySQL query statement below
WITH
  cte1 AS (SELECT
  i.item_category  AS item_category ,
DATE_FORMAT(o.order_date, "%W") AS week,
SUM(quantity) AS sm
FROM Orders AS o
LEFT JOIN Items AS i
ON o.item_id   = i.item_id    
GROUP BY DATE_FORMAT(o.order_date, "%W") ,i.item_category)

SELECT 
CATEGORY.CATEGORY AS CATEGORY,
CASE WHEN Monday IS NULL THEN 0 ELSE Monday END AS Monday,
CASE WHEN Tuesday IS NULL THEN 0 ELSE Tuesday END AS Tuesday   ,
CASE WHEN Wednesday  IS NULL THEN 0 ELSE Wednesday  END AS Wednesday ,
CASE WHEN Thursday   IS NULL THEN 0 ELSE Thursday   END AS Thursday  ,
CASE WHEN Friday     IS NULL THEN 0 ELSE Friday     END AS Friday    ,
CASE WHEN Saturday   IS NULL THEN 0 ELSE Saturday   END AS Saturday  ,
CASE WHEN Sunday     IS NULL THEN 0 ELSE Sunday    END AS Sunday    
FROM
(SELECT DISTINCT item_category AS CATEGORY FROM Items) AS Category
LEFT JOIN (SELECT item_category , sm  AS Monday FROM cte1 WHERE week = 'Monday'   ) AS Monday
ON Monday.item_category = Category.CATEGORY
LEFT JOIN (SELECT item_category , sm  AS Tuesday FROM cte1 WHERE week = 'Tuesday'   ) AS Tuesday   
ON Tuesday.item_category = Category.CATEGORY
LEFT JOIN (SELECT item_category , sm  AS Wednesday    FROM cte1 WHERE week = 'Wednesday'   ) AS Wednesday      
ON Wednesday.item_category = Category.Category
LEFT JOIN (SELECT item_category , sm  AS Thursday    FROM cte1 WHERE week = 'Thursday'   ) AS Thursday      
ON Thursday.item_category = Category.Category
LEFT JOIN (SELECT item_category , sm  AS Friday    FROM cte1 WHERE week = 'Friday'   ) AS Friday    
ON Friday.item_category = Category.Category
LEFT JOIN (SELECT item_category , sm  AS Saturday    FROM cte1 WHERE week = 'Saturday'   ) AS Saturday    
ON Saturday.item_category = Category.Category
LEFT JOIN (SELECT item_category , sm  AS Sunday     FROM cte1 WHERE week = 'Sunday'   ) AS Sunday    
ON Sunday.item_category = Category.Category
ORDER BY category;
