-- Create the student table
CREATE TABLE Student (
    student_id INT,
    student_name VARCHAR(50),
    gender CHAR(1),
    dept_id INT
);

-- Insert data into the student table
INSERT INTO Student (student_id, student_name, gender, dept_id) VALUES
(1, 'Jack', 'M', 1),
(2, 'Jane', 'F', 1),
(3, 'Mark', 'M', 2);

-- Create the department table
CREATE TABLE Department (
    dept_id INT,
    dept_name VARCHAR(50)
);

-- Insert data into the department table
INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Engineering'),
(2, 'Science'),
(3, 'Law');


select * from Student ;
select * from department;

select d.dept_name as department, count(s.dept_id) as student_number
from student s
right join department d on 
s.dept_id = d.dept_id
group by dept_name;


SELECT dept_name,
  SUM(CASE WHEN student_id IS NULL THEN 0 ELSE 1 END) AS student_number
FROM department
LEFT JOIN student
ON department.dept_id = student.dept_id
GROUP BY department.dept_id
ORDER BY student_number DESC, dept_name;
















