CREATE DATABASE PaymentTransactionDB;
USE PaymentTransactionDB;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    payment_mode VARCHAR(30),
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    payment_id INT,
    transaction_type VARCHAR(30),
    transaction_status VARCHAR(20),
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
);
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);
CREATE TABLE Payment_Details (
    detail_id INT PRIMARY KEY,
    payment_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
INSERT INTO Customer VALUES
(1, 'Arun', 'arun@gmail.com', '9876543210'),
(2, 'Priya', 'priya@gmail.com', '9876501234'),
(3, 'Kavin', 'kavin@gmail.com', '9123456780');
INSERT INTO Payment VALUES
(101, 1, 'UPI', 55000.00, '2026-09-01', 'Successful'),
(102, 2, 'Credit Card', 25000.00, '2026-09-02', 'Successful'),
(103, 3, 'Cash', 3000.00, '2026-09-03', 'Failed');
INSERT INTO Transactions VALUES
(201, 101, 'Purchase', 'Successful'),
(202, 102, 'Purchase', 'Successful'),
(203, 103, 'Purchase', 'Failed');
INSERT INTO Product VALUES
(301, 'Laptop', 55000.00),
(302, 'Smartphone', 25000.00),
(303, 'Headphones', 3000.00);
INSERT INTO Payment_Details VALUES
(401, 101, 301, 1),
(402, 102, 302, 1),
(403, 103, 303, 1);
SELECT
    t.transaction_id,
    c.customer_name,
    p.product_name,
    pd.quantity,
    pay.payment_mode,
    pay.amount,
    pay.payment_status,
    t.transaction_status,
    pay.payment_date
FROM Transactions t
JOIN Payment pay
    ON t.payment_id = pay.payment_id
JOIN Customer c
    ON pay.customer_id = c.customer_id
JOIN Payment_Details pd
    ON pay.payment_id = pd.payment_id
JOIN Product p
    ON pd.product_id = p.product_id;


