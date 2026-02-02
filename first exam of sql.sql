DROP DATABASE IF EXISTS DATADIGGER;
CREATE  DATABASE DataDigger;
USE DataDigger;

CREATE TABLE Customers(
	CustomersID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100)NOT NULL,
    Email VARCHAR(100)UNIQUE,
    Address TEXT
);

INSERT INTO Customers (Name, Email, Address)VALUES
('Alice Smith', 'alice@email.com', '123 Maple St'),
('Bob Jones', 'bob@email.com', '923 Chicago street Mart'),
('John cena', 'johncena@email.com', '4545 New York Times Now Road'),
('Nikki Bella', 'nikki@email.com', '2000 Rich street of tronato'),
('Smith Bella', 'smith@email.com', '3434 Malbourn street'),
('Ricky ponting', 'ricky@email.com', '500 joy street'),
('Sachin tendulkar', 'sachin@email.com', '100 brand area'),
('Virat kohil', 'virat@email.com', '250 street of freedom area'),
('Dhoni', 'dhoni@email.com', '07 ranchi old street of gold');

SELECT * FROM Customers;

UPDATE Customers
SET Address = '14 Championship lane'
WHERE  CustomersID = 3;

update Customers
SET Address = '555 Hollywood Rich street'
WHERE CustomersID = 4;

DELETE FROM Customers 
WHERE CustomersID = 9;

SELECT * FROM Customers WHERE NAME LIKE 'Alice%';

CREATE TABLE ORDERS(
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomersID INT,
    OrderDate DATE,
    TOTALAMOUNT DECIMAL(10,2),
    FOREIGN KEY (CustomersID) REFERENCES Customers(CustomersID)
);

INSERT INTO Orders (CustomersID, OrderDate, TotalAmount) VALUES
(1, '2026-01-05', 1500.00),
(2, '2026-01-10', 2500.50),
(3, '2026-01-15', 500.00),
(4, '2025-12-20', 1200.00),
(5, '2026-01-18', 3000.00),
(6, '2026-01-20', 450.75),
(7, '2026-01-21', 890.00),
(8, '2026-01-22', 120.00),
(1, '2026-01-22', 3500.00),
(3, '2026-01-12', 750.00);

SELECT * FROM Orders 
WHERE CustomersID = 1; 

UPDATE Orders 
SET TotalAmount = 3200.00 
WHERE OrderID = 11;

DELETE FROM Orders 
WHERE OrderID = 13;

SELECT * FROM Orders 
WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT 
    MAX(TotalAmount) AS Highest_Order, 
    MIN(TotalAmount) AS Lowest_Order, 
    AVG(TotalAmount) AS Average_Order_Value 
FROM Orders;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2),
    Stock INT
);

INSERT INTO Products (ProductName, Price, Stock) VALUES
('Ceiling Fan', 2500.00, 15),
('Electric Kettle', 1200.00, 25),
('Dinner Set (24pc)', 1850.00, 10),
('Cotton Bed Sheets', 800.00, 40),
('Non-Stick Frying Pan', 950.00, 20),
('Broom & Dustpan Set', 350.00, 50),
('LED Bulb 9W', 120.00, 100),
('Plastic Storage Containers', 650.00, 0), 
('Iron Box', 1100.00, 12),
('Doormat', 150.00, 80);

SELECT * FROM Products 
ORDER BY Price DESC;

UPDATE Products 
SET Price = 1950.00 
WHERE ProductID = 2;

DELETE FROM Products 
WHERE Stock = 0;

SELECT * FROM Products 
WHERE Price BETWEEN 500 AND 2000;

SELECT 
    MAX(Price) AS Most_Expensive, 
    MIN(Price) AS Cheapest 
FROM Products;

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10, 2)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal) VALUES
(10, 1, 1, 2500.00),
(11, 7, 5, 600.00),
(12, 2, 1, 1350.00),
(13, 3, 2, 3700.00),
(14, 4, 3, 2400.00),
(15, 5, 1, 950.00),
(16, 9, 2, 2200.00),
(17, 10, 4, 600.00),
(18, 1, 1, 2500.00),
(19, 2, 2, 2700.00);

SELECT * FROM OrderDetails WHERE OrderID = 11;

SELECT SUM(SubTotal) AS Total_Revenue FROM OrderDetails;

SELECT ProductID, SUM(Quantity) AS Total_Qty 
FROM OrderDetails 
GROUP BY ProductID 
ORDER BY Total_Qty DESC 
LIMIT 3;

SELECT COUNT(*) AS Sales_Frequency FROM OrderDetails WHERE ProductID = 1;


