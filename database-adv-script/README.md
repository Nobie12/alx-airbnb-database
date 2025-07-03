SQL Joins Queries
This repository contains SQL queries demonstrating different types of joins, focusing on INNER JOIN, LEFT JOIN, and FULL OUTER JOIN. The objective is to master SQL joins by writing complex queries that retrieve data from multiple related tables.

Objective
Master SQL joins by writing complex queries using different types of joins.

Instructions
The joins_queries.sql file contains the following queries:

INNER JOIN:

Query Description: Retrieve all bookings and the respective users who made those bookings. This join will only return rows where there is a match in both the bookings table and the users table.

-- Query 1: INNER JOIN - Retrieve all bookings and the respective users
SELECT
    b.booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date,
    u.user_id,
    u.username,
    u.email
FROM
    bookings AS b
INNER JOIN
    users AS u ON b.user_id = u.user_id;

LEFT JOIN:

Query Description: Retrieve all properties and their reviews, including properties that have no reviews. This join will return all rows from the properties table (left table) and the matching rows from the reviews table. If there is no match, NULL values will appear for columns from the reviews table.

-- Query 2: LEFT JOIN - Retrieve all properties and their reviews (including properties with no reviews)
SELECT
    p.property_id,
    p.property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM
    properties AS p
LEFT JOIN
    reviews AS r ON p.property_id = r.property_id;

FULL OUTER JOIN:

Query Description: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user. This join will return all rows from both the users table and the bookings table. Where there is no match, NULL values will appear for columns from the non-matching table.

Note: Not all SQL engines support FULL OUTER JOIN directly. If your SQL environment does not support it, you may need to use a UNION of LEFT JOIN and RIGHT JOIN to achieve the same result.

-- Query 3: FULL OUTER JOIN - Retrieve all users and all bookings (including unmatched)
-- This syntax assumes your SQL engine supports FULL OUTER JOIN.
SELECT
    u.user_id,
    u.username,
    u.email,
    b.booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date
FROM
    users AS u
FULL OUTER JOIN
    bookings AS b ON u.user_id = b.user_id;

-- Alternative for SQL engines that do not support FULL OUTER JOIN (e.g., MySQL)
-- This achieves the same result using UNION of LEFT JOIN and RIGHT JOIN.
/*
SELECT
    u.user_id,
    u.username,
    u.email,
    b.booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date
FROM
    users AS u
LEFT JOIN
    bookings AS b ON u.user_id = b.user_id

UNION

SELECT
    u.user_id,
    u.username,
    u.email,
    b.booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date
FROM
    users AS u
RIGHT JOIN
    bookings AS b ON u.user_id = b.user_id;
*/

Repository Structure
alx-airbnb-database/
└── database-adv-script/
    ├── joins_queries.sql
    └── README.md
