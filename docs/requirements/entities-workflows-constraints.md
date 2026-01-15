# Day 3 — Requirements Gathering Document

This document outlines the identified entities, workflows, and database constraints for the ERP Mini-System. These requirements form the foundation for ERD design and database schema development.

---

## 1. Entities (Tables)

### HR Module

**Employees**

- employee_id (PK)
- first_name
- last_name
- email (unique)
- phone
- department_id (FK → Departments.department_id)
- role_id (FK → Roles.role_id)
- join_date
- status (active/inactive)
- created_at
- updated_at

**Departments**

- department_id (PK)
- department_name

**Roles**

- role_id (PK)
- role_name
- description

---

### Inventory & Supplier Module

**Items**

- item_id (PK)
- item_name
- category_id (FK → Categories.category_id)
- sku (unique)
- description
- cost_price
- selling_price
- current_stock
- min_stock
- max_stock

**Categories**

- category_id (PK)
- category_name

**Suppliers**

- supplier_id (PK)
- supplier_name
- contact_person
- phone
- email (unique)

**Item_Suppliers (Bridge table for many-to-many)**

- item_id (FK → Items.item_id)
- supplier_id (FK → Suppliers.supplier_id)
- lead_time_days
- priority_rank

---

### Purchase Orders Module

**PurchaseOrders**

- po_id (PK)
- supplier_id (FK → Suppliers.supplier_id)
- order_date
- delivery_date
- status (draft, approved, ordered, delivered, closed)
- created_by (FK → Users.user_id)
- approved_by (FK → Users.user_id) – nullable

**PurchaseOrderItems**

- po_item_id (PK)
- po_id (FK → PurchaseOrders.po_id)
- item_id (FK → Items.item_id)
- quantity
- price

---

### Stock Control Module

**StockTransactions**

- transaction_id (PK)
- item_id (FK → Items.item_id)
- quantity_change
- transaction_type (in, out, adjustment)
- date
- reference_po_id (FK → PurchaseOrders.po_id, nullable)
- remarks

---

### Finance Module

**Expenses**

- expense_id (PK)
- category
- amount
- expense_date
- description
- payment_method
- linked_po_id (FK → PurchaseOrders.po_id, nullable)

---

### Role-Based Access Control (RBAC) Module

**Users**

- user_id (PK)
- username (unique)
- email (unique)
- password_hash
- role_id (FK → Roles.role_id)

---

## 2. Workflows

### HR Workflow

1. Create departments and roles.
2. Add employees with required details.
3. Assign department and role to each employee.
4. Update employee status when needed.
5. Maintain accurate employee records.

---

### Inventory Workflow

1. Create item categories.
2. Add items and assign categories.
3. Assign multiple suppliers to an item.
4. Maintain stock levels (current, min, max).
5. Track supplier lead times.

---

### Purchase Order Workflow

1. Staff creates purchase order (status = draft).
2. Add PO items with quantities and price.
3. Manager/Admin approves purchase order.
4. Status updates to approved or ordered.
5. When items arrive, status updates to delivered.
6. Stock levels increase accordingly.
7. Close PO when completed.

---

### Stock Control Workflow

1. Stock In → Add quantity.
2. Stock Out → Subtract quantity.
3. Adjustments → Manual corrections.
4. Each transaction updates the item’s current_stock.
5. Optional: link stock-in to purchase order.

---

### Finance Workflow

1. Log expense records.
2. Assign category, amount, date.
3. Optionally link to PO.
4. Track payment methods.
5. Generate summaries based on filters.

---

### RBAC Workflow

1. Admin creates users.
2. Assigns each user a role (Admin, Manager, Staff).
3. Role determines permissions:
   - Staff → Create PO
   - Manager → Approve PO
   - Admin → Full access
4. Users log in and operate based on allowed permissions.

---

## 3. Database Constraints

### Primary Key Constraints

Every main table must have a primary key:

- employee_id
- department_id
- role_id
- item_id
- category_id
- supplier_id
- po_id
- po_item_id
- transaction_id
- expense_id
- user_id

---

### Foreign Key Constraints

- Employees.department_id → Departments.department_id
- Employees.role_id → Roles.role_id
- Items.category_id → Categories.category_id
- Item_Suppliers.item_id → Items.item_id
- Item_Suppliers.supplier_id → Suppliers.supplier_id
- PurchaseOrders.supplier_id → Suppliers.supplier_id
- PurchaseOrders.created_by → Users.user_id
- PurchaseOrders.approved_by → Users.user_id
- PurchaseOrderItems.po_id → PurchaseOrders.po_id
- PurchaseOrderItems.item_id → Items.item_id
- StockTransactions.item_id → Items.item_id
- StockTransactions.reference_po_id → PurchaseOrders.po_id
- Expenses.linked_po_id → PurchaseOrders.po_id

---

### Not Null Constraints

Fields that must never be empty:

- first_name
- last_name
- email
- item_name
- quantity
- amount
- username
- password_hash

---

### Unique Constraints

To prevent duplicate records:

- employee email
- supplier email
- item SKU
- username

---

### Check Constraints

To enforce valid data:

- Employee.status IN (active, inactive)
- PurchaseOrder.status IN (draft, approved, ordered, delivered, closed)
- StockTransactions.transaction_type IN (in, out, adjustment)

---

### Default Values

- created_at = NOW()
- updated_at = NOW()
- employee.status = 'active'
- po.status = 'draft'
