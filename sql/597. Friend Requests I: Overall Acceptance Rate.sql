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
