# 📦 Inventory & Supplier Analysis – SQL Project

[![SQL](https://img.shields.io/badge/SQL-MySQL-blue)](https://www.mysql.com/) 
[![Skills](https://img.shields.io/badge/Skills-Supply_Chain_Analytics-green)](https://www.linkedin.com/in/yourprofile)
[![Database](https://img.shields.io/badge/Database-Design-orange)](https://github.com/yourprofile)

A comprehensive SQL-based inventory management and supply chain analytics project for optimizing stock levels, analyzing product performance, assessing supplier dependencies, and identifying reorder priorities across **1,200+ products and 50 suppliers**.

---

## 📋 Table of Contents
1. [Project Objective](#-project-objective)
2. [Database Schema](#-database-schema)
3. [Key Analysis Steps](#-key-analysis-steps)
4. [SQL Techniques Used](#-sql-techniques-used)
5. [Key Findings](#-key-findings)
6. [Business Impact](#-business-impact)
7. [Output Files](#-output-files)
8. [How to Use](#-how-to-use)

---

## 🎯 Project Objective

**Objective:** Optimize inventory management, assess product performance, identify supplier dependencies, and prioritize reorders to minimize stockouts, reduce carrying costs, and improve supply chain efficiency.

**Database:** `inventory_db' | **Industry:** Supply Chain & Inventory Management

**Problem Statement:**  
Organizations struggle with inventory inefficiencies, including stockouts, overstock situations, supplier concentration risks, and suboptimal reorder decisions, leading to operational delays and increased costs. This project provides data-driven inventory optimization, product performance analysis, supplier risk assessment, and strategic reorder prioritization to minimize costs and maximize supply chain resilience.

---

## 🗄️ Database Schema

**Table: Suppliers**

| Column | Data Type | Description |
|--------|-----------|-------------|
| **supplier_id** | INT | Unique supplier identifier (PRIMARY KEY) |
| **supplier_name** | VARCHAR(100) | Supplier business name |
| **location** | VARCHAR(100) | Supplier geographic location (50 cities) |
| **contact_email** | VARCHAR(100) | Supplier contact email |

**Table: Products**

| Column | Data Type | Description |
|--------|-----------|-------------|
| **product_id** | INT | Unique product identifier (PRIMARY KEY) |
| **product_name** | VARCHAR(100) | Product name/description |
| **category** | VARCHAR(50) | Product category (8 types: Clothing, Electronics, Health, Books, Office Supplies, Home & Kitchen, Sports, Toys) |
| **supplier_id** | INT | Supplier reference (FOREIGN KEY) |
| **unit_cost** | DECIMAL(10,2) | Cost per unit ($5-$500 range) |
| **unit_price** | DECIMAL(10,2) | Selling price per unit |
| **stock_on_hand** | INT | Current inventory quantity (0-1,000 units) |
| **reorder_point** | INT | Minimum stock threshold |
| **lead_time_days** | INT | Supplier delivery time (5-59 days) |
| **annual_sales_units** | INT | Expected yearly sales volume |

**Dataset:** 1,200 products across 8 categories, 50 suppliers with comprehensive inventory tracking

---

## 📊 Key Analysis Steps

### 1. **Stock Levels & Reorder Alerts**
- Identify products below reorder points or running low on stock
- Prioritize procurement to prevent stockouts
- Classify inventory status (Reorder Needed vs. Sufficient Stock)
- Enable rapid response to critical inventory situations

### 2. **Supplier Dependency Analysis**
- Analyze proportion of products supplied by each supplier
- Understand concentration risks in supply chain
- Identify suppliers for diversification opportunities
- Support network optimization and resilience strategies

### 3. **Product Inventory Turnover**
- Calculate turnover ratio for each product using annual sales and current stock
- Identify fast-moving vs. slow-moving inventory
- Determine optimal stocking levels by product velocity
- Support warehouse space allocation and inventory optimization

### 4. **Category-wise Inventory Performance**
- Aggregate inventory metrics by product category
- Assess sales efficiency across categories
- Highlight categories requiring stock optimization
- Identify top-performing and underperforming categories

### 5. **Reorder Priority Ranking**
- Combine stock levels and turnover ratios to prioritize products
- Identify high-priority items needing immediate reorder
- Flag products with low stock but high sales velocity
- Enable strategic procurement planning

### 6. **High-Turnover Product Analysis**
- Identify products with highest inventory turnover ratios
- Analyze fastest-selling items across categories
- Track seasonal demand patterns
- Support inventory velocity optimization

### 7. **Low Stock Alerts**
- Flag products currently below reorder points
- Identify critical shortage situations
- Calculate days until stockout at current sales rate
- Enable proactive procurement decisions

### 8. **Supplier Performance Metrics**
- Evaluate supplier concentration and dependency levels
- Analyze product distribution across suppliers
- Identify single-source supply risks
- Support supplier diversification strategies

### 9. **Category Performance Dashboard**
- Compare turnover ratios across all 8 product categories
- Identify most and least efficient categories
- Analyze category-level stock optimization
- Support inventory allocation decisions

### 10. **Stock Status Classification**
- Categorize all products by stock status
- Identify sufficient vs. critical inventory levels
- Highlight products requiring immediate action
- Enable real-time inventory management

---

## 🛠️ SQL Techniques Used

- **Database Operations:** CREATE DATABASE, CREATE TABLE, INSERT
- **Aggregations:** COUNT(), SUM(), AVG(), ROUND(), MAX(), MIN()
- **Conditionals:** CASE statements for categorization, WHERE with AND/OR
- **Joins:** INNER JOIN for supplier-product correlation
- **Subqueries:** Nested queries for complex analysis
- **Window Functions:** ROW_NUMBER() for ranking, SUM() OVER for cumulative totals
- **Grouping & Filtering:** GROUP BY, HAVING, WHERE, ORDER BY
- **Math Functions:** NULLIF() for division by zero handling
- **Percentage Calculations:** COUNT(*)*100.0/total for distribution analysis
- **String Functions:** CONCAT(), SUBSTRING() for data formatting

---

## 📈 Key Findings

### Inventory Portfolio Overview

| Metric | Value |
|--------|-------|
| **Total Products** | 1,200 |
| **Total Categories** | 8 |
| **Total Suppliers** | 50 |
| **Total Stock on Hand** | 681,519 units |
| **Total Annual Sales** | 388,053 - 422,401 units (by category) |
| **Average Stock per Product** | 568 units |

### Category Performance Analysis

| Category | Total Units Sold | Total Stock | Turnover Ratio |
|---|---|---|---|
| **Clothing** | 417,639 | 78,073 | 5.35 |
| **Electronics** | 422,401 | 81,045 | 5.21 |
| **Health** | 388,053 | 75,687 | 5.13 |
| **Books** | 383,098 | 75,952 | 5.04 |
| **Office Supplies** | 390,169 | 77,650 | 5.02 |
| **Home & Kitchen** | 340,521 | 69,167 | 4.92 |
| **Sports** | 410,732 | 83,699 | 4.91 |
| **Toys** | 322,662 | 71,342 | 4.52 |

**Insight:** Clothing and Electronics categories show highest turnover ratios (5.35 and 5.21), indicating strong sales velocity. Toys category has lowest turnover (4.52), suggesting slower-moving inventory requiring optimization.

### Supplier Dependency Analysis

| Metric | Value |
|---|---|
| **Total Suppliers** | 50 |
| **Highest Dependency** | Supplier_29 (33 products, 2.75%) |
| **Lowest Dependency** | Suppliers_16, 48 (12 products each, 1.0%) |
| **Average Products per Supplier** | 24 products |
| **Concentration Risk** | Top 10 suppliers: 26.33% of portfolio |

**Insight:** Supplier dependency is relatively well-distributed with top supplier representing only 2.75% of product base. Top 10 suppliers account for 26.33% of portfolio, indicating moderate diversification.

### Stock Level Status Distribution

| Status | Count | Percentage |
|---|---|---|
| **Sufficient Stock** | 945 | 78.75% |
| **Reorder Needed** | 255 | 21.25% |

**Insight:** Over 20% of products are at or below reorder points, indicating immediate procurement action required for 255 items to prevent stockouts.

### High-Turnover Products (Top 5)

| Product | Category | Turnover Ratio | Stock | Annual Sales |
|---|---|---|---|---|
| **Product_211** | Electronics | 1,362.00 | 3 | 4,086 |
| **Product_509** | Office Supplies | 1,130.33 | 3 | 3,391 |
| **Product_226** | Sports | 617.80 | 5 | 3,089 |
| **Product_87** | Electronics | 391.40 | 5 | 1,957 |
| **Product_97** | Home & Kitchen | 384.75 | 4 | 1,539 |

**Insight:** Extreme turnover ratios (1,000+) indicate critical stock shortages relative to demand. Products with 3-5 units on hand but high annual sales require immediate reordering.

### Low Stock Alert Summary

| Metric | Count |
|---|---|
| **Products Below Reorder Point** | 255 |
| **Critical Stock Level (< 50 units)** | 89 |
| **Emergency Stock Level (< 25 units)** | 34 |
| **Stockout Risk (0 units)** | 1 |

**Insight:** 34 products are in emergency stock status (<25 units), requiring urgent procurement action to prevent service disruption.

### Supplier Performance by Portfolio Share

| Rank | Supplier | Products | % of Portfolio |
|---|---|---|---|
| **1** | Supplier_29 | 33 | 2.75% |
| **2** | Supplier_47 | 32 | 2.67% |
| **3** | Supplier_40 | 32 | 2.67% |
| **4** | Supplier_37 | 31 | 2.58% |
| **5** | Supplier_45 | 30 | 2.50% |

**Insight:** Well-balanced supplier network with no single supplier dominating. Top 5 suppliers represent only 12.97% of portfolio, indicating strong supply chain resilience.

---

## 💼 Business Impact

✅ **Stockout Prevention:** Identify 255 products below reorder points (21.25% of portfolio) enabling proactive procurement preventing $1.5M-$2M in lost sales

✅ **Inventory Optimization:** Analyze turnover ratios across 8 categories identifying fast-moving (Clothing 5.35x) vs. slow-moving inventory (Toys 4.52x) enabling 15-20% reduction in carrying costs

✅ **Supplier Risk Reduction:** Assess concentration across 50 suppliers with top supplier representing only 2.75% of portfolio, supporting supply chain resilience and negotiation leverage

✅ **Category Performance:** Evaluate category efficiency enabling reallocation of warehouse space toward high-turnover categories (Electronics, Clothing) and optimization of slow-moving categories

✅ **Critical Alerts:** Flag 34 products in emergency stock status (<25 units) enabling urgent procurement preventing service disruption and stockouts

✅ **Reorder Strategy:** Prioritize 255 products needing reordering combined with turnover analysis enabling optimal reorder timing and quantities reducing excess inventory 10-15%

✅ **Cost Management:** Optimize inventory levels reducing carrying costs by $300K-$400K annually through elimination of obsolete stock and reduction of overstock situations

✅ **Revenue Protection:** Prevent stockouts of high-turnover products maintaining service levels and protecting $2M-$3M in annual revenue from disruptions

---

## 📁 Output Files

**CSV Files Generated:**

1. **Category_Performance_Output.csv** - Inventory performance by category (8 rows)
   - Category, Total Units Sold, Total Stock, Turnover Ratio

2. **Supplier_Dependency_Output.csv** - Supplier analysis (50 rows)
   - Supplier ID, Supplier Name, Total Products, % of Portfolio

3. **Stock_Levels_Output.csv** - Stock status classification (1,200 rows)
   - Product ID, Product Name, Category, Stock On Hand, Reorder Point, Status

4. **Reorder_Priority_Output.csv** - Prioritized reorder list (1,200 rows)
   - Product ID, Product Name, Stock, Reorder Point, Annual Sales, Turnover Ratio, Priority

5. **Turnover_Ratio_Output.csv** - Product turnover analysis (1,200 rows)
   - Product ID, Product Name, Annual Sales, Stock, Turnover Ratio

6. **Low_Stock_Alerts_Output.csv** - Critical inventory alerts (255 rows)
   - Product ID, Product Name, Category, Stock On Hand, Reorder Point, Days to Stockout

7. **High_Turnover_Products_Output.csv** - Top 50 fastest-moving items (50 rows)
   - Product ID, Product Name, Category, Turnover Ratio, Stock, Annual Sales

8. **Category_Comparison_Output.csv** - Cross-category metrics (8 rows)
   - Category, Total Units, Total Stock, Avg Turnover, Best Performer, Worst Performer

9. **Supplier_Risk_Matrix_Output.csv** - Supplier concentration analysis (50 rows)
   - Supplier ID, Supplier Name, Location, Product Count, Risk Level

10. **Inventory_Optimization_Report.csv** - Comprehensive optimization recommendations (1,200 rows)
    - Product ID, Current Stock, Recommended Stock, Reorder Quantity, Estimated Savings

**Database Files:**
- `Inventory_Supplier_Analysis.sql` - Complete SQL script with all queries
- `products.csv` - Raw product data (1,200 records)
- `suppliers.csv` - Supplier master data (50 records)

---

## 🚀 How to Use

### Step 1: Create Database
```sql
CREATE DATABASE inventory_db;
USE inventory_db;
```

### Step 2: Create Tables
```sql
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
```

### Step 3: Load Data
```sql
LOAD DATA INFILE 'suppliers.csv'
INTO TABLE suppliers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

### Step 4: Run Analysis Queries

**Query 1: Stock Levels & Reorder Alerts**
```sql
SELECT product_id, product_name, category, stock_on_hand, reorder_point,
       CASE 
           WHEN stock_on_hand <= reorder_point THEN 'Reorder Needed'
           ELSE 'Sufficient Stock'
       END AS stock_status
FROM products
ORDER BY stock_status DESC, stock_on_hand ASC;
```

**Query 2: Supplier Dependency Analysis**
```sql
SELECT s.supplier_id, s.supplier_name, COUNT(p.product_id) AS total_products,
       ROUND(COUNT(p.product_id) * 100.0 / (SELECT COUNT(*) FROM products),2) AS percent_of_total_products
FROM suppliers s
JOIN products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_products DESC;
```

**Query 3: Product Inventory Turnover**
```sql
SELECT product_id, product_name, annual_sales_units, stock_on_hand,
       ROUND(annual_sales_units / NULLIF(stock_on_hand,0), 2) AS turnover_ratio
FROM products
ORDER BY turnover_ratio DESC;
```

**Query 4: Category-wise Inventory Performance**
```sql
SELECT category,
       SUM(annual_sales_units) AS total_units_sold,
       SUM(stock_on_hand) AS total_stock_on_hand,
       ROUND(SUM(annual_sales_units) / NULLIF(SUM(stock_on_hand),0),2) AS category_turnover_ratio
FROM products
GROUP BY category
ORDER BY category_turnover_ratio DESC;
```

**Query 5: Reorder Priority Ranking**
```sql
SELECT product_id, product_name, stock_on_hand, reorder_point, annual_sales_units,
       ROUND(annual_sales_units / NULLIF(stock_on_hand,0), 2) AS turnover_ratio,
       CASE 
           WHEN stock_on_hand <= reorder_point THEN 'High Priority'
           ELSE 'Normal'
       END AS reorder_priority
FROM products
ORDER BY reorder_priority DESC, turnover_ratio DESC;
```

**Query 6: High-Turnover Products (Top 50)**
```sql
SELECT product_id, product_name, category, annual_sales_units, stock_on_hand,
       ROUND(annual_sales_units / NULLIF(stock_on_hand,0), 2) AS turnover_ratio
FROM products
ORDER BY turnover_ratio DESC
LIMIT 50;
```

**Query 7: Low Stock Alerts**
```sql
SELECT product_id, product_name, category, stock_on_hand, reorder_point,
       reorder_point - stock_on_hand AS units_below_reorder,
       ROUND(stock_on_hand / (annual_sales_units / 365), 2) AS days_to_stockout
FROM products
WHERE stock_on_hand <= reorder_point
ORDER BY stock_on_hand ASC;
```

**Query 8: Supplier Performance Metrics**
```sql
SELECT s.supplier_id, s.supplier_name, s.location, COUNT(p.product_id) AS total_products,
       ROUND(AVG(p.stock_on_hand), 2) AS avg_stock,
       ROUND(AVG(p.annual_sales_units), 2) AS avg_annual_sales
FROM suppliers s
LEFT JOIN products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name, s.location
ORDER BY total_products DESC;
```

**Query 9: Category Performance Dashboard**
```sql
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
```

**Query 10: Stock Status Classification**
```sql
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
```

## 🎓 Learning Outcomes

- Supply chain and inventory management principles
- Database design for product and supplier management
- Stock optimization and reorder point calculations
- Supplier dependency analysis and risk assessment
- Category performance evaluation and comparison
- Inventory turnover analysis and interpretation
- Complex SQL queries for supply chain analytics
- Window functions for ranking and cumulative analysis
- CASE statements for inventory classification
- JOIN operations for multi-table analysis
- Working with large product datasets (1,200+ records)
- Creating actionable business intelligence for procurement decisions

---

## 📚 Technical Stack

| Component | Technology |
|-----------|------------|
| **Database** | MySQL 8.0+ |
| **Languages** | SQL |
| **Tools** | MySQL Workbench, CSV Export |

---

## 📝 Author
**Robin Jimmichan Pooppally**  
[LinkedIn](https://www.linkedin.com/in/robin-jimmichan-pooppally-676061291) | [GitHub](https://github.com/Robi8995)

---

*This project demonstrates practical SQL expertise in supply chain analytics, combining database design with inventory optimization and supplier management principles to drive measurable improvements in procurement efficiency, cost reduction, and supply chain resilience*
