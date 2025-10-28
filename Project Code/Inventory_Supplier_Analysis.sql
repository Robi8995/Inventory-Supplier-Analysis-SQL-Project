-- Create a new database
CREATE DATABASE inventory_db;

-- Use the database
USE inventory_db;

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    location VARCHAR(100),
    contact_email VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    supplier_id INT,
    unit_cost DECIMAL(10,2),
    unit_price DECIMAL(10,2),
    stock_on_hand INT,
    reorder_point INT,
    lead_time_days INT,
    annual_sales_units INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

USE inventory_db;

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS suppliers;

USE inventory_db;

SELECT * FROM suppliers LIMIT 10;
SELECT * FROM products LIMIT 10;

-- Stock Levels & Reorder Alerts

SELECT product_id, product_name, category, stock_on_hand, reorder_point,
       CASE 
           WHEN stock_on_hand <= reorder_point THEN 'Reorder Needed'
           ELSE 'Sufficient Stock'
       END AS stock_status
FROM products
ORDER BY stock_status DESC, stock_on_hand ASC;

-- Supplier Dependency Analysis

SELECT s.supplier_id, s.supplier_name, COUNT(p.product_id) AS total_products,
       ROUND(COUNT(p.product_id) * 100.0 / (SELECT COUNT(*) FROM products),2) AS percent_of_total_products
FROM suppliers s
JOIN products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_products DESC;

-- Product Inventory Turnover

SELECT product_id, product_name, annual_sales_units, stock_on_hand,
       ROUND(annual_sales_units / NULLIF(stock_on_hand,0), 2) AS turnover_ratio
FROM products
ORDER BY turnover_ratio DESC;

-- Category-wise Inventory Performance

SELECT category,
       SUM(annual_sales_units) AS total_units_sold,
       SUM(stock_on_hand) AS total_stock_on_hand,
       ROUND(SUM(annual_sales_units) / NULLIF(SUM(stock_on_hand),0),2) AS category_turnover_ratio
FROM products
GROUP BY category
ORDER BY category_turnover_ratio DESC;

-- Reorder Priority Ranking

SELECT product_id, product_name, stock_on_hand, reorder_point, annual_sales_units,
       ROUND(annual_sales_units / NULLIF(stock_on_hand,0), 2) AS turnover_ratio,
       CASE 
           WHEN stock_on_hand <= reorder_point THEN 'High Priority'
           ELSE 'Normal'
       END AS reorder_priority
FROM products
ORDER BY reorder_priority DESC, turnover_ratio DESC;

-- High-Turnover Products (Top 50)

SELECT product_id, product_name, category, annual_sales_units, stock_on_hand,
       ROUND(annual_sales_units / NULLIF(stock_on_hand,0), 2) AS turnover_ratio
FROM products
ORDER BY turnover_ratio DESC
LIMIT 50;

-- Low Stock Alerts

SELECT product_id, product_name, category, stock_on_hand, reorder_point,
       reorder_point - stock_on_hand AS units_below_reorder,
       ROUND(stock_on_hand / (annual_sales_units / 365), 2) AS days_to_stockout
FROM products
WHERE stock_on_hand <= reorder_point
ORDER BY stock_on_hand ASC;

-- Supplier Performance Metrics

SELECT s.supplier_id, s.supplier_name, s.location, COUNT(p.product_id) AS total_products,
       ROUND(AVG(p.stock_on_hand), 2) AS avg_stock,
       ROUND(AVG(p.annual_sales_units), 2) AS avg_annual_sales
FROM suppliers s
LEFT JOIN products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name, s.location
ORDER BY total_products DESC;

-- Category Performance Dashboard

SELECT category,
       COUNT(*) AS total_products,
       ROUND(AVG(stock_on_hand), 2) AS avg_stock,
       SUM(annual_sales_units) AS total_annual_sales,
       ROUND(SUM(annual_sales_units) / NULLIF(SUM(stock_on_hand),0), 2) AS turnover_ratio,
       MIN(stock_on_hand) AS min_stock,
       MAX(stock_on_hand) AS max_stock
FROM products
GROUP BY category
ORDER BY turnover_ratio DESC;

-- Stock Status Classification

SELECT 
    CASE 
        WHEN stock_on_hand = 0 THEN 'Out of Stock'
        WHEN stock_on_hand < 25 THEN 'Emergency Stock'
        WHEN stock_on_hand <= reorder_point THEN 'Low Stock'
        ELSE 'Sufficient Stock'
    END AS stock_category,
    COUNT(*) AS product_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM products), 2) AS percentage
FROM products
GROUP BY stock_category
ORDER BY product_count DESC;
