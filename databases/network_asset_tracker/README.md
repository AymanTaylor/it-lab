# Network Asset Tracker

## Overview

The Network Asset Tracker is a PostgreSQL-based IT asset management system designed to support IT Operations.  
It provides structured asset inventory management, patch tracking, risk classification, and basic reporting automation.

---

## Architecture

**Database:** PostgreSQL  
**Automation:** Python (psycopg2, pandas)  
**Backup:** pg_dump (bash script)

Core components:

- Relational schema for devices, users, departments, IP assignments, and maintenance logs  
- SOC-relevant SQL queries  
- Python scripts for asset import, risk evaluation, and report generation  
- Database backup script  

---

## Database Schema

Main tables:

- `departments`
- `users`
- `devices`
- `ip_assignments`
- `maintenance_logs`

Key features:

- Foreign key relationships
- Unique constraints on hostname and MAC address
- IP stored using PostgreSQL `INET` type
- Risk classification per device
- Patch tracking via `last_patch_date`

---

## Setup Instructions

### 1. Create Database

```bash
createdb asset_db
psql asset_db -f schema.sql
psql asset_db -f seed_data.sql
```

### 2. Install Python Dependencies

```bash
pip install psycopg2 pandas
```

### 3. Configure Database Credentials

Edit connection settings inside the Python scripts:

```python
dbname="asset_db"
user="postgres"
password="yourpassword"
host="localhost"
```

---

## Project Structure

```
network_asset_tracker/
├── schema.sql
├── seed_data.sql
├── sample_scan.csv
├── queries/
├── python/
├── backups/
└── README.md
```

---

## Core Features

### Asset Inventory

- Track hostname, MAC address, OS version
- Assign users and departments
- Associate IP addresses and VLANs
- Record maintenance activity

### Risk Evaluation

Devices are marked as HIGH risk if:

- Last patch date exceeds defined threshold (e.g., 60 days)

Automated via `risk_evaluator.py`.

---

### Reporting

`monthly_report.py` generates:

- CSV export of devices
- Risk level overview
- Patch status information

---

### Queries

Included queries support:

- Identifying outdated devices
- Detecting duplicate IP assignments
- Listing inactive systems
- Finding high-risk assets

---

### Backup

Manual backup:

```bash
bash backups/backup.sh
```

Creates a date-stamped SQL dump of the database.
