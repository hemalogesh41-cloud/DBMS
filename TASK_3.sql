CREATE DATABASE SellerInventoryDB;
USE SellerInventoryDB;
CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100)
);
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    stock_status VARCHAR(20),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
CREATE TABLE Seller_Product (
    seller_product_id INT PRIMARY KEY,
    seller_id INT,
    product_id INT,
    selling_price DECIMAL(10,2),
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    seller_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
INSERT INTO Seller VALUES
(1, 'Arun Traders', '9876543210', 'arun@gmail.com'),
(2, 'Priya Stores', '9876501234', 'priya@gmail.com'),
(3, 'Kavin Enterprises', '9123456780', 'kavin@gmail.com');
INSERT INTO Product VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Smartphone', 'Electronics', 25000.00),
(103, 'T-Shirt', 'Clothing', 800.00),
(104, 'Headphones', 'Accessories', 3000.00);
INSERT INTO Inventory VALUES
(201, 101, 15, 'Available'),
(202, 102, 25, 'Available'),
(203, 103, 0, 'Unavailable'),
(204, 104, 10, 'Available');
INSERT INTO Seller_Product VALUES
(301, 1, 101, 54000.00),
(302, 2, 102, 24500.00),
(303, 3, 103, 750.00),
(304, 1, 104, 2800.00);
INSERT INTO Sales VALUES
(401, 1, 101, 2, '2026-09-01'),
(402, 2, 102, 3, '2026-09-02'),
(403, 3, 103, 5, '2026-09-03'),
(404, 1, 104, 2, '2026-09-04');
SELECT
    s.seller_id,
    s.seller_name,
    p.product_id,
    p.product_name,
    p.category,
    sp.selling_price,
    i.quantity AS stock_quantity,
    i.stock_status,
    sa.quantity AS sold_quantity,
    sa.sale_date
FROM Seller s
JOIN Seller_Product sp
    ON s.seller_id = sp.seller_id
JOIN Product p
    ON sp.product_id = p.product_id
JOIN Inventory i
    ON p.product_id = i.product_id
JOIN Sales sa
    ON s.seller_id = sa.seller_id
    AND p.product_id = sa.product_id;



