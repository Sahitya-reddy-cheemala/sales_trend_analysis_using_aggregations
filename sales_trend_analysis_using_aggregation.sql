CREATE DATABASE IF NOT EXISTS online_sales;
USE online_sales;
Drop table if exists orders;
-- creating the order table 
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id VARCHAR(10)
);
-- insering valeus to the table 
INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
(1011, '2024-06-02', 280.00, 'P001'),
(1012, '2024-06-18', 140.00, 'P002'),
(1013, '2024-07-03', 320.00, 'P003'),
(1014, '2024-07-19', 90.00,  'P002'),
(1015, '2024-08-07', 400.00, 'P004'),
(1016, '2024-08-24', 310.00, 'P001'),
(1017, '2024-09-10', 120.00, 'P003'),
(1018, '2024-09-22', 260.00, 'P002'),
(1019, '2024-10-01', 180.00, 'P004'),
(1020, '2024-10-16', 350.00, 'P001'),
(1021, '2024-11-05', 190.00, 'P003'),
(1022, '2024-11-21', 410.00, 'P002'),
(1023, '2024-12-04', 220.00, 'P001'),
(1024, '2024-12-19', 330.00, 'P004'),
(1025, '2024-01-25', 275.00, 'P003'),
(1026, '2024-02-10', 135.00, 'P002'),
(1027, '2024-03-12', 210.00, 'P001'),
(1028, '2024-04-22', 290.00, 'P003'),
(1029, '2024-05-27', 175.00, 'P002'),
(1030, '2024-06-30', 195.00, 'P001');
select * from orders;
-- extracting month from the order date
SELECT
    EXTRACT(MONTH FROM order_date) AS month
FROM
    online_sales.orders;
-- GROUP BY EXTRACT(YEAR...), EXTRACT(MONTH...) groups the data monthly per year.
-- This avoids mixing up March 2023 and March 2024. 
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales.orders
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;
-- Purpose of SUM()
-- SUM(amount) calculates the total sales revenue for each group (e.g., per month). 
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM
    online_sales.orders
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;
-- counting the number of unique orders placed each month.
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales.orders
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;
-- order by sorting 
-- ORDER BY arranges the grouped results by ascending or descending values—typically by year first, then month, for a monthly trend.
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales.orders
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;
-- WHERE Clause
-- It restricts the data to a specific time range, such as one year (2024) or a few specific months.
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales.orders
WHERE
    order_date BETWEEN '2024-01-01' AND '2024-12-31'  -- ✅ Specific time period
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;


