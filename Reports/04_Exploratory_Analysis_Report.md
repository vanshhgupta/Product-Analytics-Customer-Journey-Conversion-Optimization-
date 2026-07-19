# 04. Exploratory Data Analysis Report

## Project
**E-commerce Product Analytics & Growth Optimization**

---

# Objective

The objective of this phase was to explore customer behavior, product engagement, purchasing patterns, and category performance using the cleaned RetailRocket dataset.

Unlike the previous ETL stage, this analysis focuses on understanding **how customers interact with the platform** and identifying trends that can support product optimization and business decision-making.

---

# Dataset Summary

| Metric | Value |
|--------|-------:|
| Total Events | **2,756,101** |
| Total Customers | **1,407,580** |
| Total Products | **235,061** |
| Total Transactions | **17,672** |

### Observation

The platform records a large volume of customer interactions but comparatively few completed purchases, indicating that the majority of customer activity occurs during the browsing stage.

---

# Event Distribution

| Event Type | Count | Percentage |
|------------|-------:|-----------:|
| View | 2,664,312 | 96.67% |
| Add to Cart | 69,332 | 2.52% |
| Transaction | 22,457 | 0.81% |

## Key Findings

- Product views dominate customer activity.
- Only a small proportion of viewed products are added to the cart.
- Purchase events account for less than 1% of total interactions.

### Business Insight

The large gap between views and purchases suggests opportunities to improve product discoverability, pricing strategies, checkout experience, or product information.

---

# Customer Analysis

## Summary

- Total Customers: **1.41 Million**
- Unique Buyers: **17,672**
- Average Actions per Customer: **1.96**

### Key Findings

- Most customers interact with only one or two products.
- A relatively small group of users generates a significant proportion of platform activity.
- Repeat purchasers represent only a small subset of the customer base.

### Business Insight

Improving customer retention and encouraging repeat visits could significantly increase overall engagement and revenue.

---

# Product Analysis

The analysis identified the most viewed, most added-to-cart, and most purchased products.

## Key Findings

- Product **461686** received the highest number of purchases (**133**).
- Product **119736** ranked among both the most viewed and most purchased products.
- Several products consistently appeared across views, carts, and purchases, indicating strong customer demand.

### Business Insight

High-performing products can be prioritized in recommendations, promotions, and homepage placements.

---

# Category Analysis

## Most Engaged Categories

The highest customer interaction was observed in:

- Category **1051**
- Category **1483**
- Category **491**
- Category **959**
- Category **342**

## Highest Purchasing Categories

Top-performing purchase categories included:

- Category **959**
- Category **1051**
- Category **1483**
- Category **196**
- Category **1542**

### Business Insight

Some categories attract significant customer traffic but do not generate proportional purchases, indicating potential optimization opportunities.

---

# Time-Based Analysis

## Monthly Activity

| Month | Total Events |
|--------|-------------:|
| May | 590,652 |
| June | 610,393 |
| July | **697,984** |
| August | 553,362 |
| September* | 303,710 |

\*Dataset contains partial September data.

### Key Findings

- Platform activity peaked during **July 2015**.
- Customer engagement gradually declined after July.
- September shows reduced activity because the dataset covers only part of the month.

---

## Hourly Activity

Customer interactions increase during the late afternoon and evening hours.

Peak activity occurs between:

- **17:00 – 22:00**

Lowest activity occurs during:

- **08:00 – 11:00**

### Business Insight

Promotional campaigns and push notifications should ideally be scheduled during peak engagement hours.

---

# Product Availability

| Availability | Products |
|-------------|---------:|
| Available | 54,010 |
| Unavailable | 363,043 |

### Observation

Only a relatively small proportion of products are currently available.

### Business Impact

Product availability can significantly influence customer conversion rates and should be monitored closely.

---

# Advanced Exploratory Analysis

## Highest Product Conversion Rates

Products with the highest purchase conversion rates include:

- Product **213834** (31.40%)
- Product **173653** (18.03%)
- Product **379953** (16.42%)

### Business Insight

These products successfully convert customer interest into purchases and may represent best practices for pricing, product presentation, or customer demand.

---

## Categories with the Largest Customer Base

The highest customer reach was observed in:

- Category **1483**
- Category **491**
- Category **1051**

These categories consistently attracted both high interaction volumes and large numbers of unique customers.

---

## Weekday vs Weekend Activity

| Day Type | Events | Unique Customers |
|----------|-------:|-----------------:|
| Weekday | 2,116,464 | 1,094,660 |
| Weekend | 639,637 | 367,662 |

### Key Finding

Customer activity is substantially higher during weekdays than weekends.

### Business Recommendation

Marketing campaigns should primarily target weekdays, while weekend campaigns can focus on promotions or customer retention initiatives.

---

## High-View, Low-Purchase Products

Several products accumulated thousands of views but generated **zero purchases**.

Examples include:

- Product **187946**
- Product **5411**
- Product **370653**

### Business Insight

These products represent potential conversion bottlenecks.

Possible reasons include:

- Uncompetitive pricing
- Poor product descriptions
- Low customer trust
- Weak product images
- Stock availability issues

These products should be prioritized for detailed investigation.

---

# Overall Business Insights

The exploratory analysis reveals several important behavioral patterns:

- Customer activity is heavily concentrated around product browsing.
- Conversion from product views to purchases remains relatively low.
- A small number of products and categories generate a disproportionate share of customer engagement.
- Platform activity peaks during weekday evenings.
- Several highly viewed products fail to convert into purchases, highlighting opportunities for optimization.

---

# Conclusion

The exploratory analysis establishes a comprehensive understanding of customer behavior across the platform.

These findings provide the foundation for deeper product analytics in the next phase of the project, where customer journeys will be analyzed through conversion funnels, drop-off rates, and purchasing behavior.

