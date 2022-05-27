--################################################--
--		DATABASE DESIGN
--################################################--

-- create client Table 
CREATE TABLE client
(
client_id INT NOT NULL PRIMARY KEY,
first_name NVARCHAR(20),
middle_name NVARCHAR(20),
last_name NVARCHAR(20),
date_of_birth DATE
);

-- create loan table
CREATE TABLE loan(
loan_id INT NOT NULL PRIMARY KEY,
client_id INT,
vehicle_id INT,
principal_amount INT,
submitted_on_date DATE
);

-- create vehicle table
CREATE TABLE vehicle(
vehicle_id INT NOT NULL PRIMARY KEY,
make varchar(20),
model_name NVARCHAR(30)
);



-- Add constraints 
----ALTER TABLE loan ADD CONSTRAINT loan_vehicle_FK
----FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id);

----ALTER TABLE loan ADD CONSTRAINT loan_client_FK
----FOREIGN KEY (client_id) REFERENCES client(client_id);


--Populate the tables.

INSERT INTO client VALUES(33, 'Susan', 'Mapenzi','Marigu','1974-06-11'); 
INSERT INTO client VALUES(35,'Paul','','Pogba','1993-03-15'); 
INSERT INTO client VALUES(36,'Hafsa','Wangui','Munga','1987-05-07'); 
INSERT INTO client VALUES(37,'Everlyne', '', 'Maten''ge','1973-02-27'); 
INSERT INTO client VALUES(38,'Barack', '','Obama', '1961-08-04'); 
INSERT INTO client VALUES(39, 'Prudence','Salim', 'Okeyo', '1985-02-16'); 
INSERT INTO client VALUES(40, 'Rosemary', 'Pauline', 'Kinyua', '1977-01-27') 
INSERT INTO client VALUES(42, 'Elizabeth', '', 'Mbaji', '1975-10-03'); 
INSERT INTO client VALUES(43, 'Johny', 'Paul', 'Orengo', '1971-07-29'); 
INSERT INTO client VALUES(44, 'Merceline', 'Lucy', 'Njenga', '1982-04-21'); 











INSERT INTO vehicle VALUES(24,'Haojin','HJ 150CC-11A');
INSERT INTO vehicle VALUES(26,'Honda','Ace CB 125CC ES');
INSERT INTO vehicle VALUES(27,'TVS','HLX 125CC ES');
INSERT INTO vehicle VALUES(29,'TVS','HLX 150CC X');
INSERT INTO vehicle VALUES(30,'TVS','HLX 100CC KS');
INSERT INTO vehicle VALUES(31,'Haojin','HJ 125CC-A');
INSERT INTO vehicle VALUES(32,'Boxer','BM 150CC (4)');
INSERT INTO vehicle VALUES(33,'Ferrari','Enzo 6000CC');
INSERT INTO vehicle VALUES(34,'Boxer','BM 150cc-2');
INSERT INTO vehicle VALUES(35,'Boxer','BM 150cc-3');













INSERT INTO loan VALUES(75676,40784,24,106500,'2019-05-02');
INSERT INTO loan VALUES(75659,40760,26,108400,'2020-12-05');
INSERT INTO loan VALUES(75685,40807,27,101500,'2019-05-02');
INSERT INTO loan VALUES(75657,40796,28,271482,'2019-06-21');
INSERT INTO loan VALUES(75662,40803,29,114400,'2019-05-02');
INSERT INTO loan VALUES(75660,40737,30,95300,'2019-05-02');
INSERT INTO loan VALUES(75656,40815,31,78500,'2019-05-02');
INSERT INTO loan VALUES(75666,40834,32,111800,'2019-05-02');
INSERT INTO loan VALUES(75658,40811,33,107050,'2019-05-02');
INSERT INTO loan VALUES(75663,40840,34,101800,'2019-05-02');




-- View the tables
SELECT *
FROM client;

SELECT *
FROM loan;

SELECT *
FROM vehicle;

--################################################--
--		QUESTIONS
--################################################--

--1. Select all the clients called Paul in first_name or middle_name and who
-- are more than 25 years old.
-- In the results, create a column with the client's age in years. 
-- Order them from older to younger.

SELECT first_name, middle_name, 
	DATEDIFF(YEAR,date_of_birth,GETDATE()) AS age
FROM client
WHERE (first_name = 'paul' OR middle_name = 'paul') 
AND(DATEDIFF(YEAR,date_of_birth,GETDATE()) > 25)
ORDER BY age DESC;





-- 2. Add a column to the table from question (1) that contains 
-- the number of loans each customer made.
-- If there is no loan, this column should show 0.

SELECT c.client_id, ISNULL(0,COUNT(loan_id)) AS loan_count
FROM client c
LEFT JOIN loan l
ON c.client_id = l.client_id
GROUP BY c.client_id;





-- 3. Select the 100cc, 125cc and 150cc bikes from the vehicle table.
-- Add an engine_size column to the output (that contains the engine size).

SELECT *, SUBSTRING(model_name, CHARINDEX('1', model_name), 5) AS [engine size]
FROM vehicle
WHERE model_name LIKE '%100CC%'
	OR model_name LIKE '%125CC%'
	OR model_name LIKE '%150CC%';





-- 4. Calculate the total principal_amount per client full name 
-- (one column that includes all the names for each client) and per vehicle make.

SELECT CONCAT_WS(' ', first_name, middle_name, last_name) AS client_full_name, 
		SUM(l.principal_amount) AS [Total Principal amount], make  
FROM loan l
JOIN vehicle v ON v.vehicle_id = l.vehicle_id
FULL JOIN client c ON c.client_id = L.client_id
GROUP BY make,  CONCAT_WS(' ', first_name, middle_name, last_name);





-- 5. Select the loan table and add an extra column that shows the chronological 
-- loan order for each client based on the submitted_on_date column: 
-- 1 if it's the client's first sale, 2 if it's the client's second sale etc.
-- Call it loan_order

SELECT *,
	ROW_NUMBER() OVER(PARTITION BY client_id 
	ORDER BY submitted_on_date ) AS loan_order
FROM loan;




