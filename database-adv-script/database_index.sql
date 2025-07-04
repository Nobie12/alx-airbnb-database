
---

### 🗂 `database_index.sql` (SQL Commands):


### 3️⃣ Measure Performance with `EXPLAIN` or `ANALYZE`

✅ Before creating indexes:
```sql
EXPLAIN SELECT * FROM bookings WHERE user_id = 101;
```

```sql
-- 🗄 User Table Indexes
CREATE UNIQUE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);

-- 🏠 Property Table Indexes
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(pricepernight);
CREATE INDEX idx_properties_name ON properties(name);

-- 📅 Booking Table Indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_dates ON bookings(start_date, end_date);
CREATE INDEX idx_bookings_status ON bookings(status);
```

✅ After creating the index:
```sql
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 101;
```

**Observe:**

> Whether the query plan switches from Seq Scan (slow) to Index Scan (fast).


