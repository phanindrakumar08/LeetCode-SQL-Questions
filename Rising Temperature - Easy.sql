use hackerrank;
-- Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).
-- Create the Weather table
CREATE TABLE Weather (
    id INT PRIMARY KEY,
    recordDate DATE NOT NULL,
    Temperature INT NOT NULL
);

-- Insert values into the Weather table
INSERT INTO Weather (id, recordDate, Temperature) VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);

SELECT * from weather;

SELECT t.id
FROM Weather t
Join Weather y
where DATEDIFF(t.RecordDate, y.RecordDate) = 1
AND t.Temperature > y.Temperature;










