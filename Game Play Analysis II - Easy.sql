-- Create the Activity table
-- Write a SQL query that reports the device that is first logged in for each player.
CREATE TABLE Activity1 (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);

-- Insert data into Activity table
INSERT INTO Activity1 (player_id, device_id, event_date, games_played)
VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

select * from activity1;

select player_id, device_id
from activity1
where (player_id, event_date) in 
(select player_id, min(event_date) from activity1 group by player_id);
















