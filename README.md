# E-Commerce Customer Segmentation & Revenue Analysis

## Project Overview

This project analyzes an e-commerce retail dataset to uncover **customer purchasing behavior, revenue trends, and high-value customer segments**.
The objective is to transform raw transactional data into meaningful business insights using **Python, MySQL, and Power BI**.

The project demonstrates a **complete end-to-end data analytics workflow**, including data cleaning, exploratory data analysis, advanced SQL queries, customer segmentation, and interactive dashboard creation.

---

## Objectives

* Analyze sales transactions to identify **revenue patterns and top-performing products**
* Perform **customer segmentation** to identify high-value customers
* Use **SQL (Window Functions, CTEs, Subqueries)** for advanced analysis
* Build an **interactive Power BI dashboard** to visualize key insights
* Generate **business recommendations based on data**

---

## Tools & Technologies

* **Python** – Data cleaning and preprocessing
* **Pandas, NumPy** – Data manipulation and analysis
* **MySQL** – Data storage and SQL analysis
* **Power BI** – Data visualization and dashboard creation
* **Jupyter Notebook** – Data analysis workflow

---

## Dataset

The dataset contains online retail transaction data including:

* Invoice Number
* Product Description
* Quantity
* Unit Price
* Invoice Date
* Customer ID
* Country

Each row represents a **product purchased within a transaction**.

---

## Project Workflow

### 1. Data Collection

* Imported the online retail dataset into **Jupyter Notebook**.

### 2. Data Cleaning & Preparation

* Removed missing customer IDs
* Filtered out negative quantities (product returns)
* Converted date columns to proper datetime format
* Created **Revenue column**

```python
df['Revenue'] = df['Quantity'] * df['UnitPrice']
```

---

### 3. Exploratory Data Analysis (EDA)

Performed analysis to understand:

* Total revenue generated
* Monthly sales trends
* Top selling products
* Revenue by country
* High-spending customers

---

### 4. SQL Analysis (MySQL)

The cleaned dataset was exported to **MySQL** for advanced analysis.

Key SQL techniques used:

* **Window Functions**
* **Common Table Expressions (CTEs)**
* **Subqueries**
* **Ranking functions**

Example query:

```sql
SELECT 
    Description,
    SUM(Quantity * UnitPrice) AS Revenue,
    RANK() OVER (ORDER BY SUM(Quantity * UnitPrice) DESC) AS Revenue_Rank
FROM ecommerce_table
GROUP BY Description;
```

---

### 5. Customer Segmentation (RFM Analysis)

Customers were segmented using **RFM Analysis**:

| Metric    | Meaning                  |
| --------- | ------------------------ |
| Recency   | Days since last purchase |
| Frequency | Number of transactions   |
| Monetary  | Total spending           |

Customer segments identified:

* High Value Customers
* Loyal Customers
* Potential Customers
* At Risk Customers

---

### 6. Power BI Dashboard

An interactive dashboard was created to visualize key business metrics.

Dashboard includes:

* Total Revenue
* Total Orders
* Total Customers
* Monthly Sales Trend
* Revenue by Country
* Top Products by Revenue
* Top Customers by Spending

---

## Key Insights

* A small group of customers contributes a **large share of total revenue**.
* Certain products generate **significantly higher sales compared to others**.
* A few countries dominate overall sales performance.
* Sales trends show **seasonal patterns across months**.

---

## Project Structure

```
Ecommerce-Customer-Segmentation
│
├── data
│   └── online_retail_dataset.csv
│
├── notebooks
│   └── data_analysis.ipynb
│
├── sql
│   └── advanced_sql_analysis.sql
│
├── dashboard
│   └── ecommerce_dashboard.pbix
│
└── README.md
```

---

## Skills Demonstrated

* Data Cleaning & Preparation
* Exploratory Data Analysis
* Advanced SQL (Window Functions, CTEs, Subqueries)
* Customer Segmentation
* Data Visualization
* Business Insight Generation

---

## Business Value

This analysis helps businesses:

* Identify **high-value customers**
* Understand **product performance**
* Discover **regional sales opportunities**
* Make **data-driven marketing decisions**

---

## Future Improvements

* Implement **cohort analysis for customer retention**
* Perform **customer lifetime value (CLV) modeling**
* Build a **predictive model for customer churn**

---
