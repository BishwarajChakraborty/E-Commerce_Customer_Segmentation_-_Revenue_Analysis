create database e_commerce_cust_segment;

select * from ecommerce_table;

-- 1. Total Revenue by Country
SELECT Country, SUM(Quantity * UnitPrice) AS Total_Revenue
FROM ecommerce_table
GROUP BY Country
ORDER BY Total_Revenue DESC;

-- 2. Top 10 Customers by Spending
SELECT * FROM
(
    SELECT CustomerID, SUM(Quantity * UnitPrice) AS Total_Spending
    FROM ecommerce_table
    GROUP BY CustomerID
) AS customer_spending
ORDER BY Total_Spending DESC
LIMIT 10;

-- 3. Monthly Revenue Trend
SELECT YEAR(InvoiceDate) AS Year, MONTH(InvoiceDate) AS Month, SUM(Quantity * UnitPrice) AS Revenue
FROM ecommerce_table
GROUP BY Year, Month
ORDER BY Year, Month;

-- 4. Rank Top Products by Revenue
SELECT Description, SUM(Quantity * UnitPrice) AS Revenue,
	DENSE_RANK() OVER (ORDER BY SUM(Quantity * UnitPrice) DESC) AS Revenue_Rank
FROM ecommerce_table
GROUP BY Description;

-- 5. Running Revenue Trend
SELECT InvoiceDate, SUM(Quantity * UnitPrice) AS Daily_Revenue,
    SUM(SUM(Quantity * UnitPrice)) OVER (ORDER BY InvoiceDate) AS Running_Revenue
FROM ecommerce_table
GROUP BY InvoiceDate
ORDER BY InvoiceDate;

-- 6. Top Customer per Country
WITH customer_sales AS (
    SELECT Country, CustomerID, SUM(Quantity * UnitPrice) AS Revenue
    FROM ecommerce_table
    GROUP BY Country, CustomerID
),
ranked_customers AS (
    SELECT *, DENSE_RANK() OVER (PARTITION BY Country ORDER BY Revenue DESC) AS d_rnk
    FROM customer_sales
)

SELECT * FROM ranked_customers
WHERE d_rnk = 1;

-- 7. Products Performing Above Average
SELECT Description, SUM(Quantity * UnitPrice) AS Revenue
FROM ecommerce_table
GROUP BY Description
HAVING Revenue >
(
    SELECT AVG(product_revenue)
    FROM (
        SELECT SUM(Quantity * UnitPrice) AS product_revenue
        FROM ecommerce_table
        GROUP BY Description
    ) AS avg_table
);

-- 8. Customer Purchase Frequency
SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM ecommerce_table
GROUP BY CustomerID
ORDER BY COUNT(DISTINCT InvoiceNo) DESC;

-- 9. Top 3 Products in Each Country
WITH product_sales AS (
    SELECT Country, Description, SUM(Quantity) AS Total_Quantity
    FROM ecommerce_table
    GROUP BY Country, Description
),

ranked_products AS (
    SELECT *, DENSE_RANK() OVER (PARTITION BY Country ORDER BY Total_Quantity DESC) AS d_rnk
    FROM product_sales
)

SELECT * FROM ranked_products
WHERE d_rnk <= 3;

-- 10. Customer Lifetime Value
SELECT CustomerID, SUM(Quantity * UnitPrice) AS Lifetime_Value,
    DENSE_RANK() OVER (ORDER BY SUM(Quantity * UnitPrice) DESC) AS Customer_Rank
FROM ecommerce_table
GROUP BY CustomerID;



