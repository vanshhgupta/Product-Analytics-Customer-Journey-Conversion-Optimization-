# 2. Data Profiling Report

## 2.1 Objective

Before performing data cleaning and product analytics, an initial data profiling exercise was conducted to assess the quality, completeness, and structure of the RetailRocket dataset. The objective was to identify any data quality issues, understand the characteristics of each dataset, and ensure that the data was suitable for downstream SQL analysis.

---

## 2.2 Dataset Overview

The RetailRocket dataset consists of three primary tables used throughout this project.

| Dataset | Number of Records | Description |
|----------|------------------:|-------------|
| Events | 2,756,101 | Customer interactions including product views, add-to-cart events, and completed transactions. |
| Item Properties | 20,275,902 | Historical product attribute records showing changes over time. |
| Category Tree | 1,669 | Hierarchical product category relationships. |

---

## 2.3 Initial Observations

The initial exploration of the datasets revealed the following:

- The **Events** table contains over **2.7 million** customer interactions, providing sufficient behavioral data for customer journey and conversion analysis.
- The **Item Properties** table contains historical records, indicating that product attributes may change over time.
- The **Category Tree** table defines a hierarchical structure consisting of **1,669** product categories, enabling category-level analysis.

---

## 2.4 Data Quality Assessment

### Missing Value Analysis

The datasets were examined for missing values across key analytical columns.

### Events Dataset

| Column | Status | Remarks |
|--------|--------|---------|
| Timestamp | No Missing Values | Complete |
| Visitor ID | No Missing Values | Complete |
| Event Type | No Missing Values | Complete |
| Item ID | No Missing Values | Complete |
| Transaction ID | Missing for Non-Purchase Events | Expected because transaction IDs are generated only for completed purchases. |

No unexpected missing values were identified in the Events dataset.

### Item Properties Dataset

No significant missing values were found in the product attributes required for analysis.

### Category Tree Dataset

| Column | Observation | Interpretation |
|--------|-------------|----------------|
| Parent Category | NULL Values Present | Represents root-level categories and does not indicate missing data. |

---

## 2.5 User Event Distribution

The Events dataset records three distinct customer actions representing different stages of the purchasing process.

| Event Type | Description |
|------------|-------------|
| View | Customer views a product. |
| Add to Cart | Customer adds a product to the shopping cart. |
| Transaction | Customer completes a purchase. |

These events naturally form the customer purchase funnel:

```text
View
   ↓
Add to Cart
   ↓
Transaction
```

This structure enables the analysis of customer behavior, conversion rates, and purchase funnels.

---

## 2.6 Product Attribute Analysis

The Item Properties dataset contains numerous product attributes. For this analysis, two business-relevant attributes were identified.

| Attribute | Purpose |
|-----------|---------|
| categoryid | Identifies the product category. |
| available | Indicates product availability. |

These attributes will later be transformed into the Product dimension for analytical queries.

The most frequently occurring product properties are shown below.

| Property | Frequency |
|----------|----------:|
| Property 888 | 3,000,398 |
| Property 790 | 1,790,516 |
| available | 1,503,639 |
| categoryid | 788,214 |

Since many additional property identifiers exist, only business-relevant attributes will be retained during data cleaning.

---

## 2.7 Category Hierarchy

The Category Tree dataset provides a hierarchical classification of products through parent-child relationships.

| Metric | Value |
|--------|------:|
| Total Categories | 1,669 |
| Root Categories | Multiple |
| Hierarchy Type | Parent–Child Relationships |

This hierarchy supports category-based reporting and product performance analysis.

---

## 2.8 Key Findings

The data profiling exercise produced the following findings:

- Successfully imported all three datasets into SQL Server.
- No significant data quality issues were identified in the Events dataset.
- Missing Transaction IDs are expected for non-purchase events and require no corrective action.
- NULL Parent Category values represent root-level categories within the hierarchy.
- Product attributes are stored historically and require transformation before analysis.
- The datasets provide sufficient behavioral and product information for customer and product analytics.

---

## 2.9 Analytical Opportunities

Based on the profiling results, the RetailRocket dataset supports several analytical use cases.

| Analysis | Objective |
|----------|-----------|
| Funnel Analysis | Evaluate customer progression through the purchase funnel. |
| Customer Journey Analysis | Analyze customer browsing and purchasing behavior. |
| Product Performance Analysis | Identify high-performing and low-performing products. |
| Customer Segmentation | Group customers based on behavioral patterns. |
| Conversion Analysis | Measure customer conversion rates across funnel stages. |

---

## 2.10 Conclusion

The data profiling exercise confirmed that the RetailRocket dataset is suitable for SQL-based analytical tasks. The datasets exhibit a high level of completeness, with no major data quality issues affecting the primary analytical fields. Expected missing values, such as Transaction IDs for non-purchase events and Parent Category values for root categories, do not require remediation.

The combination of detailed customer interaction data, historical product attributes, and hierarchical category information provides a strong foundation for data cleaning, exploratory analysis, and business intelligence reporting. Subsequent sections of this project focus on transforming the raw data into an analytics-ready format and generating actionable business insights using SQL.
