-- Create the insurance table
CREATE TABLE Insurance (
    PID INT,
    TIV_2015 INT,
    TIV_2016 INT,
    LAT INT,
    LON INT
);

-- Insert data into the insurance table
INSERT INTO Insurance (PID, TIV_2015, TIV_2016, LAT, LON) VALUES
(1, 10, 5, 10, 10),
(2, 20, 20, 20, 20),
(3, 10, 30, 20, 20),
(4, 10, 40, 40, 40);


select * from Insurance;

SELECT SUM(TIV_2016) AS TIV_2016
FROM insurance
WHERE CONCAT(LAT, ',', LON)
    IN (SELECT CONCAT(LAT, ',', LON)
       FROM insurance
       GROUP BY LAT, LON
       HAVING COUNT(*) = 1)
AND TIV_2015 in
    (SELECT TIV_2015
    FROM insurance
    GROUP BY TIV_2015
    HAVING COUNT(*)>1);



















