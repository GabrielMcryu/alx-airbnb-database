# Task 2

## 📦 Database Name
**`airbnb_clone_database`**

---

## 📄 Tables Created

The database contains the following normalized tables:

| Table      | Description                            |
|------------|----------------------------------------|
| `User`     | Stores user account and profile data   |
| `Property` | Stores property listings from hosts    |
| `Booking`  | Manages reservations made by users     |
| `Payment`  | Records payment details for bookings   |
| `Review`   | Stores reviews left by users           |
| `Message`  | Stores messages exchanged between users|

---

## 🧠 Normalization

All tables have been normalized up to **Third Normal Form (3NF)**:
- ✅ No repeating groups or arrays (1NF)
- ✅ No partial dependencies on composite keys (2NF)
- ✅ No transitive dependencies between non-key attributes (3NF)
- Related data is separated into logical tables and connected via foreign keys.

---

## 🔐 Primary Keys (UUID)

- All primary keys use **UUIDs**, stored as `CHAR(36)` to ensure global uniqueness.
- MySQL automatically creates indexes on all primary keys.

---

## 🗂️ Indexes Added

To improve query performance, the following **additional indexes** have been added:

| Table     | Indexed Column       | Purpose                            |
|-----------|----------------------|------------------------------------|
| `User`    | `email`              | Speed up authentication & lookups |
| `Booking` | `property_id`        | Optimize property-based filtering  |
| `Payment` | `booking_id`         | Improve JOIN performance           |

> ⚠️ Primary keys are **automatically indexed** by MySQL, so no need to manually index `user_id`, `property_id`, or `booking_id`.

---

## 🧾 Schema Highlights

- **UUIDs as Primary Keys**: Used for all tables to support distributed systems and future scalability.
- **Foreign Keys**: Maintain referential integrity across relationships, with `ON DELETE CASCADE` for automatic cleanup.
- **ENUMs**: Used for fixed status fields like `role`, `booking.status`, and `payment_method`.
- **Constraints**:
  - `email` is `UNIQUE`
  - `Review` table has a `UNIQUE(user_id, property_id)` constraint to prevent duplicate reviews.

---

## ✅ How to Use

1. Run the `airbnb_clone.sql` script in MySQL (e.g., via phpMyAdmin or CLI).
2. The script will:
   - Create the database (if it doesn't exist)
   - Create all tables
   - Add the appropriate indexes

---

## 🛠 Technologies

- **MySQL**

---