## 📝 Identified High-Usage Columns and Rationale

---

### 👤 User Table:

| Column      | Reason for Indexing                                                                                     |
|------------|---------------------------------------------------------------------------------------------------------|
| `user_id`  | *(Primary Key)* Automatically indexed. Used heavily in **JOIN** clauses from `Booking`, `Property`, `Review`, `Message`. |
| `email`    | *(Unique Constraint)* Often used for **user login** or direct **lookup in WHERE** clauses. A **UNIQUE** index enforces data integrity and speeds up lookups. |
| `created_at` | Useful for queries that **sort users by registration date** (e.g., `ORDER BY created_at DESC`).          |

---

### 🏠 Property Table:

| Column         | Reason for Indexing                                                                                      |
|---------------|----------------------------------------------------------------------------------------------------------|
| `property_id` | *(Primary Key)* Automatically indexed. Used heavily in **JOIN** clauses from `Booking`, `Review`.        |
| `host_id`     | *(Foreign Key)* Used in **JOIN** operations to link properties to their hosts.                           |
| `location`    | Frequently used in **WHERE** clauses for searching properties by **geographical area**.                  |
| `pricepernight` | Common in **WHERE** clauses for **price range filtering** (e.g., `pricepernight BETWEEN X AND Y`) and **ORDER BY** clauses for sorting by price. |
| `name`        | Used in **WHERE** clauses for **searching by property name** (e.g., `name LIKE 'Cozy%'`).                |

---

### 📅 Booking Table:

| Column         | Reason for Indexing                                                                                             |
|---------------|-------------------------------------------------------------------------------------------------------------------|
| `booking_id`  | *(Primary Key)* Automatically indexed.                                                                            |
| `user_id`     | *(Foreign Key)* Used in **JOIN** operations to link bookings to the users who made them.                          |
| `property_id` | *(Foreign Key)* Used in **JOIN** operations to link bookings to the properties.                                   |
| `start_date`, `end_date` | Crucial for **date range queries** (e.g., finding available properties, bookings within a period). A **composite index** on these can be highly beneficial. |
| `status`      | Often used in **WHERE** clauses to **filter bookings by current state** (e.g., `status = 'confirmed'`).          |

---

```sql
-- database_index.sql

-- Indexes for the "User" table
-- user_id is the Primary Key, so it is automatically indexed.
-- CREATE INDEX idx_user_id ON "User" (user_id); -- Not strictly necessary if PK is clustered/indexed by default

-- Index on email for fast unique lookups and login queries
CREATE UNIQUE INDEX idx_user_email ON "User" (email);

-- Index on created_at for sorting users by registration date
CREATE INDEX idx_user_created_at ON "User" (created_at);


-- Indexes for the "Property" table
-- property_id is the Primary Key, so it is automatically indexed.
-- CREATE INDEX idx_property_id ON Property (property_id); -- Not strictly necessary if PK is clustered/indexed by default

-- Index on host_id for efficient joins with the "User" table (as host)
CREATE INDEX idx_property_host_id ON Property (host_id);

-- Index on location for fast filtering of properties by geographic area
CREATE INDEX idx_property_location ON Property (location);

-- Index on pricepernight for range queries and sorting by price
CREATE INDEX idx_property_pricepernight ON Property (pricepernight);

-- Index on name for searching properties by name (e.g., LIKE 'Prefix%')
CREATE INDEX idx_property_name ON Property (name);


-- Indexes for the "Booking" table
-- booking_id is the Primary Key, so it is automatically indexed.
-- CREATE INDEX idx_booking_id ON Booking (booking_id); -- Not strictly necessary if PK is clustered/indexed by default

-- Index on user_id for efficient joins with the "User" table
CREATE INDEX idx_booking_user_id ON Booking (user_id);

-- Index on property_id for efficient joins with the "Property" table
CREATE INDEX idx_booking_property_id ON Booking (property_id);

-- Composite index on start_date and end_date for efficient date range queries
CREATE INDEX idx_booking_dates ON Booking (start_date, end_date);

-- Index on status for filtering bookings by their current state
CREATE INDEX idx_booking_status ON Booking (status);


-- Note: For other tables (Payment, Review, Message), similar principles apply:
-- - Index foreign keys (e.g., booking_id in Payment, property_id/user_id in Review, sender_id/recipient_id in Message).
-- - Index columns used in WHERE clauses (e.g., payment_date, rating).
-- - Index columns used in ORDER BY clauses (e.g., sent_at).
```


