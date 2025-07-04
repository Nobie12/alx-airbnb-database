-- 🚀 Step 1: Create the Partitioned Bookings Table
CREATE TABLE bookings_partitioned (
  booking_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  property_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  status VARCHAR(50),
  amount DECIMAL(10,2)
) PARTITION BY RANGE (start_date);


-- 🚀 Step 2: Create Partitions

CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');


-- 🚀 Step 3: Insert or Migrate Data (Example)
-- INSERT INTO bookings_partitioned SELECT * FROM bookings;
-- 🚀 Step 3: Insert or Migrate Data (Example)

-- Insert bookings from 2023 into the partitioned table
INSERT INTO bookings_partitioned (booking_id, user_id, property_id, start_date, end_date, status, amount)
SELECT booking_id, user_id, property_id, start_date, end_date, status, amount
FROM bookings
WHERE start_date >= '2023-01-01' AND start_date < '2024-01-01';

-- Insert bookings from 2024 into the partitioned table
INSERT INTO bookings_partitioned (booking_id, user_id, property_id, start_date, end_date, status, amount)
SELECT booking_id, user_id, property_id, start_date, end_date, status, amount
FROM bookings
WHERE start_date >= '2024-01-01' AND start_date < '2025-01-01';

-- Insert bookings from 2025 into the partitioned table
INSERT INTO bookings_partitioned (booking_id, user_id, property_id, start_date, end_date, status, amount)
SELECT booking_id, user_id, property_id, start_date, end_date, status, amount
FROM bookings
WHERE start_date >= '2025-01-01' AND start_date < '2026-01-01';


-- 🚀 Step 4: Query on Partitioned Table
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';


-- 🚀 Step 5: Check Execution Plan
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
