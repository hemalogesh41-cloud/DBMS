CREATE DATABASE ProductReviewDB;
USE ProductReviewDB;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    rating INT,
    review_text VARCHAR(200),
    review_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(50),
    location VARCHAR(50)
);
CREATE TABLE Product_Seller (
    product_seller_id INT PRIMARY KEY,
    product_id INT,
    seller_id INT,
    stock INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id)
);
INSERT INTO Customer VALUES
(1, 'Arun', 'arun@gmail.com'),
(2, 'Priya', 'priya@gmail.com'),
(3, 'Kavin', 'kavin@gmail.com');
INSERT INTO Product VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Smartphone', 'Electronics', 25000.00),
(103, 'Headphones', 'Accessories', 3000.00);
INSERT INTO Review VALUES
(201, 1, 101, 5, 'Excellent product', '2026-09-01'),
(202, 2, 102, 4, 'Good quality', '2026-09-02'),
(203, 3, 103, 3, 'Average product', '2026-09-03');
INSERT INTO Seller VALUES
(301, 'ABC Electronics', 'Chennai'),
(302, 'XYZ Stores', 'Bangalore'),
(303, 'Global Traders', 'Coimbatore');
INSERT INTO Product_Seller VALUES
(401, 101, 301, 10),
(402, 102, 302, 20),
(403, 103, 303, 30);
SELECT
    r.review_id,
    c.customer_name,
    p.product_name,
    p.category,
    r.rating,
    r.review_text,
    s.seller_name,
    ps.stock,
    r.review_date
FROM Review r
JOIN Customer c
    ON r.customer_id = c.customer_id
JOIN Product p
    ON r.product_id = p.product_id
JOIN Product_Seller ps
    ON p.product_id = ps.product_id
JOIN Seller s
    ON ps.seller_id = s.seller_id;
