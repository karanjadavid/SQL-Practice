--##########################################################
/* Q1 Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job.
      You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
	  Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.
*/
--##########################################################

CREATE TABLE candidates
(
candidate_id INT,
skill VARCHAR(20)
);


INSERT INTO candidates(candidate_id,skill)
VALUES(123, 'Python'),
(123, 'Tableau'),
(123, 'PostgreSQL'),
(234, 'R'),
(234, 'PowerBI'),
(234, 'SQL Server'),
(345, 'Python'),
(345, 'Tableau'),
(147, 'Python'),
(147, 'PostgreSQL'),
(147, 'Tableau'),
(147, 'Java'),	
(168, 'Python'),	
(256, 'Tableau');



SELECT candidate_id 
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;

