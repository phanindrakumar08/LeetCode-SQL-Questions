CREATE TABLE Candidate (
    id INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Vote (
    id INT PRIMARY KEY,
    CandidateId INT,
    FOREIGN KEY (CandidateId) REFERENCES Candidate(id)
);

INSERT INTO Candidate (id, Name) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');

INSERT INTO Vote (id, CandidateId) VALUES
(1, 2),
(2, 4),
(3, 3),
(4, 2),
(5, 5);

select * from candidate;
select * from vote;


SELECT Name
FROM Candidate
WHERE id = (SELECT CandidateId
     FROM Vote
     GROUP BY CandidateId
     ORDER BY COUNT(1) desc
     LIMIT 1);
     
-- Alternate approach
SELECT c.Name
FROM candidate c
RIGHT JOIN vote v
ON c.id = v.CandidateId
GROUP BY c.Name
HAVING COUNT(v.CandidateId) = (
    SELECT MAX(vote_count)
    FROM (
        SELECT COUNT(CandidateId) AS vote_count
        FROM vote
        GROUP BY CandidateId
    ) AS subquery
);























