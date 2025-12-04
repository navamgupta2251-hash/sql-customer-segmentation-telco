-- INSIGHTS QUERIES

-- use telco


-- 1. Overall churn rate


-- SELECT 
--     COUNT(*) AS total_customers,
--     SUM(Churn = 'Yes') AS churned_customers,
--     ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate_percent
-- FROM telco_churn;


-- 2. Churn rate per contract type


-- SELECT 
--     Contract,
--     COUNT(*) AS customers,
--     SUM(Churn = 'Yes') AS churned,
--     ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate_percent
-- FROM telco_churn
-- GROUP BY Contract
-- ORDER BY churn_rate_percent DESC;


-- 3. MonthlyCharges distribution by churn


-- SELECT 
--     Churn,
--     ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
--     ROUND(MAX(MonthlyCharges), 2) AS max_monthly_charges
-- FROM telco_churn
-- GROUP BY Churn;


-- 4. Services that correlate with churn


-- SELECT InternetService,
--        COUNT(*) AS churn_count
-- FROM telco_churn
-- WHERE Churn = 'Yes'
-- GROUP BY InternetService
-- ORDER BY churn_count DESC;


-- 5. Tenure vs churn


-- SELECT 
--     CASE
--         WHEN tenure < 12 THEN '0–12 months'
--         WHEN tenure BETWEEN 12 AND 36 THEN '1–3 years'
--         ELSE '3+ years'
--     END AS tenure_group,
--     COUNT(*) AS customers,
--     SUM(Churn = 'Yes') AS churned,
--     ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate_percent
-- FROM telco_churn
-- GROUP BY tenure_group
-- ORDER BY churn_rate_percent DESC;

-- 6. Payment method vs churn


-- SELECT 
--     PaymentMethod,
--     COUNT(*) AS customers,
--     SUM(Churn = 'Yes') AS churned,
--     ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate_percent
-- FROM telco_churn
-- GROUP BY PaymentMethod
-- ORDER BY churn_rate_percent DESC;


-- 7. Average revenue per segment (based on spending quartile)


-- SELECT 
--     revenue_segment,
--     ROUND(AVG(MonthlyCharges), 2) AS avg_revenue
-- FROM final_segments
-- GROUP BY revenue_segment
-- ORDER BY revenue_segment;


-- 8. Which segment churns the most?


-- SELECT 
--     churn_segment,
--     COUNT(*) AS customers,
--     ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate
-- FROM final_segments
-- GROUP BY churn_segment
-- ORDER BY churn_rate DESC;


-- 9. Gender vs churn insight


-- SELECT 
--     gender,
--     COUNT(*) AS customers,
--     SUM(Churn = 'Yes') AS churned,
--     ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate
-- FROM telco_churn
-- GROUP BY gender;


-- 10. Senior citizen vs churn


-- SELECT 
--     SeniorCitizen,
--     COUNT(*) AS customers,
--     SUM(Churn = 'Yes') AS churned,
--     ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate
-- FROM telco_churn
-- GROUP BY SeniorCitizen
-- ORDER BY churn_rate DESC;


-- 11. Streaming usage vs churn


-- SELECT 
--     StreamingTV,
--     StreamingMovies,
--     COUNT(*) AS users,
--     SUM(Churn = 'Yes') AS churned
-- FROM telco_churn
-- GROUP BY StreamingTV, StreamingMovies
-- ORDER BY churned DESC;


-- 12. “High risk + high spenders” churn insight


-- SELECT 
--     customerID,
--     MonthlyCharges,
--     tenure,
--     Churn
-- FROM telco_churn
-- WHERE Churn = 'Yes'
--   AND MonthlyCharges > 80;



