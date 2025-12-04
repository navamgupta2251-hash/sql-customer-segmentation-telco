-- DATA CLEANING SQL

-- UPDATE telco_churn
-- SET TotalCharges = NULL
-- WHERE TRIM(TotalCharges) = '';


-- ALTER TABLE telco_churn
-- MODIFY TotalCharges DECIMAL(10,2);


-- UPDATE telco_churn
-- SET Partner = UPPER(Partner),
--     Dependents = UPPER(Dependents),
--     PhoneService = UPPER(PhoneService),
--     PaperlessBilling = UPPER(PaperlessBilling),
--     Churn = UPPER(Churn);
-- 