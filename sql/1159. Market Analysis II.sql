SELECT
u.user_id AS seller_id ,
CASE WHEN 2nd_item_fav_brand  IS NULL THEN 'no' ELSE 2nd_item_fav_brand END AS 2nd_item_fav_brand 
FROM Users AS u
LEFT JOIN
(SELECT
res.seller_id ,
CASE WHEN favorite_brand = item_brand THEN 'yes' ELSE 'no' END AS 2nd_item_fav_brand 
FROM
(SELECT
*,
RANK() OVER(PARTITION BY seller_id  ORDER BY order_date ASC) AS rnk
FROM Orders) AS res
LEFT JOIN Users AS u
ON u.user_id = res.seller_id 
LEFT JOIN Items AS i
ON i.item_id = res.item_id
WHERE rnk = 2) AS result
ON result.seller_id = u.user_id 
