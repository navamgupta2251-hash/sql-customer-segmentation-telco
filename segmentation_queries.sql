-- SQL SEGMENTATION QUERIES


-- Segmentation Group 1 — Monetary Segments


-- 1. High/Mid/Low spenders


-- SELECT 
--    customerID,
--    MonthlyCharges,
--    NTILE(3) OVER (ORDER BY MonthlyCharges DESC) AS revenue_segment
-- FROM telco_churn;


-- 2. Identify high-value customers


-- SELECT customerID, MonthlyCharges 
-- FROM telco_churn
-- WHERE MonthlyCharges > 80;


-- Segmentation Group 2 — Tenure Segments


-- 3. Tenure segments


-- SELECT customerID, tenure,
-- CASE
--   WHEN tenure < 12 THEN 'New'
--   WHEN tenure BETWEEN 12 AND 36 THEN 'Established'
--   ELSE 'Loyal'
-- END AS tenure_segment
-- FROM telco_churn;


-- 4. Loyal customers spending > 70


-- SELECT customerID, tenure, MonthlyCharges
-- FROM telco_churn
-- WHERE tenure > 36 AND MonthlyCharges > 70;


-- Segmentation Group 3 — Churn Risk Segments


-- 5. Churn risk logic (core segmentation)


-- SELECT customerID,
--        Churn,
--        tenure,
--        MonthlyCharges,
--        CASE
--          WHEN Churn='Yes' THEN 'High Risk'
--          WHEN tenure < 12 AND MonthlyCharges > 70 THEN 'Medium Risk'
--          ELSE 'Low Risk'
--        END AS churn_risk_segment
-- FROM telco_churn;


-- 6. Count customers per risk segment


-- SELECT churn_risk_segment, COUNT(*)
-- FROM (
--     SELECT customerID,
--            Churn,
--            tenure,
--            MonthlyCharges,
--            CASE
--              WHEN Churn='Yes' THEN 'High Risk'
--              WHEN tenure < 12 AND MonthlyCharges > 70 THEN 'Medium Risk'
--              ELSE 'Low Risk'
--            END AS churn_risk_segment
--     FROM telco_churn
-- ) AS x
-- GROUP BY churn_risk_segment;


-- Segmentation Group 4 — Service Usage Segments


-- 7. Service usage score


-- SELECT 
--    customerID,
--    (PhoneService='Yes') +
--    (InternetService='Fiber optic') +
--    (StreamingTV='Yes') +
--    (StreamingMovies='Yes') AS service_score
-- FROM telco_churn;


-- 8. Heavy users


-- SELECT customerID, service_score
-- FROM (
--     SELECT customerID,
--     (PhoneService='Yes') +
--     (InternetService='Fiber optic') +
--     (StreamingTV='Yes') +
--     (StreamingMovies='Yes') AS service_score
--     FROM telco_churn
-- ) AS y
-- WHERE service_score >= 3;


-- Segmentation Group 5 — Contract & Payment Behavior


-- 9. Stability segment


-- SELECT customerID, Contract,
-- CASE
--   WHEN Contract='Two year' THEN 'Stable'
--   WHEN Contract='One year' THEN 'Semi-Stable'
--   ELSE 'Volatile'
-- END AS stability_segment
-- FROM telco_churn;


-- 10. Payment method vs churn


-- SELECT PaymentMethod, COUNT(*) AS churn_count
-- FROM telco_churn
-- WHERE Churn='Yes'
-- GROUP BY PaymentMethod
-- ORDER BY churn_count DESC;


-- Segmentation Group 6 — Demographic Segments


-- 11. Senior citizen segments


-- SELECT SeniorCitizen, AVG(MonthlyCharges)
-- FROM telco_churn
-- GROUP BY SeniorCitizen;


-- 12. Families vs singles


-- SELECT Partner, Dependents, COUNT(*)
-- FROM telco_churn
-- GROUP BY Partner, Dependents;


-- Segmentation Group 7 — Multi-factor Segments


-- 13. Segmentation by tenure + spending


-- SELECT customerID,
--        tenure,
--        MonthlyCharges,
--        CASE
--          WHEN tenure >= 24 AND MonthlyCharges >= 80 THEN 'Premium Loyal'
--          WHEN tenure < 12 AND MonthlyCharges >= 80 THEN 'Premium New'
--          WHEN tenure >= 24 AND MonthlyCharges < 40 THEN 'Low-Spend Loyal'
--          ELSE 'Standard'
--        END AS combined_segment
-- FROM telco_churn;


-- Segmentation Group 8 — Cluster-like Rules (SQL-only)


-- 14. Tech-savvy customers


-- SELECT customerID
-- FROM telco_churn
-- WHERE InternetService='Fiber optic'
--   AND TechSupport='No'
--   AND StreamingTV='Yes';


-- 15. High risk + high-value customers


-- SELECT customerID, tenure, MonthlyCharges
-- FROM telco_churn
-- WHERE Churn='Yes'
--   AND MonthlyCharges > 80;


-- Segmentation Group 9 — RFM-style SQL (Telco Version)


-- 16. Recency = tenure


-- SELECT customerID, tenure AS recency
-- FROM telco_churn;


-- 17. Frequency = services count


-- SELECT customerID,
-- (PhoneService='Yes') +
-- (StreamingTV='Yes') +
-- (StreamingMovies='Yes') +
-- (OnlineSecurity='Yes') AS frequency
-- FROM telco_churn;


-- 18. Monetary = MonthlyCharges


-- SELECT customerID, MonthlyCharges AS monetary
-- FROM telco_churn;

-- 19. RFM composite score
-- SELECT customerID,
--        tenure AS recency,
--        (PhoneService='Yes')+(StreamingTV='Yes')+(StreamingMovies='Yes') AS frequency,
--        MonthlyCharges AS monetary
-- FROM telco_churn;


-- Segmentation Group 10 — Final Segmentation Table Creation


-- 20. Create final segmentation table


-- CREATE TABLE final_segments AS
-- SELECT customerID,
--        gender,
--        SeniorCitizen,
--        tenure,
--        MonthlyCharges,
--        Churn,

--        -- Revenue segment
--        NTILE(3) OVER (ORDER BY MonthlyCharges DESC) AS revenue_segment,

--        -- Tenure segment
--        CASE
--          WHEN tenure < 12 THEN 'New'
--          WHEN tenure BETWEEN 12 AND 36 THEN 'Established'
--          ELSE 'Loyal'
--        END AS tenure_segment,

--        -- Churn risk segment
--        CASE
--          WHEN Churn='Yes' THEN 'High Risk'
--          WHEN tenure < 12 AND MonthlyCharges > 70 THEN 'Medium Risk'
--          ELSE 'Low Risk'
--        END AS churn_segment
-- FROM telco_churn;



