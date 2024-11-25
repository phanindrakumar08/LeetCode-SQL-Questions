-- Create the Trips table
-- Write a SQL query to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03".

-- The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

-- Return the result table in any order. Round Cancellation Rate to two decimal points.
CREATE TABLE Trips (
    Id INT PRIMARY KEY,
    Client_Id INT NOT NULL,
    Driver_Id INT NOT NULL,
    City_Id INT NOT NULL,
    Status VARCHAR(50) NOT NULL,
    Request_at DATE NOT NULL
);

-- Insert values into the Trips table
INSERT INTO Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES
(1, 1, 10, 1, 'completed', '2013-10-01'),
(2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
(3, 3, 12, 6, 'completed', '2013-10-01'),
(4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
(5, 1, 10, 1, 'completed', '2013-10-02'),
(6, 2, 11, 6, 'completed', '2013-10-02'),
(7, 3, 12, 6, 'completed', '2013-10-02'),
(8, 2, 12, 12, 'completed', '2013-10-03'),
(9, 3, 10, 12, 'completed', '2013-10-03'),
(10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');


-- Create the Users table
CREATE TABLE Users (
    Users_Id INT PRIMARY KEY,
    Banned VARCHAR(3) NOT NULL,
    Role VARCHAR(10) NOT NULL
);

-- Insert values into the Users table
INSERT INTO Users (Users_Id, Banned, Role) VALUES
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');
use hackerrank;
select * from trips;
select * from users;

with cte
as  (SELECT * 
FROM TRIPS
where client_id in (select users_id from users where banned = "yes")
or driver_id in (select users_id from users where banned = "yes"))

SELECT 
    request_at, 
    COUNT(CASE WHEN status IN ('cancelled_by_client', 'cancelled_by_driver') THEN id END) / 
    COUNT(id) AS cancellation_rate
from trips
where id not in (select id from cte)
group by request_at;

-- Alternative approach

select request_at, round(sum(if(status<>"completed", 1,0))/count(status),2) as cancellation_rate
from trips
where request_at between "2013-10-01" and "2013-10-03"
and client_id not in (select users_id from users where banned = "Yes")
and driver_id not in (select users_id from users where banned = "Yes")
group by request_at;










