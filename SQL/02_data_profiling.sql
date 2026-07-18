/*
Objective: Profile the raw datasets to understand their structure,quality, completeness, and business relevance before performing any data cleaning or analysis.
*/

USE RetailRocket_Product_Analytics;

-- Row Count

SELECT COUNT(*) AS total_rows_from_events FROM events_raw;
SELECT COUNT(*) AS total_rows_from_item_properties FROM item_properties_raw;
SELECT COUNT(*) AS total_rows_from_category FROM category_tree_raw;

-- Missing Values : 
print 'missing values
1. Events' 

-- 1. Events
SELECT
SUM(CASE WHEN timestamp IS NULL THEN 1 ELSE 0 END) AS missing_timestamp,
SUM(CASE WHEN visitorid IS NULL THEN 1 ELSE 0 END) AS missing_visitor,
SUM(CASE WHEN event IS NULL THEN 1 ELSE 0 END) AS missing_event,
SUM(CASE WHEN itemid IS NULL THEN 1 ELSE 0 END) AS missing_item,
SUM(CASE WHEN transactionid IS NULL THEN 1 ELSE 0 END) AS missing_transaction
FROM events_raw;

print '2. Item Properties' 
-- 2. Item Properties
SELECT
SUM(CASE WHEN timestamp IS NULL THEN 1 ELSE 0 END) AS missing_timestamp,
SUM(CASE WHEN itemid IS NULL THEN 1 ELSE 0 END) AS missing_item,
SUM(CASE WHEN property IS NULL THEN 1 ELSE 0 END) AS missing_property,
SUM(CASE WHEN value IS NULL THEN 1 ELSE 0 END) AS missing_value
FROM item_properties_raw;

-- 3. Category Tree
print '3. Category Tree' 
SELECT
SUM(CASE WHEN categoryid IS NULL THEN 1 ELSE 0 END) AS missing_category,
SUM(CASE WHEN parentid IS NULL THEN 1 ELSE 0 END) AS missing_parent
FROM category_tree_raw;

-- Duplicate Events
print 'Duplicate Events' 
SELECT timestamp,visitorid,event,itemid,transactionid,COUNT(*) AS duplicate_count
FROM events_raw GROUP BY timestamp, visitorid, event, itemid, transactionid HAVING COUNT(*) > 1;

-- Event Distribution
print 'What user actions are recorded?' 
SELECT event, COUNT(*) AS total_events
FROM events_raw GROUP BY event ORDER BY total_events DESC;

print 'How many unique users and products exist?'
-- Unique Visitors
SELECT COUNT(DISTINCT visitorid) AS unique_visitors
FROM events_raw;

-- Unique Products
SELECT COUNT(DISTINCT itemid) AS unique_products
FROM events_raw;


-- Total Transactions 
PRINT 'How many purchases occurred?'
SELECT COUNT(*) AS purchases 
FROM events_raw WHERE event='transaction';

-- Available Product Properties
PRINT 'Which product attributes are available?'
SELECT DISTINCT property
FROM item_properties_raw ORDER BY property;

-- Most Frequent Properties
PRINT 'Most frequent buyers'
SELECT property, COUNT(*) AS frequency
FROM item_properties_raw GROUP BY property ORDER BY frequency DESC;

-- Total Categories
print 'How many product categories are available?'
SELECT COUNT(*) AS total_categories FROM category_tree_raw;

-- Root Categories
print 'These are categories without a parent.'
SELECT * FROM category_tree_raw WHERE parentid IS NULL;

