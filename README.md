# 📦 Shipping Data Analysis with SQL

This project showcases various SQL techniques applied to a shipping dataset within the `amitdb` database. 
It involves creating tables, performing data analysis, joining customer information, optimizing performance with indexes, and creating a view for better analytics. 
The objective is to demonstrate SQL proficiency for data analysis and database management.

---

## 🗃️ Dataset Overview

**Main Table**: `shipping`  
**Additional Table**: `customers` (created for JOIN operations)  

### Key Columns in `shipping`:
- `ID`: Primary key (auto-increment)
- `Mode_of_Shipment`: Mode used to deliver the product (Flight, Ship, Road)
- `Warehouse_block`: The warehouse section (A–F)
- `Customer_rating`: Rating given by customer (1–5)
- `Cost_of_the_Product`: Product cost in rupees
- `Gender`: Customer gender
- `Product_importance`: High / Medium / Low
- `Reached.on.Time_Y.N`: 1 = Yes, 0 = No

---

## 📊 SQL Operations Performed

### ✅ a. Basic SQL Queries (SELECT, WHERE, ORDER BY, GROUP BY)
- Extract total orders per warehouse using `'Flight'` mode.
- Grouped and sorted results to identify top-performing blocks.

### ✅ b. JOINs with Customer Table
- Created a sample `customers` table.
- Added `customer_id` to `shipping` table.
- Performed:
  - **INNER JOIN**
  - **LEFT JOIN**
  - **RIGHT JOIN**

### ✅ c. Subquery
- Identified orders where product cost is greater than the average product cost.

### ✅ d. Aggregation
- Used `SUM()` and `AVG()` functions to find:
  - Total spending by gender
  - Average customer ratings

### ✅ e. Views
- Created a view `shipment_summary_view` for simplified shipment analysis.

### ✅ f. Index Optimization
- Created indexes on columns like `Gender` and a composite index on `Customer_rating` and `Cost_of_the_Product` to improve query performance.

---

## 🔧 Technologies Used

- **MySQL** (Workbench or any SQL IDE)
- Sample data manually inserted or loaded from `.csv`
- Basic database design and performance optimization techniques

---

## 📌 How to Use

1. Import the `shipping` dataset into your MySQL database as `amitdb`.
2. Run the SQL script `shipping_analysis.sql` step-by-step.
3. Use `SELECT * FROM shipment_summary_view;` to test your view.
4. Check performance differences before and after adding indexes.

---


