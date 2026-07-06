-- TASK 5
USE librarydb;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Customers VALUES
(1,'Amit'),
(2,'Priya'),
(3,'Rahul'),
(4,'Sneha');

INSERT INTO Orders VALUES
(101,1,'Laptop'),
(102,2,'Phone'),
(103,2,'Keyboard'),
(104,4,'Monitor');

SELECT c.customer_name, o.product
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.product
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.product
FROM Orders o
LEFT JOIN Customers c
ON o.customer_id = c.customer_id;

SELECT c.customer_name, o.product
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id

UNION

SELECT c.customer_name, o.product
FROM Orders o
LEFT JOIN Customers c
ON o.customer_id = c.customer_id;