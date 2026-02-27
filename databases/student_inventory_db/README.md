# Student Inventory Database

A relational database project designed to manage university inventory usage across multiple departments.  
The system focuses on controlled borrowing workflows, inventory accountability, and auditability using structured SQL features.

---

## Overview

This project models a centralized inventory system where students borrow laboratory or classroom equipment under staff supervision.  
Availability is calculated dynamically, borrowing rules are enforced at the database level, and operational activity is logged automatically.

The design emphasizes reliability, traceability, and realistic institutional workflows rather than basic CRUD operations.

---

## Features

- Student and staff role separation
- Department-agnostic student records
- Equipment inventory tracking
- Borrow and return lifecycle management
- Automatic late penalty calculation
- Real-time availability view
- Audit logging through triggers
- Soft deletion for data recovery

---

## Database Components

| File | Purpose |
|---|---|
| `schema.sql` | Tables and relational constraints |
| `views.sql` | Derived inventory availability |
| `procedures.sql` | Controlled borrowing operations |
| `triggers.sql` | Audit logging and penalty automation |
| `seed_data.sql` | Realistic dataset for testing |
| `queries.sql` | Reporting and analysis examples |

---

## Technical Concepts Used

- Foreign key integrity
- ENUM workflow states
- Stored procedures
- Triggers
- Derived views
- Data validation constraints
- Soft delete strategy

---

## Requirements

- MySQL or MariaDB
- phpMyAdmin or MySQL Workbench

---

## Setup

Execute files in the following order:

1. `schema.sql`
2. `views.sql`
3. `procedures.sql`
4. `triggers.sql`
5. `seed_data.sql`
