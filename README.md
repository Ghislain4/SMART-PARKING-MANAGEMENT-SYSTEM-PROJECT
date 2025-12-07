# SMART-PARKING-MANAGEMENT-SYSTEM-PROJECT
# Smart Parking Management System (SPMS)

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)  
[![Oracle DB](https://img.shields.io/badge/Database-Oracle-blue.svg)](https://www.oracle.com/database/)  

---

## Table of Contents
1. [Project Overview](#project-overview)  
2. [Motivation](#motivation)  
3. [Features](#features)  
4. [System Architecture](#system-architecture)  
5. [Database Design](#database-design)  
6. [Audit Policies](#audit-policies)  
7. [Installation & Setup](#installation--setup)  
8. [Usage](#usage)  
9. [Technologies Used](#technologies-used)  
10. [Contributing](#contributing)  
11. [License](#license)  
12. [Author](#author)  

---

## Project Overview
The **Smart Parking Management System (SPMS)** is a database-centric application designed to manage parking spaces efficiently. It provides real-time tracking of parking slots, vehicle entries and exits, and ensures secure auditing of all operations. This project showcases **enterprise-level database management** using **Oracle Database**, **PL/SQL**, and **Unified Auditing**.

The system is ideal for **smart city infrastructure**, private parking management, and commercial parking facilities.

---

## Motivation
Urban areas face increasing traffic congestion and limited parking spaces. SPMS aims to:

- Optimize parking space utilization.  
- Provide a centralized system to monitor parking activities.  
- Ensure data security and auditability using Oracle’s Unified Auditing.  
- Provide administrators with actionable insights through reports.

---

## Features
- **Parking Slot Management**: Add, update, delete, and monitor parking slots.  
- **Vehicle Tracking**: Log entries and exits of vehicles.  
- **Audit Logging**: Unified Audit policies to track user sessions and DML operations.  
- **Reports Generation**: Analyze parking usage trends and vehicle activity.  
- **Secure Access**: Role-based privileges for database users.  
- **Extensible**: Easily scalable to add more features or integrate with web/mobile apps.

---

## System Architecture
The system follows a **three-layer architecture**:

1. **Database Layer**: Oracle Database with tables for parking slots, vehicles, users, and audit logs.  
2. **Application Layer (Optional)**: Can be built with PHP, Java, or Python for CRUD operations and reporting.  
3. **User Interface Layer (Optional)**: Web or mobile interface for administrators and users.  

**Flow:**  
`User Action → Application Layer → Database Layer → Audit Trail → Reports`

---

## Database Design

### Key Tables

| Table Name       | Description |
|-----------------|-------------|
| `PARKINGSLOT`    | Stores details about parking slots (slot number, status, location). |
| `VEHICLE`        | Stores vehicle information (license plate, owner). |
| `PARKING_LOG`    | Tracks vehicle entries and exits with timestamps. |
| `USER`           | Stores user credentials, roles, and permissions. |

### ER Diagram (Simplified)

---

## Audit Policies

SPMS leverages **Oracle Unified Audit Policies** for secure and compliant logging.

1. **Session Audit Policy**: `spm_session_audit`  
   - Tracks all user logons and logoffs.  

2. **DML Audit Policy**: `spm_dml_audit`  
   - Audits all **INSERT, UPDATE, DELETE** operations on critical tables (`PARKINGSLOT`, `VEHICLE`, etc.).  

### Example SQL
```sql
-- Create session audit policy
CREATE AUDIT POLICY spm_session_audit
  ACTIONS LOGON, LOGOFF;

-- Create DML audit policy
CREATE AUDIT POLICY spm_dml_audit
  ACTIONS INSERT, UPDATE, DELETE
  ON smartparking.parkingslot;

-- Enable policies
AUDIT POLICY spm_session_audit;
AUDIT POLICY spm_dml_audit;

