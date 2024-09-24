SELECT
tweet_id
FROM Tweets
WHERE LENGTH(content) -length(replace(content,'@',''))>=4 OR 
LENGTH(content) -length(replace(content,'#',''))>=4 OR 
LENGTH(content) >140;
