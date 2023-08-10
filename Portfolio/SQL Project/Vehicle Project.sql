CREATE DATABASE AssignmentV2;
-- TASK 1 --
CREATE TABLE Member(MemberID VARCHAR(10) PRIMARY KEY, MFName VARCHAR(20), MLName VARCHAR(20), MLoc VARCHAR(20));
CREATE TABLE Vehicle(VehReg VARCHAR(10) PRIMARY KEY, VehMake VARCHAR(10), VehModel VARCHAR(10), MemberID VARCHAR(10));
CREATE TABLE Engineer(EngID INT PRIMARY KEY, EFName VARCHAR(20), ELName VARCHAR(20));
CREATE TABLE EngVan(VanReg VARCHAR(10) PRIMARY KEY, VanMake VARCHAR(10), VanModel VARCHAR(10), EngID INT, VMileage INT);
CREATE TABLE Breakdown(BDID INT(10) PRIMARY KEY, VehReg VARCHAR(10), VanReg VARCHAR(10), BDDATE DATE, BDTIME TIME, BDLoc VARCHAR(20));

-- Using the Alter command set the foreign keys --
ALTER TABLE Vehicle ADD FOREIGN KEY (MemberID) REFERENCES Member(MemberID);
ALTER TABLE EngVan ADD FOREIGN KEY (EngID) REFERENCES Engineer(EngID);
ALTER TABLE Breakdown ADD FOREIGN KEY (VehReg) REFERENCES Vehicle(VehReg);
ALTER TABLE Breakdown ADD FOREIGN KEY (VanReg) REFERENCES EngVan(VanReg);

-- TASK 2--
INSERT INTO Member(MemberID, MFName, MLName, MLoc) VALUES
(1,'Harry','Kane','London'),(2,'Gary','Nevile','Manchester'),
(3,'Jeremy','Clarkson','London'),(4,'Richard','Hammond','Birmingham'),
(5,'James','May','Manchester');

INSERT INTO Vehicle(VehReg, VehMake, VehModel, MemberID) VALUES
('E11 MAK','Toyota','Basic',2),('TA22 MAK','Ferrari','Advanced','2'),
('K21 MAK','Porche','Super','1'),('BIO MAK','Mercedes','Eco','3'),
('J24 MAK','Vauxhall','Basic','4'),('M10 MAK','Fiat','Eco','5'),
('MA10 MAK','Honda','Fast','1'),('MA13 MAK','BMW','Basic','5');

INSERT INTO Engineer(EngID, EFName, ELName) VALUES
(1,'Marcus','Rashford'),(2,'Roy','Keane'),(3,'Joe','Willock');

INSERT INTO EngVan(VanReg, VanMake, VanModel, EngID, VMileage) VALUES
('MKLI KER','Ford','New',2,12000),('MAK 7I4N','Mercedes','Old',1,24000),
('YA54 MAK','Mercedes','Old',1,34000), ('KE53 MAK','Mercedes','New',3,44000),
('C701 MAK','BMW','New',3,64000);

INSERT INTO Breakdown(BDID, VehReg, VanReg, BDDATE, BDTIME, BDLoc) VALUES
(1,'E11 MAK', 'MKLI KER', '2021-08-23', '12:00:00', 'London'),
(2,'J24 MAK', 'YA54 MAK', '2021-08-23', '16:00:00', 'Manchester'),
(3,'MA10 MAK', 'MKLI KER', '2022-06-20', '12:00:00', 'Manchester'),
(4,'MA13 MAK', 'YA54 MAK', '2021-06-15', '18:00:00', 'Aberdeen'),
(5,'BIO MAK', 'MKLI KER', '2021-06-01', '11:00:00', 'Aberdeen'),
(6,'BIO MAK', 'YA54 MAK', '2019-12-23', '12:00:00', 'Birmingham'),
(7,'E11 MAK', 'MAK 7I4N', '2018-08-23', '12:00:00', 'Birmingham'),
(8,'TA22 MAK', 'MKLI KER', '2014-07-23', '12:00:00', 'Manchester'),
(9,'TA22 MAK', 'MAK 7I4N', '2015-03-23', '12:00:00', 'Bristol'),
(10,'E11 MAK', 'KE53 MAK', '2021-08-23', '12:00:00', 'Swansea'),
(11,'E11 MAK', 'MKLI KER', '2021-08-23', '12:00:00', 'London'),
(12,'E11 MAK', 'C701 MAK', '2021-08-23', '12:00:00', 'London');

-- TASK 3 --
-- 1. The names of members who live in a location e.g. London.
SELECT * FROM Member WHERE MLoc='London';
-- 2. All cars registered with the company e.g. all Nissan cars.
SELECT * FROM Vehicle WHERE VehMake ='BMW';
-- 3. The number of engineers that work for the company.
SELECT COUNT(*) AS engineer_count FROM Engineer;
-- 4. The number of members registered.
SELECT COUNT(*) AS Member_count FROM Member;
-- 5. All the breakdown after a particular date
SELECT * FROM Breakdown WHERE BDDATE > '2021-08-23';
-- 6. All the breakdown between 2 dates
SELECT * FROM Breakdown WHERE BDDATE BETWEEN '2021-06-01' AND '2022-06-20';
-- 7. The number of time a particular vehicle has broken down
SELECT COUNT(*) AS breakdown_count FROM Breakdown WHERE VehReg = 'E11 MAK';
-- 8. The number of vehicles broken down more than once
SELECT VehReg, COUNT(*) AS breakdown_count FROM Breakdown GROUP BY VehReg HAVING COUNT(*) > 1;

-- TASK 4 --
CREATE TABLE MshipType (MTID INT PRIMARY KEY, MType VARCHAR(6), MPrice DECIMAL(4, 2));
INSERT INTO MshipType (MTID, MType, MPrice) VALUES
(1, 'Gold', 99.99), (2, 'Silver', 59.99), (3, 'Bronze', 39.99);

-- TASK 5 --
ALTER TABLE Vehicle ADD COLUMN MTID INT NULL, ADD CONSTRAINT FK_Vehicle_MTID FOREIGN KEY (MTID) REFERENCES MshipType(MTID);
UPDATE Vehicle SET MTID = 2 WHERE VehReg ='TA22 MAK';
UPDATE Vehicle SET MTID = 2 WHERE VehReg = 'TA22 MAK';
UPDATE Vehicle SET MTID = 1 WHERE VehReg = 'K21 MAK';

-- TASK 6 --
-- 1. All the vehicles a member owns.
SELECT VehReg, VehMake, VehModel FROM Vehicle INNER JOIN 
Member ON Vehicle.MemberID WHERE Member.MemberID = '1';
SELECT VehReg, VehMake, VehModel FROM Vehicle INNER JOIN 
Member ON Vehicle.MemberID WHERE Member.MemberID = '2';
SELECT VehReg, VehMake, VehModel FROM Vehicle INNER JOIN 
Member ON Vehicle.MemberID WHERE Member.MemberID = '3';
SELECT VehReg, VehMake, VehModel FROM Vehicle INNER JOIN 
Member ON Vehicle.MemberID WHERE Member.MemberID = '4';
SELECT VehReg, VehMake, VehModel FROM Vehicle INNER JOIN 
Member ON Vehicle.MemberID WHERE Member.MemberID = '5';
-- 2. The number of vehicles for each member in descending order.
SELECT MemberID, COUNT(*) AS vehicle_count FROM Vehicle GROUP BY MemberID ORDER BY vehicle_count DESC;  
-- 3. The number of vans driven by a particular engineer.
SELECT COUNT(E.VanReg) AS 'Number of Vans', CONCAT(EN.EFName,' ',EN.ELName)AS 'Engineer Name'
FROM EngVan E LEFT JOIN Engineer EN ON E.EngID=EN.EngID GROUP BY E.EngID;
-- 4. All vehicles that have broken down in a particular location along with member details.
SELECT B.VehReg AS 'Vehicle Registration', V.MemberID AS 'Member ID', B.BDLoc AS Location
FROM Breakdown B LEFT JOIN Vehicle V  ON B.VehReg=V.VehReg WHERE BDLoc='London';
-- 5 A list of all vehicles that broke down along with the member details and the engineer who attended.
SELECT B.BDID AS'Breakdown ID', V.MemberID AS 'Member ID', CONCAT(M.MFName,' ',M.MLName)AS'Owner Name',
CONCAT(V.VehMake,' ',V.VehModel) AS CAR, CONCAT(E.EFName,' ',E.ELName) AS Attended FROM Breakdown B 
LEFT JOIN Vehicle V ON B.VehReg=V.VehReg INNER JOIN member m ON M.MemberID=V.MemberID LEFT JOIN EngVan EN 
ON EN.VanReg=B.VanReg LEFT JOIN Engineer E ON EN.EngID=E.EngID;
-- 6. A list of all breakdown along with member and engineer details between two dates.
SELECT B.BDID AS'Breakdown ID', V.MemberID AS 'Member ID', CONCAT(M.MFName,' ',M.MLName) AS 'Owner Name',
CONCAT(V.VehMake,' ',V.VehModel) AS CAR, CONCAT(E.EFName,' ',E.ELName)AS Attended FROM Breakdown B LEFT JOIN Vehicle V ON B.VehReg=V.VehReg
INNER JOIN member m ON M.MemberID=V.MemberID LEFT JOIN EngVan EN ON EN.VanReg=B.VanReg LEFT JOIN Engineer E 
ON EN.EngID=E.EngID WHERE BDDATE BETWEEN '2018-08-23'AND'2021-08-23';
-- 7. A further 3 relational queries of your choice that are meaningful to the company.
-- Highest vehicle amount
SELECT MemberID, COUNT(*) AS VehicleCount FROM Vehicle GROUP BY MemberID ORDER BY VehicleCount DESC LIMIT 2;
-- SUM of miles driven per engineer.
SELECT SUM(VMileage) AS 'SUM of miles driven per engineer',E.EFName,E.ELName 
FROM EngVan EV LEFT JOIN Engineer E on EV.EngID=E.EngID GROUP BY E.EngID;
-- TASK 7 --
/*Using W3Schools or any other resource research the following functions – Avg, Max, Min, Sum.  
Explain with examples how each one is used. Create a separate database with sample data to illustrate your examples.  
However please do not copy from the websites. */
CREATE DATABASE SAMPLEDATA;
CREATE TABLE Employees (EmployeeID INT PRIMARY KEY, FirstName VARCHAR(50), LastName VARCHAR(50), Department VARCHAR(50), Salary DECIMAL(10, 2));
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'Sales', 50000.00),
(2, 'Jane', 'Smith', 'Marketing', 60000.00),
(3, 'Mike', 'Johnson', 'HR', 55000.00),
(4, 'Sarah', 'Williams', 'Finance', 70000.00),
(5, 'David', 'Brown', 'IT', 65000.00);

-- AVG() returns the average value of a collumn --
SELECT AVG(Salary)
FROM Employees;

-- MAX() returns the maximum value of a collumn --
SELECT MAX(Salary)
FROM Employees;

-- MAX() returns the minimum value of a collumn --
SELECT MIN(Salary)
FROM Employees;

-- SUM() returns the total SUM of a collumn --
SELECT SUM(EmployeeID)
FROM Employees;

-- TASK 8 --
-- 1) For 2 can say if greater than one vehicle owned then has multi-car policy. 
SELECT member.MemberID, mFName, MLName, COUNT(*) AS numberOfCars,
CASE
    WHEN COUNT(*)>1 THEN 'the member has a multi-car policy'
    WHEN COUNT(*)<=1 THEN 'the member has a one-car policy'
END AS 'policy message'
FROM Vehicle INNER JOIN member ON member.MemberID=Vehicle.MemberID
GROUP BY Vehicle.MemberID;

-- 2) The number of times each car broken down
-- a. If more than twice then next premium to be increased by 10%
-- b. If twice then increase by 5%
-- c.	If once then no increase
-- d.	If not broken down then 10% discount
SELECT v.VehReg,v.VehMake, COUNT(*) AS numberOfBreakdown,
CASE 
    WHEN COUNT(*)>2 THEN 'Increase by 10%'
    WHEN COUNT(*)=2 THEN  'Increase by 5%'
    WHEN COUNT(*)=1 THEN 'No increase'
    WHEN COUNT(*)=0 THEN  '10% Discount'
END AS 'Premium Message'
FROM breakDown b INNER JOIN vehicle v ON b.VehReg=v.VehReg
GROUP BY b.VehReg;



