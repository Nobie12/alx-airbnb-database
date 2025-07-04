# 🚀Optimize Complex Queries

## 🎯 Objective:
Refactor complex queries to improve performance.

---

## 📝 Instructions:

### 1️⃣ Initial Query (Before Optimization)

The goal is to retrieve:
- All **bookings**
- Related **user details**
- Associated **property details**
- Payment information (if available)

```sql
SELECT b.*, u.*, p.*, pay.*
FROM bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
LEFT JOIN payments AS pay ON b.booking_id = pay.booking_id;
```

## 2️⃣ Query Performance Analysis (EXPLAIN ANALYZE Before Indexing & Optimization)

```sql
EXPLAIN ANALYZE
SELECT b.*, u.*, p.*, pay.*
FROM bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
LEFT JOIN payments AS pay ON b.booking_id = pay.booking_id;
```

## 🐢 Sample Output (Before Optimization)

```bash
Seq Scan on bookings b (cost=0.00..15000.00 rows=50000 width=500)
-> Hash Join ...
-> Seq Scan on users u ...
-> Seq Scan on properties p ...
-> Hash Left Join ...
Planning Time: 2.500 ms
Execution Time: 1800.234 ms
```

### 🚨 Problems Identified:
- Multiple **Sequential Scans** (no indexes)
- Pulling too many columns with `SELECT *`
- No `WHERE` filtering → unnecessary rows processed

---

## 3️⃣ Optimized Query (After Refactoring)

```sql
SELECT 
  b.booking_id,
  b.start_date,
  b.end_date,
  u.user_id,
  u.username,
  p.property_id,
  p.property_name,
  pay.amount
FROM bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
LEFT JOIN payments AS pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
ORDER BY b.start_date DESC;
```

### ✅ Changes Made:

- Selected only necessary columns instead of `SELECT *`
- Added `WHERE` clause to limit result set
- Ordered results efficiently for better pagination

---

## 4️⃣ Query Performance Analysis (EXPLAIN ANALYZE After Optimization & Indexing)

```sql
EXPLAIN ANALYZE
SELECT 
  b.booking_id,
  b.start_date,
  b.end_date,
  u.user_id,
  u.username,
  p.property_id,
  p.property_name,
  pay.amount
FROM bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
LEFT JOIN payments AS pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
ORDER BY b.start_date DESC;
```

## 🚀 Sample Output (After Optimization):

```bash
Index Scan using idx_bookings_status on bookings b  (cost=0.43..5000.00 rows=5000 width=120)
  -> Nested Loop ...
  -> Index Scan on users u using idx_users_user_id ...
  -> Index Scan on properties p using idx_properties_property_id ...
Planning Time: 1.120 ms
Execution Time: 210.452 ms
```

### ✅ Improvements:

- Sequential scans replaced by **Index Scans**
- Execution time **dropped significantly**
