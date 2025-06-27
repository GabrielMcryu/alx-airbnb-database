# Task 1

# 📊 Database Normalization Summary for Airbnb Clone Schema

This document outlines the normalization steps applied to the relational database schema designed for an Airbnb-clone application. The schema consists of the following main entities:

- User
- Property
- Booking
- Payment
- Review
- Message

---

## ✅ First Normal Form (1NF) – Atomicity

**Goal:**  
Ensure that each field contains only atomic (indivisible) values, and there are no repeating groups.

**How this schema satisfies 1NF:**
- All fields hold single values (e.g., `email`, `location`, `status`).
- No arrays, lists, or nested fields are used.
- Tables are structured with clearly defined columns and no duplicate columns for the same data type.

✅ **All tables comply with 1NF.**

---

## ✅ Second Normal Form (2NF) – Full Functional Dependency

**Goal:**  
Eliminate partial dependencies — every non-key attribute must depend on the **whole** primary key.

**How this schema satisfies 2NF:**
- All tables use a **single-column primary key** (UUID format).
- Since there are no composite primary keys, partial dependency cannot exist.

✅ **The schema satisfies 2NF by design.**

---

## ✅ Third Normal Form (3NF) – No Transitive Dependencies

**Goal:**  
Ensure that non-key attributes depend **only** on the primary key, and not on other non-key attributes.

**How this schema satisfies 3NF:**
- Related data is separated into their own tables (e.g., User, Property, Booking, etc.).
- No derived or redundant information (e.g., property names, emails) is stored across related tables.
- Foreign keys (`user_id`, `property_id`, etc.) are used to create relationships without duplicating data.
- Each attribute in a table is functionally dependent on its table's primary key only.

✅ **All tables meet the requirements of 3NF.**

---

## 📌 Additional Normalization Practices Applied

| Technique | Example |
|----------|---------|
| Use of foreign keys | `booking.user_id` references `user.user_id` |
| Separation of concerns | `Payment` is separated from `Booking` to isolate payment logic |
| Avoiding derived data | `total_price` is stored, but could be derived from `price_per_night * nights` |
| Enum usage for controlled values | e.g., `status` in Booking, `payment_method` in Payment |
| Optional enhancement | Unique constraint could be added to `Review(user_id, property_id)` to prevent duplicates |

---

## ✅ Summary Table

| Normal Form | Description                             | Status |
|-------------|------------------------------------------|--------|
| 1NF         | No repeating groups; atomic fields       | ✅     |
| 2NF         | No partial dependencies                  | ✅     |
| 3NF         | No transitive dependencies               | ✅     |
