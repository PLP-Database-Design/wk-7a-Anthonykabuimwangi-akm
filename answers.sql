--QUESTION 1
-- Create a new normalized table
CREATE TABLE NormalizedProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert data by splitting the Products column
-- For Order 101
INSERT INTO NormalizedProductDetail VALUES (101, 'John Doe', 'Laptop');
INSERT INTO NormalizedProductDetail VALUES (101, 'John Doe', 'Mouse');

-- For Order 102
INSERT INTO NormalizedProductDetail VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO NormalizedProductDetail VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO NormalizedProductDetail VALUES (102, 'Jane Smith', 'Mouse');

-- For Order 103
INSERT INTO NormalizedProductDetail VALUES (103, 'Emily Clark', 'Phone');


--QUESTION 2
-- remove the partial dependency
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- MAKE IT fully dependent on composite key
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Orders 
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OriginalOrderDetails;

-- Insert data into OrderDetails
INSERT INTO OrderDetails (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OriginalOrderDetails;
