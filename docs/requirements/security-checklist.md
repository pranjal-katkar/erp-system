# Security Checklist — ERP Mini System

## 1. Database-Level Security

- [ ] Enforce NOT NULL on all required fields
- [ ] Enforce UNIQUE on key fields (email, username, SKU)
- [ ] Apply CHECK constraints for valid values
- [ ] Use appropriate CASCADE or RESTRICT rules
- [ ] Restrict deletion of parent records if children depend on them
- [ ] Enable data validation at DB level (not only application level)

---

## 2. User Access Security (RBAC)

- [ ] Three roles defined: Admin, Manager, Staff
- [ ] Admin has full access to all tables
- [ ] Manager can approve Purchase Orders
- [ ] Staff can create PO but cannot approve
- [ ] Users table stores hashed passwords (never plain text)
- [ ] Permissions table supports future expansion

---

## 3. Data Protection Practices

- [ ] Passwords stored as hashed text (never clear text)
- [ ] Sensitive actions require role validation
- [ ] Protect financial and PO data from non-admin users
- [ ] Track created_by and approved_by

---

## 4. Audit & Logging

- [ ] Include created_at and updated_at timestamps
- [ ] Log stock movements with references
- [ ] Maintain PO lifecycle statuses

---

# End of Security Checklist
