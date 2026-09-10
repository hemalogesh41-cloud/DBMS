CREATE DATABASE OrderManagementDB;
USE OrderManagementDB;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Order_Details (
    detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_mode VARCHAR(30),
    payment_status VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
INSERT INTO Customer VALUES
(1, 'Arun', 'arun@gmail.com', '9876543210'),
(2, 'Priya', 'priya@gmail.com', '9876501234'),
(3, 'Kavin', 'kavin@gmail.com', '9123456780');
INSERT INTO Product VALUES
(101, 'Laptop', 55000.00, 10),
(102, 'Smartphone', 25000.00, 20),
(103, 'Headphones', 3000.00, 30);
INSERT INTO Orders VALUES
(201, 1, '2026-09-01', 55000.00),
(202, 2, '2026-09-02', 50000.00),
(203, 3, '2026-09-03', 3000.00);
INSERT INTO Order_Details VALUES
(301, 201, 101, 1, 55000.00),
(302, 202, 102, 2, 25000.00),
(303, 203, 103, 1, 3000.00);
INSERT INTO Payment VALUES
(401, 201, 'UPI', 'Successful', '2026-09-01'),
(402, 202, 'Credit Card', 'Successful', '2026-09-02'),
(403, 203, 'Cash', 'Pending', '2026-09-03');
SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    od.quantity,
    od.price,
    o.total_amount,
    pay.payment_mode,
    pay.payment_status,
    o.order_date
FROM Orders o
JOIN Customer c
    ON o.customer_id = c.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Product p
    ON od.product_id = p.product_id
JOIN Payment pay
    ON o.order_id = pay.order_id;

