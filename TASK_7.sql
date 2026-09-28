-- Create Database
CREATE DATABASE IF NOT EXISTS ECommerceDB3;
USE ECommerceDB3;

-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Create Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

-- Insert Customers
INSERT INTO Customers
(customer_id, customer_name, email, city)
VALUES
(1, 'Arun', 'arun@gmail.com', 'Chennai'),
(2, 'Priya', 'priya@gmail.com', 'Madurai'),
(3, 'Karthik', 'karthik@gmail.com', 'Coimbatore'),
(4, 'Divya', 'divya@gmail.com', 'Chennai'),
(5, 'Rahul', 'rahul@gmail.com', 'Salem');

-- Insert Products
INSERT INTO Products
(product_id, product_name, category, price, stock)
VALUES
(101, 'Laptop', 'Electronics', 55000.00, 10),
(102, 'Mobile', 'Electronics', 25000.00, 20),
(103, 'Headphones', 'Accessories', 2000.00, 15),
(104, 'Keyboard', 'Accessories', 1500.00, 0),
(105, 'T-Shirt', 'Fashion', 800.00, 30);

-- SQL Query Implementation for E-Commerce

SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.price,
    p.stock,
    c.customer_name,
    c.city
FROM Products p
JOIN Customers c
ON c.city = 'Chennai'
WHERE p.price < 30000
AND p.stock > 0
ORDER BY p.price DESC
LIMIT 5;