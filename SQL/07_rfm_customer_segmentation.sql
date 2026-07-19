/*Objective:
Perform RFM (Recency, Frequency, Monetary) Analysis to
segment customers based on purchasing behavior and identify high-value, loyal, and at-risk customers.

Note:
The RetailRocket dataset does not contain transaction values.
Therefore, Monetary is approximated using the total number of completed purchases made by each customer.
*/

USE RetailRocket_Product_Analytics;

-- 1. CUSTOMER RFM METRICS
-- Calculate Recency, Frequency and Monetary for each customer

WITH RFM AS
(
SELECT visitor_id, MAX(event_timestamp) AS Last_Purchase_Date, 
DATEDIFF(DAY, MAX(event_timestamp), (SELECT MAX(event_timestamp) FROM events)) AS Recency,
COUNT(transaction_id) AS Frequency, COUNT(transaction_id) AS Monetary
FROM events WHERE transaction_id IS NOT NULL GROUP BY visitor_id
)

SELECT * FROM RFM ORDER BY Frequency DESC;


-- 2. TOP 20 MOST VALUABLE CUSTOMERS
-- Which customers have the highest purchase activity?

WITH RFM AS
(
SELECT visitor_id, DATEDIFF(DAY, MAX(event_timestamp), (SELECT MAX(event_timestamp) FROM events)) AS Recency,
COUNT(transaction_id) AS Frequency, COUNT(transaction_id) AS Monetary
FROM events WHERE transaction_id IS NOT NULL GROUP BY visitor_id
)

SELECT TOP 20 visitor_id, Recency, Frequency, Monetary
FROM RFM ORDER BY Frequency DESC, Recency ASC;


-- 3. CUSTOMER RECENCY DISTRIBUTION
-- How recently have customers made purchases?

WITH RFM AS
(
SELECT visitor_id, DATEDIFF(DAY, MAX(event_timestamp), (SELECT MAX(event_timestamp) FROM events)) AS Recency
FROM events WHERE transaction_id IS NOT NULL GROUP BY visitor_id
)

SELECT
CASE WHEN Recency <= 30 THEN 'Recent' WHEN Recency <= 90 THEN 'Active' WHEN Recency <= 180 THEN 'Inactive' ELSE 'Dormant' END AS Customer_Status,
COUNT(*) AS Customers FROM RFM
GROUP BY CASE WHEN Recency <= 30 THEN 'Recent' WHEN Recency <= 90 THEN 'Active' WHEN Recency <= 180 THEN 'Inactive' ELSE 'Dormant' END
ORDER BY Customers DESC;


-- 4. PURCHASE FREQUENCY DISTRIBUTION
-- How frequently do customers purchase?

WITH RFM AS
(
SELECT visitor_id, COUNT(transaction_id) AS Frequency FROM events WHERE transaction_id IS NOT NULL
GROUP BY visitor_id
)

SELECT CASE WHEN Frequency >= 10 THEN 'Very Frequent' WHEN Frequency BETWEEN 5 AND 9 THEN 'Frequent' WHEN Frequency BETWEEN 2 AND 4 THEN 'Occasional' ELSE 'One-Time' END AS Purchase_Type,
COUNT(*) AS CustomersFROM RFM
GROUP BYCASEWHEN Frequency >= 10 THEN 'Very Frequent' WHEN Frequency BETWEEN 5 AND 9 THEN 'Frequent' WHEN Frequency BETWEEN 2 AND 4 THEN 'Occasional' ELSE 'One-Time' END
ORDER BY Customers DESC;


-- 5. RFM CUSTOMER SEGMENTS
-- Segment customers based on Recency and Frequency

WITH RFM AS
(
SELECT visitor_id, DATEDIFF(DAY, MAX(event_timestamp), (SELECT MAX(event_timestamp) FROM events)) AS Recency,
COUNT(transaction_id) AS Frequency FROM events
WHERE transaction_id IS NOT NULL GROUP BY visitor_id
) 

SELECT
CASE WHEN Recency <= 30 AND Frequency >= 5 THEN 'Champions' WHEN Recency <= 60 AND Frequency >= 3 THEN 'Loyal Customers' WHEN Recency <= 90 AND Frequency >= 2 THEN 'Potential Loyalists' WHEN Recency > 90 AND Frequency >= 3 THEN 'At Risk' ELSE 'Lost Customers' END AS Customer_Segment,
COUNT(*) AS Customers FROM RFM
GROUP BY
CASE WHEN Recency <= 30 AND Frequency >= 5 THEN 'Champions' WHEN Recency <= 60 AND Frequency >= 3 THEN 'Loyal Customers' WHEN Recency <= 90 AND Frequency >= 2 THEN 'Potential Loyalists' WHEN Recency > 90 AND Frequency >= 3 THEN 'At Risk' ELSE 'Lost Customers' END
ORDER BY Customers DESC;


-- 6. HIGH VALUE CUSTOMERS
-- Which customers combine recent activity with frequent purchases?

WITH RFM AS
(
SELECT visitor_id,
DATEDIFF(DAY, MAX(event_timestamp), (SELECT MAX(event_timestamp) FROM events)) AS Recency,
COUNT(transaction_id) AS Frequency 
FROM events WHERE transaction_id IS NOT NULL
GROUP BY visitor_id
)

SELECT TOP 20 visitor_id, Recency, Frequency
FROM RFM WHERE Frequency >= 5
ORDER BY Frequency DESC, Recency ASC;


-- 7. CUSTOMER PURCHASE SUMMARY
-- What is the overall purchasing behavior of customers?

SELECT
COUNT(DISTINCT visitor_id) AS Purchasing_Customers, COUNT(transaction_id) AS Total_Purchases, 
ROUND(COUNT(transaction_id) * 1.0 /COUNT(DISTINCT visitor_id),2) AS Avg_Purchases_Per_Customer
FROM events WHERE transaction_id IS NOT NULL;


-- 8. EXECUTIVE RFM KPI SUMMARY
-- Overall customer purchasing metrics

WITH RFM AS
(
SELECT visitor_id,
DATEDIFF(DAY, MAX(event_timestamp), (SELECT MAX(event_timestamp) FROM events)) AS Recency,
COUNT(transaction_id) AS Frequency FROM events
WHERE transaction_id IS NOT NULL GROUP BY visitor_id
)

SELECT
COUNT(*) AS Purchasing_Customers,
AVG(Recency) AS Avg_Recency_Days,
AVG(Frequency) AS Avg_Purchase_Frequency,
MAX(Frequency) AS Max_Purchases_By_Customer,
MIN(Recency) AS Most_Recent_Purchase
FROM RFM;