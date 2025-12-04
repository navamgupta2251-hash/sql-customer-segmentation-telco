-- use telco


-- Final Segmentation Table Creation


-- Create final segmentation table


CREATE TABLE final_segments AS
SELECT customerID,
       gender,
       SeniorCitizen,
       tenure,
       MonthlyCharges,
       Churn,

       -- Revenue segment
       NTILE(3) OVER (ORDER BY MonthlyCharges DESC) AS revenue_segment,

       -- Tenure segment
       CASE
         WHEN tenure < 12 THEN 'New'
         WHEN tenure BETWEEN 12 AND 36 THEN 'Established'
         ELSE 'Loyal'
       END AS tenure_segment,

       -- Churn risk segment
       CASE
         WHEN Churn='Yes' THEN 'High Risk'
         WHEN tenure < 12 AND MonthlyCharges > 70 THEN 'Medium Risk'
         ELSE 'Low Risk'
       END AS churn_segment
FROM telco_churn;