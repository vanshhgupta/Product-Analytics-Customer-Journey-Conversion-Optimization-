/*Objective:
Evaluate product performance using engagement,
purchase behavior, customer interaction,
and product popularity metrics.*/

USE RetailRocket_Product_Analytics;

-- 1. MOST VIEWED PRODUCTS
-- Which products receive the highest customer attention?

SELECT TOP 20 item_id, COUNT(*) AS Total_Views
FROM events WHERE event_type = 'view' 
GROUP BY item_id ORDER BY Total_Views DESC;


-- 2. MOST PURCHASED PRODUCTS
-- Which products generate the most sales?

SELECT TOP 20 item_id, COUNT(*) AS Total_Purchases
FROM events WHERE event_type = 'transaction'
GROUP BY item_id ORDER BY Total_Purchases DESC;


-- 3. MOST ADDED-TO-CART PRODUCTS
-- Which products generate the highest purchase intent?

SELECT TOP 20 item_id, COUNT(*) AS Cart_Additions
FROM events WHERE event_type = 'addtocart'
GROUP BY item_id ORDER BY Cart_Additions DESC;


-- 4. PRODUCT PURCHASE FREQUENCY
-- Which products are purchased most frequently?

SELECT TOP 20 item_id,
COUNT(transaction_id) AS Purchase_Frequency
FROM events WHERE transaction_id IS NOT NULL
GROUP BY item_id ORDER BY Purchase_Frequency DESC;


-- 5. REPEAT PURCHASE RATE
-- Which products have the highest repeat purchase rate?

WITH RepeatPurchases AS
(
SELECT item_id, visitor_id, COUNT(*) AS Purchase_Count
FROM events WHERE event_type = 'transaction'
GROUP BY item_id, visitor_id
)

SELECT TOP 20 item_id, COUNT(visitor_id) AS Total_Buyers,
SUM(CASE WHEN Purchase_Count > 1 THEN 1 ELSE 0 END) AS Repeat_Buyers,
ROUND(SUM(CASE WHEN Purchase_Count > 1 THEN 1 ELSE 0 END) * 100.0 /NULLIF(COUNT(visitor_id),0),2) AS Repeat_Purchase_Rate
FROM RepeatPurchases
GROUP BY item_id HAVING COUNT(visitor_id) >= 5
ORDER BY Repeat_Purchase_Rate DESC, Total_Buyers DESC;


-- 6. PRODUCT CUSTOMER REACH
-- Which products attract the highest number of unique customers?

SELECT TOP 20 item_id, COUNT(DISTINCT visitor_id) AS Unique_Customers
FROM events
GROUP BY item_id ORDER BY Unique_Customers DESC;


-- 7. PRODUCT ENGAGEMENT SCORE
-- Which products generate the highest overall engagement?

SELECT TOP 20 item_id,
SUM(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS Views,
SUM(CASE WHEN event_type = 'addtocart' THEN 1 ELSE 0 END) AS Cart_Additions,
SUM(CASE WHEN event_type = 'transaction' THEN 1 ELSE 0 END) AS Purchases,
SUM( CASE WHEN event_type = 'view' THEN 1 WHEN event_type = 'addtocart' THEN 3 WHEN event_type = 'transaction' THEN 5 ELSE 0 END) AS Engagement_Score
FROM events
GROUP BY item_id ORDER BY Engagement_Score DESC;


-- 8. PRODUCT INTERACTION DISTRIBUTION
-- How are customer interactions distributed across products?

SELECT event_type, COUNT(DISTINCT item_id) AS Unique_Products, COUNT(*) AS Total_Interactions,
ROUND(COUNT(*) * 100.0 /SUM(COUNT(*)) OVER (),2) AS Interaction_Percentage
FROM events
GROUP BY event_type ORDER BY Total_Interactions DESC;


-- 9. EXECUTIVE PRODUCT KPI SUMMARY
-- Overall product performance metrics

SELECT
COUNT(DISTINCT item_id) AS Total_Products,
COUNT(DISTINCT CASE WHEN event_type='view' THEN item_id END) AS Viewed_Products,
COUNT(DISTINCT CASE WHEN event_type='addtocart' THEN item_id END) AS Carted_Products,
COUNT(DISTINCT CASE WHEN event_type='transaction' THEN item_id END) AS Purchased_Products,
COUNT(DISTINCT visitor_id) AS Total_Customers,
COUNT(*) AS Total_Product_Interactions
FROM events;