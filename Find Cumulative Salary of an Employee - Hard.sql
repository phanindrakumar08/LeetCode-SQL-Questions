
use hello;



-- Create the table
CREATE TABLE EmployeeSalary2 (
    Id INT,
    Month INT,
    Salary INT
);

-- Insert data into the table
INSERT INTO EmployeeSalary2 (Id, Month, Salary) VALUES
(1, 1, 20),
(2, 1, 20),
(1, 2, 30),
(2, 2, 30),
(3, 2, 40);


SELECT
    a.id,
    a.month,
    SUM(b.salary) Salary
FROM
    EmployeeSalary2 a JOIN EmployeeSalary2 b ON
    a.id = b.id AND
    a.month - b.month >= 0 AND
    a.month - b.month < 3
GROUP BY
    a.id, a.month
HAVING
    (a.id, a.month) NOT IN (SELECT id, MAX(month) FROM EmployeeSalary2 GROUP BY id)
ORDER BY
    a.id, a.month DESC;


SELECT
    *
FROM
    EmployeeSalary2 a JOIN EmployeeSalary2 b ON
    a.id = b.id AND
    a.month - b.month >= 0 AND
    a.month - b.month < 3;








