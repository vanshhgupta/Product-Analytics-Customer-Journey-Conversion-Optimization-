# 07. RFM Customer Segmentation Report

## Project
**E-commerce Product Analytics & Growth Optimization**

---

# Objective

The objective of this phase was to perform **RFM (Recency, Frequency, Monetary) Analysis** to understand customer purchasing behavior and identify high-value customer segments.

RFM analysis is one of the most widely used customer segmentation techniques in e-commerce, enabling businesses to improve customer retention, personalize marketing campaigns, and maximize customer lifetime value.

> **Note:** The RetailRocket dataset does not contain transaction values. Therefore, the **Monetary** component has been approximated using the total number of completed purchases made by each customer.

---

# Executive Summary

| KPI | Value |
|------|------:|
| Purchasing Customers | **11,719** |
| Total Purchases | **22,457** |
| Average Purchases per Customer | **1.92** |

### Key Findings

- The platform recorded **11,719 unique purchasing customers**.
- Customers completed **22,457 successful transactions**.
- On average, each purchasing customer made **1.92 purchases**, indicating that most customers purchased only once or twice.
- A relatively small group of highly active customers contributed a significant share of total purchases.

---

# Customer RFM Metrics

For every purchasing customer, the following metrics were calculated:

- **Recency:** Number of days since the customer's last purchase.
- **Frequency:** Total completed purchases.
- **Monetary:** Approximated using purchase count due to the absence of revenue information.

### Top Customer

| Visitor ID | Recency | Frequency | Monetary |
|------------|---------:|----------:|---------:|
| **1150086** | **1 day** | **559** | **559** |

### Observation

A small number of customers generated exceptionally high purchase frequencies, demonstrating highly engaged buying behavior.

---

# Most Valuable Customers

The highest-value customers were identified using purchase frequency and purchase recency.

| Visitor ID | Frequency |
|------------|----------:|
| 1150086 | **559** |
| 152963 | **349** |
| 530559 | **286** |
| 684514 | **189** |
| 861299 | **188** |

### Business Insight

These customers represent the platform's most valuable users and should receive priority through loyalty rewards, exclusive promotions, and personalized recommendations.

---

# Customer Recency Distribution

Customers were categorized according to the time since their most recent purchase.

| Customer Status | Customers |
|-----------------|----------:|
| Active (31–90 Days) | **5,219** |
| Inactive (91–180 Days) | **4,124** |
| Recent (≤30 Days) | **2,376** |

### Key Findings

- The largest customer group consists of customers who purchased within the last **31–90 days**.
- More than **4,000 customers** have not purchased for over three months, indicating an opportunity for re-engagement campaigns.

### Business Insight

Targeted email campaigns, personalized offers, and remarketing strategies can help reactivate inactive customers before they become permanently lost.

---

# Purchase Frequency Distribution

Customers were segmented according to purchase frequency.

| Purchase Type | Customers |
|---------------|----------:|
| One-Time | **9,143** |
| Occasional | **2,199** |
| Frequent | **219** |
| Very Frequent | **158** |

### Key Findings

- Nearly **78%** of purchasing customers completed only a single purchase.
- Only a small percentage of customers became repeat purchasers.

### Business Insight

Increasing repeat purchases should be a key business objective through loyalty programs, personalized recommendations, and post-purchase engagement.

---

# RFM Customer Segments

Customers were classified into standard RFM-inspired segments.

| Customer Segment | Customers |
|------------------|----------:|
| Lost Customers | **9,697** |
| Potential Loyalists | **1,219** |
| Loyal Customers | **370** |
| At Risk | **327** |
| Champions | **106** |

### Segment Interpretation

- **Champions:** Recently active customers with frequent purchases.
- **Loyal Customers:** Regular repeat buyers showing consistent engagement.
- **Potential Loyalists:** Customers likely to become loyal with targeted engagement.
- **At Risk:** Previously active customers whose recent activity has declined.
- **Lost Customers:** Customers who have not returned for an extended period.

### Business Insight

The dominance of the **Lost Customers** segment highlights the importance of improving customer retention throughout the purchase lifecycle.

---

# High-Value Customers

Customers with both high purchase frequency and recent activity represent the platform's highest-value users.

These customers are ideal candidates for:

- VIP loyalty programs
- Early product launches
- Personalized discounts
- Premium customer support
- Referral campaigns

---

# Overall Business Insights

The RFM analysis reveals several important customer behavior patterns:

- Most purchasing customers complete only one transaction.
- Customer purchasing activity is highly concentrated among a relatively small number of highly engaged users.
- The platform contains a substantial population of inactive and lost customers who represent opportunities for reactivation.
- Only a limited number of customers qualify as Champions or Loyal Customers, indicating significant potential for improving long-term customer retention.
- RFM segmentation provides a structured framework for designing targeted marketing and customer retention strategies.

---

# Recommendations

Based on the analysis, the following actions are recommended:

- Launch customer retention campaigns targeting Lost and At Risk customers.
- Reward Champions and Loyal Customers with exclusive benefits and loyalty incentives.
- Encourage repeat purchases through personalized product recommendations.
- Develop lifecycle marketing campaigns for Potential Loyalists to increase long-term engagement.
- Continuously monitor RFM segments to evaluate customer behavior and optimize marketing strategies.

---

# Conclusion

The RFM Customer Segmentation analysis provides a comprehensive understanding of customer purchasing behavior by evaluating recency, purchase frequency, and customer value.

Despite the absence of transaction revenue, the adapted RFM framework successfully identifies high-value customers, loyal buyers, and customer retention opportunities. These insights support data-driven decision-making for customer relationship management, personalized marketing, and long-term business growth.

---

# Project Completion

This report concludes the SQL analytics workflow for the **RetailRocket Product Analytics Project**, which includes:

- Database Setup
- Data Profiling
- Data Cleaning
- Exploratory Data Analysis
- Purchase Funnel Analysis
- Product Performance Metrics
- RFM Customer Segmentation

Together, these analyses provide an end-to-end view of customer behavior, product performance, and business opportunities within an e-commerce environment.
