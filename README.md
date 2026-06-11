# 📊 IBM HR Analytics — Employee Attrition Analysis

![Attrition Overview Dashboard](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Dashboards/HR%20attriction%20risk%20overview%20Dashboard.jpg)

> **End-to-end HR Analytics project** using SQL (PostgreSQL), Python (Pandas, Matplotlib, Seaborn), and Power BI — built on the IBM HR Employee Attrition dataset to uncover why employees leave and what retains them.

---

## 🗂️ Table of Contents

- [Project Overview](#project-overview)
- [Tools & Tech Stack](#tools--tech-stack)
- [Dataset](#dataset)
- [Key Findings](#key-findings)
- [Power BI Dashboards](#power-bi-dashboards)
- [Python EDA Visuals](#python-eda-visuals)
- [SQL Analysis](#sql-analysis)
- [Project Structure](#project-structure)
- [How to Run](#how-to-run)
- [About Me](#about-me)

---

## 📌 Project Overview

Employee attrition is one of the most costly challenges organizations face. This project performs a **full exploratory data analysis** on IBM's HR dataset to identify:

- Which departments, roles, and demographics are at highest attrition risk
- What compensation, satisfaction, and workload factors drive employees to leave
- Actionable retention signals backed by data

The project spans three layers: **SQL queries** for structured business questions, **Python EDA** for statistical visualization, and a **4-page Power BI dashboard** for executive-level storytelling.

---

## 🛠️ Tools & Tech Stack

| Layer | Tool |
|---|---|
| Database & Querying | PostgreSQL |
| Data Analysis | Python — Pandas, NumPy |
| Visualization | Matplotlib, Seaborn |
| BI Dashboard | Power BI Desktop |
| Notebook | Jupyter Notebook |
| Version Control | Git & GitHub |

---

## 📂 Dataset

- **Source:** [IBM HR Analytics Employee Attrition & Performance](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)
- **Rows:** 1,470 employees
- **Columns:** 35 features
- **Target Variable:** `Attrition` (Yes / No)
- **Missing Values:** None
- **Duplicates:** None

---

## 🔑 Key Findings

| # | Finding | Value |
|---|---|---|
| 1 | Overall Attrition Rate | **16.12%** |
| 2 | Highest Risk Department | Sales — **20.6%** |
| 3 | Highest Risk Job Role | Sales Representative — **39.8%** |
| 4 | Overtime Attrition Rate | **30.5%** vs 10.4% (No OT) |
| 5 | Highest Risk Age Group | 18–25 — **35.8%** |
| 6 | Avg Income — Left | **~$4,787/month** |
| 7 | Avg Income — Stayed | **~$6,833/month** |
| 8 | No Stock Option Attrition | **24.4%** |
| 9 | Low Job Involvement Attrition | **33.7%** |
| 10 | Frequent Travel Attrition | **24.9%** |

---

## 📊 Power BI Dashboards

4-page interactive dashboard with slicers for Department, Gender, Age Group, Job Level, Overtime, Business Travel, and more.

### Page 1 — Attrition Overview

![Attrition Overview](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Dashboards/HR%20attriction%20risk%20overview%20Dashboard.jpg)

Key visuals: Department attrition rates · Job role ranking · Age group risk curve · Tenure milestone drop-off · Marital status breakdown

---

### Page 2 — Attrition Risk Drivers

![Risk Drivers](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Dashboards/HR%20Dashboard%20Attrition%20Risk%20driver%20Overview.jpg)

Key visuals: Overtime impact donut · Job satisfaction line chart · Work-life balance bars · Business travel comparison · Promotion gap combo chart

---

### Page 3 — Compensation & Performance

![Compensation & Performance](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Dashboards/HR%20Dashboard%20Compensation%20%26%20Performance.jpg)

Key visuals: Stock option level vs attrition · Income band vs attrition · Education bubble chart · Dept × Job Level income matrix

---

### Page 4 — Top Earners & High Performers

![Top Earners](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Dashboards/HR%20Dashboard.jpg)

Key visuals: Top earner detail table · High performer attrition risk by department (Excellent vs Outstanding)

---

## 📈 Python EDA Visuals

All 14 charts generated in [`Jupyter Notebook/IBM_HR_Attrition_Analysis.ipynb`](Jupyter%20Notebook/IBM_HR_Attrition_Analysis.ipynb)

### 01 — Numeric Feature Distributions
![Numeric Distributions](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/01_numeric_distributions.png)

Age, MonthlyIncome, TotalWorkingYears, YearsAtCompany, DistanceFromHome, NumCompaniesWorked — split by attrition status. Attrited employees (red) consistently skew younger and lower-income.

---

### 02 — Overall Attrition Split
![Overall Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/02_overall_attrition.png)

**16.12% attrition rate** — 237 employees left out of 1,470.

---

### 03 — Attrition by Department
![Department Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/03_attrition_by_department.png)

Sales leads at **20.6%**, followed by HR at **19.1%**, R&D at **13.8%**.

---

### 04 — Attrition by Job Role
![Job Role Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/04_attrition_by_jobrole.png)

Sales Representatives at **39.8%** — far above the 15.7% company average. Research Directors at just 2.5%.

---

### 05 — Overtime vs Attrition
![Overtime Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/05_overtime_attrition.png)

OT employees leave at **30.5%** vs **10.4%** — a 3× difference.

---

### 06 — Attrition by Age Group
![Age Group Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/06_attrition_by_age.png)

**18–25 group** is most at risk at **35.8%**. Risk drops significantly with age.

---

### 07 — Monthly Income vs Attrition
![Income vs Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/07_income_vs_attrition.png)

Box and violin plots confirm employees who left earned significantly less (~$4,787 vs ~$6,833 avg).

---

### 08 — Income by Department & Job Level
![Income Dept Job Level](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/08_income_dept_joblevel.png)

Job Level 5 earns ~$19K across all departments. Level 1 earns ~$2,700–2,840 — the most at-risk compensation band.

---

### 09 — Salary Hike by Performance Rating
![Hike vs Performance](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/09_hike_vs_performance.png)

Rating 4 (Outstanding) gets ~22% hike. Rating 3 (Excellent) gets ~14%. Hike distributions nearly identical between attrited and retained — salary hike alone doesn't drive retention.

---

### 10 — Satisfaction Scores Heatmap
![Satisfaction Heatmap](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/10_satisfaction_heatmap.png)

**JobInvolvement Score 1 = 33.7% attrition** — strongest single engagement signal. WorkLifeBalance Score 1 = 31.2%.

---

### 11 — Attrition by Business Travel
![Travel Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/11_travel_attrition.png)

Frequent travelers: **24.9%** | Rare: **15%** | Non-travel: **8%** — near-linear relationship.

---

### 12 — Demographic Attrition Patterns
![Demographic Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/12_demographic_attrition.png)

Singles leave at **25.5%** — twice the rate of married/divorced. HR females: **30%** — highest gender-department combination.

---

### 13 — Tenure & Promotion Analysis
![Tenure Promotion](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/13_tenure_promotion.png)

Attrition heavily concentrated in the **first 0–5 years**. Beyond 10 years, departure density drops to near zero.

---

### 14 — Top 15 Features Correlated with Attrition
![Correlation Chart](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/14_correlation_with_attrition.png)

**TotalWorkingYears, JobLevel, YearsInCurrentRole** are top 3 negative correlators — experienced, senior employees are the most stable.

---

## 🗄️ SQL Analysis

**File:** [`SQL/HR.sql`](SQL/HR.sql) | **Database:** PostgreSQL

| Query | Business Question |
|---|---|
| Q1 | What is the overall attrition rate? |
| Q2 | Which departments lose the most employees? |
| Q3 | Which job roles have the highest attrition? |
| Q4 | Do overtime employees leave more often? |
| Q5 | What is the compensation structure across departments and seniority? |
| Q6 | Which age bracket is most at risk? |
| Q7 | Does poor work-life balance cause higher attrition? |
| Q8 | How does job satisfaction affect retention? |
| Q9 | Does marital status affect attrition? |
| Q10 | Do frequent travelers burn out and leave? |
| Q11 | Do employees without recent promotions leave more? |
| Q12 | Who are the top earners and what keeps them? |
| Q13 | Which employee profiles are at the highest combined risk? |
| Q14 | Which education backgrounds earn more and stay longer? |
| Q15 | At what tenure milestones do employees leave? |
| Q16 | Does stock option equity improve retention? |
| Q17 | How are high performers distributed — are they at risk? |

---

## 📁 Project Structure

```
IBM-HR-Attrition-Analysis/
│
├── Dashboards/
│   ├── HR attriction risk overview Dashboard.jpg
│   ├── HR Dashboard Attrition Risk driver Overview.jpg
│   ├── HR Dashboard Compensation & Performance.jpg
│   └── HR Dashboard.jpg
│
├── Jupyter Notebook/
│   └── IBM_HR_Attrition_Analysis.ipynb
│
├── Python output visuals/
│   ├── 01_numeric_distributions.png
│   ├── 02_overall_attrition.png
│   ├── 03_attrition_by_department.png
│   ├── 04_attrition_by_jobrole.png
│   ├── 05_overtime_attrition.png
│   ├── 06_attrition_by_age.png
│   ├── 07_income_vs_attrition.png
│   ├── 08_income_dept_joblevel.png
│   ├── 09_hike_vs_performance.png
│   ├── 10_satisfaction_heatmap.png
│   ├── 11_travel_attrition.png
│   ├── 12_demographic_attrition.png
│   ├── 13_tenure_promotion.png
│   └── 14_correlation_with_attrition.png
│
├── SQL/
│   └── HR.sql
│
├── README.md
└── report.md
```

---

## ▶️ How to Run

### Python Notebook
```bash
pip install pandas numpy matplotlib seaborn jupyter
jupyter notebook "Jupyter Notebook/IBM_HR_Attrition_Analysis.ipynb"
```

### SQL (PostgreSQL)
```sql
-- Update the COPY path in HR.sql to your local CSV location, then:
\i SQL/HR.sql
```

**Dataset:** [Kaggle — IBM HR Analytics](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)

---

## 👤 About Me

**Subhash Gautam** | Data Analyst

Skilled in SQL (PostgreSQL), Python (Pandas, NumPy, Matplotlib, Seaborn), Power BI, and Excel. I build end-to-end analytics projects spanning data cleaning, EDA, and interactive dashboards.

🔗 [GitHub Profile](https://github.com/subhashgautam788-DS)  
💼 [LinkedIn](https://www.linkedin.com/in/subhash-gautam-a6126626b/)  
📧 subhashgautam788@gmail.com

---

*⭐ If you found this project useful, consider starring the repository!*
