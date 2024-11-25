-- Create the Activity table
-- Write an SQL query that reports the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. 
-- In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, 
-- then divide that number by the total number of players.
CREATE TABLE Activity4 (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);

-- Insert data into Activity table
INSERT INTO Activity4 (player_id, device_id, event_date, games_played)
VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-03-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

select * from activity4;

SELECT round(sum(case when t1.event_date = t2.first_event + 1 then 1 else 0 end)/count(distinct t1.player_id),2) as fraction
FROM Activity4 t1
JOIN
    (SELECT player_id, MIN(event_date) AS first_event
    FROM Activity4
    GROUP BY player_id) t2
    ON t1.player_id = t2.player_id;


















