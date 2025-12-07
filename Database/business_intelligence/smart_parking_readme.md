# Smart Parking Management System — BI & Analytics

This repository contains the Business Intelligence (BI) and Analytics components of the **Smart Parking Management System** project. It includes documentation, ETL scripts, data models, and KPI definitions used to support data-driven decision making for operations, finance, and executive dashboards.

---

## 📌 Project Overview
The Smart Parking Management System captures operational parking data such as slot occupancy, sessions, reservations, payments, and audits. This BI module transforms that OLTP data into a structured analytics layer using:

- **Dimensional modeling (Star Schema)**
- **Fact table for parking sessions**
- **Materialized views for fast dashboards**
- **Incremental ETL using PL/SQL**
- **Scheduled data refresh with DBMS_SCHEDULER**
- **Defined KPIs & SQL queries for dashboards**

---

## 📂 Folder Structure
```
business_intelligence/
├── kpi_definitions.md         # KPI formulas + SQL queries
├── data_model.sql             # DDL for dims, facts, and indexes
├── etl/
│   ├── load_fact.sql          # Incremental ETL procedure
│   ├── refresh_mvs.sql        # Materialized views for analytics
│   └── scheduler_jobs.sql     # Auto-refresh scheduler jobs
└── dashboard_mockups.md       # Optional (visuals + wireframes)
```

---

## 🚀 How to Use

### 1️⃣ **Run the BI Schema**
Run the following script in your PDB as `parking_user`:
```
business_intelligence/data_model.sql
```
This creates:
- Dimension tables
- Fact table
- Indexes
- Initial dimension population

---

### 2️⃣ **Create Materialized Views**
Run:
```
business_intelligence/etl/refresh_mvs.sql
```
This generates fast-refresh analytics views:
- `mv_hourly_occupancy`
- `mv_daily_revenue`

---

### 3️⃣ **Create ETL Procedure**
Execute:
```
business_intelligence/etl/load_fact.sql
```
This creates:
- `etl_metadata` table
- `proc_incremental_load_fact` procedure

Then run manually once:
```sql
BEGIN
  proc_incremental_load_fact;
END;
/
```

---

### 4️⃣ **Enable Automated Refresh**
Run:
```
business_intelligence/etl/scheduler_jobs.sql
```
This creates scheduled jobs to refresh:
- Materialized Views
- Incremental fact table loading

---

## 📊 BI Deliverables
- Operational Dashboards: Real-time occupancy, active sessions
- Finance Dashboards: Revenue, payments, discounts
- Audit Dashboard: Audit logs, denied operations
- Reservation Dashboard: Fulfillment rates, status tracking
- Executive Summary: KPIs + trends

---

## 🔧 Requirements
- Oracle Database 23ai or XE with PDB support
- SQL Developer / SQL*Plus
- BI Tool (Power BI, Metabase, Tableau, etc.)

---

## 🤝 Contribution
You can extend this repository by adding:
- More MVs for performance
- Additional KPI queries
- Dashboard screenshots
- Automated alert scripts (email/SMS)

---

## 📞 Support
If you need help deploying the scripts or connecting BI tools to Oracle, contact the project maintainer.


