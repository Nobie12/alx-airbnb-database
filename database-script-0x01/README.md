# 🏠 Airbnb Clone - Database Schema

This repository contains the SQL script for creating a PostgreSQL database schema for the Airbnb Clone project. The schema is designed to be robust, normalized, and optimized for performance.

---

## 📄 Overview

The schema supports core Airbnb features by including:

- Custom `ENUM` types for data integrity
- Relational tables for users, properties, bookings, payments, reviews, and messages
- Proper use of constraints (e.g., `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`)
- Indexes for improving query performance on frequently accessed columns

---

## 📁 Files

### `schema.sql`

This is the main file that defines the database structure. It consists of the following steps:

---

## 🧱 Schema Breakdown

### 1. 🔁 Drop Existing Objects

To ensure a clean setup on every run, the script drops any existing tables and custom types:

```sql
DROP TABLE IF EXISTS Message, Review, Payment, Booking, Property, "User" CASCADE;
DROP TYPE IF EXISTS user_role, booking_status, payment_method;
```
### 2. 🧩 Creates ENUM Types

Defines controlled value sets for specific columns to maintain consistency:

- user_role: guest, host, admin

- booking_status: pending, confirmed, canceled

- payment_method: credit_card, paypal, stripe

### 3. 🗂️ Creates Tables
- 🔹 User
> Stores user info (both guests and hosts).

- 🔹 Property
> Represents properties listed by hosts.

- 🔹 Booking
> Tracks reservations made by guests for properties.

- 🔹 Payment
> Records payment information tied to bookings.

- 🔹 Review
> Allows users to leave feedback and ratings on properties.

- 🔹 Message
> Handles communication between users (guest ↔ host).

---

#### All tables use appropriate data types and constraints like:

- UUID primary keys

- FOREIGN KEY with ON DELETE CASCADE or SET NULL

- NOT NULL, UNIQUE, and CHECK constraints

### 4. ⚙️ Creates Indexes
- Improves performance for search and JOIN queries:

```sql
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);
CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_recipient_id ON Message(recipient_id);
```

> Indexes are created on frequently queried fields like email, user_id, property_id, etc.

### ▶️ How to Use
- To set up the schema on a PostgreSQL database:

- Make sure PostgreSQL is installed and running.

Create a new database, e.g.:

```bash
createdb airbnb_clone_db
Run the script using psql:
```

```bash
psql -U your_username -d airbnb_clone_db -f schema.sql
Replace your_username with your actual PostgreSQL username.
```

### 📌 Notes
Make sure UUID extension is enabled in your DB if you're generating UUIDs with Postgres.

Run this schema script before inserting data (e.g., with a seed.sql).

Adjust table names or constraints as needed if integrating with a different application model.

### 📬 Contact
For questions, suggestions, or contributions, feel free to open an issue or pull request.

