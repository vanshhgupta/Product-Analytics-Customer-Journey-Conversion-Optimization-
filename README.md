# RetailRocket Product & Customer Analytics using SQL Server & Power BI

> End-to-End Business Intelligence Case Study

---

# Executive Summary

## Overview

This project demonstrates an end-to-end product analytics workflow using the RetailRocket E-commerce dataset. The objective is to transform raw customer interaction logs into actionable business insights through SQL Server and Power BI.

The project simulates the responsibilities of a Product Analyst or Business Analyst by covering the complete analytics lifecycle—from data ingestion and cleaning to KPI development, customer segmentation, funnel optimization, and executive reporting.

Unlike academic SQL exercises, this repository focuses on solving real business problems using industry-standard analytical techniques.

---

# Business Problem

E-commerce organizations collect millions of customer interactions every day. Without structured analysis, organizations cannot answer questions such as:

- Which products attract attention but fail to convert?
- Where do customers abandon the purchase journey?
- Which customers generate the highest long-term value?
- Which product categories deserve marketing investment?
- Which KPIs should executives monitor?

This project addresses these questions through structured SQL analytics.

---

# Project Objectives

- Build a scalable SQL Server analytics database
- Clean and transform raw event-level data
- Design reusable analytical tables
- Perform exploratory data analysis
- Analyze customer purchase funnels
- Measure product performance
- Segment customers using RFM Analysis
- Estimate Customer Lifetime Value (CLV)
- Simulate A/B Testing
- Design executive dashboards in Power BI

---

# Dataset Overview

Source: RetailRocket Recommender System Dataset

| Metric | Value |
|--------|-------:|
| Customer Events | 2,756,101 |
| Customers | 1,407,580 |
| Products | 235,061 |
| Transactions | 22,457 |
| Product Properties | 20,275,902 |
| Categories | 1,669 |

Event Types:
- View
- Add to Cart
- Transaction

---

# Technology Stack

- SQL Server
- T-SQL
- Power BI
- Microsoft Excel
- Git & GitHub

---

# Project Workflow

Raw Data
↓
Data Profiling
↓
Data Cleaning
↓
Analytical Database
↓
Exploratory Analysis
↓
Business KPIs
↓
Customer Analytics
↓
Power BI Dashboard
↓
Business Recommendations

---

# Database Design

Raw Tables

- events_raw
- item_properties_raw
- category_tree_raw

Analytical Tables

- events
- products
- categories

The analytical schema preserves historical raw data while creating optimized reporting tables.

---

# Analytics Modules

## 1. Data Profiling

Performed an initial assessment of data quality including:

- Missing values
- Duplicate records
- Event distribution
- Customer counts
- Product counts
- Category validation
- Product properties

Key Finding

96.67% of all events were product views, indicating that conversion optimization is the largest business opportunity.

---

## 2. Data Cleaning

Implemented ETL processes to:

- Convert Unix timestamps
- Standardize data types
- Remove inconsistencies
- Create latest product snapshot
- Map categories
- Preserve historical data

---

## 3. Exploratory Data Analysis

Analyzed:

- Customer activity
- Product popularity
- Category distribution
- Weekly trends
- Monthly trends
- Hourly purchasing patterns
- Product availability
- Conversion metrics

Highlights

- Peak shopping hours occur during evening.
- Weekday engagement exceeds weekend activity.
- Only a small percentage of product views convert into purchases.

---

## 4. Funnel Analysis

Purchase Funnel

View
→ Add to Cart
→ Purchase

KPIs

| Metric | Value |
|------|------:|
| Views | 2,664,312 |
| Cart Adds | 69,332 |
| Purchases | 22,457 |
| View → Cart | 2.60% |
| Cart → Purchase | 32.39% |
| Overall Conversion | 0.84% |
| Cart Abandonment | 67.61% |

Business Insights

- High browsing activity but low purchase conversion.
- Significant opportunity exists in checkout optimization.
- Cart abandonment is the primary revenue leakage point.

---

## 5. Product Analytics

Measured

- Most viewed products
- Most purchased products
- Most carted products
- Product engagement score
- Customer reach
- Repeat purchase rate

Business Questions

- Which products attract users?
- Which products generate revenue?
- Which products require optimization?

---

## 6. Customer Segmentation (RFM)

Since transaction value is unavailable, Purchase Frequency was used as the Monetary proxy.

Segments

- Champions
- Loyal Customers
- Potential Loyalists
- At Risk
- Lost Customers

Results

| Segment | Customers |
|------|------:|
| Champions | 106 |
| Loyal | 370 |
| Potential Loyalists | 1,219 |
| At Risk | 327 |
| Lost | 9,697 |

---

## 7. Customer Lifetime Value

Estimated CLV using purchase frequency because product pricing is unavailable.

Purpose

- Identify valuable customers
- Improve retention strategy
- Prioritize marketing campaigns

---

## 8. A/B Testing Simulation

Because the dataset contains no experimental groups, deterministic customer assignment was used to simulate an A/B experiment.

Measured

- Purchase conversion
- Cart conversion
- Engagement
- Statistical comparison

---

# Executive KPIs

| KPI | Value |
|------|------:|
| Total Customers | 1,407,580 |
| Purchasing Customers | 11,719 |
| Products | 235,061 |
| Transactions | 22,457 |
| Overall Conversion | 0.84% |
| Cart Abandonment | 67.61% |
| Average Purchases per Buyer | 1.92 |

---

# Business Insights

1. Customer acquisition is strong but purchase conversion is weak.
2. Cart abandonment is the largest optimization opportunity.
3. A small group of customers contributes disproportionately to purchases.
4. Certain products receive high visibility but poor conversion.
5. Seasonal and hourly demand patterns can improve inventory planning.
6. Customer segmentation enables targeted retention campaigns.

---

# Business Recommendations

- Optimize checkout experience.
- Reduce cart abandonment using remarketing.
- Improve product pages with poor conversion.
- Personalize recommendations for loyal customers.
- Introduce promotional campaigns for at-risk customers.
- Build executive dashboards for continuous KPI monitoring.

---

# Power BI Dashboard

Recommended Pages

1. Executive Overview
2. Customer Analytics
3. Product Performance
4. Funnel Analysis
5. Category Insights
6. Time-Series Trends
7. Customer Segmentation
8. CLV Dashboard

Suggested Visuals

- KPI Cards
- Line Charts
- Funnel Chart
- Treemap
- Matrix
- Heatmaps
- Slicers
- Bar Charts

---

# Repository Structure

```text
RetailRocket-Product-Analytics/
│
├── data/
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_data_profiling.sql
│   ├── 03_data_cleaning.sql
│   ├── 04_exploratory_analysis.sql
│   ├── 05_funnel_analysis.sql
│   ├── 06_product_metrics.sql
│   ├── 07_rfm_customer_segmentation.sql
│   ├── 08_ab_testing_simulation.sql
│   └── 09_clv_analysis.sql
├── dashboard/
├── reports/
├── images/
└── README.md
```

# Skills Demonstrated

Technical

- SQL Server
- Complex SQL Queries
- Window Functions
- CTEs
- Joins
- Aggregate Functions
- ETL
- Data Modeling
- Power BI
- Business Intelligence

Business

- Product Analytics
- Customer Analytics
- KPI Development
- Funnel Optimization
- Customer Segmentation
- Executive Reporting
- Data Storytelling

---

# Future Improvements

- Real-time pipeline using Azure Data Factory
- Predictive demand forecasting
- Recommendation engine
- Cohort retention analysis
- Churn prediction
- Market basket analysis
- Statistical significance testing
- Revenue forecasting

---

# Conclusion

This project demonstrates the complete lifecycle of an analytics solution—from raw transactional data to executive-level insights. It combines data engineering, SQL analytics, business intelligence, and product analytics to solve practical e-commerce problems. The repository showcases production-oriented SQL practices, structured reporting, and business-focused recommendations suitable for analytics, business intelligence, and product analyst roles.

