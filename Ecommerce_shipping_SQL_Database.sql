use amitdb;
select *from shipping;

-- a. SELECT, WHERE, ORDER BY, GROUP BY
SELECT Warehouse_block, COUNT(*) AS Total_Orders
FROM shipping
WHERE Mode_of_Shipment = 'Flight'
GROUP BY Warehouse_block
ORDER BY Total_Orders DESC;

-- b. JOINS (Simulating by creating a sample customers table and joining)
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(10)
);

-- Add customer_id to ecommerce_shipping (for join purposes)
ALTER TABLE shipping ADD COLUMN customer_id INT;

-- Insert sample customers
INSERT INTO customers VALUES
(101, 'Amit Sharma', 'M'),
(102, 'Priya Kapoor', 'F'),
(103, 'Ravi Desai', 'M'),
(104, 'Neha Singh', 'F'),
(105, 'Arjun Reddy', 'M');

DESCRIBE shipping;

ALTER TABLE shipping ADD COLUMN id INT PRIMARY KEY AUTO_INCREMENT;

UPDATE shipping SET customer_id = 101 WHERE id = 1;
UPDATE shipping SET customer_id = 102 WHERE id = 2;
UPDATE shipping SET customer_id = 103 WHERE id = 3;
UPDATE shipping SET customer_id = 104 WHERE id = 4;
UPDATE shipping SET customer_id = 105 WHERE id = 5;

SELECT id, customer_id FROM shipping;

-- INNER JOIN
SELECT es.ID, c.customer_name, es.Mode_of_Shipment
FROM shipping es
INNER JOIN customers c ON es.customer_id = c.customer_id;

-- LEFT JOIN
SELECT c.customer_name, es.ID, es.Mode_of_Shipment
FROM customers c
LEFT JOIN shipping es ON es.customer_id = c.customer_id;

-- RIGHT JOIN (Only in MySQL)
SELECT c.customer_name, es.ID, es.Mode_of_Shipment
FROM customers c
RIGHT JOIN shipping es ON es.customer_id = c.customer_id;

-- c. Subquery: Get all orders where product cost > average product cost
SELECT ID, Cost_of_the_Product
FROM shipping
WHERE Cost_of_the_Product > (
    SELECT AVG(Cost_of_the_Product) FROM shipping
);

-- d. Aggregate functions (SUM, AVG)
SELECT Gender, 
       SUM(Cost_of_the_Product) AS Total_Spent, 
       AVG(Customer_rating) AS Avg_Rating
FROM shipping
GROUP BY Gender;

SHOW COLUMNS FROM shipping;

-- e. Create view for analysis
CREATE VIEW shipment_summary_view AS
SELECT ID, Warehouse_block, Mode_of_Shipment, Product_importance, `Reached.on.Time_Y.N`
FROM shipping;

SELECT * FROM shipment_summary_view LIMIT 10;

-- f. Optimize queries with indexes
DROP INDEX idx_gender ON shipping;
CREATE INDEX idx_gender ON shipping(Gender(10));
SHOW INDEXES FROM shipping;

