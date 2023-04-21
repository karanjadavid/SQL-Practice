
--##########################################################
/*
-- Q5 Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.
Write a query to retrieve the top three cities that have the 
highest number of completed trade orders listed in descending order.
Output the city name and the corresponding number of completed trade orders.
*/
--##########################################################

CREATE TABLE trades
(
order_id INT,
user_id INT,
quantity INT,
status CHAR(20),
timestamp DATETIME,
price FLOAT
);


INSERT INTO trades 
VALUES
(100101, 111, 10, 'Cancelled', '08/17/2022 12:00:00', 9.80),
(100102, 111, 10, 'Completed', '08/17/2022 12:00:00', 10.00),
(100264, 148, 40, 'Completed', '08/26/2022 12:00:00', 4.80),
(100305, 300, 15, 'Completed', '09/05/2022 12:00:00', 10.00),
(100909, 488, 1,  'Completed', '07/05/2022 12:00:00', 6.50),
(100259, 148, 35, 'Completed', '08/25/2022 12:00:00', 5.10),
(100900, 148, 50, 'Completed', '07/14/2022 12:00:00', 9.78),
(101432, 265, 10, 'Completed', '08/16/2022 12:00:00', 13.00),
(102533, 488, 25, 'Cancelled', '11/10/2022 12:00:00', 22.40),
(100565, 265, 2,  'Completed', '09/27/2022 12:00:00', 8.70),
(100400, 178, 32, 'Completed', '09/17/2022 12:00:00', 12.00),
(100777, 178, 60, 'Completed', '07/25/2022 17:47:00', 3.5);





CREATE TABLE users
(
user_id INT,
city VARCHAR(20),
email VARCHAR(30),
signup_date DATETIME
);


INSERT INTO users
VALUES
(111, 'San Francisco', 'rrok10@gmail.com', '08/03/2021 12:00:00'),
(148, 'Boston', 'sailor9820@gmail.com', '08/20/2021 12:00:00'),
(178, 'San Francisco', 'harrypotterfan182@gmail.com', '01/05/2022 12:00:00'),
(265, 'Denver', 'shadower_@hotmail.com', '02/26/2022 12:00:00'),
(300, 'San Francisco', 'houstoncowboy1122@hotmail.com', '06/30/2022 12:00:00'),
(488, 'New York', 'empire_state78@outlook.com', '07/03/2022 12:00:00');





SELECT TOP 3 us.city, COUNT(td.order_id) AS Number_of_complete_orders
FROM users us
INNER JOIN trades td
ON us.user_id = td.user_id
WHERE status = 'Completed'
GROUP BY us.city 
ORDER BY Number_of_complete_orders DESC;





-- In Postgre SQL:
SELECT us.city, COUNT(td.order_id) AS Number_of_complete_orders
FROM users us
INNER JOIN trades td
ON us.user_id = td.user_id
WHERE status = 'Completed'
GROUP BY us.city 
ORDER BY Number_of_complete_orders DESC
LIMIT 3;

