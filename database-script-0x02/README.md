# Task 3

## 📝 Sample Data Insertion

To demonstrate the functionality and relational integrity of the `airbnb_clone` database schema, sample data has been inserted into each table. These inserts reflect real-world scenarios and maintain valid foreign key relationships across all entities.

### ✅ Overview of Inserted Data

- **Users**:  
  Five users are added, including hosts, guests, and an admin.

- **Properties**:  
  Three properties are listed by two hosts (Alice and Clara), located in Nairobi, Mombasa, and Diani.

- **Bookings**:  
  Guests (Bob and David) book the listed properties. Each booking is linked to a specific user and property.

- **Payments**:  
  Payments are recorded for each booking with various payment methods (credit card, PayPal, Stripe).

- **Reviews**:  
  Guests who completed bookings leave reviews for the properties they stayed in.

- **Messages**:  
  Guests send inquiries and feedback to hosts via messages, demonstrating user-to-user communication.

### 🧠 Notes

- All UUIDs are manually set for consistency in testing and debugging.
- Foreign key dependencies are respected (e.g., you cannot insert a property without a valid host).
- This data is useful for testing joins, queries, and application logic.