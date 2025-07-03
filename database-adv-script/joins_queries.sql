-- INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT u.first_name, b.property_id
FROM "User" AS u
INNER JOIN Booking AS b
ON u.id = b.user_id;

/*
LEFT JOIN to retrieve all properties and their reviews,
including properties that have no reviews.
*/
SELECT p.name, r.comment
FROM Property AS p
LEFT JOIN Reviews AS r 
ON p.property_id = r.property_id
ORDER BY p.property_id ASC;

/*
Write a query using a FULL OUTER JOIN to retrieve all users and all bookings,
even if the user has no booking or a booking is not linked to a user.
*/
SELECT u.first_name, b.booking_id
FROM "User" AS u
FULL OUTER JOIN Booking AS b
ON u.id = b.user_id

