# IBM HR Analytics — Employee Attrition Analysis Report

**Project Type:** End-to-End HR Analytics  
**Dataset:** IBM HR Employee Attrition & Performance (1,470 employees · 35 features)  
**Tools:** PostgreSQL · Python (Pandas, NumPy, Matplotlib, Seaborn) · Power BI  
**Analyst:** Subhash Gautam | [GitHub](https://github.com/subhashgautam788-DS) | [LinkedIn](https://www.linkedin.com/in/subhash-gautam-a6126626b/) | subhashgautam788@gmail.com

---

## 1. Executive Summary

This report presents a comprehensive analysis of employee attrition using IBM's HR dataset. The overall attrition rate is **16.12%** — 237 out of 1,470 employees left. Through SQL-based querying, Python EDA, and a 4-page Power BI dashboard, this project identifies the root drivers of attrition and surfaces actionable retention signals.

**Three core themes:**
1. **Compensation gap** — employees who leave earn significantly less than those who stay
2. **Workload pressure** — overtime, frequent travel, and poor work-life balance multiply attrition risk
3. **Engagement deficit** — low job involvement and satisfaction scores are the clearest leading indicators

---

## 2. Dataset Overview

| Attribute | Detail |
|---|---|
| Total Employees | 1,470 |
| Active Employees | 1,233 |
| Attrited Employees | 237 |
| Overall Attrition Rate | **16.12%** |
| Features | 35 columns |
| Missing Values | None |
| Duplicate Records | None |
| Target Variable | `Attrition` (Yes / No) |

---

## 3. Attrition Overview Dashboard

![Attrition Overview Dashboard](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Dashboards/HR%20attriction%20risk%20overview%20Dashboard.jpg)

**Key KPIs:** 1,470 total employees · 1,233 active · 16.12% attrition · 237 attrited

This page answers six business questions at a glance:
- Which department loses the most people? → **Sales (20.63%)**
- Which job roles have highest attrition? → **Sales Representatives (39.76%)**
- Which age group is most at risk? → **18–25 Entry Level (35.8%)**
- At what tenure milestone do people leave? → **0–1 Year Onboarding phase**
- Does marital status affect attrition? → **Singles: 50.6% of all exits**

---

## 4. Department & Role Analysis

### 4.1 Attrition by Department

![Department Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/03_attrition_by_department.png)

| Department | Attrition Rate |
|---|---|
| Sales | **20.63%** |
| Human Resources | **19.05%** |
| Research & Development | **13.84%** |

### 4.2 Attrition by Job Role

![Job Role Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/04_attrition_by_jobrole.png)

| Job Role | Attrition Rate |
|---|---|
| Sales Representative | **39.8%** ← Critical |
| Laboratory Technician | 23.9% |
| Human Resources | 23.1% |
| Sales Executive | 17.5% |
| Research Scientist | 16.1% |
| Manufacturing Director | 6.9% |
| Healthcare Representative | 6.9% |
| Manager | 4.9% |
| Research Director | **2.5%** ← Lowest |

Company average: **15.7%** (dashed line in chart). Sales Representatives leave at nearly 2.5× the average — a critical retention priority.

---

## 5. Attrition Risk Drivers Dashboard

![Risk Drivers Dashboard](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Dashboards/HR%20Dashboard%20Attrition%20Risk%20driver%20Overview.jpg)

**Key KPIs on this page:**
- OT Attrition Rate: **30.53%**
- Avg Job Satisfaction: **2.73 / 4**
- Avg Work-Life Balance: **2.76 / 4**
- Avg Promotion Gap: **2.19 years**

### 5.1 Overtime Effect

![Overtime Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/05_overtime_attrition.png)

| Overtime | Attrition Rate |
|---|---|
| Yes | **30.5%** |
| No | **10.4%** |

Overtime **triples** attrition risk. Of 237 employees who left, 110 (46.4%) worked overtime — disproportionate given overtime workers are a workforce minority.

### 5.2 Satisfaction Heatmap

![Satisfaction Heatmap](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/10_satisfaction_heatmap.png)

Attrition rate at Score 1 (lowest) for each dimension:

| Dimension | Score 1 Attrition Rate |
|---|---|
| JobInvolvement | **33.7%** ← Highest |
| WorkLifeBalance | **31.2%** |
| EnvironmentSatisfaction | **25.4%** |
| JobSatisfaction | **22.8%** |
| RelationshipSatisfaction | **20.7%** |

**JobInvolvement at Score 1 is the single most powerful attrition predictor** — disengaged employees leave at one-third rate.

### 5.3 Business Travel

![Travel Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/11_travel_attrition.png)

| Business Travel | Attrition Rate |
|---|---|
| Travel_Frequently | **24.9%** |
| Travel_Rarely | 15.0% |
| Non-Travel | **8.0%** |

Near-linear relationship — more travel = more attrition. Frequent travelers leave at **3× non-travelers**.

---

## 6. Age & Tenure Analysis

### 6.1 Attrition by Age Group

![Age Group Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/06_attrition_by_age.png)

| Age Group | Attrition Rate |
|---|---|
| 18–25 (Entry Level) | **35.8%** |
| 26–35 (Early Career) | 19.1% |
| 36–45 (Mid Career) | 9.2% |
| 46–55 (Senior) | 11.5% |
| 56+ (Pre-Retirement) | 17.0% |

Entry-level employees leave at **4× the rate** of mid-career employees.

### 6.2 Numeric Feature Distributions

![Numeric Distributions](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/01_numeric_distributions.png)

Across all six key features, attrited employees (red) skew toward lower values — younger age, lower income, fewer working years. This confirms the **"junior and underpaid"** attrition profile.

### 6.3 Tenure & Promotion

![Tenure Promotion](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/13_tenure_promotion.png)

Attrition is heavily concentrated in **0–5 years** tenure. Beyond 10 years, departure density drops to near zero. The promotion gap boxplot shows similar medians between attrited and retained groups — promotion timing alone is not a primary driver.

---

## 7. Compensation & Performance Dashboard

![Compensation Dashboard](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Dashboards/HR%20Dashboard%20Compensation%20%26%20Performance.jpg)

**Key KPIs:** Avg Monthly Income: **$6,502.9** · Avg Salary Hike: **15.21%** · No Stock Option employees: **42.93%**

### 7.1 Monthly Income vs Attrition

![Income vs Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/07_income_vs_attrition.png)

| Attrition Status | Avg Monthly Income |
|---|---|
| Yes (Left) | **~$4,787** |
| No (Stayed) | **~$6,833** |

### 7.2 Income by Department & Job Level

![Income Dept Job Level](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/08_income_dept_joblevel.png)

| Department | L1 | L2 | L3 | L4 | L5 |
|---|---|---|---|---|---|
| Human Resources | $2,733 | $5,563 | $9,623 | $16,148 | $19,197 |
| Research & Development | $2,840 | $5,291 | $10,171 | $15,635 | $19,218 |
| Sales | $2,507 | $5,746 | $9,282 | $15,166 | $19,088 |

### 7.3 Stock Options & Retention

| Stock Option Level | Attrition Rate |
|---|---|
| 0 — No Options | **24.4%** |
| 1 — Low | 9.4% |
| 2 — Medium | **7.6%** |
| 3 — High | 17.7% |

42.9% of employees have no stock options — this single group drives disproportionate attrition.

### 7.4 Salary Hike by Performance

![Hike vs Performance](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/09_hike_vs_performance.png)

Hike distributions are nearly identical between attrited and retained within each performance tier. **Salary hike alone does not differentiate retention** — other factors dominate.

---

## 8. Demographic Analysis

![Demographic Attrition](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/12_demographic_attrition.png)

| Marital Status | Attrition Rate |
|---|---|
| Single | **25.5%** |
| Married | 12.5% |
| Divorced | 10.1% |

| Department | Female | Male |
|---|---|---|
| Human Resources | **30.0%** | 14.3% |
| Research & Development | 11.3% | 15.5% |
| Sales | 20.6% | 20.6% |

---

## 9. Top Earners & High Performers Dashboard

![Top Earners Dashboard](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Dashboards/HR%20Dashboard.jpg)

### High Performer Attrition Risk

| Department | Excellent | Outstanding | Total |
|---|---|---|---|
| Human Resources | 20.4% | 11.1% | **19.1%** |
| Research & Development | 13.3% | 16.7% | **13.8%** |
| Sales | 21.3% | 16.4% | **20.6%** |
| **Total** | **16.1%** | **16.4%** | **16.1%** |

High performers leave at the **same rate as the company average** — performance does not protect retention. Sales high performers are especially at risk.

---

## 10. Correlation Analysis

![Correlation Chart](https://raw.githubusercontent.com/subhashgautam788-DS/IBM-HR-Attrition-Analysis/main/Python%20output%20visuals/14_correlation_with_attrition.png)

Top features negatively correlated with attrition (higher = less likely to leave):

| Rank | Feature | Insight |
|---|---|---|
| 1 | TotalWorkingYears | Experienced employees are far more stable |
| 2 | JobLevel | Senior-level employees rarely leave |
| 3 | YearsInCurrentRole | Role stability reduces departure risk |
| 4 | MonthlyIncome | Higher pay = lower attrition |
| 5 | Age | Older employees leave less |
| 6 | YearsWithCurrManager | Long manager relationships improve retention |
| 7 | StockOptionLevel | Equity ownership creates loyalty |
| 8 | YearsAtCompany | Company loyalty grows with tenure |
| 9 | JobInvolvement | Engagement is a protective factor |
| 10 | JobSatisfaction | Satisfied employees stay |

**Positive correlator:** DistanceFromHome — employees who live farther from office have slightly higher attrition.

---

## 11. Strategic Recommendations

### 🔴 High Priority

1. **Reduce mandatory overtime** — overtime triples attrition. Audit workload in Sales especially.
2. **Compensation review for Level 1–2** — low income band (<$5K/month) drives 21.8% attrition.
3. **Sales Representative retention program** — 39.8% exit rate is unsustainable; structured career pathing needed.
4. **Extend stock options to Level 0 employees** — minimal equity drops attrition from 24.4% to under 10%.

### 🟡 Medium Priority

5. **Onboarding & early retention program (0–3 years)** — steepest attrition happens in first 3 years.
6. **Business travel rotation policy** — frequent travelers leave at 24.9%; remote alternatives can help.
7. **Job involvement initiatives** — Score 1 employees have 33.7% attrition; manager training on delegation can improve this.

### 🟢 Monitor

8. **6–10 year promotion gap cohort** — secondary spike at 18.1% suggests mid-career stagnation.
9. **HR department female attrition** — 30% rate warrants targeted pulse survey.

---

## 12. Summary Statistics

| Metric | Value |
|---|---|
| Total Employees | 1,470 |
| Overall Attrition Rate | **16.12%** |
| Highest Risk Department | Sales (20.63%) |
| Highest Risk Job Role | Sales Representative (39.76%) |
| Overtime Attrition Rate | 30.53% |
| Non-Overtime Attrition Rate | 10.40% |
| Avg Income — Attrited | ~$4,787/month |
| Avg Income — Retained | ~$6,833/month |
| Highest Risk Age Group | 18–25 (35.8%) |
| No Stock Option Attrition | 24.41% |
| Low Job Involvement Attrition | 33.7% |
| Frequent Travel Attrition | 24.91% |
| Single Employee Attrition | 25.5% |
| Top Correlator with Retention | TotalWorkingYears |

---

## 13. Project Files

| File | Description |
|---|---|
| `Jupyter Notebook/IBM_HR_Attrition_Analysis.ipynb` | Python EDA — 14 visualizations |
| `SQL/HR.sql` | PostgreSQL — 17 business questions |
| `README.md` | GitHub project documentation |
| `report.md` | This detailed analysis report |
| `Python output visuals/` | 14 Python-generated EDA charts |
| `Dashboards/` | 4 Power BI dashboard screenshots |

---

*Analysis on IBM HR Employee Attrition Dataset (1,470 records). All percentages rounded to 2 decimal places.*
