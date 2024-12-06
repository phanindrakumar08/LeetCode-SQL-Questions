-- Create the table
CREATE TABLE UserActions (
    uid INT,
    action VARCHAR(50),
    question_id INT,
    answer_id INT,
    q_num INT,
    timestamp INT
);

-- Insert data into the table
INSERT INTO UserActions (uid, action, question_id, answer_id, q_num, timestamp)
VALUES
    (5, 'show', 285, NULL, 1, 123),
    (5, 'answer', 285, 124124, 1, 124),
    (5, 'show', 369, NULL, 2, 125),
    (5, 'skip', 369, NULL, 2, 126);

select * from UserActions;


select question_id from UserActions
group by question_id
order by count(*) desc
limit 1;

SELECT question_id AS survey_log FROM
(SELECT question_id,
        SUM(IF(action='show', 1, 0)) AS num_show,
        SUM(IF(action='answer', 1, 0)) AS num_answer
 FROM UserActions GROUP BY question_id) AS t
ORDER BY (num_answer/num_show) DESC LIMIT 1;




