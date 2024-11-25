-- Create the table
CREATE TABLE Salaries (
    Id INT PRIMARY KEY,
    Company VARCHAR(10),
    Salary INT
);

-- Insert values into the table
INSERT INTO Salaries (Id, Company, Salary) VALUES
(1, 'A', 2341),
(2, 'A', 341),
(3, 'A', 15),
(4, 'A', 15314),
(5, 'A', 451),
(6, 'A', 513),
(7, 'B', 15),
(8, 'B', 13),
(9, 'B', 1154),
(10, 'B', 1345),
(11, 'B', 1221),
(12, 'B', 234),
(13, 'C', 2345),
(14, 'C', 2645),
(15, 'C', 2645),
(16, 'C', 2652),
(17, 'C', 65);

select * from salaries;



WITH RankedSalaries AS (
    SELECT 
        Id,
        Company,
        Salary,
        ROW_NUMBER() OVER (PARTITION BY Company ORDER BY Salary ASC) AS RowAsc,
        ROW_NUMBER() OVER (PARTITION BY Company ORDER BY Salary DESC) AS RowDesc
    FROM salaries
),
MedianSalaries AS (
    SELECT 
        Id,
        Company,
        Salary
    FROM RankedSalaries
    WHERE RowAsc = RowDesc OR RowAsc + 1 = RowDesc OR RowAsc - 1 = RowDesc
)
SELECT *
FROM MedianSalaries
ORDER BY Company, Salary;








