# Network Asset Tracker

[![MySQL](https://img.shields.io/badge/Built%20With-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Platform](https://img.shields.io/badge/Platform-Cross--Platform-6DB33F?style=for-the-badge&logo=linux&logoColor=white)](#)
[![License](https://img.shields.io/badge/License-Unlicense-lightgrey?style=for-the-badge)](#)
[![Status](https://img.shields.io/badge/Status-Production--Ready-success?style=for-the-badge)](#)

> Track network assets including devices, IPs, MAC addresses, services, and ownership with automated reports and auditing.

---

## 1. Mission Brief

IT operations require structured tracking of network devices for maintenance, auditing, and security purposes.

**Goal:** Maintain an up-to-date network asset database with accurate status, ownership, and service information.

**Success criteria:**

* Complete device inventory
* IP/MAC/service correlation
* Ownership and responsibility tracked
* Automated reports and audits generated

---

## 2. Context

* **Target environment:** MySQL / MariaDB
* **Assumptions:**
  * Devices have unique identifiers (IP or MAC)
  * Admins/operators maintain the data
* **Constraints:**
  * Single-database setup
  * No frontend required
  * Integrity enforced via SQL

---

## 3. System Topology

**Layers:**

* Interface Layer: SQL client or scripts
* Data Layer: Tables for devices, IPs, MACs, services, and owners
* Logic Layer: Triggers, stored procedures, and views
* Reporting Layer: Queries for status, assignments, and audits

**Data Flow Summary:**
Device/asset entry → Triggers enforce rules → Availability/status view updates → Reports generated automatically

---

## 4. Design Rationale

* **Stack choice:** MySQL for cross-platform relational support
* **Storage model:** Normalized relational tables
* **Trade-offs:** No GUI, minimal external dependencies
* **Alternatives rejected:** External asset management software; unnecessary complexity for lab exercises

---

## 5. Core Mechanisms

**Mechanism A – Asset Registration**

* Procedure: `register_device`
* Logic: Ensure uniqueness of IP/MAC before insert
* Output: Success or error if duplicate

**Mechanism B – Service Tracking**

* Procedure: `update_device_services`
* Logic: Maintain list of services per device
* Output: Service status logged per device

**Mechanism C – Ownership Assignment**

* Procedure: `assign_owner`
* Logic: Map device to responsible staff or department
* Output: Ownership confirmed in audit table

**Mechanism D – Audit Logging**

* Trigger: `asset_audit`
* Logic: Logs inserts/updates/deletes on asset tables
* Output: Timestamped record for traceability

**Mechanism E – Availability & Status Views**

* View: `device_status_view`
* Logic: Shows device info, services, and owner
* Output: Real-time snapshot of network assets

---

## 6. Data Contracts

**Primary Entities:**

`Device` – id, hostname, IP, MAC, device_type, location  
`Service` – id, device_id, service_name, port, status  
`Owner` – id, username, role, department  
`Asset_Audit` – action_type, table_name, record_id, performed_by, timestamp  

**Integrity Rules:**

* Foreign key constraints
* Unique IP and MAC addresses
* ENUM workflow states for service status
* Soft deletion for recovery

---

## 7. Execution Model

* Stateless operations per transaction
* Synchronous procedure calls
* Triggers enforce integrity and logging automatically

**Resource profile:**

* CPU: Minimal
* Memory: Minimal
* I/O: Transaction writes and audit logs

---

## 8. Setup

**Database Initialization:**

```sql
source schema.sql;
source views.sql;
source procedures.sql;
source triggers.sql;
source seed_data.sql;
````

---

## 9. Observability

* Audit logs track all changes
* Status view provides real-time asset snapshot
* Reports can be generated via queries
* Service uptime and ownership easily reviewed

---

## 10. Failure Surfaces

* **Duplicate devices:** Same IP or MAC
* **Race conditions:** Multiple updates simultaneously (use transactions)
* **Manual bypass:** Direct edits outside procedures

**Mitigations:** Enforce triggers, foreign keys, and unique constraints

---

## 11. Validation Strategy

* Unit: Test each procedure independently
* Integration: Full asset registration and service updates workflow
* Edge-case: Duplicate IPs, deleted devices, unassigned owners
* Coverage: ≥90% asset scenarios tested

---

## 12. Operational Limits

* Single-database design; no multi-branch support
* No real-time GUI or alerting outside SQL queries
* Intended for IT ops lab and SOC exercises, not enterprise asset management

---

## Maintainer

Ayman Taylor

