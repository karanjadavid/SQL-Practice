--##########################################################
/*
-- Q2 Assume you're given the tables below about Facebook Page and Page likes (as in "Like a Facebook Page").
Write a query to return the IDs of the Facebook pages which do not possess any likes. 
The output should be sorted in ascending order.
*/
--##########################################################

CREATE TABLE pages
(
page_id INT,
page_name VARCHAR(50)
);


INSERT INTO pages (page_id, page_name)
VALUES(20001,'SQL Solutions'),
(20045,'Brain Exercises'),
(20701,'Tips for Data Analysts'),
(31111,'Postgres Crash Course'),
(32728,'Break the thread');





CREATE TABLE page_likes 
(
user_id INT,
page_id INT,
liked_date DATETIME
);


INSERT INTO page_likes(user_id,page_id,liked_date)
VALUES(111,20001,'04/08/2022 00:00:00'),
(121,20045,'03/12/2022 00:00:00'),
(156,20001,'07/25/2022 00:00:00'),
(255,20045,'07/19/2022 00:00:00'),
(125,20001,'07/19/2022 00:00:00'),
(144,31111,'06/21/2022 00:00:00'),
(125,31111,'07/04/2022 00:00:00');





-- Use a left outer join
SELECT p.page_id
FROM pages p
LEFT OUTER JOIN page_likes pl
ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL;


-- Use Except
SELECT page_id
FROM pages
EXCEPT
SELECT page_id
FROM page_likes;


-- Use NOT IN
SELECT page_id
FROM pages
WHERE page_id NOT IN (
  SELECT DISTINCT page_id
  FROM page_likes
);


-- Use Not Exists
SELECT page_id
FROM pages
WHERE NOT EXISTS (
  SELECT page_id
  FROM page_likes AS likes
  WHERE likes.page_id = pages.page_id
);