USE churn;
-- Import data
-- Viewing the data
SELECT *
FROM churn_data;
-- DUPLICATING THE DATA

CREATE TABLE `churn_analysis` (
  `customerID` VARCHAR(255),
  `gender` text,
  `SeniorCitizen` int DEFAULT NULL,
  `IsSeniorCitizen` text,
  `Partner` text,
  `Dependents` text,
  `tenure` int DEFAULT NULL,
  `TenureGroup` text,
  `PhoneService` text,
  `MultipleLines` text,
  `InternetService` text,
  `OnlineSecurity` text,
  `OnlineBackup` text,
  `DeviceProtection` text,
  `TechSupport` text,
  `StreamingTV` text,
  `StreamingMovies` text,
  `Contract` text,
  `PaperlessBilling` text,
  `PaymentMethod` text,
  `MonthlyCharges` double DEFAULT NULL,
  `Charge Group` text,
  `TotalCharges` double DEFAULT NULL,
  `Churn` text,
  `ChurnFlag` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO churn_analysis
SELECT *
FROM churn_data;
SELECT *
FROM churn_analysis;
-- Count of values
SELECT COUNT(*)
FROM churn_data;

SELECT COUNT(*)
FROM churn_analysis;
-- 1.Total Customer Churn

SELECT COUNT(Churn)
FROM churn_analysis
WHERE Churn ='Yes';
# 1869  total churn 

-- Customer Retention
SELECT COUNT(Churn)
FROM churn_analysis
WHERE Churn ='No';
-- Churn percentage
SELECT 
  ROUND(
    100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 
    2
  ) AS churn_rate_percentage
FROM churn_analysis;
#26.58%

-- Customer Retention Rate
SELECT 
  ROUND(
    100.0 * SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) / COUNT(*), 
    2
  ) AS Customer_Retention_Rate_percentage
FROM churn_analysis;
#73.42 retention rate
-- Gender Churn
SELECT gender,Count(gender) AS Total_churn
FROM churn_analysis
WHERE Churn='Yes'
GROUP BY gender;
-- 2. Factors for Churn
SELECT Contract,Count(Contract)AS ChurnCount
FROM churn_analysis
WHERE Churn='Yes'
Group by Contract;

select*from churn_analysis;
SELECT TechSupport,Count(TechSupport)
FROM churn_analysis
WHERE Churn ='Yes'
GROUP BY TechSupport; # Customers with no tech support have the highest churn

-- now check all customers with internet support 
Select TechSupport,Count(TechSupport)
From churn_analysis
Group by TechSupport;

SELECT  MonthlyCharges,Count(MonthlyCharges) as TC
FROM churn_analysis
WHERE Churn='Yes'
GROUP BY MonthlyCharges
ORDER BY TC DESC;

SELECT `Charge Group`,COUNT(`Charge Group`) AS  Churn
FROM churn_analysis
WHERE Churn='Yes'
GROUP BY `Charge Group`;
# Users In the High charge group recorded the most churn 

SELECT InternetService,Count(InternetService) As Churn 
From churn_analysis
WhERE Churn='Yes'
Group by InternetService; 
# fiber Optic has the highest churn 

SELECT MultipleLines,Count(MultipleLines)
FROM churn_analysis
Where Churn='Yes'
Group  by MultipleLines;

SElECT OnlineSecurity,COUNT(OnlineSecurity)
FROM churn_analysis
WHERE Churn='Yes'
GROUP BY OnlineSecurity;
#No online Security recorded the hughest churn

select*from churn_analysis;

SELECT IsSeniorCitizen,COUNT(IsSeniorCitizen)
FROM churn_analysis
WHERE Churn='Yes'
GROUP BY IsSeniorCitizen;
#Younger Citizens recorded the highest churn

SElECT Partner,Dependents,COUNT(*) AS Churn
FROM churn_analysis
WHERE Churn='Yes'
GrOUP BY Partner,Dependents;
# Customers with no partners and dependents lead the churn

SELECT PaymentMethod,COUNT(PaymentMethod)
FROM churn_analysis
WHERE Churn='Yes'
GROUP BY PaymentMethod;
#Electronic check recored the highest churn

