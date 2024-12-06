-- Create the customer table
CREATE TABLE Customer (
    id INT,
    name VARCHAR(50),
    referee_id INT
);

-- Insert data into the customer table
INSERT INTO Customer (id, name, referee_id) VALUES
(1, 'Will', NULL),
(2, 'Jane', NULL),
(3, 'Alex', 2),
(4, 'Bill', NULL),
(5, 'Zack', 1),
(6, 'Mark', 2);

select name from customer
where referee_id != 2 or referee_id IS Null;




















