-- Create the students_classes table
CREATE TABLE Students_Classes (
    student CHAR(1),
    class VARCHAR(50)
);

-- Insert data into the students_classes table
INSERT INTO Students_Classes (student, class) VALUES
('A', 'Math'),
('B', 'English'),
('C', 'Math'),
('D', 'Biology'),
('E', 'Math'),
('F', 'Computer'),
('G', 'Math'),
('H', 'Math'),
('I', 'Math');

select class 
from Students_Classes
group by class
having count(student)>=5;













