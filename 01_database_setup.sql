
--Create Database

CREATE DATABASE RetailRocket_Product_Analytics;
GO

USE RetailRocket_Product_Analytics;
GO

-- Drop Existing Tables (IF EXISTS)

IF OBJECT_ID('events_raw', 'U') IS NOT NULL
DROP TABLE events_raw;

IF OBJECT_ID('item_properties_raw', 'U') IS NOT NULL
DROP TABLE item_properties_raw;

IF OBJECT_ID('category_tree_raw', 'U') IS NOT NULL
DROP TABLE category_tree_raw;

IF OBJECT_ID('events', 'U') IS NOT NULL
DROP TABLE events;

IF OBJECT_ID('products', 'U') IS NOT NULL
DROP TABLE products;

IF OBJECT_ID('categories', 'U') IS NOT NULL
DROP TABLE categories;

-- RAW TABLES

CREATE TABLE events_raw
(
    timestamp BIGINT,
    visitorid BIGINT,
    event VARCHAR(25),
    itemid BIGINT,
    transactionid BIGINT
);

CREATE TABLE item_properties_raw
(
    timestamp BIGINT,
    itemid BIGINT,
    property VARCHAR(100),
    value VARCHAR(MAX)
);

CREATE TABLE category_tree_raw
(
    categoryid BIGINT,
    parentid BIGINT
);

-- DEFINE TABLES

CREATE TABLE events
(
    event_id INT IDENTITY(1,1) PRIMARY KEY,
    event_timestamp DATETIME2,
    visitor_id BIGINT NOT NULL,
    event_type VARCHAR(25) NOT NULL,
    item_id BIGINT NOT NULL,
    transaction_id BIGINT NULL
);

CREATE TABLE products
(
    item_id BIGINT PRIMARY KEY,
    category_id BIGINT,
    available BIT,
    price DECIMAL(12,2)
);

CREATE TABLE categories
(
    category_id BIGINT PRIMARY KEY,
    parent_category BIGINT NULL
);

-- Indexes

CREATE INDEX idx_events_visitor
ON events(visitor_id);

CREATE INDEX idx_events_item
ON events(item_id);

CREATE INDEX idx_events_type
ON events(event_type);

CREATE INDEX idx_events_timestamp
ON events(event_timestamp);

CREATE INDEX idx_products_category
ON products(category_id);

PRINT 'Database setup completed successfully.';