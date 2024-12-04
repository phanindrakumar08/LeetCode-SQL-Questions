-- Create the table
CREATE TABLE Numbers (
    Number INT PRIMARY KEY,
    Frequency INT NOT NULL
);

-- Insert the values
INSERT INTO Numbers (Number, Frequency) VALUES
(0, 7),
(1, 1),
(2, 3),
(3, 1);
use santa;

select * from Numbers;

with recursive rec_cte as 
(
select number, frequency, 1 as cnt
from numbers
union
select number, frequency, cnt+1 as cnt
from rec_cte
where cnt<frequency
),
med_cte as
(
select number, frequency, cnt, row_number() over (order by number) as row_num,
count(*) over () tot_count
from rec_cte
)
select case when MOD(tot_count,2)=0 then round(avg(number),1)
else round(number, 1) end as median
from med_cte
where row_num between
tot_count/2 and tot_count/2 + 1; 


-- Alternate approach


SELECT avg(t3.Number) as median
FROM Numbers as t3
JOIN
    (SELECT t1.Number,
        abs(SUM(CASE WHEN t1.Number>t2.Number THEN t2.Frequency ELSE 0 END) -
            SUM(CASE WHEN t1.Number<t2.Number THEN t2.Frequency ELSE 0 END)) AS count_diff
    FROM numbers AS t1, numbers AS t2
    GROUP BY t1.Number) AS t4
ON t3.Number = t4.Number
WHERE t3.Frequency>=t4.count_diff;

select * from numbers n1;
SELECT t1.Number,
        abs(SUM(CASE WHEN t1.Number>t2.Number THEN t2.Frequency ELSE 0 END) -
            SUM(CASE WHEN t1.Number<t2.Number THEN t2.Frequency ELSE 0 END)) AS count_diff
    FROM numbers AS t1, numbers AS t2
    GROUP BY t1.Number;
    SELECT *
    FROM numbers AS t1, numbers AS t2;











