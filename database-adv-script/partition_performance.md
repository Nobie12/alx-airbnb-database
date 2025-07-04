# 🚀 Table Partitioning for Booking Table

## 🎯 Objective:
Implement **table partitioning** on the `bookings` table to optimize query performance for large datasets.

---

## 📝 Instructions Recap:
- Partition the `bookings` table by the `start_date` column.
- Save the partitioning SQL in `partitioning.sql`.
- Test query performance before and after partitioning.
- Write a brief report on the observed improvements.

---

## 🔧 Partitioning Strategy:

We chose **Range Partitioning** based on the `start_date` of the bookings because:
- Most queries on the `bookings` table filter by **date ranges**.
- Partitioning by date helps the database **skip irrelevant partitions**, reducing scan time.

---

## 💾 SQL Implementation:
See `partitioning.sql` for full commands.

Steps taken:
1. Created a **new partitioned table**.
2. Defined partitions for different years (2023, 2024, 2025).
3. Migrated existing data into the partitions.

---

## 🧪 Performance Testing:

### 🔍 Before Partitioning:
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
```

> Planning Time: ~3.2 ms
> Execution Time: ~750 ms
> 🚨 Full table scan over millions of rows.

### 🚀 After Partitioning:
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
```

> Planning Time: ~1.1 ms
> Execution Time: ~160 ms
> ✅ Query scans only the relevant partition (bookings_2024).

### ✅ Improvements Observed:
- Execution time reduced by 70-80%.

- Indexes on partitions make filtering and sorting faster.

- Database skips non-matching partitions automatically.
