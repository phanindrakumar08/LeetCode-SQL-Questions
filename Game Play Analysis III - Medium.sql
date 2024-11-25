-- Write an SQL query that reports for each player and date, how many games played so far by the player. 
-- That is, the total number of games played by the player until that date. Check the example for clarity. Create the Activity table
CREATE TABLE Activity3 (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);

-- Insert data into Activity table
INSERT INTO Activity3 (player_id, device_id, event_date, games_played)
VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(1, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

select * from activity3;

select a1.player_id, a1.event_date, sum(a2.games_played) as games_played_so_far
from activity3 a1
join activity3 a2
on a1.player_id = a2.player_id
where a1.event_date>=a2.event_date
group by a1.player_id, a1.event_date;

-- Alternate approach

select player_id, event_date, sum(games_played) over(partition by player_id order by event_date) as games_played_so_far
from activity3










