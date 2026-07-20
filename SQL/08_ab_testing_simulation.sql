/*Objective:
Simulate an A/B experiment by assigning customers into
Control (A) and Treatment (B) groups. Compare engagement,
conversion, and purchase metrics to evaluate the impact of
a hypothetical product feature or recommendation algorithm.
*/

USE RetailRocket_Product_Analytics;

-- 1. ASSIGN CUSTOMERS TO EXPERIMENT GROUPS
-- Split customers into Group A and Group B

WITH Experiment AS
(
SELECT *, CASE WHEN ABS(CHECKSUM(visitor_id)) % 2 = 0 THEN 'Group A' ELSE 'Group B' END AS Experiment_Group
FROM events
)

SELECT Experiment_Group, COUNT(DISTINCT visitor_id) AS Customers
FROM Experiment
GROUP BY Experiment_Group;

-- 2. EVENT DISTRIBUTION BY GROUP
-- Compare customer interactions between both groups

WITH Experiment AS
(
SELECT *, CASE WHEN ABS(CHECKSUM(visitor_id)) % 2 = 0 THEN 'Group A' ELSE 'Group B' END AS Experiment_Group
FROM events
)

SELECT Experiment_Group, event_type, COUNT(*) AS Total_Events
FROM Experiment
GROUP BY Experiment_Group,event_type ORDER BY Experiment_Group,event_type;

-- 3. VIEW TO CART CONVERSION
-- Which group converts more views into cart additions?

WITH Experiment AS
(
SELECT *, CASE WHEN ABS(CHECKSUM(visitor_id)) % 2 = 0 THEN 'Group A' ELSE 'Group B' END AS Experiment_Group
FROM events
)

SELECT Experiment_Group, SUM(CASE WHEN event_type='view' THEN 1 ELSE 0 END) AS Views,
SUM(CASE WHEN event_type='addtocart' THEN 1 ELSE 0 END) AS Cart_Additions,
ROUND(SUM(CASE WHEN event_type='addtocart' THEN 1 ELSE 0 END)*100.0/NULLIF(SUM(CASE WHEN event_type='view' THEN 1 ELSE 0 END),0),2) AS View_To_Cart_Rate
FROM Experiment GROUP BY Experiment_Group;

-- 4. CART TO PURCHASE CONVERSION
-- Which group converts carts into purchases more efficiently?

WITH Experiment AS
(
SELECT *, CASE WHEN ABS(CHECKSUM(visitor_id)) % 2 = 0 THEN 'Group A' ELSE 'Group B' END AS Experiment_Group
FROM events
)

SELECT Experiment_Group, SUM(CASE WHEN event_type='addtocart' THEN 1 ELSE 0 END) AS Cart_Additions,
SUM(CASE WHEN event_type='transaction' THEN 1 ELSE 0 END) AS Purchases, 
ROUND(SUM(CASE WHEN event_type='transaction' THEN 1 ELSE 0 END)*100.0/NULLIF(SUM(CASE WHEN event_type='addtocart' THEN 1 ELSE 0 END),0),2) AS Cart_To_Purchase_Rate
FROM Experiment
GROUP BY Experiment_Group;

-- 5. OVERALL PURCHASE CONVERSION
-- Which group achieves a higher purchase rate?

WITH Experiment AS
(
SELECT *, CASE WHEN ABS(CHECKSUM(visitor_id)) % 2 = 0 THEN 'Group A' ELSE 'Group B' END AS Experiment_Group
FROM events
)

SELECT Experiment_Group, SUM(CASE WHEN event_type='view' THEN 1 ELSE 0 END) AS Views,
SUM(CASE WHEN event_type='transaction' THEN 1 ELSE 0 END) AS Purchases,
ROUND(SUM(CASE WHEN event_type='transaction' THEN 1 ELSE 0 END)*100.0/NULLIF(SUM(CASE WHEN event_type='view' THEN 1 ELSE 0 END),0),2) AS Purchase_Conversion
FROM Experiment
GROUP BY Experiment_Group;

-- 6. CUSTOMER ENGAGEMENT
-- Compare average engagement per customer

WITH Experiment AS
(
SELECT *, CASE WHEN ABS(CHECKSUM(visitor_id)) % 2 = 0 THEN 'Group A' ELSE 'Group B' END AS Experiment_Group
FROM events
),
CustomerActivity AS
(
SELECT Experiment_Group, visitor_id, COUNT(*) AS Total_Actions
FROM Experiment GROUP BY Experiment_Group,visitor_id
)

SELECT
Experiment_Group, COUNT(visitor_id) AS Customers, AVG(Total_Actions) AS Avg_Actions_Per_Customer, MAX(Total_Actions) AS Max_Actions
FROM CustomerActivity GROUP BY Experiment_Group;

-- 7. EXPERIMENT SUMMARY
-- Overall experiment KPIs

WITH Experiment AS
(
SELECT *, CASE WHEN ABS(CHECKSUM(visitor_id)) % 2 = 0 THEN 'Group A' ELSE 'Group B' END AS Experiment_Group
FROM events
)

SELECT Experiment_Group, COUNT(DISTINCT visitor_id) AS Customers, COUNT(*) AS Total_Events,
COUNT(DISTINCT CASE WHEN transaction_id IS NOT NULL THEN visitor_id END) AS Purchasing_Customers, COUNT(transaction_id) AS Total_Purchases
FROM Experiment
GROUP BY Experiment_Group;