-- Create the countries table
CREATE TABLE Countries (
    name VARCHAR(100),
    continent VARCHAR(50),
    area INT,
    population INT,
    gdp BIGINT
);

-- Insert data into the countries table
INSERT INTO Countries (name, continent, area, population, gdp) VALUES
('Afghanistan', 'Asia', 652230, 25500100, 20343000),
('Albania', 'Europe', 28748, 2831741, 12960000),
('Algeria', 'Africa', 2381741, 37100000, 188681000),
('Andorra', 'Europe', 468, 78115, 3712000),
('Angola', 'Africa', 1246700, 20609294, 100990000);

select name, population, area 
from countries
where area > 3000000 or population > 25000000;
















