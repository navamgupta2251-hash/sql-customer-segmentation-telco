# SQL Customer Segmentation Project (Telco Telecom Dataset)

## Overview
This project delivers a complete **SQL-only customer segmentation workflow** using the IBM Telco Customer Churn dataset.  
No Python, no Power BI — the entire analysis is performed using SQL: schema creation, data cleaning, feature engineering, segmentation logic, and churn insights.

The goal is to segment telecom customers into meaningful groups such as:
- High/medium/low revenue customers  
- New/established/loyal customers  
- High-, medium-, and low-churn-risk segments  
- Service usage clusters  
- Combined multi-factor segments  

These segments help telecom companies understand customer behavior, improve retention, and build targeted strategies.

---

## Dataset
**Source:** IBM Sample Data – Telco Customer Churn  
**Rows:** ~7,043 customers  
**Features:**  
- Demographics (senior citizen, gender, dependents)  
- Account & tenure  
- Services (internet, TV, phone, security, support)  
- Billing (monthly/total charges, contract, payment method)  
- Churn flag  

Dataset included in `/data` folder:

WA_Fn-UseC_-Telco-Customer-Churn.csv

---

## SQL Skills Demonstrated
- SQL schema design  
- Data cleaning & type correction  
- Feature engineering in SQL  
- CASE-based segmentation  
- Window functions (NTILE, OVER)  
- Aggregations & grouping  
- Derived segmentation tables  
- Churn insights  
- RFM-style logic in SQL  
- Exporting and documenting results  

---

## Project Structure
sql-customer-segmentation-telco
├── data
│ └── WA_Fn-UseC_-Telco-Customer-Churn.csv
├── sql
│ ├── schema.sql
│ ├── cleaning.sql
│ ├── segmentation_queries.sql
│ ├── insights_queries.sql
│ └── final_segments.sql
├── outputs
│ ├── final_segments.csv
│ └── churn_insights.csv
├── README.md
└── ERD.txt

---

## Key Segmentation Logic

### **1. Revenue Segmentation**
High-, mid-, and low-spending customers using NTILE:
NTILE(3) OVER (ORDER BY MonthlyCharges DESC)


### **2. Tenure Segmentation**
- New: <12 months  
- Established: 12–36 months  
- Loyal: >36 months  

### **3. Churn Risk Segmentation**
- High Risk: churned  
- Medium Risk: new & high spend  
- Low Risk: others  

### **4. Service Usage Score**
Count of subscribed services (phone, internet, TV, streaming, security, support).

### **5. Combined Segments**
Examples:
- Premium Loyal  
- Premium New  
- Low-Spend Loyal  
- Volatile New Customers  

---

## Outputs
Located in `/outputs`:
- `final_segments.csv` – complete segmentation output  
- `churn_insights.csv` – churn-related insights  

---

## Sample Business Insights
- **Month-to-month contract customers churn the most**, followed by one-year contracts.  
- **Fiber optic users show higher churn** because of higher MonthlyCharges and lower support satisfaction.  
- **New customers with high MonthlyCharges** are the highest-risk churn group.  
- **Loyal customers (>3 years)** have the lowest churn rates and highest product adoption.  

---

## How to Run

1. **Import dataset** into MySQL Workbench  
2. Run `schema.sql` to create the table  
3. Run `cleaning.sql` to fix data types and clean inconsistencies  
4. Run `segmentation_queries.sql` to build segments  
5. Run `final_segments.sql` to generate the master segmentation table  
6. Export results from MySQL into `/outputs`  

---

## ER Diagram (Simplified)
+-------------------+
| telco_churn |
+-------------------+
| customerID (PK) |
| gender |
| SeniorCitizen |
| Partner |
| Dependents |
| tenure |
| PhoneService |
| MultipleLines |
| InternetService |
| OnlineSecurity |
| OnlineBackup |
| DeviceProtection |
| TechSupport |
| StreamingTV |
| StreamingMovies |
| Contract |
| PaperlessBilling |
| PaymentMethod |
| MonthlyCharges |
| TotalCharges |
| Churn |
+-------------------+

## 
Created as a SQL-focused customer segmentation project demonstrating SQL analytics, segmentation logic, and business insights entirely through SQL scripts.
