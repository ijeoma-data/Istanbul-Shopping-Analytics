
/*===============================================================
Project:   Istanbul Shopping Analytics
Author:    Ijeoma Okeke
Tool:      SQL Server Management Studio (SSMS)
Database:  ShoppingDB
Table:     customer_shopping
Rows:      99,457
 
Objective:
To analyze customer shopping behavior and revenue performance
across 10 Istanbul shopping malls covering 99,457 transactions
from January 2021 to March 2023.
===============================================================*/
 
USE ShoppingDB;
SELECT * FROM customer_shopping;
 
---===============================
--- Query 1. Overall Business KPIs
---===============================

SELECT
COUNT(*) AS Total_Transaction,
COUNT(DISTINCT Customer_ID) AS Total_Customers,
SUM(Quantity*Price) AS Total_Revenue,
ROUND(AVG(Quantity * Price), 2) AS Avg_Order_Value,
SUM(Quantity) AS Total_Item_Sold
FROM customer_shopping

---====================================
---Query 2. Revenue by Product Category
---====================================

SELECT
Category AS Product_Category,
COUNT(*) AS Total_Orders,
SUM(Quantity) AS Total_Items_sold,
ROUND(SUM(Quantity * Price), 2) AS Total_Revenue,
ROUND(AVG(Quantity * Price), 2) AS Avg_Order_Value
FROM customer_shopping
GROUP BY Category
ORDER BY Total_Revenue DESC

---============================
---Query 3. Monthly Sales Trend
---============================

SELECT
YEAR(Invoice_Date) AS YEAR,
MONTH(Invoice_Date) AS Month_Number,
DATENAME(MONTH, Invoice_Date) AS Month_Name,
COUNT(*) AS Total_Orders,
ROUND(SUM(Quantity * Price), 2) AS Monthly_Revenue
FROM customer_shopping
GROUP BY
YEAR(Invoice_Date),
MONTH(Invoice_Date),
DATEName(MONTH, Invoice_Date)
ORDER BY Year, Month_Number

---==========================
---Query 4. Revenue by Gender
---==========================

SELECT 
    gender,
    COUNT(*) AS Total_Transactions,
    COUNT(DISTINCT customer_id) AS Total_Customers,
    ROUND(SUM(quantity * price), 2) AS Total_Revenue,
    ROUND(AVG(quantity * price), 2) AS Avg_Order_Value
FROM customer_shopping
GROUP BY gender
ORDER BY Total_Revenue DESC;

---=============================
---Query 5. Revenue by Age Group
---=============================

SELECT 
    Age_Group,
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(quantity * price), 2) AS Total_Revenue,
    ROUND(AVG(quantity * price), 2) AS Avg_Order_Value
FROM customer_shopping
GROUP BY Age_Group
ORDER BY Total_Revenue DESC;

---=================================
--- Query 6. Payment Method Analysis
---=================================

SELECT 
    payment_method,
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(quantity * price), 2) AS Total_Revenue,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage_Share
FROM customer_shopping
GROUP BY payment_method
ORDER BY Total_Revenue DESC;

---==============================
--- Query 7. Top Performing Malls
---==============================

SELECT 
    shopping_mall,
    COUNT(*) AS Total_Transactions, 
    COUNT(DISTINCT customer_id) AS Unique_Customers,
    ROUND(SUM(quantity * price), 2) AS Total_Revenue,
    ROUND(AVG(quantity * price), 2) AS Avg_Order_Value
FROM customer_shopping
GROUP BY shopping_mall
ORDER BY Total_Revenue DESC;

---================================
--- Query 8. Best Category Per Mall
---================================

SELECT 
    shopping_mall,
    category,
    ROUND(SUM(quantity * price), 2) AS Revenue
FROM customer_shopping
GROUP BY shopping_mall, category
ORDER BY shopping_mall, Revenue DESC;

---==================================
--- Query 9. Yearly Revenue Comparism
---==================================

SELECT 
    YEAR(invoice_date) AS Year,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(quantity * price), 2) AS Total_Revenue,
    ROUND(AVG(quantity * price), 2) AS Avg_Order_Value
FROM customer_shopping
GROUP BY YEAR(invoice_date)
ORDER BY Year;

---============================================
--- Query 10. Top 10 Highest spending Customers
---============================================

SELECT TOP 10
    customer_id,
    COUNT(*) AS Total_Purchases,
    ROUND(SUM(quantity * price), 2) AS Lifetime_Value,
    ROUND(AVG(quantity * price), 2) AS Avg_Order_Value
FROM customer_shopping
GROUP BY customer_id
ORDER BY Lifetime_Value DESC;

USE ShoppingDB;
SELECT * FROM customer_shopping;