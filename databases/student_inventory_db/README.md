# Student Inventory DB Lab

[![MySQL](https://img.shields.io/badge/Built%20With-MySQL-4479A1?style=for-the-badge\&logo=mysql\&logoColor=white)](https://www.mysql.com/)
[![Platform](https://img.shields.io/badge/Platform-Cross--Platform-6DB33F?style=for-the-badge\&logo=linux\&logoColor=white)](#)
[![License](https://img.shields.io/badge/License-Unlicense-lightgrey?style=for-the-badge)](#)
[![Status](https://img.shields.io/badge/Status-Production--Ready-success?style=for-the-badge)](#)

> Manage student equipment inventory with borrowing workflows, availability tracking, and audit logging.

---

## 1. Mission Brief

Universities need structured inventory management for labs, classrooms, and shared equipment.

**Goal:** Track items, borrow/return activities, and enforce rules at the database level with accurate availability and audit trails.

**Success criteria:**

* Correct borrow/return status tracking
* Availability calculation accurate
* Audit logs record all changes
* Penalties for late returns calculated automatically

---

## 2. Context

* **Target environment:** MySQL / MariaDB
* **Assumptions:**

  * Staff and admin roles exist
  * Students belong to multiple departments
* **Constraints:**

  * Single-database setup
  * No frontend required
  * Data consistency enforced via SQL

---

## 3. System Topology

**Layers:**

* Interface Layer: SQL client / scripts
* Data Layer: Relational tables for students, staff, items, transactions, and audit logs
* Business Logic Layer: Triggers, stored procedures, and views
* Reporting Layer: Queries for availability, late returns, and usage analytics

**Data Flow Summary:**
User inserts transaction → Triggers update status & audit → Availability view reflects real-time stock → Reports generated via queries

---

## 4. Design Rationale

* **Stack choice:** MySQL for cross-platform relational support
* **Storage model:** Normalized relational tables for integrity
* **Trade-offs:** No GUI, minimal external dependencies
* **Alternatives rejected:** External inventory software; unnecessary complexity for lab exercises

---

## 5. Core Mechanisms

**Mechanism A – Borrow/Return Enforcement**

* Trigger: `borrow_item` procedure
* Logic: Checks stock availability before inserting transaction
* Output: Success or error message if insufficient items

**Mechanism B – Audit Logging**

* Trigger: `borrow_audit`
* Logic: Log all inserts/updates to `borrow_transactions`
* Output: Timestamped action log for traceability

**Mechanism C – Late Penalty Calculation**

* Trigger: `late_penalty`
* Logic: Updates status and penalty automatically on return
* Output: Late items flagged with calculated penalty

**Mechanism D – Availability View**

* View: `available_inventory`
* Logic: Total – borrowed – damaged
* Output: Real-time stock per item

---

## 6. Data Contracts

**Primary Entities:**

`Student` – id, name, email, department
`Staff` – id, username, role
`Inventory_Item` – id, name, category, total, damaged, deleted
`Borrow_Transaction` – id, student_id, item_id, quantity, borrow/due/return, status, penalty
`Audit_Log` – action_type, table_name, record_id, performed_by, timestamp

**Integrity Rules:**

* Foreign key constraints
* Non-negative quantities
* ENUM workflow states
* Soft deletion for recovery

---

## 7. Execution Model

* Stateless operations per transaction
* Synchronous procedure calls
* Stored procedures enforce rules automatically

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
```

---

## 9. Observability

* Audit logs record all inserts and updates
* Availability view provides stock snapshot
* Penalty calculations visible in transactions table
* Reports can be generated via simple SQL queries

---

## 10. Failure Surfaces

* **Input abuse:** Borrow quantity exceeding available stock
* **Race conditions:** Multiple simultaneous borrows not serialized (handled via transactions if required)
* **Data corruption:** Manual edits bypassing constraints

**Mitigations:** Use procedures and triggers, enforce foreign keys, validate inputs in queries

---

## 11. Validation Strategy

* Unit: Test each procedure and trigger independently
* Integration: Run full borrow/return workflow
* Edge-case: Late returns, damaged items, deleted items
* Coverage: ≥90% transaction scenarios tested

---

## 12. Operational Limits

* Single-database design, no multi-branch support
* No real-time alerts outside SQL client
* Designed for lab and classroom inventory, not enterprise-level ERP

---

## Maintainer

Ayman Taylor
