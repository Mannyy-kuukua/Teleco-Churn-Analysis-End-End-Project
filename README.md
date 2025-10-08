# Teleco-Churn-Analysis-End-End-Project


---

#  Customer Churn Analysis (SQL Project)

##  Overview

This project explores customer churn behavior using **SQL**  and **Power BI**. The analysis identifies key factors that influence churn, calculates churn and retention rates, and provides insights into customer behavior based on demographics, contracts, and service usage.

The dataset used is a **telecommunication churn dataset**, where each record represents a customer’s subscription details, service usage, and churn status.

---
## Dashboard Preview
---
<img width="1446" height="814" alt="MTN 1" src="https://github.com/user-attachments/assets/8301777b-41da-4b3c-a1d0-be98f21e3351" />

<img width="1453" height="810" alt="MTN 2" src="https://github.com/user-attachments/assets/b558bb74-2077-4b84-a8d8-9d4c8c5ca993" />

---

##  Database Setup

```sql
USE churn;

-- Viewing the dataset
SELECT * FROM churn_data;

-- Creating a duplicate table for analysis
CREATE TABLE churn_analysis (
  customerID VARCHAR(255),
  gender TEXT,
  SeniorCitizen INT,
  IsSeniorCitizen TEXT,
  Partner TEXT,
  Dependents TEXT,
  tenure INT,
  TenureGroup TEXT,
  PhoneService TEXT,
  MultipleLines TEXT,
  InternetService TEXT,
  OnlineSecurity TEXT,
  OnlineBackup TEXT,
  DeviceProtection TEXT,
  TechSupport TEXT,
  StreamingTV TEXT,
  StreamingMovies TEXT,
  Contract TEXT,
  PaperlessBilling TEXT,
  PaymentMethod TEXT,
  MonthlyCharges DOUBLE,
  `Charge Group` TEXT,
  TotalCharges DOUBLE,
  Churn TEXT,
  ChurnFlag INT
);

INSERT INTO churn_analysis
SELECT * FROM churn_data;
```

---

##  Key Metrics

### Total Customers

```sql
SELECT COUNT(*) FROM churn_analysis;
```

###  Total Customer Churn

```sql
SELECT COUNT(*) FROM churn_analysis WHERE Churn = 'Yes';
-- Result: 1869 customers churned
```

### Customer Retention

```sql
SELECT COUNT(*) FROM churn_analysis WHERE Churn = 'No';
```

###  Churn Rate

```sql
SELECT 
  ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_percentage
FROM churn_analysis;
-- Churn Rate: 26.58%
```

###  Retention Rate

```sql
SELECT 
  ROUND(100.0 * SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) / COUNT(*), 2) AS retention_rate
FROM churn_analysis;
-- Retention Rate: 73.42%
```

---

##  Churn Breakdown by Factors

### Gender

```sql
SELECT gender, COUNT(gender) AS Total_churn
FROM churn_analysis
WHERE Churn = 'Yes'
GROUP BY gender;
```

###  Contract Type

```sql
SELECT Contract, COUNT(Contract) AS ChurnCount
FROM churn_analysis
WHERE Churn = 'Yes'
GROUP BY Contract;
```

> **Insight:** Customers with **month-to-month contracts** have the highest churn.

---

###  Tech Support

```sql
SELECT TechSupport, COUNT(TechSupport)
FROM churn_analysis
WHERE Churn = 'Yes'
GROUP BY TechSupport;
```

> **Insight:** Customers with **no tech support** recorded the highest churn.

---

###  Internet Service Type

```sql
SELECT InternetService, COUNT(InternetService)
FROM churn_analysis
WHERE Churn = 'Yes'
GROUP BY InternetService;
```

> **Insight:** **Fiber optic users** have the highest churn rate.

---

### Monthly Charges

```sql
SELECT `Charge Group`, COUNT(`Charge Group`) AS Churn
FROM churn_analysis
WHERE Churn = 'Yes'
GROUP BY `Charge Group`;
```

> **Insight:** Users in the **high charge group** recorded the most churn.

---

### Online Security

```sql
SELECT OnlineSecurity, COUNT(OnlineSecurity)
FROM churn_analysis
WHERE Churn = 'Yes'
GROUP BY OnlineSecurity;
```

> **Insight:** Customers **without online security** are more likely to churn.

---

### Senior Citizens

```sql
SELECT IsSeniorCitizen, COUNT(IsSeniorCitizen)
FROM churn_analysis
WHERE Churn = 'Yes'
GROUP BY IsSeniorCitizen;
```

> **Insight:** **Younger citizens** recorded the highest churn.

---

###  Partner & Dependents

```sql
SELECT Partner, Dependents, COUNT(*) AS Churn
FROM churn_analysis
WHERE Churn = 'Yes'
GROUP BY Partner, Dependents;
```

> **Insight:** Customers with **no partners and no dependents** are more likely to churn.

---

### Payment Method

```sql
SELECT PaymentMethod, COUNT(PaymentMethod)
FROM churn_analysis
WHERE Churn = 'Yes'
GROUP BY PaymentMethod;
```

> **Insight:** Customers who use **Electronic Checks** have the highest churn.

---

## 🧠 Summary of Insights

| Factor                  | Key Finding                             |
| ----------------------- | --------------------------------------- |
| **Contract Type**       | Month-to-month customers churn the most |
| **Tech Support**        | No tech support → higher churn          |
| **Internet Service**    | Fiber optic customers churn more        |
| **Charges**             | High charge group has more churn        |
| **Online Security**     | Lack of security increases churn        |
| **Age Group**           | Younger citizens churn more             |
| **Dependents/Partners** | Singles churn more                      |
| **Payment Method**      | Electronic check users churn most       |

---
## Recommendations

* Encourage long-term contracts – Offer discounts or rewards for customers who choose yearly or bi-annual plans.

* Improve customer support – Provide free or affordable tech support to new customers.

* Revisit pricing strategy – Review high-charge plans and align prices with value received.

* Add security bundles – Offer online security as part of the basic package.

* Engage younger customers – Use loyalty programs or personalized offers to retain them.

* Target single customers – Create referral or “partner” plans to improve engagement.

* Promote alternative payment options – Educate users on more stable payment methods like auto-pay or credit cards.
---

##  Conclusion

The analysis highlights that **short-term contracts, high charges, and lack of technical support** are major contributors to customer churn. Businesses can improve retention by offering:

* Discounted rates for long-term contracts
* Better technical support and online security options
* Incentives for electronic check users to switch to more reliable payment methods

---

## 🛠️ Tools Used

* **MySQL** for data querying and analysis
* **Power BI**  for visualization


---

## 📚 Author

👩‍💻 **Manasia Dankwah Sackey**
*Data Analyst*
📍 Ghana
🔗 [LinkedIn Profile](www.linkedin.com/ManasiaSackey)


