# 🛍️ Istanbul Shopping Analytics

## A Data-Driven Analysis of Customer Behavior, Sales Performance & Revenue Trends Across 10 Istanbul Shopping Malls

![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-6B2C91?style=for-the-badge&logo=powerbi)
![SQL](https://img.shields.io/badge/SQL-Server-3B0A45?style=for-the-badge&logo=microsoftsqlserver)
![Excel](https://img.shields.io/badge/Microsoft-Excel-217346?style=for-the-badge&logo=microsoftexcel)

---

## 📌 Project Overview

This project analyzes **99,457 customer transactions** across **10 shopping malls in Istanbul, Turkey** covering the period from **January 2021 to March 2023**. The goal was to uncover actionable insights about customer behavior, revenue performance, and shopping trends to support data-driven decision making for mall management.

---

## 🎯 Business Questions Investigated

1. Which product categories generate the most revenue across Istanbul malls?
2. How does customer gender influence purchasing behavior and revenue?
3. Which age groups represent the most valuable customer segments?
4. What payment methods do customers prefer and what does this reveal?
5. Which shopping malls are the top revenue performers — and why?
6. How has revenue trended over time and what seasonal patterns exist?
7. Are there anomalies or data quality issues management should be aware of?

---

## 📊 Key Findings

| Finding | Insight |
|---|---|
| 🥇 Clothing dominates | $114M revenue — #1 category in every single mall |
| 👩 Female shoppers lead | 59.8% of total revenue ($150.2M) |
| 👴 Seniors top spenders | 56+ age group generates $67.1M — highest of all groups |
| 💵 Cash still king | 44.69% of transactions paid in cash |
| 🏬 Top 2 malls = 40% | Mall of Istanbul & Kanyon together account for ~40% of revenue |
| ⚠️ 2023 data incomplete | Dataset ends March 2023 — $22M is NOT a real decline |
| 🔍 Spending anomaly | Top 10 customers each spent exactly $26,250 — flagged for investigation |

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| **Microsoft Excel** | Data cleaning, date formatting, feature engineering |
| **SQL Server (SSMS)** | 10 analytical queries across 99,457 rows |
| **Microsoft Power BI** | 4-page interactive dashboard with 9 DAX measures |

---

## 📁 Repository Structure

```
Istanbul-Shopping-Analytics/
│
├── 📂 Dataset/
│   └── istanbul_shopping_cleaned.xlsx       # Cleaned dataset (99,457 rows)
│
├── 📂 Dashboard/
│   └── Istanbul Shopping Analytics          # Interactive Power BI dashboard
│       Portfolio PROJECT.pbix
│
├── 📂 SQL/
│   └── Istanbul_Shopping_SQL_Queries.sql    # All 10 SQL queries with results
│
├── 📂 Report/
│   └── Istanbul_Shopping_Business_Report    # 13-page business report (Word)
│       .docx
│
├── 📂 Presentation/
│   └── Istanbul_Shopping_Analytics          # 10-slide presentation (PowerPoint)
│       .pptx
│
├── 📂 Images/
│   └── Dashboard screenshots                # All 4 dashboard page screenshots
│
└── README.md
```

---

## 🗂️ Dataset

- **Source:** Kaggle — [Customer Shopping Dataset](https://www.kaggle.com/datasets/mehmettahiraslan/customer-shopping-dataset/data)
- **Rows:** 99,457 transactions
- **Period:** January 2021 – March 2023
- **Malls:** 10 shopping malls across Istanbul

### Original Columns
| Column | Description |
|---|---|
| invoice_no | Unique transaction ID |
| customer_id | Unique customer ID |
| gender | Customer gender |
| age | Customer age |
| category | Product category |
| quantity | Items purchased |
| price | Price per item |
| payment_method | Cash / Credit Card / Debit Card |
| invoice_date | Date of transaction |
| shopping_mall | Mall name |

### Feature Engineering
| New Column | Formula | Purpose |
|---|---|---|
| Revenue | Quantity × Price | Total transaction value |
| Age_Group | IF formula (5 bands) | Customer segmentation |

---

## 🧹 Data Cleaning Steps

- ✅ Fixed mixed date formats using Text to Columns (DMY)
- ✅ Standardized all column headers
- ✅ Verified zero missing values across all columns
- ✅ Verified zero duplicate records
- ✅ Created Revenue column (Quantity × Price)
- ✅ Created Age_Group column (Youth / Young Adults / Middle Aged / Older Adults / Seniors)
- ✅ Exported cleaned file as CSV for SQL and Power BI import

---

## 🗃️ SQL Analysis

10 queries were written in SQL Server Management Studio against the `ShoppingDB` database:

| Query | Description |
|---|---|
| Query 1 | Overall Business KPIs |
| Query 2 | Revenue by Product Category |
| Query 3 | Monthly Sales Trend |
| Query 4 | Revenue by Gender |
| Query 5 | Revenue by Age Group |
| Query 6 | Payment Method Analysis |
| Query 7 | Top Performing Malls |
| Query 8 | Best Category Per Mall |
| Query 9 | Yearly Revenue Comparison |
| Query 10 | Top 10 Highest Spending Customers |

---

## 📈 Power BI Dashboard

The interactive dashboard contains **4 pages:**

| Page | Content |
|---|---|
| 🖼️ Cover | Project title, key stats, navigation |
| 📊 Executive Summary | 5 KPIs, category revenue, mall performance, payment distribution |
| 👥 Customer Analysis | Gender split, age group revenue, category by gender, payment by age |
| 📉 Sales Trends | Monthly trend, YoY revenue, category trend, seasonal patterns |

### DAX Measures Created
```
Total Revenue            = SUM(final_shopping[Revenue])
Total Transactions       = COUNTROWS(final_shopping)
Avg Order Value          = AVERAGE(final_shopping[Revenue])
Total Items Sold         = SUM(final_shopping[quantity])
Total Customers          = DISTINCTCOUNT(final_shopping[customer_id])
Female Revenue Share     = DIVIDE(CALCULATE(SUM(...), Gender="Female"), SUM(...))
Top Age Group Revenue    = MAXX(VALUES(...), CALCULATE(SUM(...)))
Top Age Group Name       = CALCULATE(FIRSTNONBLANK(...), TOPN(1,...))
Best Year Revenue        = MAXX(VALUES(...Year), CALCULATE(SUM(...)))
```

---

## 💡 Strategic Recommendations

1. **Protect Clothing Dominance** — Maintain strong fashion tenants while expanding premium tech zones to capture high AOV ($11,581)
2. **Build a Senior Loyalty Programme** — Seniors (56+) are the highest-spending yet most underserved segment
3. **Target Male Shoppers for Growth** — Males represent 40% of revenue with room to grow through targeted campaigns
4. **Modernise Payment Infrastructure** — Incentivise card payments to reduce 44.69% cash handling costs
5. **Seasonal Campaign Planning** — January peaks at $25.8M; plan promotions for mid-year dip (Jul–Aug)
6. **Investigate Top Customer Accounts** — Uniform $26,250 spend across top 10 customers warrants investigation

---

## 👩‍💻 About the Author

**Ijeoma Okeke** | Data Analyst

Former educator of 12 years turned data analyst. Skilled in transforming complex datasets into clear, actionable insights that drive business decisions.

**Skills:** SQL • Python • Excel • Power BI • Tableau • Data Cleaning • Data Visualization • Storytelling with Data

---

📍 Nigeria

🔗 LinkedIn: www.linkedin.com/in/ijeoma-okeke-53123829b

💻 **GitHub:** https://github.com/ijeoma-data

---

⭐ *If you found this project interesting, feel free to explore the repository or connect with me on LinkedIn!*
---

*Dataset source: Kaggle — mehmettahiraslan/customer-shopping-dataset*
