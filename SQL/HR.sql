
──────────────────────────────
--Create table and load data
────────────────────────────

CREATE TABLE IF NOT EXISTS hr_employee (
    Age                      INT,
    Attrition                VARCHAR(5),
    BusinessTravel           VARCHAR(30),
    DailyRate                INT,
    Department               VARCHAR(50),
    DistanceFromHome         INT,
    Education                INT,       
    EducationField           VARCHAR(50),
    EmployeeCount            INT,
    EmployeeNumber           INT PRIMARY KEY,
    EnvironmentSatisfaction  INT,    
    Gender                   VARCHAR(10),
    HourlyRate               INT,
    JobInvolvement           INT,     
    JobLevel                 INT,
    JobRole                  VARCHAR(50),
    JobSatisfaction          INT,     
    MaritalStatus            VARCHAR(15),
    MonthlyIncome            INT,
    MonthlyRate              INT,
    NumCompaniesWorked       INT,
    Over18                   VARCHAR(2),
    OverTime                 VARCHAR(5),
    PercentSalaryHike        INT,
    PerformanceRating        INT,      
    RelationshipSatisfaction INT,
    StandardHours            INT,
    StockOptionLevel         INT,      
    TotalWorkingYears        INT,
    TrainingTimesLastYear    INT,
    WorkLifeBalance          INT,        
    YearsAtCompany           INT,
    YearsInCurrentRole       INT,
    YearsSinceLastPromotion  INT,
    YearsWithCurrManager     INT
);

-- Load data from CSV
-- COPY hr_employee FROM '/path/to/WA_Fn-UseC_-HR-Employee-Attrition.csv'
-- DELIMITER ',' CSV HEADER;


-------------------------------------------------------------
-- Q1: What percentage of employees have left the company?
-----------------------------------------------------------
SELECT
    COUNT(*)  AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited_employees,
    SUM(CASE WHEN Attrition = 'No'  THEN 1 ELSE 0 END) AS active_employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee;


-------------------------------------------------------
--Q2: Which departments are losing the most employees?
---------------------------------------------------------
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)  AS attrition_rate_pct
FROM hr_employee
GROUP BY Department
ORDER BY attrition_rate_pct DESC;


----------------------------------------------------------------
--Q3: Which job roles have the highest attrition?
--------------------------------------------------------------
SELECT
    JobRole,
    Department,
    COUNT(*)  AS total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0  / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee
GROUP BY JobRole, Department
ORDER BY attrition_rate_pct DESC;


------------------------------------------------------
-- Q4: Do employees working overtime leave more often?
------------------------------------------------------
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)  AS attrition_rate_pct
FROM hr_employee
GROUP BY OverTime
ORDER BY attrition_rate_pct DESC;


------------------------------------------------------------------------------------------
-- Q5: What is the average compensation structure across departments and seniority levels?
------------------------------------------------------------------------------------------

SELECT
    Department,
    JobLevel,
    COUNT(*)  AS headcount,
    ROUND(AVG(MonthlyIncome), 0) AS avg_monthly_income,
    MIN(MonthlyIncome) AS min_income,
    MAX(MonthlyIncome)  AS max_income,
    ROUND(STDDEV(MonthlyIncome), 0) AS income_std_dev
FROM hr_employee
GROUP BY Department, JobLevel
ORDER BY Department, JobLevel;


----------------------------------------------------
--Q6: Which age bracket is most at risk of leaving?
------------------------------------------------------

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25 (Entry Level)'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35 (Early Career)'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45 (Mid Career)'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55 (Senior)'
        ELSE '56+ (Pre-Retirement)'
    END AS age_group,
    COUNT(*) AS total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND( SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income
FROM hr_employee
GROUP BY age_group
ORDER BY attrition_rate_pct DESC;


-------------------------------------------------------------------
----Q7: Does poor work-life balance cause higher attrition?
---------------------------------------------------------------------

SELECT
    CASE WorkLifeBalance
        WHEN 1 THEN '1-Bad'
        WHEN 2 THEN '2-Good'
        WHEN 3 THEN '3-Better'
        WHEN 4 THEN '4-Best'
    END AS work_life_balance,
    COUNT(*)  AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND( SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;


--------------------------------------------------------
-- Q8: How does job satisfaction level affect retention?
-------------------------------------------------------

SELECT
    CASE JobSatisfaction
        WHEN 1 THEN '1 - Low'
        WHEN 2 THEN '2 - Medium'
        WHEN 3 THEN '3 - High'
        WHEN 4 THEN '4 - Very High'
    END AS job_satisfaction_level,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-----------------------------------------------------------------------------------------------
--Q9: What is the workforce demographic breakdown and does marital status affect attrition?
----------------------------------------------------------------------------------------------

SELECT
    MaritalStatus,
    Gender,
    COUNT(*)  AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100. / COUNT(*), 2) AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income
FROM hr_employee
GROUP BY MaritalStatus, Gender
ORDER BY MaritalStatus, Gender;


--------------------------------------------------------
--Q10: Do frequent travelers burn out and leave more?
---------------------------------------------------------

SELECT
    BusinessTravel,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND( SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct,
    ROUND(AVG(WorkLifeBalance), 2) AS avg_work_life_balance
FROM hr_employee
GROUP BY BusinessTravel
ORDER BY attrition_rate_pct DESC;


-------------------------------------------------------------------------------------
--Q11: Do employees who haven't been promoted recently tend to leave the company?
--------------------------------------------------------------------------------------

SELECT
    CASE
        WHEN YearsSinceLastPromotion = 0  THEN 'Just Promoted'
        WHEN YearsSinceLastPromotion <= 2 THEN '1-2 Years'
        WHEN YearsSinceLastPromotion <= 5 THEN '3-5 Years'
        WHEN YearsSinceLastPromotion <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS promotion_gap,
    COUNT(*)  AS total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income
FROM hr_employee
GROUP BY promotion_gap
ORDER BY attrition_rate_pct DESC;


-------------------------------------------------------
--Q12: Who are the top earners and what keeps them?
------------------------------------------------------

SELECT
    EmployeeNumber,
    Age,
    Gender,
    Department,
    JobRole,
    JobLevel,
    MonthlyIncome,
    TotalWorkingYears,
    YearsAtCompany,
    PerformanceRating
FROM hr_employee
WHERE Attrition = 'No'
ORDER BY MonthlyIncome DESC
LIMIT 10;


-----------------------------------------------------------------------------------------
--Q13: Which employee profiles are at the highest combined risk of leaving?
---------------------------------------------------------------------------------------

SELECT
    Department,
    JobRole,
    OverTime,
    MaritalStatus,
    COUNT(*)  AS segment_size,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2 ) AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income,
    ROUND(AVG(JobSatisfaction), 2) AS avg_job_satisfaction
FROM hr_employee
GROUP BY Department, JobRole, OverTime, MaritalStatus
HAVING COUNT(*) >= 10
ORDER BY attrition_rate_pct DESC
LIMIT 15;


------------------------------------------------------------------------
--Q14: Which education backgrounds earn more and stay longer?
--------------------------------------------------------------------
SELECT
    EducationField,
    CASE Education
        WHEN 1 THEN 'Below College'
        WHEN 2 THEN 'College'
        WHEN 3 THEN 'Bachelor'
        WHEN 4 THEN 'Master'
        WHEN 5 THEN 'Doctor'
    END AS education_level,
    COUNT(*) AS total_employees,
    ROUND(AVG(MonthlyIncome), 0) AS avg_monthly_income,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND( SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee
GROUP BY EducationField, Education
ORDER BY avg_monthly_income DESC;


--------------------------------------------------------------------
--Q15: At what tenure milestones do employees leave most?
-----------------------------------------------------------------

WITH tenure_data AS (
    SELECT
        CASE
            WHEN YearsAtCompany <= 1  THEN '0-1 Year (Onboarding)'
            WHEN YearsAtCompany <= 3  THEN '2-3 Years (Early Retention)'
            WHEN YearsAtCompany <= 7  THEN '4-7 Years (Growth Phase)'
            WHEN YearsAtCompany <= 15 THEN '8-15 Years (Experienced)'
            ELSE '15+ Years (Long Tenure)'
        END AS tenure_band,
        Attrition,
        MonthlyIncome,
        JobSatisfaction
    FROM hr_employee)

SELECT
    tenure_band,
    COUNT(*) AS total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income,
    ROUND(AVG(JobSatisfaction), 2) AS avg_job_satisfaction
FROM tenure_data
GROUP BY tenure_band
ORDER BY
    CASE tenure_band
        WHEN '0-1 Year (Onboarding)' THEN 1
        WHEN '2-3 Years (Early Retention)' THEN 2
        WHEN '4-7 Years (Growth Phase)' THEN 3
        WHEN '8-15 Years (Experienced)' THEN 4
        ELSE 5
    END;

-------------------------------------------------------------
---Q16: Does equity/stock offering improve retention?
------------------------------------------------------------

SELECT
    CASE StockOptionLevel
        WHEN 0 THEN '0 - No Stock Options'
        WHEN 1 THEN '1 - Low'
        WHEN 2 THEN '2 - Medium'
        WHEN 3 THEN '3 - High'
    END AS stock_option_level,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income
FROM hr_employee
GROUP BY StockOptionLevel
ORDER BY StockOptionLevel;


-----------------------------------------------------------------------------------------------
--Q17: How are high performers distributed across departments, and are they at risk of leaving?
-----------------------------------------------------------------------------------------------

SELECT
    Department,
    CASE PerformanceRating
        WHEN 3 THEN 'Excellent'
        WHEN 4 THEN 'Outstanding'
    END AS performance_category,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0  / COUNT(*), 2) AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income,
    ROUND(AVG(PercentSalaryHike), 1) AS avg_salary_hike_pct
FROM hr_employee
GROUP BY Department, PerformanceRating
ORDER BY Department, PerformanceRating DESC;


---------------------
-- END
---------------------