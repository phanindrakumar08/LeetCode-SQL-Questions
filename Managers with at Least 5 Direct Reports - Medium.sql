use santa;
-- Given the Employee table, 
-- write a SQL query that finds out managers with at least 5 direct report. For the above table, your SQL query should return:
-- Create the table
CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Department CHAR(1),
    ManagerId INT NULL,
    FOREIGN KEY (ManagerId) REFERENCES Employees(Id)
);

-- Insert the values
INSERT INTO Employees (Id, Name, Department, ManagerId) VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);

select * from employees;

select distinct(e1.name)
from employees e1
join employees e2
on e1.id = e2.managerid
group by e1.id, e1.name
having count(e2.id)>=5;

-- Alternate approach

SELECT Name
FROM Employee
WHERE id IN
   (SELECT ManagerId
    FROM Employees
    GROUP BY ManagerId
    HAVING COUNT(DISTINCT Id) >= 5)













