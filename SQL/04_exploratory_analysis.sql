/*
Objective: 
Perform exploratory data analysis (EDA) on the cleaned
RetailRocket dataset to understand customer behavior,
product engagement, purchase trends, and category performance.
*/

USE RetailRocket_Product_Analytics;

-- 1. DATASET OVERVIEW

SELECT COUNT(*) AS Total_Events FROM events;
SELECT COUNT(DISTINCT visitor_id) AS Total_Customers FROM events;
SELECT COUNT(DISTINCT item_id) AS Total_Products FROM events;
SELECT COUNT(DISTINCT transaction_id) AS Total_Transactions FROM events WHERE transaction_id IS NOT NULL;

-- 2. EVENT DISTRIBUTION
-- What actions are customers performing?

SELECT event_type, COUNT(*) AS Total_Events, ROUND(COUNT(*) * 100.0 /SUM(COUNT(*)) OVER (),2 ) AS Percentage FROM events 
GROUP BY event_type ORDER BY Total_Events DESC;

--3. CUSTOMER ANALYSIS
--How active are customers?

-- CUSTOMER ACTIVITY
SELECT TOP 20 visitor_id, COUNT(*) AS Total_Actions FROM events 
GROUP BY visitor_id ORDER BY Total_Actions DESC;


--AVERAGE CUSTOMER ACTIVITY
SELECT CAST(COUNT(*) AS FLOAT) /COUNT(DISTINCT visitor_id) AS Avg_Actions_Per_Customer FROM events;

--4. PRODUCT ANALYSIS
--Which products receive the highest engagement?

--MOST VIEWED PRODUCTS
SELECT TOP 20 item_id, COUNT(*) AS Views FROM events WHERE event_type = 'view'
GROUP BY item_id ORDER BY Views DESC;


--MOST ADDED TO CART PRODUCTS
SELECT TOP 20 item_id, COUNT(*) AS Cart_Additions FROM events WHERE event_type = 'addtocart'
GROUP BY item_id ORDER BY Cart_Additions DESC;

--MOST PURCHASED PRODUCTS
SELECT TOP 20 item_id, COUNT(*) AS Purchases FROM events WHERE event_type = 'transaction'
GROUP BY item_id ORDER BY Purchases DESC;

--5. CATEGORY ANALYSIS
--Which categories drive the highest engagement?

-- Most Active Categories
SELECT TOP 20 p.category_id, COUNT(*) AS Total_Interactions FROM events e
JOIN products p ON e.item_id = p.item_id
GROUP BY p.category_id ORDER BY Total_Interactions DESC;

-- Most Purchased Categories
SELECT TOP 20 p.category_id, COUNT(*) AS Purchases FROM events e
JOIN products p ON e.item_id = p.item_id WHERE event_type = 'transaction'
GROUP BY p.category_id ORDER BY Purchases DESC;

-- 6. TIME ANALYSIS
-- When are customers most active?

-- Daily Activity
SELECT CAST(event_timestamp AS DATE) AS Event_Date, COUNT(*) AS Total_Events FROM events
GROUP BY CAST(event_timestamp AS DATE) ORDER BY Event_Date;

-- Monthly Activity
SELECT YEAR(event_timestamp) AS Year, MONTH(event_timestamp) AS Month, COUNT(*) AS Total_Events FROM events
GROUP BY YEAR(event_timestamp), MONTH(event_timestamp) ORDER BY Year, Month;

-- Hourly Activity
SELECT DATEPART(HOUR, event_timestamp) AS Hour_of_Day, COUNT(*) AS Total_Events FROM events
GROUP BY DATEPART(HOUR, event_timestamp) ORDER BY Hour_of_Day;

-- 7. PRODUCT AVAILABILITY

-- What percentage of products are currently available?
SELECT available, COUNT(*) AS Products FROM products 
GROUP BY available;

-- 8. DATA QUALITY CHECK

-- Products without Category
SELECT COUNT(*) AS Missing_Category FROM products WHERE category_id IS NULL;

-- Products without Availability
SELECT COUNT(*) AS Missing_Availability FROM products WHERE available IS NULL;

-- 9. EXECUTIVE KPI SUMMARY
SELECT
    (SELECT COUNT(*) FROM events) AS Total_Events,
    (SELECT COUNT(DISTINCT visitor_id) FROM events) AS Total_Customers,
    (SELECT COUNT(DISTINCT item_id) FROM events) AS Total_Products,
    (SELECT COUNT(DISTINCT transaction_id) FROM events WHERE transaction_id IS NOT NULL) AS Total_Transactions, 
    (SELECT CAST(COUNT(*) AS FLOAT) / COUNT(DISTINCT visitor_id) FROM events) AS Avg_Actions_Per_Customer;

-- 10. ADVANCED EXPLORATORY ANALYSIS

-- Top Products by Purchase Conversion Rate
-- Which products convert the highest percentage of views into purchases?
WITH Product_Funnel AS(
    SELECT item_id, 
    SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS Views,
    SUM(CASE WHEN event_type = 'transaction' THEN 1 ELSE 0 END) AS Purchases FROM events
    GROUP BY item_id
)
SELECT TOP 20 item_id, Views, Purchases, ROUND(Purchases * 100.0 / NULLIF(Views, 0), 2) AS Purchase_Conversion_Rate FROM Product_Funnel WHERE Views > 50 
ORDER BY Purchase_Conversion_Rate DESC;


-- Top Categories by Unique Customers
-- Which categories attract the largest customer base?
SELECT TOP 20 p.category_id, COUNT(DISTINCT e.visitor_id) AS Unique_Customers, COUNT(*) AS Total_Interactions
FROM events e JOIN products p ON e.item_id = p.item_id
GROUP BY p.category_id ORDER BY Unique_Customers DESC;
     
-- Weekday vs Weekend Activity
-- Do customers interact more on weekdays or weekends?
SELECT CASE WHEN DATEPART(WEEKDAY, event_timestamp) IN (1,7) THEN 'Weekend' ELSE 'Weekday' END AS Day_Type, 
COUNT(*) AS Total_Events, COUNT(DISTINCT visitor_id) AS Unique_Customers FROM events
GROUP BY CASE WHEN DATEPART(WEEKDAY, event_timestamp) IN (1,7) THEN 'Weekend' ELSE 'Weekday' END;


-- High View, Low Purchase Products
-- Which products receive high traffic but poor conversions?
WITH Product_Performance AS (
    SELECT item_id,
    SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS Views,
    SUM(CASE WHEN event_type = 'transaction' THEN 1 ELSE 0 END) AS Purchases FROM events GROUP BY item_id
)

SELECT TOP 20 item_id, Views, Purchases, ROUND(Purchases * 100.0 / NULLIF(Views, 0), 2) AS Conversion_Rate
FROM Product_Performance WHERE Views > 100
ORDER BY Conversion_Rate ASC, Views DESC;