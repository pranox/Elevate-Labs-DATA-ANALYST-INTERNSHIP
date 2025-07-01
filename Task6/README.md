
# Task 6: Sales Trend Analysis Using Aggregations

This task focuses on analyzing sales trends using SQL aggregation techniques.

## ✅ Objective
- Analyze monthly revenue and order volume from an `online_sales` dataset.

## 📄 Files Included
- `task6_sales_trend_analysis.sql` — SQL script containing:
  - Table creation (`online_sales`)
  - Sample data insertion
  - Queries to calculate monthly revenue and total orders
  - Query to fetch top 3 months by revenue

## 🔧 Tools Used
- SQLite (compatible with DB Browser for SQLite)
- Can be adapted to MySQL/PostgreSQL with minor syntax changes

## 📊 SQL Concepts Used
- `GROUP BY`
- `SUM()`, `COUNT(DISTINCT)`
- `strftime()` for extracting month/year (SQLite)
- `ORDER BY` and `LIMIT`

## 🚀 Output
- A summary of total revenue and total orders grouped by year and month.
- Top 3 months with highest revenue.

## 💡 Learning Outcome
- How to perform time-based analysis using SQL aggregation functions.
