-- 🔴 Initial Query (Unoptimized)
SELECT b.*, u.*, p.*, pay.*
FROM bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
LEFT JOIN payments AS pay ON b.booking_id = pay.booking_id;


-- ✅ Optimized Query (Improved Performance)
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


-- 🔍 EXPLAIN ANALYZE Before Optimization (Example)
EXPLAIN ANALYZE
SELECT b.*, u.*, p.*, pay.*
FROM bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
LEFT JOIN payments AS pay ON b.booking_id = pay.booking_id;


-- 🔍 EXPLAIN ANALYZE After Optimization (Example)
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
