-- Create the orders table
CREATE TABLE Orders (
    order_number INT,
    customer_number INT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    status VARCHAR(20),
    comment TEXT
);

-- Insert data into the orders table
INSERT INTO Orders (order_number, customer_number, order_date, required_date, shipped_date, status, comment) VALUES
(1, 1, '2017-04-09', '2017-04-13', '2017-04-12', 'Closed', NULL),
(2, 2, '2017-04-15', '2017-04-20', '2017-04-18', 'Closed', NULL),
(3, 3, '2017-04-16', '2017-04-25', '2017-04-20', 'Closed', NULL),
(4, 3, '2017-04-18', '2017-04-28', '2017-04-25', 'Closed', NULL);


select * from orders;

select customer_number 
from orders 
group by customer_number
order by count(*) desc
limit 1;













