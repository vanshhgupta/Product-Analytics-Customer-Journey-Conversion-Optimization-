# 03. Data Cleaning & Data Modeling Report

## Project
**E-commerce Product Analytics & Growth Optimization**

---

# Objective

The purpose of this stage was to transform the raw RetailRocket datasets into a clean, analytics-ready data model suitable for SQL analysis, Power BI dashboards, and business reporting.

The raw data contained historical product attributes, inconsistent naming conventions, Unix timestamps, and normalized property records that required restructuring before analysis.

This process created a structured star schema consisting of one fact table and two dimension tables.

---

# Source Tables

Three raw datasets were used during the transformation process.

| Raw Table | Description |
|------------|-------------|
| events_raw | Customer interaction events including product views, cart additions, and purchases |
| item_properties_raw | Historical product attributes such as category and availability |
| category_tree_raw | Product category hierarchy |

---

# Data Cleaning Steps

## 1. Events Table

The raw events dataset was transformed into an analytical fact table.

### Transformations

- Converted Unix timestamps (milliseconds) into SQL DATETIME format.
- Renamed columns using business-friendly naming conventions.
- Preserved every customer interaction without removing records.
- Retained transaction IDs only for purchase events.

### Final Structure

| Column |
|---------|
| event_timestamp |
| visitor_id |
| event_type |
| item_id |
| transaction_id |

---

## 2. Categories Dimension

The category hierarchy was extracted directly from the raw category dataset.

Duplicate category records were removed using DISTINCT.

### Final Structure

| Column |
|---------|
| category_id |
| parent_category |

This table provides hierarchical information for category-level product analysis.

---

## 3. Products Dimension

The RetailRocket dataset stores product information as historical property records rather than a single row per product.

Example:

| Timestamp | Item | Property | Value |
|------------|--------|----------|-------|
| Jan | 100 | categoryid | 22 |
| Mar | 100 | categoryid | 24 |
| Jun | 100 | categoryid | 25 |

Instead of storing multiple rows for the same product, the latest available information was retained.

### Attributes Extracted

- Category
- Availability

---

# Window Function Implementation

Historical product attributes were transformed using the SQL `ROW_NUMBER()` window function.

```sql
ROW_NUMBER() OVER (
    PARTITION BY itemid
    ORDER BY timestamp DESC
)
```

This assigns a ranking to every historical record for a product.

Example:

| Item | Timestamp | Category | Row Number |
|------|------------|----------|------------|
|100|Jun|25|1|
|100|Mar|24|2|
|100|Jan|22|3|

Only the latest record (`Row Number = 1`) was retained.

---

# Why This Approach?

The RetailRocket dataset captures the complete history of product attribute changes.

However, Product Analytics typically requires the **current state** of each product.

Keeping only the latest category and availability values provides:

- One record per product
- No duplicate dimension rows
- Consistent joins
- Faster analytical queries
- Simplified dashboard development

The original historical data remains preserved in `item_properties_raw` for future temporal analysis.

---

# Final Data Model

```
                 categories
                      │
                      │
                  category_id
                      │
                      │
products ─────────► events ◄──────── visitors
      item_id          item_id
```

### Fact Table

- events

### Dimension Tables

- products
- categories

This star schema is optimized for analytical workloads and business intelligence reporting.

---

# Data Validation

After transformation, validation checks were performed to verify:

- Successful population of all analytical tables.
- One record per product in the Products dimension.
- Valid category mappings.
- Availability values standardized to binary (0 or 1).
- Successful timestamp conversion.
- No duplicate product records.

---

# Key Decisions

| Decision | Reason |
|----------|--------|
| Keep all event records | Every interaction contributes to customer journey analysis |
| Convert timestamps | Enables time-series and trend analysis |
| Retain latest product attributes | Creates a clean Products dimension |
| Preserve raw tables | Maintains complete historical data for traceability |
| Build star schema | Improves query performance and dashboard design |

---

# Business Impact

The cleaned analytical model enables reliable business analysis across multiple domains, including:

- Customer purchase funnel analysis
- Product performance evaluation
- Customer segmentation
- Conversion rate optimization
- Executive KPI reporting
- Power BI dashboard development

Without this transformation layer, the raw RetailRocket dataset would be difficult to analyze efficiently due to its highly normalized and historical structure.
