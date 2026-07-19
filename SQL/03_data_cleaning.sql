/* Objective: Transform raw RetailRocket datasets into clean analytical
tables for Product Analytics.*/

USE RetailRocket_Product_Analytics;

-- Remove Existing Data
/*TRUNCATE TABLE events;
TRUNCATE TABLE products;
TRUNCATE TABLE categories;*/

-- Put data into Events Fact Table
INSERT INTO events
(event_timestamp, visitor_id, event_type, item_id, transaction_id
)

SELECT DATEADD(SECOND, [timestamp] / 1000, '1970-01-01') AS event_timestamp, 
visitorid, event, itemid,transactionid FROM events_raw;

-- Step 3 : Populate Categories Dimension
INSERT INTO categories
(category_id, parent_category
)

SELECT DISTINCT categoryid, parentid FROM category_tree_raw;

-- Step 4 : Build Products Dimension

WITH latest_category AS
(SELECT itemid, TRY_CAST(value AS BIGINT) AS category_id,
ROW_NUMBER() OVER( PARTITION BY itemid ORDER BY [timestamp] DESC) AS rn 
FROM item_properties_raw WHERE property = 'categoryid'
),

latest_availability AS
(SELECT itemid, CASE WHEN value = '1' THEN 1 ELSE 0 END AS available,
ROW_NUMBER() OVER (PARTITION BY itemid ORDER BY [timestamp] DESC) AS rn
FROM item_properties_raw WHERE property = 'available'
)

INSERT INTO products (item_id, category_id, available)

SELECT c.itemid, c.category_id, ISNULL(a.available,0) FROM latest_category c 
LEFT JOIN latest_availability a ON c.itemid = a.itemid AND a.rn = 1 WHERE c.rn = 1;

--Data Validation

SELECT 'Events' AS Table_Name, COUNT(*) AS Total_Records FROM events
UNION ALL
SELECT 'Products', COUNT(*) FROM products
UNION ALL
SELECT 'Categories', COUNT(*) FROM categories;


--Preview Clean Tables
PRINT 'Preview : Events'; 
SELECT TOP 10 * FROM events;

PRINT 'Preview : Products';
SELECT TOP 10 * FROM products;

PRINT 'Preview : Categories';
SELECT TOP 10 * FROM categories;



