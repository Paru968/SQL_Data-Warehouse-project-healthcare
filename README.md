# 🏥 Enterprise Healthcare Analytics Data Warehouse

## 📌 Project Overview

The Enterprise Healthcare Analytics Data Warehouse is a production-style SQL Server Data Warehouse project built using a Medallion Architecture (Bronze → Silver → Gold). The solution integrates multiple hospital operational datasets into a centralized analytical platform to support business intelligence, operational reporting, and executive decision-making.

The project demonstrates end-to-end data warehousing concepts including ETL development, dimensional modeling, SQL Server stored procedures, metadata management, auditing, logging, and Power BI reporting.

---

# 🎯 Project Objectives

- Build an enterprise Healthcare Data Warehouse using SQL Server.
- Implement a Medallion Architecture (Bronze, Silver, Gold).
- Design scalable ETL pipelines using SQL Server Stored Procedures.
- Transform raw operational data into business-ready analytical models.
- Develop dimensional models using Star Schema.
- Build interactive Power BI dashboards for hospital executives.
- Implement metadata-driven ETL, auditing, and logging.
- Provide reusable datasets for SQL analytics and Python analysis.

---

# 🏥 Business Problem

Hospital data is distributed across multiple operational systems including patient registration, admissions, billing, laboratory, pharmacy, inventory, and insurance. These isolated systems make it difficult for management to monitor hospital performance and make timely decisions.

This project consolidates hospital data into a centralized analytics platform that provides a single source of truth for operational and strategic reporting.

---

# 📂 Source System

The project uses the Hospital HMIS Dataset consisting of **19 interconnected operational datasets**.

### Source Tables

- Patient
- Doctor
- Employee
- Department
- Ward
- Bed
- Admission
- Billing
- Billing Detail
- Prescription
- Disease
- Diagnostic Test
- Patient Diagnostic
- Drug
- Drug Manufacturer
- Drug Inventory
- Insurance Provider
- Patient Insurance
- Staff Assignment

---

# 🏗 Architecture

```
Source CSV Files
        │
        ▼
Bronze Layer
(Raw Data)

        │
Stored Procedures

        ▼
Silver Layer
(Cleansed & Standardized)

        │
Stored Procedures

        ▼
Gold Layer
(Fact Tables, Dimension Tables, Business Views)

        │
        ▼
Power BI
Ad-hoc SQL
Python Analytics
```

---

# 🛠 Technology Stack

| Category | Technology |
|----------|------------|
| Database | SQL Server |
| IDE | SQL Server Management Studio (SSMS) |
| ETL | T-SQL Stored Procedures |
| Reporting | Power BI |
| Data Transformation | SQL |
| Analytics | Python |
| Source Files | CSV |
| Version Control | Git & GitHub |

---

# 📁 Project Structure

```
Healthcare-Analytics-DW/

├── 00_Database
├── 01_Bronze
├── 02_Silver
├── 03_Gold
├── 04_Metadata
├── 05_Audit
├── 06_Logging
├── 07_ETL
├── 08_PowerBI
├── 09_Python
├── 10_Documentation
└── README.md
```

---

# 🧱 Data Warehouse Layers

## Bronze Layer

- Raw data ingestion
- One table per source dataset
- Full Load (Truncate & Insert)
- ETL metadata columns
- No business transformations

---

## Silver Layer

- Data cleansing
- Data standardization
- Duplicate removal
- Null handling
- Data quality validation
- Data type conversions
- Derived columns

---

## Gold Layer

- Star Schema
- Fact Tables
- Dimension Tables
- Business Views
- KPI calculations
- Optimized for Power BI

---

# 📊 Power BI Reporting

The Gold layer serves as the semantic model for Power BI.

## Executive Dashboard

- Total Patients
- Total Admissions
- Total Revenue
- Bed Occupancy Rate
- Average Length of Stay
- Insurance Claim Amount
- Revenue Trend
- Monthly Performance

---

## Patient Analytics Dashboard

- Patient Demographics
- Admissions by Department
- Disease Analysis
- Readmission Rate
- Age Group Distribution
- Gender Distribution

---

## Doctor Performance Dashboard

- Patients Treated
- Consultations
- Department Performance
- Average Treatment Time
- Doctor Workload

---

## Billing & Revenue Dashboard

- Total Revenue
- Outstanding Balance
- Revenue by Department
- Revenue by Doctor
- Revenue Trend
- Payment Status

---

## Pharmacy Dashboard

- Medicine Usage
- Drug Inventory
- Low Stock Medicines
- Inventory Value
- Top Prescribed Drugs

---

## Laboratory Dashboard

- Diagnostic Tests
- Most Requested Tests
- Test Volume
- Test Performance

---

## Operations Dashboard

- Ward Occupancy
- Bed Availability
- Emergency Admissions
- Staff Allocation

---

# 📈 Key Performance Indicators (KPIs)

### Patient KPIs

- Total Patients
- New Patients
- Returning Patients
- Admission Rate
- Readmission Rate
- Average Length of Stay

### Financial KPIs

- Total Revenue
- Billing Amount
- Outstanding Balance
- Insurance Claim Amount
- Revenue by Department

### Clinical KPIs

- Total Diagnoses
- Total Prescriptions
- Laboratory Test Count
- Surgery Count

### Operational KPIs

- Bed Occupancy Rate
- Ward Utilization
- Staff Allocation
- Drug Inventory Status

---

# 🔄 ETL Workflow

1. Load source CSV files into Bronze.
2. Clean and standardize data in Silver.
3. Build analytical models in Gold.
4. Consume Gold layer using Power BI, SQL, and Python.

---

# 🔒 Enterprise Features

- Metadata-driven ETL
- Batch Processing
- Audit Logging
- Error Logging
- Data Quality Validation
- Stored Procedure-based ETL
- Star Schema
- SQL Server Agent Scheduling
- Git Version Control

---

# 🚀 Future Enhancements

- Incremental Loading
- Slowly Changing Dimensions (SCD)
- Role-Based Security
- Automated Data Validation
- CI/CD Deployment
- Real-Time Data Integration

---

# 👨‍💻 Author

** Parvathi **

Enterprise Healthcare Analytics Data Warehouse Project
