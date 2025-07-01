
-- Task 6: Sales Trend Analysis Using Aggregations

-- 1. Create table
CREATE TABLE online_sales (
    order_id INTEGER PRIMARY KEY,
    order_date TEXT NOT NULL,
    amount REAL NOT NULL,
    product_id INTEGER
);

-- 2. Insert sample data
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2024-01-15', 250.00, 101),
(2, '2024-01-20', 180.50, 102),
(3, '2024-02-10', 300.00, 103),
(4, '2024-02-18', 450.25, 104),
(5, '2024-03-05', 520.00, 105),
(6, '2024-03-15', 210.00, 106),
(7, '2024-04-10', 800.00, 107),
(8, '2024-04-22', 130.00, 108),
(9, '2024-05-05', 340.75, 109),
(10, '2024-05-18', 220.00, 110);

-- 3. Monthly Revenue and Order Volume
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
GROUP BY 
    year, month
ORDER BY 
    year, month;

-- 4. Top 3 months by revenue
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    year, month
ORDER BY 
    total_revenue DESC
LIMIT 3;
