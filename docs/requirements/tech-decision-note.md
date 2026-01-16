# Tech Decision Note — ERP Mini System

## 1. Tech Stack Overview

The following technologies are selected based on scalability, maintainability, and database-focused project scope:

### Backend

- No backend code required at this stage (DB-focused internship).
- Stored procedures, functions, triggers will handle workflows.

### Database

- **PostgreSQL 16** — Selected as primary DB engine.
- Reason:
  - Strong support for relational integrity.
  - Better JSON handling and indexing.
  - Industry standard for ERP-type systems.

### DB Client

- **DBeaver Community Edition**
- Reason:
  - Universal database management
  - ERD generation support
  - Easy table management and SQL execution

### Version Control

- **Git + GitHub**
- Reason:
  - Industry standard
  - Enables clean history tracking
  - Easy collaboration and documentation control

### Documentation

- Markdown files inside `/docs`
- Reason:
  - Lightweight
  - Easy to version control
  - Clear and readable structure

---

## 2. DB Engine Decision

### PostgreSQL is chosen over MySQL because:

- Better support for complex joins
- Better support for constraints and triggers
- Strong transactional consistency (ACID)
- Better indexing features (GIN, GiST)
- Stronger CHECK constraint support

---

## 3. Entity Modeling Approach

- Fully normalized to **3NF**
- Use of:
  - Primary Keys
  - Foreign Keys
  - Unique constraints
  - Check constraints
  - Cascading rules
  - Default values
  - Timestamps
