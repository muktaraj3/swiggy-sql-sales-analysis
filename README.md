<p align="center">
  <img src="Images/Banner.png" alt="Swiggy Sales Analysis Banner" width="100%">
</p>

# 🍽️ Swiggy Sales Analysis using SQL

An end-to-end SQL data analytics project that transforms raw Swiggy food delivery data into actionable business insights through data validation, cleaning, dimensional modelling, and analytical SQL queries using PostgreSQL.
## 🛠️ Tech Stack

- **Database:** PostgreSQL
- **Language:** SQL
- **Data Modelling:** Star Schema
- **Dataset:** Swiggy Food Delivery Dataset
- **Documentation:** Microsoft Word
- **Version Control:** Git & GitHub

## 📖 Project Overview
This project demonstrates an end-to-end SQL data analytics workflow using a Swiggy food delivery dataset. The project begins with raw transactional data and follows the complete analytics pipeline, including data validation, data cleaning, dimensional modelling using a Star Schema, and business analysis through SQL queries.

The primary objective is to transform raw operational data into a structured analytical database that supports efficient reporting and meaningful business insights.

## 🎯 Business Problem

Food delivery platforms generate massive volumes of transactional data every day. However, raw operational data often contains inconsistencies, duplicate records, and unstructured formats that limit meaningful analysis.

This project focuses on transforming raw Swiggy food delivery data into a structured analytical database by applying data validation, cleaning, and dimensional modelling techniques. The final objective is to answer key business questions and generate actionable insights that support data-driven decision-making.


This project addresses the following objectives:

- Validate the quality of the raw dataset
- Detect and remove duplicate records
- Standardize date formats
- Design a Star Schema for analytical reporting
- Generate business KPIs using SQL
- Extract actionable business insights from the data

## 📂 Project Structure

```text
swiggy-sql-sales-analysis
│
├── Dataset
│   ├── Swiggy_Data.csv
│   └── swiggy_data.xlsx
│
├── SQL Scripts
│   ├── 01_Table_Creation.sql
│   ├── 02_Data_Validation.sql
│   ├── 03_Order_Date_Conversion.sql
│   ├── 04_Star_Schema.sql
│   └── 05_Business_Findings.sql
│
├── Documentation
│   └── Business Requirements.docx
│
├── Images
│
└── README.md
```

### 📁 Folder Description

| Folder | Description |
|---------|-------------|
| **Dataset** | Contains the raw Swiggy dataset used for data validation, cleaning, and analysis. |
| **SQL Scripts** | Contains SQL scripts organised in execution order, covering table creation, data validation, data transformation, star schema design, and business analysis. |
| **Documentation** | Includes the Business Requirements Document and other project documentation. |
| **Images** | Stores the ER Diagram, SQL query outputs, and screenshots used in the README. |
| **README.md** | Provides an overview of the project, workflow, implementation, and key findings. |

Raw Swiggy Dataset
        │
        ▼
Table Creation
        │
        ▼
Data Validation
        │
        ▼
Data Cleaning & Transformation
        │
        ▼
Star Schema Design
        │
        ▼
Business Analysis
        │
        ▼
Key Business Findings

## 🔄 Project Workflow

This project follows a structured SQL analytics workflow to transform raw transactional data into meaningful business insights.

1. **Table Creation**
   - Imported the raw Swiggy dataset into PostgreSQL and created the base table.

2. **Data Validation**
   - Checked for null values, duplicate records, inconsistent data, and data quality issues.

3. **Data Cleaning & Transformation**
   - Standardized date formats and prepared the dataset for analytical processing.

4. **Star Schema Design**
   - Created dimension and fact tables to build a scalable analytical data model.

5. **Business Analysis**
   - Wrote SQL queries to calculate KPIs, identify trends, and answer key business questions.

6. **Key Findings**
   - Summarized the analytical results into actionable business insights.

## 🔍 Data Validation

The dataset was validated before analysis to ensure data quality and reliability. Validation checks included identifying null values, duplicate records, blank values, and verifying data types for analytical processing.

### Sample Validation Outputs

#### Null Value Check

<p align="center">
  <img src="Images/Data_Validation/Null_Value_Check.png" width="90%">
</p>

#### Duplicate Record Deletion Check

<p align="center">
  <img src="Images/Data_Validation/Delete_Duplicates.png" width="90%">
</p>

#### Blank/Empty Strings Check

<p align="center">
  <img src="Images/Data_Validation/Blank_Empty_Strings.png" width="90%">
</p>

## 🗄️ Database Design (Star Schema)

To support efficient analytical reporting, the raw transactional dataset was transformed into a **Star Schema**. This dimensional model organizes descriptive information into dimension tables while storing transactional metrics in a centralized fact table.

The Star Schema simplifies complex analytical queries, reduces data redundancy, and provides a scalable foundation for reporting and business analysis.

### Dimension Tables

| Table | Description |
|-------|-------------|
| **dim_date** | Stores date-related attributes for time-based analysis. |
| **dim_location** | Contains geographical information such as city and state. |
| **dim_restaurant** | Stores restaurant-specific details. |
| **dim_category** | Contains food category information. |
| **dim_dish** | Stores dish-level information. |

### Fact Table

| Table | Description |
|-------|-------------|
| **fact_swiggy_orders** | Stores transactional order details and links all dimension tables through foreign keys. |

<p align="center">
  <img src="Images/ER_Diagram.png" alt="Star Schema ER Diagram" width="90%">
</p>

## 💻 SQL Implementation

The project is divided into modular SQL scripts, with each script focusing on a specific stage of the analytics workflow.

| SQL Script | Purpose |
|------------|---------|
| **01_Table_Creation.sql** | Creates the raw table and imports the dataset. |
| **02_Data_Validation.sql** | Performs null checks, blank value detection, duplicate identification, and data quality validation. |
| **03_Order_Date_Conversion.sql** | Converts the `Order_Date` column into the appropriate `DATE` data type for time-based analysis. |
| **04_Star_Schema.sql** | Builds the dimensional model by creating dimension and fact tables. |
| **05_Business_Findings.sql** | Contains analytical SQL queries used to calculate KPIs and generate business insights. |


## 📊 Business Insights

### 💰 Key Performance Indicators (KPIs)

#### Total Revenue

<p align="center">
  <img src="Images/KPI_Results/Total_Revenue.png" width="80%">
</p>

#### Total Orders

<p align="center">
  <img src="Images/KPI_Results/Total_Orders.png" width="80%">
</p>

---

### 🌍 Geographical Analysis

#### Revenue Contribution by States
<p align="center">
  <img src="Images/Business_Insights/Revenue_by_States.png" width="85%">
</p>

#### Top 10 Cities by Revenue
<p align="center">
  <img src="Images/Business_Insights/Top_10_Cities_by_Revenue.png" width="85%">
</p>

---

### 🍽️ Restaurant & Cuisine Analysis

#### Top 10 Restaurants by Revenue
<p align="center">
  <img src="Images/Business_Insights/Top_10_Restaurants_by_Revenue.png" width="85%">
</p>

#### Top Categories by Order Volume
<p align="center">
  <img src="Images/Business_Insights/Top_Categories_by_Order_Volume.png" width="85%">
</p>

---

### 📈 Sales Trend Analysis

#### Monthly Order Trends
<p align="center">
  <img src="Images/Business_Insights/Monthly_Order_Trend.png" width="85%">
</p>

#### Orders by Day of the Week
<p align="center">
  <img src="Images/Business_Insights/Orders_by_the_Day_of_Week.png" width="85%">
</p>

---

### ⭐ Customer Behaviour Analysis

#### Rating Count Distribution
<p align="center">
  <img src="Images/Business_Insights/Rating_Count_Distribution.png" width="85%">
</p>

## 🧠 Skills Demonstrated

### SQL
- SQL Query Writing
- Joins (INNER, LEFT)
- Aggregate Functions
- GROUP BY & HAVING
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Date Functions
- CASE Statements

### Database & Data Modelling
- PostgreSQL
- Database Design
- Star Schema
- Fact & Dimension Tables
- Data Modelling
- Primary & Foreign Keys

### Data Preparation
- Data Validation
- Data Cleaning
- Duplicate Detection & Removal
- Data Transformation
- Data Quality Checks

### Business Analytics
- KPI Development
- Revenue Analysis
- Geographical Analysis
- Restaurant Performance Analysis
- Customer Behaviour Analysis
- Trend Analysis
- Business Insights Generation

### Version Control & Documentation
- Git
- GitHub
- Technical Documentation
- Business Requirements Documentation
  
## 📌 Conclusion

This project demonstrates a complete SQL-based analytics workflow, from preparing raw transactional data to designing a dimensional data model and generating analytical insights. It showcases practical SQL skills, data modelling techniques, and a structured approach to solving real-world business problems.

