# Total cusomters
SELECT COUNT(*) AS Total_Customers FROM churn_modelling;

#Total churned customers
SELECT COUNT(*) AS Total_Churned_Customers FROM churn_modelling WHERE Exited = 1;

# Churn rate
SELECT 
    ROUND(
        (SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Churn_Rate_Percentage
FROM 
    churn_modelling;
 
# Avg account balance 
SELECT 
    ROUND(AVG(Balance), 2) AS Average_Account_Balance
FROM 
    churn_modelling;
    
# Active cusotmer rate
SELECT 
    ROUND(
        (SUM(CASE WHEN IsActiveMember = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Active_Customer_Rate
FROM 
    churn_modelling;
    
# Credit card ownership rate 
SELECT 
    ROUND(
        (SUM(CASE WHEN HasCrCard = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Credit_Card_Ownership_Rate
FROM 
    churn_modelling;

# 1. avg age 
SELECT 
    ROUND(AVG(Age), 2) AS Avg_Age
FROM churn_modelling;

# 2. avg credit score
SELECT 
    ROUND(AVG(CreditScore), 2) AS Avg_Credit_Score
FROM churn_modelling;

# 3. avg tenure
SELECT 
    ROUND(AVG(Tenure), 2) AS Avg_Tenure
FROM churn_modelling;

# 4. avg salary
SELECT 
    ROUND(AVG(EstimatedSalary), 2) AS Avg_Estimated_Salary
FROM churn_modelling;

# 5. Total exited
SELECT 
    COUNT(*) AS Total_Exited
FROM churn_modelling
WHERE Exited = 1;

# 6. customer with credit card
SELECT 
    SUM(CASE WHEN HasCrCard = 1 THEN 1 ELSE 0 END) AS Customers_With_Card,
    ROUND(
        SUM(CASE WHEN HasCrCard = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS With_Card_Percentage
FROM churn_modelling;

# 7. Active customers
SELECT 
    SUM(CASE WHEN IsActiveMember = 1 THEN 1 ELSE 0 END) AS Active_Customers,
    ROUND(
        SUM(CASE WHEN IsActiveMember = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS Active_Customers_Percentage
FROM churn_modelling;

# 8. Avg number of products
SELECT 
    ROUND(AVG(NumOfProducts), 2) AS Avg_Num_Products
FROM churn_modelling;

# 9. Exited customer by gender
SELECT 
    Gender,
    COUNT(*) AS Exited_Customers
FROM churn_modelling
WHERE Exited = 1
GROUP BY Gender;

# 10. Total number of exited customers
SELECT 
    Exited,
    COUNT(*) AS Num_Customers
FROM churn_modelling
GROUP BY Exited;

# 11. Count of customers by balance and exited
SELECT 
    CASE 
        WHEN Balance < 50000 THEN 'Low (<50k)'
        WHEN Balance BETWEEN 50000 AND 100000 THEN 'Medium (50k-100k)'
        ELSE 'High (>100k)'
    END AS Balance_Range,
    Exited,
    COUNT(*) AS Num_Customers
FROM churn_modelling
GROUP BY Balance_Range, Exited

# 12. Customer churn by number of products
SELECT 
    NumOfProducts,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Exited_Customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS Churn_Rate_Percentage
FROM churn_modelling
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

# 13. Customer by country count and churn
SELECT 
    Geography,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Exited_Customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS Churn_Rate_Percentage
FROM churn_modelling
GROUP BY Geography
ORDER BY Geography;


