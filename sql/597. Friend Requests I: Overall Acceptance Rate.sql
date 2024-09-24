SELECT 
(CASE WHEN ROUND(num2.cnt/num1.cnt,2) IS NOT NULL THEN ROUND(num2.cnt/num1.cnt,2) ELSE ROUND(0,2) END)AS accept_rate
FROM
(SELECT
COUNT(*) AS cnt
FROM 
(SELECT
DISTINCT sender_id,send_to_id
FROM FriendRequest
) AS Friend) AS num1,
(SELECT
COUNT(*) AS cnt
FROM 
(SELECT
DISTINCT requester_id,accepter_id
FROM RequestAccepted
) AS acc) AS num2;


SELECT 
  
  ROUND( CASE WHEN count(DISTINCT r.requester_id, r.accepter_id)/count(DISTINCT f.sender_id, f.send_to_id) IS NOT NULL THEN count(DISTINCT r.requester_id, r.accepter_id)/count(DISTINCT f.sender_id, f.send_to_id) ELSE 0 END,2) AS accept_rate 
  
  FROM FriendRequest AS f,RequestAccepted AS R; 




SELECT CASE WHEN rate.accept_rate IS NULL THEN 0 ELSE rate.accept_rate END AS accept_rate
FROM
 (SELECT 
ROUND(COUNT(DISTINCT r.requester_id,r.accepter_id)/COUNT(DISTINCT f.sender_id,f.send_to_id),2) AS accept_rate 
FROM FriendRequest AS f,RequestAccepted AS r) AS rate;


