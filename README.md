1)creating a manual data
CREATE DATABASE IF NOT EXISTS online_sales;
USE online_sales;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id VARCHAR(10)
);
2)inserting data to the orders table
INSERT INTO online_sales.orders (order_id, order_date, amount, product_id) VALUES
(1001, '2024-01-15', 120.00, 'P001'),
(1002, '2024-01-18', 250.00, 'P002'),
(1003, '2024-02-02', 340.00, 'P001'),
(1004, '2024-02-25', 80.00, 'P003'),
(1005, '2024-03-10', 150.00, 'P002'),
(1006, '2024-03-22', 200.00, 'P001'),
(1007, '2024-04-01', 300.00, 'P004'),
(1008, '2024-04-15', 100.00, 'P003'),
(1009, '2024-05-05', 175.00, 'P002'),
(1010, '2024-05-20', 225.00, 'P004');
3)view data by using select * from orders;
4)extracting month from the data
SELECT
    EXTRACT(MONTH FROM order_date) AS month
FROM
    online_sales.orders;
5)GROUP BY year/month in SQL
To do this properly, especially in MySQL, you should use EXTRACT(YEAR ...) and EXTRACT(MONTH ...) in both the SELECT and GROUP BY clauses.
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
6)Use SUM() for revenue, which is used to calculate the total revenue for each month (or group).
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
7)COUNT(DISTINCT order_id) for volume, which refers to counting the number of unique orders placed each month.
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
8)ORDER BY for sorting, which ensures that your results are listed in chronological order—by year and month.
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
9)WHERE Clause
It restricts the data to a specific time range, such as one year (2024) or a few specific months.
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
