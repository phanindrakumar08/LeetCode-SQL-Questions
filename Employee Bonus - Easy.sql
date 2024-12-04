use santa;
CREATE TABLE Employee (
    empId INT PRIMARY KEY,
    name VARCHAR(50),
    supervisor INT,
    salary INT
);

CREATE TABLE Bonus (
    empId INT PRIMARY KEY,
    bonus INT
);

-- Insert into Employee table
INSERT INTO Employee (empId, name, supervisor, salary) VALUES
(1, 'John', 3, 1000),
(2, 'Dan', 3, 2000),
(3, 'Brad', NULL, 4000),
(4, 'Thomas', 3, 4000);

-- Insert into Bonus table
INSERT INTO Bonus (empId, bonus) VALUES
(2, 500),
(4, 2000);

select * from employee;
select * from bonus;

select employee.name, bonus.bonus
from employee
left join bonus
on employee.empid = bonus.empid
where bonus.bonus<=500 or bonus.bonus IS NULL;


























