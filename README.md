# 🚀 SaaS Product Analytics & Churn Analysis System

![Python](https://img.shields.io/badge/Python-Data%20Analysis-blue)
![SQL](https://img.shields.io/badge/SQL-PostgreSQL-green)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)

---

## 📌 Problem Statement

SaaS companies often struggle to understand customer behavior, leading to high churn and low engagement. Key challenges include:

- Identifying customers likely to churn  
- Understanding product usage patterns  
- Evaluating the impact of errors and support on retention  
- Identifying high-value customer segments  

---

## 🎯 Objective

This project aims to:

- Analyze customer behavior using SaaS data  
- Identify key drivers of churn  
- Understand product engagement patterns  
- Evaluate support and error impact on retention  
- Build interactive dashboards for business decision-making  

---

## 🧰 Tech Stack

- **Python (Pandas, NumPy)** → Data Cleaning & Feature Engineering  
- **SQL (PostgreSQL)** → Data Analysis  
- **Power BI** → Dashboard & Visualization  

---

## 📂 Dataset Description

The project uses multiple datasets:

- **Accounts** → Customer details  
- **Subscriptions** → Plan & billing information  
- **Feature Usage** → Event-level user activity  
- **Support Tickets** → Customer interactions  
- **Churn Events** → Customer churn status  

---

## ⚙️ Project Workflow

### 1️⃣ Data Cleaning
- Converted date columns to datetime format  
- Handled missing values  
- Standardized data formats  

---

### 2️⃣ Data Merging
- Combined datasets using `account_id`  
- Created master dataset (~147K rows)  

---

### 3️⃣ Feature Engineering (Core Step)
- Transformed event-level data → customer-level dataset  
- Created features:
  - Total feature usage  
  - Average usage duration  
  - Total errors  
  - Total tickets  
  - Customer satisfaction  
  - ARR & MRR  

➡️ Final dataset: **500 × 20**

---

### Churn Prediction Model
- Analyzed SaaS customer data to understand churn, engagement, and revenue patterns, and built a churn prediction model. Created dashboards and a customer health scoring system to generate actionable insights.

---

### 4️⃣ SQL Analysis
- Churn rate by industry  
- Support impact on churn  
- Customer segmentation  

---

### 5️⃣ Dashboard Creation (Power BI)

Built 3 interactive dashboards:

---

## 📊 Dashboards & Insights

---

### 🔹 Executive Overview

![Executive Dashboard](dashboards/executive.png)

- Total Customers: 500  
- Total ARR: 4 Billion  
- Total MRR: 330 Million  
- Churn Rate: ~22%  

💡 **Insights:**
- High churn rate indicates retention challenges  
- Revenue is concentrated in Pro & Enterprise plans  
- A large portion of customers fall into the At Risk category  

---

### 🔹 Product Usage Dashboard

![Usage Dashboard](dashboards/usage.png)

💡 **Insights:**
- Most users are clustered in low usage range (0–5K)  
- Low engagement strongly correlates with churn  
- Higher usage leads to more support tickets  
- Errors increase with usage → product stability issues  

---

### 🔹 Customer Health & Churn Dashboard

![Health Dashboard](dashboards/health.png)

💡 **Insights:**
- Majority customers are classified as “At Risk”  
- Low health score strongly correlates with churn  
- More support tickets → lower satisfaction  
- Silent dissatisfaction observed (low tickets but low satisfaction)  

---

## 🔍 Key Business Insights

- 📉 **Churn Rate ~22%** → Major retention concern  
- 📊 **Low engagement is the strongest churn indicator**  
- ⚠️ **High error rates significantly impact retention**  
- 📞 **Support experience directly affects satisfaction**  
- 👥 **Revenue is concentrated in high-value plans**  

---

## 💡 Business Recommendations

- Improve onboarding to increase early engagement  
- Reduce product errors and improve stability  
- Enhance customer support response quality  
- Focus retention strategies on high-value customers  

---

## ⚡ Advanced Features

- **Customer Health Score System** → Segment users into Healthy, Neutral, At Risk  
- **Interactive Dashboards** → Business-level insights  
- **Drill-through Analysis** → Navigate from high-level KPIs to individual customer-level insights for deep analysis  

---

## 📈 Future Improvements

- Add time-based trend analysis  
- Build machine learning churn prediction model  
- Deploy real-time dashboards  

---

## 👩‍💻 Author

**Gauri Borse**  
Aspiring Data Analyst and Business analyst

🔗 LinkedIn: https://www.linkedin.com/in/gauri-borse-a8146135b/

---

## ⭐ Final Note

This project demonstrates an end-to-end SaaS analytics workflow — from raw data processing to business insights — reflecting real-world product analytics practices.
This analysis is based on a sample SaaS dataset (ravenstack) used for learning purposes.

---

⭐ If you like this project, give it a star!
