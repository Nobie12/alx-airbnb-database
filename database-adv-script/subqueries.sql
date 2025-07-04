/*
a query to find all properties
where the average rating is greater than 4.0 using a subquery.
*/
SELECT p.name
FROM Property AS p
WHERE p.Property_id IN (
  SELECT r.Proerty_id
  FROM Review AS r
  GROUP BY r.Property_id
  HAVING AVG(r.rating) > 4.0
)

/*
a correlated subquery to find users who have made more than 3 bookings.
*/
SELECT u.fisrt_name
FROM "User" AS u
WHERE (
  SELECT COUNT(b.Booking_id)
  FROM Booking AS b
  WHERE b.user_id = u.user_id
) > 3
