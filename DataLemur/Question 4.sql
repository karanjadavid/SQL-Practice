--##########################################################
/*
-- Q4 Assume you're given the table on user viewership categorised by device type where the three types are laptop, tablet, and phone.
Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership.
Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.
*/
--##########################################################

CREATE TABLE viewership
(
user_id INT,
device_type VARCHAR(20),
view_time DATETIME
);


INSERT INTO viewership(user_id, device_type, view_time)
VALUES(123,'tablet','01/02/2022 00:00:00'),
(125,'laptop','01/07/2022 00:00:00'),
(128,'laptop','02/09/2022 00:00:00'),
(129,'phone','02/09/2022 00:00:00'),
(145,'tablet','02/24/2022 00:00:00');





SELECT
	SUM(CASE WHEN device_type = 'laptop' THEN 1 END) AS laptop_reviews,
	SUM(CASE WHEN device_type IN ('tablet','phone') THEN 1 END)AS mobile_views
FROM viewership;



-- This works in postgreSQL
SELECT
	COUNT(*) FILTER(WHERE device_type = 'laptop') AS laptop_reviews,
	COUNT(*) FILTER(WHERE device_type IN ('tablet','phone')) AS mobile_reviews
FROM viewership



