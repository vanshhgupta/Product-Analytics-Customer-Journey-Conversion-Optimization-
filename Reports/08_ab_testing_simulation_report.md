# 08 A/B Testing Simulation Report

## RetailRocket Product Analytics Project

---

# Overview

A/B testing is one of the most widely used methodologies in product analytics for evaluating whether changes to a product or user experience improve business performance. Since the RetailRocket dataset does not include actual experimental groups, a **simulated A/B testing framework** was developed using SQL Server.

Customers were deterministically assigned into **Group A** and **Group B** using SQL hashing (`ABS(CHECKSUM(visitor_id)) % 2`), creating two balanced cohorts for comparison. The objective was to evaluate customer behavior, conversion performance, and engagement across both groups.

---

# Objectives

The objectives of this analysis were to:

- Simulate an industry-standard A/B testing workflow using SQL.
- Compare customer engagement across two experimental groups.
- Evaluate purchase funnel performance.
- Measure conversion rates at different stages of the customer journey.
- Identify which group demonstrates superior purchasing behavior.

---

# Experiment Design

| Parameter | Description |
|-----------|-------------|
| Experiment Type | Simulated A/B Test |
| Assignment Method | Deterministic SQL Hashing |
| Groups | Group A & Group B |
| Split Ratio | Approximately 50:50 |
| Randomization Unit | Visitor ID |

Using deterministic hashing ensures that each visitor is consistently assigned to the same experiment group while maintaining an almost equal distribution of customers.

---

# Group Distribution

| Experiment Group | Customers |
|-----------------|----------:|
| Group A | 703,790 |
| Group B | 703,790 |

## Observation

- Both groups contain an identical number of customers.
- The balanced distribution minimizes sampling bias and provides a reliable basis for performance comparison.

---

# Event Distribution

| Group | Views | Cart Adds | Purchases | Total Events |
|------|-------:|----------:|----------:|-------------:|
| Group A | 1,327,078 | 34,513 | 10,871 | 1,372,462 |
| Group B | 1,337,234 | 34,819 | 11,586 | 1,383,639 |

## Analysis

- Both experimental groups generated nearly identical browsing activity.
- Group B recorded **11,177 more customer interactions** than Group A.
- Group B also achieved **715 additional purchases**, indicating slightly stronger purchasing behavior.

---

# View-to-Cart Conversion

This metric measures the percentage of product views that resulted in a customer adding an item to the shopping cart.

| Group | Views | Cart Adds | Conversion Rate |
|------|-------:|----------:|---------------:|
| Group A | 1,327,078 | 34,513 | **2.60%** |
| Group B | 1,337,234 | 34,819 | **2.60%** |

## Interpretation

- Both groups exhibit identical View-to-Cart conversion rates.
- Product discovery and customer interest remain consistent across both cohorts.
- No meaningful behavioral difference is observed during the browsing stage.

---

# Cart-to-Purchase Conversion

This KPI evaluates how effectively customers complete purchases after adding products to their shopping carts.

| Group | Cart Adds | Purchases | Conversion Rate |
|------|----------:|----------:|---------------:|
| Group A | 34,513 | 10,871 | **31.50%** |
| Group B | 34,819 | 11,586 | **33.27%** |

## Analysis

Group B demonstrates a higher Cart-to-Purchase conversion rate.

**Improvement over Group A**

> **33.27% − 31.50% = 1.77 percentage points**

### Business Interpretation

Although the improvement is relatively small, even a modest increase in checkout conversion can result in significant revenue growth for large-scale e-commerce platforms.

---

# Overall Purchase Conversion

Overall Purchase Conversion measures the percentage of product views that ultimately resulted in completed purchases.

| Group | Views | Purchases | Purchase Conversion |
|------|-------:|----------:|-------------------:|
| Group A | 1,327,078 | 10,871 | **0.82%** |
| Group B | 1,337,234 | 11,586 | **0.87%** |

## Analysis

- Group B consistently outperformed Group A.
- The higher purchase conversion is primarily driven by better checkout completion rather than increased browsing activity.

---

# Customer Engagement

| Group | Customers | Average Actions per Customer | Maximum Actions |
|------|----------:|-----------------------------:|---------------:|
| Group A | 703,790 | 1 | 7,757 |
| Group B | 703,790 | 1 | 4,328 |

## Interpretation

- Average engagement per customer is identical for both groups.
- Group A contains a few highly active users, reflected in the higher maximum number of recorded actions.
- These extreme values have little impact on overall conversion performance.

---

# Purchasing Customers

| Group | Purchasing Customers | Total Purchases |
|------|---------------------:|---------------:|
| Group A | 5,835 | 10,871 |
| Group B | 5,884 | 11,586 |

## Analysis

- Group B includes **49 more purchasing customers** than Group A.
- Total purchases are **715 higher**, indicating stronger purchase completion within the group.

---

# Executive KPI Summary

| KPI | Group A | Group B |
|------|---------:|---------:|
| Customers | 703,790 | 703,790 |
| Total Events | 1,372,462 | 1,383,639 |
| Product Views | 1,327,078 | 1,337,234 |
| Cart Adds | 34,513 | 34,819 |
| Purchases | 10,871 | 11,586 |
| View → Cart Conversion | 2.60% | 2.60% |
| Cart → Purchase Conversion | 31.50% | **33.27%** |
| Overall Purchase Conversion | 0.82% | **0.87%** |

---

# Key Findings

## 1. Balanced Experiment

The deterministic hashing strategy successfully created two equally sized customer groups, ensuring a fair comparison.

## 2. Similar Browsing Behaviour

Both groups demonstrated identical View-to-Cart conversion rates, indicating that customer interest in products remained unchanged.

## 3. Better Checkout Performance

Group B achieved a **1.77 percentage point improvement** in Cart-to-Purchase conversion, suggesting more effective purchase completion.

## 4. Higher Overall Conversion

Group B recorded a higher View-to-Purchase conversion rate (0.87%) compared to Group A (0.82%).

## 5. Greater Purchase Volume

Despite nearly identical browsing behavior, Group B generated **715 additional purchases**, indicating stronger transactional performance.

---

# Business Recommendations

Based on the simulated experiment, the following recommendations are proposed:

- Investigate the factors contributing to Group B's stronger checkout performance.
- Conduct randomized A/B tests in a production environment to validate these findings.
- Focus optimization efforts on the checkout process, where the largest performance difference was observed.
- Continue monitoring conversion metrics alongside customer engagement KPIs.
- Implement structured experimentation frameworks to support future product improvements.

---

# Limitations

This analysis has several limitations:

- The experiment is simulated because the RetailRocket dataset does not contain actual experimental groups.
- Customer assignment is deterministic rather than randomly generated.
- Statistical significance testing (e.g., Chi-Square Test or Z-Test) was not performed.
- Revenue-based performance metrics could not be evaluated because transaction values are unavailable.

---

# Conclusion

This report demonstrates how SQL Server can be used to simulate an A/B testing workflow when experimental data is unavailable. The deterministic customer assignment enabled a balanced comparison of engagement and conversion metrics across two groups.

While both groups exhibited nearly identical browsing behavior, **Group B consistently outperformed Group A in checkout completion and overall purchase conversion**. Although these differences cannot be interpreted as causal without randomized experimentation and statistical validation, the analysis reflects a practical framework for experimentation commonly used in product analytics.

The simulated A/B testing process provides valuable insight into customer behavior and establishes a foundation for future experimentation, conversion optimization, and data-driven product decision-making.
