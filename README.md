# RetailRocket Product & Customer Analytics
### End-to-End E-commerce Analytics using SQL Server & Power BI

---

<p align="center">
![SQL Server](https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
</p>

---

# Executive Summary

Modern e-commerce platforms generate millions of customer interactions every day. Every product view, cart addition, purchase, and browsing session contains valuable information that can drive business growth. However, raw transactional data alone cannot answer strategic business questions without structured analytics.

This project presents a complete end-to-end Product Analytics solution built using **SQL Server** and **Power BI**, leveraging over **2.7 million customer events** from the RetailRocket dataset.

Rather than treating SQL as merely a querying language, this project demonstrates how SQL can be used to build a complete analytics pipeline—from data ingestion and transformation to business intelligence and executive decision-making.

Throughout this project, raw event logs are transformed into meaningful business insights through data profiling, cleaning, customer segmentation, product analytics, conversion funnel analysis, customer lifetime value estimation, and KPI reporting.

The objective is not only to answer analytical questions but also to simulate the day-to-day responsibilities of a Product Analyst or Business Intelligence Analyst working in an e-commerce organization.

---

# Business Problem

Every e-commerce organization faces several fundamental questions:

- Which products receive the highest customer attention?
- Why do customers abandon purchases?
- Which customers generate the highest long-term value?
- Which product categories deserve increased investment?
- Which KPIs should executives monitor regularly?
- Where does revenue leakage occur?
- How can conversion rates be improved?

Although millions of user interactions are collected every day, these questions cannot be answered directly from raw event logs.

Without structured analytics:

- Marketing budgets become inefficient.
- Customer retention suffers.
- Inventory planning becomes inaccurate.
- Product decisions rely on intuition rather than data.
- Revenue opportunities remain hidden.

This project addresses these challenges by building an analytical data model capable of transforming raw customer behavior into actionable business intelligence.

---

# Project Objectives

The primary objectives of this project are:

### Data Engineering

- Import raw RetailRocket datasets into SQL Server
- Build an optimized relational database
- Clean and transform raw data
- Preserve historical information
- Create reusable analytical tables

### Product Analytics

- Identify top-performing products
- Measure product engagement
- Evaluate product conversion
- Analyze purchasing behavior
- Detect products requiring optimization

### Customer Analytics

- Segment customers using RFM Analysis
- Estimate Customer Lifetime Value
- Identify loyal customers
- Discover at-risk customers
- Understand purchasing patterns

### Business Intelligence

- Build executive KPIs
- Design Power BI dashboards
- Develop reusable SQL reports
- Generate business recommendations
- Support data-driven decision making

---

# Dataset Overview

This project utilizes the publicly available **RetailRocket Recommender System Dataset**, containing anonymized customer interactions collected from an online retail platform.

The dataset captures the complete customer purchase journey including browsing behavior, cart additions, and completed transactions.

## Dataset Statistics

| Metric | Value |
|----------|-----------:|
| Customer Events | 2,756,101 |
| Customers | 1,407,580 |
| Products | 235,061 |
| Transactions | 22,457 |
| Product Properties | 20,275,902 |
| Categories | 1,669 |

---

## Event Types

The dataset contains three customer actions:

| Event | Description |
|---------|------------|
| View | Customer viewed a product |
| Add to Cart | Product added to shopping cart |
| Transaction | Successful purchase |

These events collectively represent the customer purchase funnel.

---

# Technology Stack

| Category | Technology |
|------------|----------------|
| Database | SQL Server |
| Query Language | T-SQL |
| Data Cleaning | SQL |
| Analytics | SQL |
| Dashboard | Power BI |
| Spreadsheet Analysis | Microsoft Excel |
| Version Control | Git |
| Repository | GitHub |

---

# Project Workflow

The project follows a structured analytics lifecycle similar to enterprise Business Intelligence implementations.

```
RetailRocket Dataset
        │
        ▼
Data Import
        │
        ▼
Data Profiling
        │
        ▼
Data Cleaning
        │
        ▼
Analytical Database
        │
        ▼
Exploratory Data Analysis
        │
        ▼
Business KPI Development
        │
        ▼
Product Analytics
        │
        ▼
Customer Analytics
        │
        ▼
Power BI Dashboard
        │
        ▼
Business Recommendations
```

Every stage builds upon the previous one, ensuring analytical consistency throughout the project.

---

# Repository Structure

```
RetailRocket-Product-Analytics/
│
├── data/
│
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
│
├── dashboard/
│
├── reports/
│
├── images/
│
└── README.md
```

---

# Database Architecture

The project follows a layered database architecture separating raw ingestion from analytical reporting.

## Raw Tables

The raw layer stores the original RetailRocket datasets without modification.

| Table | Description |
|----------|----------------------------|
| events_raw | Customer interaction events |
| item_properties_raw | Historical product properties |
| category_tree_raw | Product category hierarchy |

These tables preserve historical data exactly as received.

---

## Analytical Tables

The analytical layer contains cleaned, standardized, reporting-ready datasets.

| Table | Description |
|-----------|-----------------------|
| events | Cleaned customer events |
| products | Latest product snapshot |
| categories | Product hierarchy |

Separating raw and analytical tables enables reproducible ETL pipelines while maintaining data lineage.

---

# ETL Pipeline

The ETL process converts raw datasets into optimized analytical tables.

## Extract

Import CSV datasets into SQL Server staging tables.

↓

## Transform

- Standardize timestamps
- Remove inconsistencies
- Create latest product snapshots
- Normalize categories
- Handle missing values
- Improve data quality

↓

## Load

Populate analytical tables optimized for reporting and dashboarding.

This ETL design mirrors industry-standard data warehousing practices where raw operational data is transformed into analytics-ready datasets.

---

# SQL Analysis Pipeline

The project is divided into nine independent SQL modules.

| Module | Purpose |
|-----------|-------------------------|
| 01 | Database Setup |
| 02 | Data Profiling |
| 03 | Data Cleaning |
| 04 | Exploratory Analysis |
| 05 | Funnel Analysis |
| 06 | Product Analytics |
| 07 | Customer Segmentation |
| 08 | A/B Testing Simulation |
| 09 | Customer Lifetime Value |

Each module focuses on a specific business objective while remaining reusable and independently executable.

---

# Key Business Questions

This project is designed to answer practical business questions commonly encountered by Product Managers, Business Analysts, and Data Analysts.

### Customer Analytics

- How many active customers exist?
- Who are the highest-value customers?
- Which customers are at risk?
- How frequently do customers purchase?

---

### Product Analytics

- Which products generate maximum engagement?
- Which products convert best?
- Which products have poor purchase rates?
- Which categories drive the highest sales?

---

### Funnel Analytics

- What percentage of visitors add products to the cart?
- What percentage complete purchases?
- Where do customers abandon the journey?
- How can conversion rates be improved?

---

### Executive Analytics

- Which KPIs require continuous monitoring?
- Which categories deserve increased investment?
- Which products should be promoted?
- Which customer segments require targeted marketing?

---

# Data Quality Assessment

Before any business analysis, extensive profiling was performed to evaluate data quality.

The profiling stage focused on:

- Missing values
- Duplicate records
- Invalid timestamps
- Category consistency
- Product availability
- Customer counts
- Event distributions

This ensured that all subsequent analyses were performed on reliable and standardized data.

---

# Project Highlights

- Built an end-to-end SQL analytics pipeline
- Processed over **2.7 million** customer interactions
- Designed reusable analytical database schema
- Developed **9 modular SQL scripts**
- Built executive-level KPIs
- Performed product analytics and customer segmentation
- Simulated A/B testing methodology
- Estimated Customer Lifetime Value
- Designed Power BI dashboard architecture

- Produced business recommendations backed by data

# Data Profiling

Data profiling is the first analytical stage of the project. Before performing any business analysis, the raw RetailRocket dataset was examined to understand its structure, identify inconsistencies, and assess overall data quality.

The objective of this phase was to ensure that subsequent analyses were based on accurate, reliable, and standardized data.

## Profiling Objectives

- Understand dataset dimensions
- Detect missing values
- Identify duplicate records
- Examine event distribution
- Validate product properties
- Verify category hierarchy
- Assess data completeness

## Dataset Summary

| Dataset | Records |
|----------|---------:|
| Events | 2,756,101 |
| Product Properties | 20,275,902 |
| Categories | 1,669 |

## Event Distribution

| Event | Count | Percentage |
|---------|---------:|----------:|
| View | 2,664,312 | 96.67% |
| Add to Cart | 69,332 | 2.52% |
| Transaction | 22,457 | 0.81% |

### Key Observations

- Customer browsing dominates platform activity.
- Less than 1% of interactions result in purchases.
- Conversion optimization represents the largest business opportunity.

---

# Data Cleaning & Transformation

Raw datasets were transformed into analytics-ready tables using SQL Server ETL procedures.

## Cleaning Operations

- Converted Unix timestamps into SQL datetime format
- Removed inconsistent records
- Standardized column names
- Created latest product snapshot
- Mapped products with categories
- Preserved raw historical data
- Improved relational integrity

## Output Tables

| Table | Purpose |
|---------|-------------------------|
| events | Cleaned event data |
| products | Latest product attributes |
| categories | Category hierarchy |

This layered architecture separates ingestion from reporting, improving maintainability and scalability.

---

# Exploratory Data Analysis (EDA)

Exploratory Data Analysis was conducted to understand customer behavior, product engagement, purchasing trends, and overall platform performance.

## Overall Statistics

| KPI | Value |
|------|-------:|
| Customers | 1,407,580 |
| Products | 235,061 |
| Transactions | 22,457 |
| Average Actions per Customer | 1.96 |

## Time-Based Analysis

Analysis revealed several important behavioral trends.

### Monthly Trends

- July recorded the highest activity.
- Customer engagement gradually declined afterwards.
- Seasonal variation exists in customer interactions.

### Hourly Trends

Peak activity occurs between **5 PM and 10 PM**, indicating that customers are most active during evening hours.

### Weekday vs Weekend

Weekday engagement exceeded weekend activity, suggesting users interact with the platform more frequently during regular working days.

## Product Availability

| Status | Products |
|---------|----------:|
| Available | 54,010 |
| Unavailable | 363,043 |

### Business Insights

- Product availability directly impacts purchasing opportunities.
- Large inactive inventories indicate opportunities for catalog optimization.

---

# Funnel Analysis

Understanding customer movement through the purchasing journey is critical for improving conversion rates.

The purchase funnel consists of three stages:

```
Product View
      ↓
Add to Cart
      ↓
Purchase
```

## Funnel KPIs

| Metric | Value |
|---------|-------:|
| Product Views | 2,664,312 |
| Cart Adds | 69,332 |
| Purchases | 22,457 |

## Conversion Metrics

| Conversion Stage | Rate |
|-----------------|------:|
| View → Cart | 2.60% |
| Cart → Purchase | 32.39% |
| Overall View → Purchase | 0.84% |
| Cart Abandonment | 67.61% |

## Key Findings

- Most customers browse without purchasing.
- Nearly two-thirds of shopping carts are abandoned.
- Checkout optimization could significantly increase revenue.

---

# Product Analytics

Product analytics identifies which products attract attention, generate purchases, and require optimization.

## Metrics Evaluated

- Product Views
- Cart Adds
- Purchases
- Conversion Rate
- Engagement Score
- Customer Reach
- Repeat Purchases

## Top Performing Products

| Metric | Product ID |
|---------|-----------:|
| Most Viewed | 187946 |
| Most Purchased | 461686 |
| Most Added to Cart | 461686 |

## Product Insights

- High visibility does not necessarily translate into purchases.
- Several products exhibit strong browsing activity but poor conversion.
- Product detail pages and pricing strategies should be reviewed for low-converting products.

---

# RFM Customer Segmentation

Customer segmentation enables personalized marketing and retention strategies.

Since transaction values are unavailable in the RetailRocket dataset, purchase frequency was used as a proxy for Monetary value.

## RFM Dimensions

### Recency

Measures how recently a customer made a purchase.

### Frequency

Measures how often purchases occur.

### Monetary (Proxy)

Estimated using purchase count.

## Customer Segments

| Segment | Customers |
|----------|----------:|
| Champions | 106 |
| Loyal Customers | 370 |
| Potential Loyalists | 1,219 |
| At Risk | 327 |
| Lost Customers | 9,697 |

## Business Applications

- Personalized recommendations
- Customer retention
- Loyalty campaigns
- Win-back campaigns
- VIP customer targeting

---

# Customer Lifetime Value (CLV)

Because product pricing is unavailable, Customer Lifetime Value was estimated using purchase frequency.

Although simplified, this approach provides a reasonable approximation for identifying high-value customers.

## Objectives

- Rank customers
- Prioritize retention
- Support loyalty initiatives
- Identify valuable customer segments

---

# A/B Testing Simulation

The RetailRocket dataset does not contain experimental groups.
To demonstrate experimentation methodology, customers were deterministically assigned into two groups using SQL hashing techniques.

## Comparison Metrics

- Purchase Conversion
- Cart Conversion
- Customer Engagement
- Purchase Frequency

This simulation demonstrates how SQL can be used to prepare experiment-ready datasets for statistical analysis.

---

# Executive KPI Dashboard

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
# Power BI Dashboard

The SQL analysis is complemented by an interactive Power BI dashboard that enables business users to monitor KPIs, customer behavior, product performance, and conversion trends through dynamic visualizations.

---

## Dashboard Overview

### Executive Dashboard

<p align="center">
    <img src="images/dashboard_overview.png" width="900">
</p>

**Highlights**

- Executive KPI Summary
- Total Customers
- Transactions
- Overall Conversion Rate
- Cart Abandonment Rate
- Revenue Proxy Metrics
- Interactive Filters

---

### Customer Analytics Dashboard

<p align="center">
    <img src="images/customer_dashboard.png" width="900">
</p>

Key Insights

- Customer Segmentation
- Purchase Frequency
- RFM Distribution
- Customer Lifetime Value
- Active vs Lost Customers

---

### Product Analytics Dashboard

<p align="center">
    <img src="images/product_dashboard.png" width="900">
</p>

Key Insights

- Top Products
- Product Conversion
- Engagement Score
- Category Performance
- Product Reach

---

### Funnel Dashboard

<p align="center">
    <img src="images/funnel_dashboard.png" width="900">
</p>

Key Insights

- Views
- Cart Adds
- Purchases
- Funnel Conversion
- Cart Abandonment

---

### Time Series Dashboard

<p align="center">
    <img src="images/time_dashboard.png" width="900">
</p>

Key Insights

- Monthly Trends
- Daily Trends
- Hourly Activity
- Peak Shopping Hours
- Seasonal Behaviour

---

# Key Business Findings

The analysis revealed several actionable insights:

### Customer Behavior

- Browsing activity is significantly higher than purchasing activity.
- Only a small fraction of visitors complete transactions.
- Customer engagement peaks during evening hours.

### Product Performance

- Several products receive substantial attention but fail to convert.
- Product popularity and profitability are not always correlated.
- Inventory optimization can improve operational efficiency.

### Conversion Optimization

- Cart abandonment represents the largest revenue leakage point.
- Improving checkout experience offers the highest potential business impact.
- Product page optimization can increase purchase rates.

### Customer Analytics

- A small number of loyal customers generate a disproportionate share of purchases.
- Targeted retention campaigns can maximize long-term customer value.
- RFM segmentation enables personalized marketing strategies.

---

# Business Recommendations

Based on the analysis, the following recommendations are proposed:

### Product Strategy

- Improve product descriptions for low-converting products.
- Highlight high-performing products on landing pages.
- Regularly review underperforming inventory.

### Marketing

- Retarget customers who abandon carts.
- Develop personalized campaigns using RFM segments.
- Reward loyal customers through exclusive offers.

### Operations

- Monitor product availability.
- Improve inventory forecasting.
- Reduce inactive product listings.

### Analytics

- Build automated KPI dashboards.
- Continuously monitor conversion metrics.
- Implement real-time customer segmentation.

---

# Power BI Dashboard

The accompanying Power BI dashboard provides an executive overview of platform performance.

## Dashboard Pages

1. Executive Summary
2. Customer Analytics
3. Product Performance
4. Funnel Analysis
5. Category Analysis
6. Time Series Trends
7. Customer Segmentation
8. Customer Lifetime Value

## Suggested Visualizations

- KPI Cards
- Funnel Charts
- Line Charts
- Bar Charts
- Treemaps
- Heatmaps
- Matrix Tables
- Interactive Slicers

---

# Skills Demonstrated

## SQL

- Complex Queries
- CTEs
- Window Functions
- Joins
- Aggregate Functions
- Date Functions
- Ranking Functions
- ETL Development

## Data Analytics

- Exploratory Data Analysis
- Funnel Analytics
- Product Analytics
- Customer Analytics
- KPI Development
- Business Intelligence
- Executive Reporting

## Business Concepts

- Customer Segmentation
- Conversion Optimization
- Customer Lifetime Value
- A/B Testing
- Data Storytelling
- Decision Support

---

# Future Enhancements

Potential extensions for this project include:

- Cohort Analysis
- Churn Prediction
- Recommendation Systems
- Market Basket Analysis
- Demand Forecasting
- Predictive Customer Lifetime Value
- Real-time Data Pipelines using Azure Data Factory
- Cloud Data Warehousing with Azure Synapse

---

# Conclusion

This project demonstrates a complete end-to-end analytics workflow for an e-commerce platform, beginning with raw customer interaction data and culminating in executive-level business insights.

Using SQL Server, a modular analytics pipeline was developed to profile, clean, transform, and analyze over **2.7 million customer events**. The project covers essential analytical domains including exploratory data analysis, conversion funnel analysis, product performance evaluation, RFM-based customer segmentation, customer lifetime value estimation, and A/B testing simulation.

Beyond technical implementation, the project emphasizes business decision-making by translating analytical findings into actionable recommendations for product optimization, customer retention, marketing strategy, and operational efficiency.

This repository showcases practical skills expected of Product Analysts, Business Analysts, and Data Analysts, including data modeling, SQL development, KPI design, business intelligence, and data storytelling. It serves as a production-oriented portfolio project demonstrating how raw data can be transformed into meaningful insights that support strategic business decisions.

---

# Contact
**Vansh Gupta**

Engineering Physics, Delhi Technological University (DTU)

**LinkedIn:*https://www.linkedin.com/in/vansh-guptaa/*

**Email:** *vansh9999gupta@gmail.com*

###If you found this project useful, consider giving the repository a ⭐.
