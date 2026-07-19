/*Objective:
Analyze customer progression through the purchase funnel,
measure conversion rates, identify drop-offs, and evaluate
product and category performance.*/

USE RetailRocket_Product_Analytics;

-- 1. OVERALL PURCHASE FUNNEL
-- How many interactions occur at each stage?
SELECT event_type, COUNT(*) AS Total_Events
FROM events WHERE event_type IN ('view','addtocart','transaction')
GROUP BY event_type ORDER BY CASE event_type WHEN 'view' THEN 1 WHEN 'addtocart' THEN 2 WHEN 'transaction' THEN 3 END;

-- 2. FUNNEL CONVERSION RATES
-- How efficiently do users move through the funnel?

WITH Funnel AS
(SELECT 
SUM(CASE WHEN event_type='view' THEN 1 ELSE 0 END) AS Views,
SUM(CASE WHEN event_type='addtocart' THEN 1 ELSE 0 END) AS Cart_Additions,
SUM(CASE WHEN event_type='transaction' THEN 1 ELSE 0 END) AS Purchases
FROM events
)

SELECT Views, Cart_Additions, Purchases, 
ROUND(Cart_Additions * 100.0 / NULLIF(Views,0),2) AS View_To_Cart_Conversion,
ROUND(Purchases * 100.0 / NULLIF(Cart_Additions,0),2) AS Cart_To_Purchase_Conversion,
ROUND(Purchases * 100.0 / NULLIF(Views,0),2) AS View_To_Purchase_Conversion
FROM Funnel;

-- 3. CART ABANDONMENT RATE
-- How many cart additions never become purchases?

WITH CartSummary AS
(SELECT
SUM(CASE WHEN event_type='addtocart' THEN 1 ELSE 0 END) AS Cart_Additions,
SUM(CASE WHEN event_type='transaction' THEN 1 ELSE 0 END) AS Purchases
FROM events
)
SELECT Cart_Additions, Purchases, Cart_Additions - Purchases AS Abandoned_Carts,
ROUND( (Cart_Additions-Purchases) *100.0 /NULLIF(Cart_Additions,0),2) AS Cart_Abandonment_Rate
FROM CartSummary;

-- 4. PRODUCT-LEVEL FUNNEL
-- Which products convert customers most effectively?

WITH ProductFunnel AS
(SELECT item_id,
SUM(CASE WHEN event_type='view' THEN 1 ELSE 0 END) AS Views,
SUM(CASE WHEN event_type='addtocart' THEN 1 ELSE 0 END) AS Cart_Additions,
SUM(CASE WHEN event_type='transaction' THEN 1 ELSE 0 END) AS Purchases
FROM events GROUP BY item_id
)
SELECT TOP 20 item_id, Views, Cart_Additions, Purchases,
ROUND(Cart_Additions*100.0/NULLIF(Views,0), 2) AS View_To_Cart, 
ROUND(Purchases*100.0/NULLIF(Cart_Additions,0),2) AS Cart_To_Purchase,
ROUND(Purchases*100.0/NULLIF(Views,0),2) AS Overall_Conversion
FROM ProductFunnel WHERE Views>100 ORDER BY Overall_Conversion DESC;


-- 5. LOW CONVERTING PRODUCTS
-- Which popular products fail to convert?

WITH ProductFunnel AS
(
SELECT item_id,
SUM(CASE WHEN event_type='view' THEN 1 ELSE 0 END) AS Views,
SUM(CASE WHEN event_type='transaction' THEN 1 ELSE 0 END) AS Purchases
FROM events
GROUP BY item_id
)
SELECT TOP 20 item_id, Views, Purchases,
ROUND(Purchases*100.0/NULLIF(Views,0),2) AS Conversion_Rate
FROM ProductFunnel
WHERE Views>100
ORDER BY Conversion_Rate ASC, Views DESC;


-- 6. CATEGORY-LEVEL FUNNEL
-- Which categories convert customers best?

WITH CategoryFunnel AS
(
SELECT p.category_id,
SUM(CASE WHEN e.event_type='view' THEN 1 ELSE 0 END) AS Views,
SUM(CASE WHEN e.event_type='addtocart' THEN 1 ELSE 0 END) AS Cart_Additions,
SUM(CASE WHEN e.event_type='transaction' THEN 1 ELSE 0 END) AS Purchases
FROM events e
JOIN products p
ON e.item_id=p.item_id
GROUP BY p.category_id
)
SELECT TOP 20 category_id, Views, Cart_Additions, Purchases,
ROUND(Cart_Additions*100.0/NULLIF(Views,0),2) AS View_To_Cart,
ROUND(Purchases*100.0/NULLIF(Cart_Additions,0),2) AS Cart_To_Purchase,
ROUND(Purchases*100.0/NULLIF(Views,0),2) AS Overall_Conversion
FROM CategoryFunnel
WHERE Views>100
ORDER BY Overall_Conversion DESC;


-- 7. CUSTOMER PURCHASE JOURNEY
-- How far do customers progress through the funnel?

WITH CustomerJourney AS
(
SELECT visitor_id,
MAX(CASE WHEN event_type='view' THEN 1 ELSE 0 END) AS Viewed,
MAX(CASE WHEN event_type='addtocart' THEN 1 ELSE 0 END) AS Added_To_Cart,
MAX(CASE WHEN event_type='transaction' THEN 1 ELSE 0 END) AS Purchased
FROM events
GROUP BY visitor_id
)
SELECT
CASE
WHEN Viewed=1 AND Added_To_Cart=0 AND Purchased=0 THEN 'Viewed Only'
WHEN Viewed=1 AND Added_To_Cart=1 AND Purchased=0 THEN 'Viewed + Cart'
WHEN Viewed=1 AND Added_To_Cart=1 AND Purchased=1 THEN 'Completed Purchase'
ELSE 'Other'
END AS Customer_Stage,
COUNT(*) AS Customers
FROM CustomerJourney
GROUP BY
CASE
WHEN Viewed=1 AND Added_To_Cart=0 AND Purchased=0 THEN 'Viewed Only'
WHEN Viewed=1 AND Added_To_Cart=1 AND Purchased=0 THEN 'Viewed + Cart'
WHEN Viewed=1 AND Added_To_Cart=1 AND Purchased=1 THEN 'Completed Purchase'
ELSE 'Other'
END
ORDER BY Customers DESC;


-- 8. EXECUTIVE KPI SUMMARY
-- Overall funnel performance metrics

WITH Funnel AS
(
SELECT
SUM(CASE WHEN event_type='view' THEN 1 ELSE 0 END) AS Views,
SUM(CASE WHEN event_type='addtocart' THEN 1 ELSE 0 END) AS Cart_Additions,
SUM(CASE WHEN event_type='transaction' THEN 1 ELSE 0 END) AS Purchases
FROM events
)
SELECT Views, Cart_Additions, Purchases,
ROUND(Cart_Additions*100.0/NULLIF(Views,0),2) AS View_To_Cart_Rate,
ROUND(Purchases*100.0/NULLIF(Cart_Additions,0),2) AS Cart_To_Purchase_Rate,
ROUND(Purchases*100.0/NULLIF(Views,0),2) AS Overall_Conversion_Rate,
ROUND((Cart_Additions-Purchases)*100.0/NULLIF(Cart_Additions,0),2) AS Cart_Abandonment_Rate
FROM Funnel;