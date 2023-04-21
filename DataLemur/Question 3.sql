--##########################################################
/*
-- Q3 Tesla is investigating production bottlenecks and they need your help to extract the relevant data. 
Write a query that determines which parts with the assembly steps have initiated the assembly process but remain unfinished.

Assumptions:
parts_assembly table contains all parts currently in production, each at varying stages of the assembly process.
An unfinished part is one that lacks a finish_date.
*/
--##########################################################

CREATE TABLE parts_assembly
(
part VARCHAR(30),
finish_date DATETIME,
assembly_step INT
);


INSERT INTO parts_assembly (part, finish_date, assembly_step)
VALUES
('battery','01/22/2022 00:00:00',1),
('battery','02/22/2022 00:00:00',2),
('battery','03/22/2022 00:00:00',3),
('bumper','01/22/2022 00:00:00',1),
('bumper','02/22/2022 00:00:00',2),
('bumper',NULL,3),
('bumper',NULL,4),
('door','01/22/2022 00:00:00',1),
('door','02/22/2022 00:00:00',2),
('engine','01/01/2022 00:00:00',1),
('engine','01/25/2022 00:00:00',2),
('engine','02/28/2022 00:00:00',3),
('engine','04/01/2022 00:00:00',4),
('engine',NULL,5);





SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;