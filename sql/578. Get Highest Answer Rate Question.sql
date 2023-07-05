# Write your MySQL query statement below
SELECT
question_id AS survey_log
FROM
(SELECT
question_id,
DENSE_RANK() OVER(ORDER BY answer_cnt/show_cnt DESC) AS rank1
FROM 
(SELECT
DISTINCT
question_id,
SUM(CASE WHEN action = 'show' THEN 1 ELSE 0 END) AS show_cnt,
SUM(CASE WHEN action = 'answer' THEN 1 ELSE 0 END) AS answer_cnt
FROM SurveyLog
GROUP BY question_id) AS res
ORDER BY rank1 ASC,question_id ASC) AS res2
limit 1;
