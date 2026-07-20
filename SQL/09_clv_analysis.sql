/*Objective:
Estimate Customer Lifetime Value (CLV) using customer
purchase frequency and transaction history to identify
high-value customers and long-term business opportunities.

Note:
The RetailRocket dataset does not contain transaction
amounts. Therefore, CLV is approximated using the total
number of completed purchases.
*/

USE RetailRocket_Product_Analytics;

-- 1. CUSTOMER LIFETIME METRICS
-- Calculate customer lifetime statistics

SELECT visitor_id, MIN(event_timestamp) AS First_Purchase, MAX(event_timestamp) AS Last_Purchase,
DATEDIFF(DAY, MIN(event_timestamp), MAX(event_timestamp)) AS Customer_Lifetime_Days, COUNT(transaction_id) AS Total_Purchases
FROM events WHERE transaction_id IS NOT NULL
GROUP BY visitor_id ORDER BY Total_Purchases DESC;

-- 2. ESTIMATED CUSTOMER LIFETIME VALUE
-- Estimate CLV using purchase frequency

SELECT visitor_id, COUNT(transaction_id) AS Estimated_CLV 
FROM events WHERE transaction_id IS NOT NULL
GROUP BY visitor_id ORDER BY Estimated_CLV DESC;

-- 3. CUSTOMER VALUE SEGMENTS
-- Categorize customers by estimated lifetime value

WITH CLV AS
(
SELECT visitor_id, COUNT(transaction_id) AS Estimated_CLV 
FROM events WHERE transaction_id IS NOT NULL
GROUP BY visitor_id
)

SELECT CASE WHEN Estimated_CLV>=20 THEN 'Premium' WHEN Estimated_CLV BETWEEN 10 AND 19 THEN 'High Value' WHEN Estimated_CLV BETWEEN 5 AND 9 THEN 'Medium Value' WHEN Estimated_CLV BETWEEN 2 AND 4 THEN 'Low Value' ELSE 'One-Time' END AS Customer_Value,
COUNT(*) AS Customers 
FROM CLV
GROUP BY CASE WHEN Estimated_CLV>=20 THEN 'Premium' WHEN Estimated_CLV BETWEEN 10 AND 19 THEN 'High Value' WHEN Estimated_CLV BETWEEN 5 AND 9 THEN 'Medium Value' WHEN Estimated_CLV BETWEEN 2 AND 4 THEN 'Low Value' ELSE 'One-Time' END 
ORDER BY Customers DESC;


-- 4. TOP 20 HIGH VALUE CUSTOMERS
-- Customers with the highest estimated CLV

SELECT TOP 20 visitor_id, COUNT(transaction_id) AS Estimated_CLV
FROM events WHERE transaction_id IS NOT NULL
GROUP BY visitor_id ORDER BY Estimated_CLV DESC;


-- 5. CUSTOMER LIFETIME DISTRIBUTION
-- Distribution of customer lifetime

WITH Lifetime AS
(
SELECT visitor_id, DATEDIFF(DAY, MIN(event_timestamp), MAX(event_timestamp)) AS Lifetime_Days
FROM events WHERE transaction_id IS NOT NULL
GROUP BY visitor_id
)

SELECT CASE WHEN Lifetime_Days<=30 THEN '0-30 Days' WHEN Lifetime_Days<=90 THEN '31-90 Days' WHEN Lifetime_Days<=180 THEN '91-180 Days' ELSE '180+ Days' END AS Lifetime,
COUNT(*) AS Customers FROM Lifetime
GROUP BY CASE WHEN Lifetime_Days<=30 THEN '0-30 Days' WHEN Lifetime_Days<=90 THEN '31-90 Days' WHEN Lifetime_Days<=180 THEN '91-180 Days' ELSE '180+ Days' END
ORDER BY Customers DESC;

-- 6. PURCHASE BEHAVIOR
-- Average purchases made by each customer

SELECT AVG(Purchase_Count) AS Avg_Purchases_Per_Customer, MAX(Purchase_Count) AS Maximum_Purchases,
MIN(Purchase_Count) AS Minimum_Purchases FROM
(SELECT visitor_id, COUNT(transaction_id) AS Purchase_Count FROM events WHERE transaction_id IS NOT NULL GROUP BY visitor_id) A;

-- 7. EXECUTIVE CLV KPI SUMMARY
-- Overall customer lifetime metrics

SELECT COUNT(DISTINCT visitor_id) AS Purchasing_Customers, COUNT(transaction_id) AS Total_Purchases,
ROUND(COUNT(transaction_id)*1.0/COUNT(DISTINCT visitor_id),2) AS Avg_CLV, MAX(Customer_CLV) AS Highest_CLV
FROM (SELECT visitor_id, COUNT(transaction_id) AS Customer_CLV, transaction_id
FROM events WHERE transaction_id IS NOT NULL GROUP BY visitor_id,transaction_id ) A;