CREATE DATABASE ProductCategoryDB;
USE ProductCategoryDB;
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);
CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    phone VARCHAR(15)
);
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    category_id INT,
    supplier_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
INSERT INTO Category VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home Appliances');
INSERT INTO Supplier VALUES
(101, 'ABC Suppliers', '9876543210'),
(102, 'XYZ Traders', '9876501234'),
(103, 'Global Suppliers', '9123456780');
INSERT INTO Product VALUES
(201, 'Laptop', 55000.00, 1, 101),
(202, 'T-Shirt', 800.00, 2, 102),
(203, 'Python Book', 600.00, 3, 103),
(204, 'Mixer Grinder', 2500.00, 4, 101);
INSERT INTO Customer VALUES
(301, 'Arun', 'arun@gmail.com'),
(302, 'Priya', 'priya@gmail.com'),
(303, 'Kavin', 'kavin@gmail.com');
INSERT INTO Orders VALUES
(401, 301, 201, 1, '2026-09-01'),
(402, 302, 202, 2, '2026-09-02'),
(403, 303, 203, 1, '2026-09-03');
SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    cat.category_name,
    s.supplier_name,
    p.price,
    o.quantity,
    o.order_date
FROM Orders o
JOIN Customer c
    ON o.customer_id = c.customer_id
JOIN Product p
    ON o.product_id = p.product_id
JOIN Category cat
    ON p.category_id = cat.category_id
JOIN Supplier s
    ON p.supplier_id = s.supplier_id;



